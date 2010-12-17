
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE RecordWildCards #-}

module Matrix where

import Data.List
import Data.Map ((!))
import Data.Set (Set)
import qualified Data.Set as S


data Matrix a b
	= Matrix
		{ rows :: Set a     -- ^ множество индексов строчек в матрице
		, cols :: Set b     -- ^ множество индексов колонок в матрице
		, ones :: Set (a,b) -- ^ индексы ненулевых элементов
		}

emptyMatrix = Matrix S.empty S.empty S.empty

isEmpty (Matrix{..}) =  S.size cols == 0


mkMatrix = foldl' process emptyMatrix
	where
		process (Matrix{..}) ((a,b), x) = Matrix
			{ rows = S.insert a rows
			, cols = S.insert b cols
			, ones = if x then S.insert (a,b) ones else ones
			}


instance
	(Ord a, Ord b, Show a, Show b)
	=> Show (Matrix a b)
	where
		show (Matrix{..})
			= unlines $ map unwords $ header : map showRow rs
			where
				rs = S.toAscList rows
				cs = S.toAscList cols
				maxWidth = maximum . map (length . show) $ map show rs ++ map show cs
				align s = take maxWidth $ s ++ repeat ' '

				showElem i j = align $ if S.member (i,j) ones then "X" else " "

				showRow i = align (show i) : [showElem i j | j <- cs]
				header = align "" : map (align . show) cs

