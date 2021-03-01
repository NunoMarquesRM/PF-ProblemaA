open Printf

(*  
let rec game(n,count) = 
    if((n mod 5) == 0) then
        begin
            (* printf("Regra 3"); *)
            m = 42;
            count := !count + 1
            game(n-m,count)
        end
    
    if((n mod 2) == 0) then
        printf "Entrou\n";
    
*)
let count = ref 0;;
let m = ref 0;;
let numFinal = ref 0;;
let aux1 = ref 0;;
let aux2 = ref 0;;

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

let () =
    let n = Scanf.scanf " %d" (fun x -> x) in
    numFinal := n;

    (* Se for multiplo de 5  *)
    if((n mod 5) = 0) then(
        printf "Regra 3\n";
        count := !count + 1;
        m := 42;
        numFinal:= n - !m
    )
    (* Se for par  *)
    else if((n mod 2) = 0) then(
        printf "Regra 1\n";
        count := !count + 1;
        m := n/2;
        numFinal := !numFinal - !m
        (* if(numFinal < 42) *)
    )
    else if((n mod 3) = 0 || (n mod 4) = 0) then(
        printf "Regra 2\n";
        count := !count + 1;
        aux1 := !numFinal mod 10;
        aux2 := (!numFinal - !aux1)/10;
        m := !aux1 * !aux2;
        numFinal := !numFinal - !m
    )
    else
        printf "CRL\n";
    

    printf "Numero: %d\nCount: %d\n" !numFinal !count



