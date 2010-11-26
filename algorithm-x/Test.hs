
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE RecordWildCards #-}

import Data.List
import Data.Map ((!))
import qualified Data.Set as S
import System.Random
import Test.QuickCheck

import Matrix
import X



data TestParams = TestParams
	{ matrixSize :: (Int,Int)
	, matrixDensity :: Double
	}

-- TODO: instance Arbitrary TestParams

testCover m = map (testSolution m) $ cover m

testSolution m sol = allColumns == sort crossColumns
	where
		(rows, _) = groupCells m
		crossColumns = concatMap (S.toList . (rows!)) sol
		allColumns = S.toAscList $ cols m


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

smallTest
	= mkTest [1..19] [1..19]
	$ map (<(0.4::Double))
	$ randoms
	$ mkStdGen 12345


-- (6.07 secs, 1076182552 bytes)
bigTest
	= mkTest [1..1200] [1..100]
	$ map (<(0.2::Double))
	$ randoms
	$ mkStdGen 12345

