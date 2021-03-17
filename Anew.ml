open Printf

let count = ref 0;;
let numFinal = ref 0;;
let num = ref 0;;
let a = ref 0;;
let b = ref 0;;
let c = ref 0;;
let x1 = ref 0;;
let x2 = ref 0;;
let x3 = false;;
let aux = ref 0;;

(* Verifica o minimo entre 3 numeros 
let min(a,b,c) =
    if(!a < !b && !a < !c) then(
        a
    )
    else if(!b < !a && !b < !c) then(
        b
    )
    else if(!c < !a && !c < !b) then(
        c
    )
;;*)

(* Retira os ultimos dois algarismos do numero 
let extract(num) =
    if(!num < 10) then (
        aux := -1;
        (!aux,!aux,false)
    )
    else(
        a := !num mod 10;
        b := (!num mod 100) / 10;
        (!a,!b,true)
    )
;;
*)

(*  *)
let rec game(numFinal) = 
    if(!numFinal < 42) then ( count := 1000000 );
    if(!numFinal = 42) then ( count := 0);
    a := 1000000;
    b := 1000000;
    c := 1000000;
    if((!numFinal mod 2) = 0) then(
        numFinal := !numFinal / 2;
        a := 1 + game( numFinal )
    );
    if((!numFinal mod 3) = 0 || (!numFinal mod 4) = 0) then(
        if(!numFinal < 10) then (
            x1 := -1;
            x2 := -1;
            x3 = false
        )
        else(
            a := !numFinal mod 10;
            b := (!numFinal mod 100) / 10;
            x1 := !a;
            x2 := !b;
            x3 = true
        );
        if( x3 && !x1 * !x2 <> 0 ) then(
            numFinal := !numFinal - !x1 * !x2;
            b := 1 + game( numFinal )
        )
    );
    if((!numFinal mod 5) = 0) then(
        numFinal := !numFinal - 42;
        c := 1 + game( numFinal )
    );
    if(!a < !b && !a < !c) then(
        count := !a;
    )
    else if(!b < !a && !b < !c) then(
        count := !b
    )
    else if(!c < !a && !c < !b) then(
        count := !c
    )
;;

let () =
    let n = Scanf.scanf " %d" (fun x -> x) in
    numFinal := n;
    game(numFinal);
    if(!count > 1000000) then(
        printf "BAD LUCK\n"
    )
    else(
        printf "%d\n" !count
    )
