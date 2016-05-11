OCB_FLAGS = -I src
OCB = 		ocamlbuild $(OCB_FLAGS)

all: 		lib doc

clean:
			$(OCB) -clean
			@rm *~ 2> /dev/null || true
			@rm **/*~ 2> /dev/null || true

lib:
			$(OCB) algo.cma
			$(OCB) algo.cmxa
			$(OCB) algo.cmxs

doc: 		
			$(OCB) algo.docdir/index.html

.PHONY: 	all clean lib
