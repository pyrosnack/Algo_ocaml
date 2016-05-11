(******************************************************************************)
(*                                                                            *)
(*                           Miscleanous basic functions                      *)
(*                                                                            *)
(******************************************************************************)

let option_get = function
  | Some x -> x
  | None -> assert false

let ht_find_opt ht x =
  try Some (Hashtbl.find ht x) with
  | Not_found -> None
  | e -> raise e
        
