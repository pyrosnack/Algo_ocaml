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
        
let get_int () = Scanf.scanf " %d" (fun x -> x)

let get_float () = Scanf.scanf " %f" (fun x -> x)

let get_string () = Scanf.scanf " %s" (fun x -> x)

let get_stringS () = Scanf.scanf " %[a-z ]" (fun x -> Str.split (Str.regexp_string " ") x)
