(******************************************************************************)
(*                                                                            *)
(*                           Priority Queues                                  *)
(*                                                                            *)
(******************************************************************************)

module type OrderedType =
  sig
    type t
    val compare: t -> t -> int
    val str: t -> string
  end

module type PQ =
  sig
    type t
    type elt
    val empty: ?size:int -> unit -> t
    val is_empty: t -> bool
    val add: t -> elt -> unit
    val pop: t -> elt option
    val size: t -> int
    val affiche: t -> unit
  end

let option_get = function
  | Some x -> x
  | None -> assert false

module Heap (Ord: OrderedType) =
  struct
    type elt = Ord.t
    type t = {mutable len:int; ar: (elt option) array}

    (* Heap are currently fixed-size arrays, so the optional parameter size
       is actually critical *)

    let empty ?size:(size = 5) () =
      {len = 0; ar = Array.make size None}

    let size h = h.len

    let is_empty h = size h = 0

    let swap arr i j =
      let aux = arr.(i) in
      arr.(i) <- arr.(j);
      arr.(j) <- aux

    let rec balance_child h i =
      if i > 0 then
	let parent = (i - 1) / 2 in
	match Ord.compare (option_get h.ar.(i)) (option_get h.ar.(parent)) with
	| x when x < 0 ->
	  swap h.ar i parent;
	  balance_child h parent
	| _ -> ()

    let add h x = match size h with
      | 0 ->
	h.len <- 1;
	h.ar.(0) <- Some x
      | _ ->
	h.ar.(h.len) <- Some x;
	h.len <- h.len + 1;
	balance_child h (h.len - 1)
	  
    let get h i =
      if i < h.len then h.ar.(i) else None

    let rec balance_parent h i =
      let left = 2 * i + 1 in
      let right = left + 1 in
      let left_c = get h left in
      let right_c = get h right in
      match left_c, right_c with
      | None, None -> ()
      | Some x, None ->
	if Ord.compare x (option_get h.ar.(i)) < 0 then begin
	  swap h.ar i left;
	  balance_parent h left
	end
      | Some x, Some y ->
	let mini, minic = if Ord.compare x y < 0 then left, x else right, y in
	if Ord.compare minic (option_get h.ar.(i)) < 0 then begin
	  swap h.ar i mini;
	  balance_parent h mini
	end
      | _ ->
	failwith "Probleme in balance_parent: on a un right child mais pas \
un left child"

    let pop h =
      if is_empty h then
	None
      else
	let res = h.ar.(0) in
	h.len <- h.len - 1;
	h.ar.(0) <- h.ar.(h.len);
	balance_parent h 0;
	res

    let affiche h =
      Printf.printf "{len:%i; ar:" h.len;
      print_string "[|";
      for i = 0 to h.len - 1 do
	match h.ar.(i) with
	| Some el ->
	  print_string ((Ord.str el)^";");
	| None -> print_string "None ;";
      done;
      print_string "|]}\n"
  end
