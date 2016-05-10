(******************************************************************************)
(*                                                                            *)
(*                           Priority Queues                                  *)
(*                                                                            *)
(******************************************************************************)

(** Priority Queues over ordered types.

    This module implements different priority queues data structure, given a 
    total ordering over the queues elements.
    The differents operations should all take time logarithmic in the size of
    the queue, for any implementation.

*)
module type OrderedType =
sig
  type t
  val compare : t -> t -> int
  val str: t -> string
    (** For debuging purpose. *)
end

module type PQ =
  sig
    type t
    type elt
    val empty : ?size:int -> unit -> t
    val is_empty : t -> bool
    val add : t -> elt -> unit
    val pop : t -> elt option
    (** Pop removes the minimum element from the queue and returns it. 
	If their are several equal minima, one is chosen at random. *)

    val size : t -> int
    val affiche: t -> unit
      (** For debuging purpose. *)
  end


module Heap : functor (Ord : OrderedType) -> PQ with type elt = Ord.t
(** Functor building an implementation of a priority queue using a heap.

    Important: Since the underlying array currently does not resize,
    need to be given the max size at creation time. *)
