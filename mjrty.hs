
{-# LANGUAGE NoMonomorphismRestriction #-}

-- http://www.cs.utexas.edu/users/moore/best-ideas/mjrty/index.html

mjrty = foldl f (undefined, 0)
  where
    f (c,n) a
      | n == 0    = (a,1)
      | a == c    = (c,n+1)
      | otherwise = (c,n-1)
