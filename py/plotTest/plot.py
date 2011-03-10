# -*- coding: utf-8 -*-

import re
import sys
from numpy import *
from pylab import *


def parse(fname, rx, test=1, x=2, y=3, xTyp=float, yTyp=float):
  """ Читает файл по строчкам, ищет результаты тестов
  и складывает их в словарь вида {test : {x:[y]}}.
    fname -- имя файла
    rx -- регулярное выражение, которым выдираются строчки с результатами тестов
    line, x, y -- номер группы в регекспе в которой будет название измерения, значение х, значение y
    xTyp, yTyp -- конвертер типа для значений
  """
  data = {}
  rx = re.compile(rx)
  with open(fname, 'r') as f:
    for l in f:
      m = rx.match(l)
      if m:
        testName = m.group(test)
        xVal     = xTyp(m.group(x))
        yVal     = yTyp(m.group(y))
        if data.has_key(testName):
          d = data[testName]
          if d.has_key(xVal):
            d[xVal].append(yVal)
          else:
            d[xVal] = [yVal]
        else:
          data[testName] = {xVal: [yVal]}
  return data

  

def calcErrors(data):
  """Подготавливает результаты к виду, удобному для использования в pylab.
  Словарь вида {test : {x:[y]}} преобразуется в {test : (xs,ys,[(y-y_min, y_max-y)]}.
  """
  plotData = {}
  for (name,vals) in data.items():
    vals = vals.items()
    vals.sort() # [(x,[y])]
    
    xs = map(lambda t: t[0], vals)
    vs = map(lambda t: array(t[1]), vals)
    
    ys = array(map(mean, vs))
    ys_min = array(map(min, vs))
    ys_max = array(map(max, vs))
    err = (ys - ys_min, ys_max - ys)
    
    plotData[name] = (xs,ys,err)
  return plotData
 

def main():
  dat = parse(
    sys.argv[1],
    '>>> (.*) (\\d+) fields\\s*(.*)',
    xTyp = int,
    yTyp = float)
    
  dat = calcErrors(dat)
    
  fig = figure()
  plt = fig.add_subplot(111)
  fields = ['sort1', 'sort2']
  for n in fields:
    (xs, ys, err) = dat[n]
    plt.errorbar(xs, ys, err, marker='s', label=n)
  plt.legend(loc='upper left')

  fig.show()

main()

