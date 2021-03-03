open Printf

let count = ref 0;;
let m = ref 0;;
let numFinal = ref 0;;
let aux1 = ref 0;;
let aux2 = ref 0;;
let flag = ref true;;
let regra = ref 0;;

(* Retirado de:

    https://stackoverflow.com/questions/14328600/ocaml-looking-at-a-specific-digit-of-an-int

Transforma os digitos de um inteiro numa lista de inteiros

let digits n =
    let rec loop n acc =
        if n = 0 then acc
        else loop (n/10) (n mod 10::acc) in
    match n with
    | 0 -> [0]
    | _ -> loop n []
*)

(*  *)
let rec game(numFinal,count) = 
    m := 0;
    if(!numFinal > 42) then(
        (* Se for multiplo de 5  *)
        if((!numFinal mod 5) = 0) then(
            (*printf "Regra 3\n";*)
            count := !count + 1;
            m := 42;
            numFinal:= !numFinal - !m;
            game(numFinal, count)
        )
        (* Se for par (multiplo de 2) *)
        else if((!numFinal mod 2) = 0) then(
            count := !count + 1;
            m := !numFinal/2;
            regra := 1;
            if((!numFinal - !m) < 42) then(
                aux1 := !numFinal mod 10;
                aux2 := (!numFinal - !aux1)/10;
                m := !aux1 * !aux2;
                regra := 2
            );
            (*printf "Regra %d\n" !regra;*)
            numFinal:= !numFinal - !m;
            game(numFinal, count)
        )
        (* Se for multiplo de 3 ou multiplo de 4 *)
        else if((!numFinal mod 3) = 0 || (!numFinal mod 4) = 0) then(
            count := !count + 1;
            aux1 := !numFinal mod 10;
            aux2 := (!numFinal - !aux1)/10;
            m := !aux1 * !aux2;
            regra := 2;
            if((!numFinal - !m) < 42) then(
                m := !numFinal/2;
                regra := 1;
            );
            (*printf "Regra %d\n" !regra;*)
            numFinal:= !numFinal - !m;
            game(numFinal, count)
        );
    );
;;

let () =
    let n = Scanf.scanf " %d" (fun x -> x) in
    numFinal := n;
    if(!numFinal >= 0 && !numFinal <= 1000000) then(
        game(numFinal,count)
    );
    if(!numFinal <> 42) then(
        printf "BAD LUCK\n"
    )
    else(
        (*printf "Numero: %d\nCount: %d\n" !numFinal !count*)
        printf "%d\n" !count
    )
    (*
    if(!numFinal >= 0 && !numFinal <= 1000000) then(
        while !flag do
            m := 0;
            if(!numFinal < 43) then(
                flag := false;
            )
            (* Se for multiplo de 5  *)
            else if((!numFinal mod 5) = 0) then(
                printf "Regra 3\n";
                count := !count + 1;
                m := 42
            )
            (* Se for par (multiplo de 2) *)
            else if((!numFinal mod 2) = 0) then(
                count := !count + 1;
                m := !numFinal/2;
                regra := 1;
                if((!numFinal - !m) < 42) then(
                    aux1 := !numFinal mod 10;
                    aux2 := (!numFinal - !aux1)/10;
                    m := !aux1 * !aux2;
                    regra := 2
                );
                printf "Regra %d\n" !regra;
            )
            (* Se for multiplo de 3 ou multiplo de 4 *)
            else if((!numFinal mod 3) = 0 || (!numFinal mod 4) = 0) then(
                count := !count + 1;
                aux1 := !numFinal mod 10;
                aux2 := (!numFinal - !aux1)/10;
                m := !aux1 * !aux2;
                regra := 2;
                if((!numFinal - !m) < 42) then(
                    m := !numFinal/2;
                    regra := 1;
                );
                printf "Regra %d\n" !regra;
            )
            else(
                (*printf "CRL\n";*)
                flag := false;
            );
            numFinal:= !numFinal - !m;
            printf "%d\n" !numFinal
        done
    );

    if(!numFinal <> 42) then(
        printf "BAD LUCK\n"
    )
    else(
        printf "Numero: %d\nCount: %d\n" !numFinal !count
    )*)
