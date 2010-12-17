-- http://stackoverflow.com/questions/4463154/haskell-overlapping-instances-and-type-functions
-- http://www.haskell.org/haskellwiki/GHC/AdvancedOverlap

{-# LANGUAGE EmptyDataDecls, MultiParamTypeClasses, FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances, UndecidableInstances, IncoherentInstances #-}
{-# LANGUAGE OverlappingInstances, FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}

import Text.Printf


data TablePerson = TablePerson
data TableCompany = TableCompany
data ColumnName = ColumnName
data Select a b = Select a b


class    Query q            where eval :: q -> String
instance Query TablePerson  where eval _ = "FROM Person"
instance Query TableCompany where eval _ = "FROM Company"
instance Query ColumnName   where eval _ = "Name"

instance (Query a, Query b) => Query (Select a b) where
  eval (Select a b) = printf "SELECT %s %s" (eval a) (eval b)


data True
data False


class (Query q, Query q') => Optimize q q' | q -> q' where
  optimize :: q -> q'

instance (CanOptimize f q, Opt f q q') => Optimize q q' where
  optimize = opt (undefined :: f)


class (Query q, Query q') => Opt f q q' | f q -> q' where
  opt :: f -> q -> q'

instance (Query p, Query q, Query q', Optimize q q')
  => Opt True
    (Select (Select q p) p)
    (Select q' p)
  where
    opt _ (Select (Select q _) p) = Select (optimize q) p


instance Query q => Opt False q q where
  opt _ q = q


class Query q => CanOptimize f q | q -> f
instance (Query q, TypeCast f False) => CanOptimize f q
instance (Query p, Query q) => CanOptimize True (Select (Select q p) p)






class AreEqual a b
instance AreEqual a a




{-
class (Query q, Query q') => Optimize' q q' | q -> q'
instance Query q => Optimize' q q
instance (Query p, Query q, Query q', Optimize' q q')
  => Optimize'
    (Select (Select q p) p)
    (Select q' p)
-}

q = Select (Select ColumnName TablePerson) TablePerson


{-
class OptimizableQuery q where
  type Optimized q :: *
  optimize :: q -> Optimized q

instance Query q => OptimizableQuery q where
  type Optimized q = q
  optimize q = q

instance (Query q, OptimizableQuery q) => OptimizableQuery (Select (Select q p) p) where
  type Optimized (Select (Select q p) p) = Select (Optimized q) p
  optimize (Select (Select q _) p) = Select (optimize q) p
-}

class TypeCast   a b   | a -> b, b->a   where typeCast   :: a -> b
class TypeCast'  t a b | t a -> b, t b -> a where typeCast'  :: t->a->b
class TypeCast'' t a b | t a -> b, t b -> a where typeCast'' :: t->a->b
instance TypeCast'  () a b => TypeCast a b where typeCast x = typeCast' () x
instance TypeCast'' t a b => TypeCast' t a b where typeCast' = typeCast''
instance TypeCast'' () a a where typeCast'' _ x  = x

