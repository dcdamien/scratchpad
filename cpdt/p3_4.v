

Inductive nat_tree: Set :=
  | Leaf: nat -> nat_tree
  | Node: (nat -> nat_tree) -> nat_tree.


Fixpoint increment (tree : nat_tree) :=
  match tree with
    | Leaf n  => Leaf (n + 1)
    | Node ns => Node (fun i => increment (ns i))
  end.

Fixpoint leapfrog (i : nat) (tree : nat_tree) :=
  match tree with
    | Leaf n  => n
    | Node ns => leapfrog (i+1) (ns i)
  end.


Theorem inc_frog : forall (i : nat) (tree : nat_tree),
  leapfrog i tree + 1 = leapfrog i (increment tree).
Proof.
  intros.
  induction tree.
   simpl; reflexivity.

   unfold increment. fold increment.
   unfold leapfrog. fold leapfrog.

   Check (H (i+1)).
   generalize (i+1).


  