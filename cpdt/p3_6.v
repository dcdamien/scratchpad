

Inductive nat_btree: Set :=
| NLeaf: nat_btree
| NNode: nat_btree -> nat -> nat_btree -> nat_btree.


(* discriminate *)
Theorem leaf_ne_node: forall (l r: nat_btree) (n: nat),
  NLeaf <> NNode l n r.
Proof.
  unfold not.
  intros.
  change ((fun t => match t with NLeaf => False | NNode _ _ _ => True end) NLeaf).
  rewrite H. apply I.
Qed.


(* inversion *)
Ltac conj_refl :=
  match goal with
    | [ |- (?x = ?x) /\ _ ] => apply conj; [reflexivity | conj_refl]
    | [ |- ?x = ?x ] => reflexivity
    end.

Theorem inv_node: forall (l r l' r': nat_btree) (n n': nat),
  NNode l n r = NNode l' n' r' -> l = l' /\ n = n' /\ r = r'.
Proof.
  intros.
  change (
    (fun t  => match t with
                 | NNode l' n' r' => l = l' /\ n = n' /\ r = r'
                 | NLeaf => False end)
    (NNode l' n' r')).
  rewrite <- H; conj_refl.
Qed.