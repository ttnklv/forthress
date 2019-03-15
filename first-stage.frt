( even parity )
: parity-check 2 % if ." uneven" else ." even" then ;

( check on simplicity )
: check if 1 else 0 then ;
: prime-check 1 swap dup 2 for r@ swap dup rot % rot * 0 > swap endfor * check ;

( store the result in memory )
: save 8 allot dup rot swap ! ;

( concat )
: allocated-memory dup count rot dup count rot + heap-alloc ; ( w1 w2 w )  
: concat allocated-memory swap dup count swap rot dup rot dup -rot string-copy heap-free dup rot + rot dup -rot string-copy heap-free ; 

( Yakovleva = var 0 )
: check-neg dup 0 < if .” Can’t create Kollatca” then ;
: check-parity dup 2 % ;
: main check-parity if 3 * 1 + else 2 / then ;
: test check-neg repeat dup main dup 1 = until ;  