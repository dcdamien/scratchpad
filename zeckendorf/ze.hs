

-- FIXME: вычислять за один проход по fib (туда и обратно)
-- FIXME: попробовать there and back again
ze :: Integer -> [Integer]
ze n
  | n == a = [n]
  | otherwise = a : ze (n-a)
  where
    a = max_fib_le n

fib = 1 : 1 : zipWith (+) fib (tail fib)

max_fib_le n = loop 1 1
  where
    loop a b
      | b > n = a
      | otherwise = loop b (a+b)

