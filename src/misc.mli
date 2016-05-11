(******************************************************************************)
(*                                                                            *)
(*                           Miscleanous basic functions                      *)
(*                                                                            *)
(******************************************************************************)

val option_get : 'a option -> 'a

val ht_find_opt : ('a, 'b) Hashtbl.t -> 'a -> 'b option

val get_int : unit -> int

val get_float : unit -> float

val get_string : unit -> string

val get_stringS : unit -> string list
