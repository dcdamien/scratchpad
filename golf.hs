
-- http://antilamer.livejournal.com/421373.html
test = "101010101010101101010011011010111010101011101010111101010101101001"

res k xs
  = minimum
  $ zipWith (\a b -> (b-a,a+1)) ixs $ drop (k-1) ixs
  where
    ixs = [i | (i,x) <- zip [0..] xs, x == '1']
