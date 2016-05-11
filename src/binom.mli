(******************************************************************************)
(*                                                                            *)
(*                           Binomial Coefficient                             *)
(*                                                                            *)
(******************************************************************************)

val ( @+ ) : Big_int.big_int -> Big_int.big_int -> Big_int.big_int

val ( @* ) : int -> Big_int.big_int -> Big_int.big_int

val ( @@* ) : Big_int.big_int -> Big_int.big_int -> Big_int.big_int

val ( @@/ ) : Big_int.big_int -> Big_int.big_int -> Big_int.big_int

val fact : int -> int

val fact_part : int -> int -> int

val num_to_take : int -> int -> int

val fact_b : int -> Big_int.big_int

val nb_ht : (int * int, Big_int.big_int) Hashtbl.t

val fact_part_b : int -> int -> Big_int.big_int

val num_to_take_b : int -> int -> Big_int.big_int
