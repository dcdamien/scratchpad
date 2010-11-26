

Inductive btree (A: Set): Set :=
  | BLeaf: A -> btree A
  | BNode: btree A -> A -> btree A -> btree A.


Inductive trexp (A: Set): Set :=
  | TLeaf: A -> trexp A
  | TNode: btree (trexp A) -> trexp A.

Implicit Arguments BLeaf [A].
Implicit Arguments BNode [A].
Implicit Arguments TLeaf [A].
Implicit Arguments TNode [A].


Section forall_bt.
  Variable A: Set.

  Fixpoint forall_bt (P: A -> Prop) (bt: btree A): Prop :=
    match bt with
      | BLeaf a => P a
      | BNode l a r => forall_bt P l /\ P a /\ forall_bt P r
    end.
End forall_bt.


Section trexp_ind'.
  Variable A: Set.
  Variable P: trexp A -> Prop.
  Hypothesis Leaf_case: forall a: A, P (TLeaf a).
  Hypothesis Node_case: forall bt: btree (trexp A), forall_bt _ P bt -> P (TNode bt).

  Fixpoint trexp_ind' (tr: trexp A): P tr :=
    match tr with
      | TLeaf a => Leaf_case a
      | TNode bt => Node_case bt (forall_bt _ P bt)
    end.
End trexp_ind'.

(*
?? Почему нужно определять foldB внутри total?

Fixpoint foldB
  (A B: Set)
  (f: A -> B)
  (g: B -> A -> B -> B)
  (tr: btree A) :=
  match tr with
    | BLeaf n => f n
    | BNode l n r => g (foldB A B f g l) n (foldB A B f g r)
  end.


Fixpoint total (tr: trexp nat) :=
  match tr with
    | TLeaf n => n
    | TNode bt => foldB (trexp nat) nat
      (fun t => total t)
      (fun l t r => l + total t + r)
      bt
  end.

-- Recursive call to total has principal argument equal to 
-- "t"
-- instead of bt.
*)


Fixpoint total (tr: trexp nat) :=
  match tr with
    | TLeaf n => n
    | TNode bt => 
      let fix foldB (t: btree (trexp nat)) :=
        match t with
          | BLeaf x => total x
          | BNode l x r => foldB l + total x + foldB r
        end
        in foldB bt
  end.

Fixpoint increment (tr: trexp nat) :=
  match tr with
    | TLeaf n => TLeaf (S n)
    | TNode bt =>
      let fix foldB t :=
        match t with
          | BLeaf x => BLeaf (increment x)
          | BNode l x r => BNode (foldB l) (increment x) (foldB r)
        end
        in TNode (foldB bt)
  end.


Require Import Le.


Theorem total_increment: forall (tr: trexp nat), total tr <= total (increment tr).
Proof.
  intros.
  induction tr.
    simpl; apply le_n_Sn.
    unfold total, increment. simpl. fold increment. fold total.


      


