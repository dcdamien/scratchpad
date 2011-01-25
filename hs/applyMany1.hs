{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, TypeFamilies #-}
{-# LANGUAGE FlexibleContexts #-}


import Control.Applicative
import TypeLevel.NaturalNumber


class GetVal v where
  getVal :: v

class Telescope n f where
  type Arg n f
  type Res n f
  app :: GetVal (Arg n f) => n -> f -> Arg n f -> Res n f

instance Telescope Zero f where
  type Arg Zero f = ()
  type Res Zero f = f
  app _ f _ = f

instance
  (GetVal a, GetVal (Arg n f), Telescope n f)
  => Telescope (SuccessorTo n) (a -> f)
  where
    type Arg (SuccessorTo n) (a -> f) = a
    type Res (SuccessorTo n) (a -> f) = Res n f
    app n f a = app (predecessorOf n) (f a) getVal


data MyType = MyType Char Int Bool deriving Show

instance GetVal ()   where getVal = undefined
instance GetVal Char where getVal = 'd'
instance GetVal Int  where getVal = 185
instance GetVal Bool where getVal = False

test3 = app n3 MyType getVal :: MyType
test2 = app n2 MyType getVal :: Bool -> MyType
test1 = app n1 MyType getVal :: Int -> Bool -> MyType






