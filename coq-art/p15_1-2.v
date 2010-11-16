
Require Import Compare_dec.

Fixpoint bdiv_aux (b m n: nat) {struct b} : nat*nat :=
  match b with
    | O => (O, O)
    | S b' =>
      match le_gt_dec n m with
        | left H => 
          match bdiv_aux b' (m-n) n with
            | pair q r => (S q, r)
          end
        | right H => (0, m)
      end
  end.

Require Import Le.

Theorem bdiv_aux_correct1:
  forall b m n: nat, m <= b -> 0 < n ->
    m = fst (bdiv_aux b m n) * n + snd (bdiv_aux b m n).
Proof.
  intros b.
  elim b.
    (* simpl. intros m n Hle. inversion Hle. *)
    simpl; intros; apply sym_equal; apply le_n_O_eq; exact H.

    intros. case (le_gt_dec n m). simpl. intros. 
    
  


SearchPattern (O = _ ).
Locate " <= ".
 apply  
  

  unfold bdiv_aux.
  simpl.
  induction b.
    simpl.
    simpl. apply H.