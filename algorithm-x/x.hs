
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE RecordWildCards #-}

-- http://en.wikipedia.org/wiki/Algorithm_X

import Data.Ord
import Data.List hiding ((\\))
import Data.Map ((!))
import qualified Data.Map as M
import Data.Set (Set, (\\))
import qualified Data.Set as S

import System.Random


data Matrix a b
	= Matrix
		{ rows :: Set a -- множество индексов строчек в матрице
		, cols :: Set b -- множество индексов колонок в матрице
		, ones :: Set (a,b) -- индексы ненулевых элементов
		}

isEmpty (Matrix{..}) = S.size rows == 0 || S.size cols == 0

groupCells (Matrix{..})
	= S.fold select (emptyMap rows, emptyMap cols) ones
	where
		emptyMap s = M.fromAscList $ zip (S.toAscList s) $ repeat S.empty
		add val = M.alter $ fmap (S.insert val)
		select (i,j) (rows,cols) = (add j i rows, add i j cols)


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


prod xs ys = [ (i,j) | i <- xs, j <- ys]
mkTest xs ys dat
	= Matrix
		{ rows = S.fromAscList xs
		, cols = S.fromAscList ys
		, ones = S.fromList [k | (k, True) <- zip (prod xs ys) dat]
		}

testMat = mkTest ['A'..'F'] [1..7]
	$ map (=='1')
			$  "1001001"
			++ "1001000"
			++ "0001101"
			++ "0010110"
			++ "0110011"
			++ "0100001"

-- (6.07 secs, 1076182552 bytes)
bigTest
	= mkTest [1..1200] [1..100]
	$ map (<(0.2::Double))
	$ randoms
	$ mkStdGen 12345

