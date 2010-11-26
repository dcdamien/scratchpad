


import Data.List
import Data.List.Split (wordsBy)
import Data.Set (Set)
import qualified Data.Set as S

import Graphics.Rendering.Diagrams


newtype Pentomino = Pentomino (Set (Int,Int)) deriving Show



pentominoes = mkPents
	[" ##|## |#   |   #|##|##|  ##|##  |###|##|  #|  #| # | #  |  # | ##|## |#####"
	,"## | ##|####|####|##|##|### | ###| # |# |  #| ##|###|####|####| # | # |     "
	," # | # |    |    | #|# |    |    | # |##|###|## | # |    |    |## | ##|     "
	]


mkPents = map mkPent . transpose . map (wordsBy (=='|'))
mkPent rows = Pentomino $ S.fromAscList
	[ (i,j)
	| (i,cols) <- zip [0..] rows
	, (j,'#') <- zip [0..] cols
	]


rotateCW (Pentomino p)
	= Pentomino $ S.fromList $ map (\(i,j) -> (j, d-i)) elems
	where
		elems = S.elems p
		minI = minimum $ map fst elems
		maxI = maximum $ map fst elems
		d = maxI-minI


allVariants = take 4 . iterate rotateCW


allPentominoes = concatMap allVariants pentominoes


draw x y (Pentomino p) = grid
	[	[(if S.member (i,j) p then fc green else id) $ rect 1 1
		| j <- [0..x-1]
		]
	| i <- [0..y-1]
	]

test
	= renderAs PNG "p.png" (Width 100)
	$ draw 5 5 $ allPentominoes !! 23

testAll
	= renderPagesAs PDF "p.pdf" (Width 100)
	$ map (draw 5 5) allPentominoes

