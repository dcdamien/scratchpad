-- http://stackoverflow.com/questions/4755557
-- http://stackoverflow.com/questions/4755557/4760208#4760208

{-# LANGUAGE MultiParamTypeClasses, FlexibleInstances, TypeFamilies #-}

import Control.Applicative
import TypeLevel.NaturalNumber

class ApplyMany n a r where
  type Arg n a r
  apply' :: Applicative f => n -> f (Arg n a r) -> f a -> f r

instance ApplyMany Zero a r where
  type Arg Zero a r = r
  apply' _ fr _ = fr

instance ApplyMany n a r => ApplyMany (SuccessorTo n) a r where
  type Arg (SuccessorTo n) a r = a -> Arg n a r
  apply' n f a =  apply' (predecessorOf n) (f<*>a) a

apply f n a = apply' (predecessorOf n) (f<$>a) a


data MyType = MyType Int Int Int deriving Show

test1 = apply MyType n1 arbitrary :: Gen (Int -> Int -> MyType)
test2 = apply MyType n3 arbitrary :: Gen MyType


