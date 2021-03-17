open Printf

let f n =
    if n < 10
    then ( -1, -1, false )
    else
        let a = n mod 10 in
        let b = n mod 100 / 10 in
        ( a, b, true )

(* Se for par (multiplo de 2) *)
let rec r1 n =
    if n mod 2 == 0
    then 1 + core ( n / 2 )
    else 1000000

(* Se for multiplo de 3 ou multiplo de 4 *)
and r2 n =
    if n mod 3 == 0 || n mod 4 == 0
    then
        let ( x1, x2, x3 ) = f n in
        if x3 && x1 * x2 == 0
        then 1000000
        else 1 + core ( n - x1 * x2 )
    else 1000000

(* Se for multiplo de 5  *)
and r3 n =
    if n mod 5 == 0
    then 1 + core ( n - 42 )
    else 1000000

and core n =
    if n < 42 then 1000000 else
    if n == 42 then 0 else
    let a = r1 n in
    let b = r2 n in
    let c = r3 n in
    if a < b && a < c then a
    else
        if b < c then b else c

let _ =
    let n = Scanf.scanf " %d" (fun x -> x) in
    let r = core n in
    if r < 1000000 then
        printf "%d\n" r
    else
        print_endline "BAD LUCK"