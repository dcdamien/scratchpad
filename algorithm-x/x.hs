
{-# LANGUAGE NoMonomorphismRestriction #-}

-- http://en.wikipedia.org/wiki/Algorithm_X

import Data.Ord
import Data.List
import Data.Map ((!))
import qualified Data.Map as M
import qualified Data.Set as S

-- FIXME:
-- data Matrix a b
--   = Matrix {rows :: Set a, Cols :: Set b, dat :: Set (a,b) }


groupCells = M.foldWithKey select (M.empty, M.empty)
	where
		add val = M.alter $ Just . maybe [val] (val:)
		init = M.alter $ Just . maybe [] id

		select (i,j) k (rows,cols)
			| k     = (add j i rows, add i j cols)
			| not k = (init i rows, init j cols)


reduce rows cols
	= M.filterWithKey $ \(i,j) _ -> not (S.member i rs || S.member j cs)
	where
		(rs,cs) = (S.fromList rows, S.fromList cols)


cover m
	| M.size m == 0  = [[]]
	| otherwise      = concat
		[ map (row:) $ cover $ reduce is js m
		| row <- crossRows
		, let js = rows ! row
		, let is = concatMap (cols!) js
		]
	where
		(rows, cols) = groupCells m
		crossRows = minimumBy (comparing length) $ M.elems cols


testMat = M.fromList
	$ zip [ (i,j) | i <- ['A'..'F'], j <- [1..7]]
	$ map (=='1')
			$  "1001001"
			++ "1001000"
			++ "0001101"
			++ "0010110"
			++ "0110011"
			++ "0100001"


