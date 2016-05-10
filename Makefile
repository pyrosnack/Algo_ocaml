OCB_FLAGS = -I src
OCB = 		ocamlbuild $(OCB_FLAGS)

all: 		lib doc

clean:
			$(OCB) -clean
			rm *~
			rm **/*~

lib:
			$(OCB) algo.cma
			$(OCB) algo.cmxa
			$(OCB) algo.cmxs

doc: 		
			$(OCB) algo.docdir/index.html

.PHONY: 	all clean lib
