{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, TypeFamilies #-}

import Control.Applicative
import TypeLevel.NaturalNumber
import Test.QuickCheck


class ApplyArbitrary n g where
  type Res n g
  app :: n -> Gen g -> Gen (Res n g)

instance ApplyArbitrary Zero g where
  type Res Zero g = g
  app _ g = g

instance
  (Arbitrary a, ApplyArbitrary n g)
  => ApplyArbitrary (SuccessorTo n) (a -> g)
  where
    type Res (SuccessorTo n) (a -> g) = Res n g
    app n f = app (predecessorOf n) (f<*>arbitrary)


data MyType = MyType Char Int Bool deriving Show

test3 = app n3 (pure MyType) :: Gen MyType
test2 = app n2 (pure MyType) :: Gen (Bool -> MyType)
test1 = app n1 (pure MyType) :: Gen (Int -> Bool -> MyType)
test0 = app n0 (pure MyType) :: Gen (Char -> Int -> Bool -> MyType)


