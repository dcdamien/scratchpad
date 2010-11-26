
(* Exercise 8.1
Define the inductive property "last A a l" that is satisfied iff l
is a list of values of type A and a is the last element of l.
Define a function "last_fun: list A -> option A" that returns the last
element when it exists. Give a statement that describes the consistency
between these two definitions and prove it. Compare the difference in
conciseness and programming style for the two definitions.
*)

Require Import List.

Section x.
  Variable A: Set.
  
  Fixpoint last_fun (l: list A): option A :=
    match l with
      | nil => None
      | a :: nil => Some a
      | _ :: l'  => last_fun l'
    end.


  Inductive last (a: A): list A -> Prop :=
  | last_one: last a (a :: nil)
  | last_many: forall (l: list A) (x: A), last a l -> last a (x :: l).


  Theorem last_consistent0: forall (l: list A) (a: A),
    last a l -> last_fun l = Some a.
  Proof.
    intros.
    induction l.
      inversion H.
      simpl.
      reflexivity.
      case l.
        simpl.
      apply (last_many a l a0) in H.
      simpl.
      case H. 
        reflexivity. 
        intros. simpl. 

contradiction.
      elimtype False. apply H. assumption.
      contradiction.
      discriminate H.
*)    

  Theorem last_consistent1: forall (l: list A) (a: A),
    last_fun l = Some a -> last a l.
  Proof.
    intros.
    induction l.
      discriminate H.
      apply last_rec. destruct H. apply IHl.

End x.