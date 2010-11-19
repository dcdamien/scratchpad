
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE RecordWildCards #-}

-- http://en.wikipedia.org/wiki/Algorithm_X
-- TODO: try Dancing Links http://arxiv.org/abs/cs/0011047
-- TODO: parallel recursive descent
module X where

import Data.Ord
import Data.List hiding ((\\))
import Data.Map ((!))
import qualified Data.Map as M
import Data.Set ((\\))
import qualified Data.Set as S

import Matrix


-- | Группирует элементы матрицы в две таблицы:
-- индекс строки  -> [индексы столбцов, на пересечении с которыми стоит единица]
-- индекс столбца -> [индексы строк, на пересечении с которыми стоит единица]
groupCells (Matrix{..})
	= S.fold select (emptyMap rows, emptyMap cols) ones
	where
		emptyMap s = M.fromAscList [(x,S.empty) | x <- S.toAscList s]
		add val = M.alter $ fmap (S.insert val)
		select (i,j) (rows,cols) = (add j i rows, add i j cols)


-- | удаляет из матицы строки 'rs' и столбцы 'cs'
reduce rs cs (Matrix{..})
	= Matrix
		{ rows = rows \\ rs
		, cols = cols \\ cs
		, ones = flip S.filter ones
				$ \(i,j) -> not $ S.member i rs || S.member j cs
		}


cover m
	| isEmpty m = [[]]
	| otherwise = concat
		[ map (row:) $ cover $ reduce is js m
		| row <- S.toList crossRows
		, let js = rows ! row
		, let is = S.unions $ map (cols!) $ S.toList js
		]
	where
		(rows, cols) = groupCells m
		crossRows = minimumBy (comparing S.size) $ M.elems cols

