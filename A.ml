open Printf

let count = ref 0;;
let m = ref 0;;
let numFinal = ref 0;;
let aux1 = ref 0;;
let aux2 = ref 0;;
let regra = ref 0;;

(*  *)
let rec game(numFinal,count) = 
    m := 0;
    if(!numFinal > 42) then(
        (* Se for multiplo de 5  *)
        if((!numFinal mod 5) = 0) then(
            count := !count + 1;
            m := 42;
            numFinal:= !numFinal - !m;
            (* *)printf "Regra 3\n"; 
            (* *)printf "%d\n" !numFinal; 
            game(numFinal, count)
        )
        (* Se for multiplo de 3 ou multiplo de 4 *)
        else if((!numFinal mod 3) = 0 || (!numFinal mod 4) = 0) then(
            count := !count + 1;
            aux1 := !numFinal mod 10;
            aux2 := ((!numFinal - !aux1) mod 100) / 10;
            m := !aux1 * !aux2;
            (* *)regra := 2; 
            if(!m = 0) then(
                m := !numFinal/2;
                (* *)regra := 1; 
                (* *)printf "-1-";
            );
            numFinal:= !numFinal - !m;
            (* *)printf "Regra %d\n" !regra; 
            (* *)printf "%d\n" !numFinal; 
            game(numFinal, count)
        )
        (* Se for par (multiplo de 2) *)
        else if((!numFinal mod 2) = 0) then(
            count := !count + 1;
            m := !numFinal/2;
            numFinal:= !numFinal - !m;
            (* *)printf "Regra 1\n"; 
            (* *)printf "%d\n" !numFinal; 
            game(numFinal, count)
        );
    );
;;

let () =
    let n = Scanf.scanf " %d" (fun x -> x) in
    numFinal := n;
    (*if(!numFinal = 42) then (
        count := !count + 1
    );*)
    if(!numFinal >= 0 && !numFinal <= 1000000) then(
        game(numFinal,count)
    );
    if(!numFinal <> 42) then(
        printf "BAD LUCK\n"
    )
    else(
        (* *)printf "%d\n" !count
        (* printf "%d\n" !count*)
    )
