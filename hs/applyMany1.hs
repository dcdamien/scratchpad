{-
http://stackoverflow.com/questions/4755557
-}

{-# LANGUAGE TypeFamilies, MultiParamTypeClasses, FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}

import Control.Applicative
import TypeLevel.NaturalNumber
import Test.QuickCheck

class GetVal a where
  getVal :: a

class Applicative f => ApplyMany n f g where
  type Res n g
  app :: n -> f g -> f (Res n g)

instance Applicative f => ApplyMany Zero f g where
  type Res Zero g = g
  app _ fg = fg

instance
  (Applicative f, GetVal (f a), ApplyMany n f g)
  => ApplyMany (SuccessorTo n) f (a -> g)
  where
    type Res (SuccessorTo n) (a -> g) = Res n g
    app n fg = app (predecessorOf n) (fg<*>getVal)


data MyType = MyType Char Int Bool deriving Show

instance Arbitrary a => GetVal (Gen a) where
  getVal = arbitrary


test3 = app n3 (pure MyType) :: Gen MyType
test2 = app n2 (pure MyType) :: Gen (Bool -> MyType)
test1 = app n1 (pure MyType) :: Gen (Int -> Bool -> MyType)
test0 = app n0 (pure MyType) :: Gen (Char -> Int -> Bool -> MyType)


