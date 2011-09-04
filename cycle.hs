

-- http://en.wikipedia.org/wiki/Cycle_detection

import Data.List
import Data.Maybe


dropWhileNE (t:ts) (h:hs)
	| t == h    = (t:ts, h:hs)
	| otherwise = dropWhileNE ts hs
dropWhileNE ts hs = (ts,hs)


hare (_:x:xs) = x : hare xs
hare _ = []


floyd xs
	= case dropWhileNE xs $ hare xs of
		(_, []) -> fail "no cycle"
		(_:meetingPoint, _) -> do
			let cycleStart@(s:ss) = fst $ dropWhileNE xs meetingPoint
			let cycle = takeWhile (/=s) ss
			return (cycleStart, length cycle + 1)



chunks _ [] = []
chunks (n:ns) xs = ys : chunks ns zs
	where
		(ys,zs) = splitAt n xs


pow2 = 1 : map (*2) pow2


findOrLast z = find' 0
	where
		find' _ [] = Left z
		find' i (x:xs)
			= if x == z then Right (i+1)
				else if null xs then Left x
				else find' (i+1) xs


brent xs@(x:xs')
	= case l of
		i:_ -> return  i -- (fst $ dropWhileNE xs $ drop i xs, i)
		_ -> fail "no cycle"
	where
		l = snd $ foldl f (x, []) $ chunks pow2 xs'

		f (x, res) chunk
			= case findOrLast x chunk of
				Left z -> (z, [])
				Right i -> (x, [i])



