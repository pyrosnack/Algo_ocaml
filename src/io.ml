(******************************************************************************)
(*                                                                            *)
(*                           Input Output                                     *)
(*                                                                            *)
(******************************************************************************)

let get_int () = Scanf.scanf " %d" (fun x -> x)

let get_float () = Scanf.scanf " %f" (fun x -> x)

let get_string () = Scanf.scanf " %s" (fun x -> x)

let get_stringS () = Scanf.scanf " %[a-z ]" (fun x -> Str.split (Str.regexp_string " ") x)
