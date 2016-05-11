(******************************************************************************)
(*                                                                            *)
(*                           Binomial Coefficient                             *)
(*                                                                            *)
(******************************************************************************)

open Big_int
open Misc

let ( @+ ) a b = add_big_int a b

let ( @* ) a b = mult_int_big_int a b

let ( @@* ) a b = mult_big_int a b

let ( @@/ ) a b = div_big_int a b

let fact n =
  let rec aux acc = function
    | 1 -> acc
    | n -> aux (n * acc) (n - 1)
  in
  aux 1 n

(* Meaningless *)
let rec fact_part n = function
  | k when k = n -> n
  | k -> k * (fact_part n (k + 1))

(* Coeff binomiaux *)
let num_to_take k n =
  if n < k then 0 else
    (fact_part n (n - k + 1)) / (fact k)

let fact_b n =
  let rec aux acc = function
    | 1 -> acc
    | n -> aux (n @* acc) (n -1)
  in
  aux unit_big_int n

let nb_ht = Hashtbl.create 1000

let rec fact_part_b n k = match ht_find_opt nb_ht (n, k) with
  | Some res -> res
  | None ->
    let res = if k = n then big_int_of_int n else fact_part_b n (k+1) in
    Hashtbl.add nb_ht (n, k) res;
    res

let num_to_take_b k n =
  if n < k then zero_big_int else
    (fact_part_b n (n - k + 1)) @@/ (fact_b k)
