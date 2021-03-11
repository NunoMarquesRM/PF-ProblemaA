#!/usr/bin/env python3
global itera, num

def function(N,i):
    global num, itera
    m = 0
    print(N)

    if(N <= 42):
        num = N
        itera = i
        return
    
    if(N % 5 == 0):
        print("Regra 3")
        m = 42
        i += 1
        function(N-m,i)
    
    elif(N % 3 == 0 or N % 4 == 0):
        aux1 = int(N % 10)
        aux2 = int(((N-aux1) % 100) / 10)
        m = int(aux1*aux2)
        i += 1
        regra = 2

        if(m == 0):
            m = int(N/2)
            regra = 1.0
        
        print("Regra "+str(regra))
        function(N-m,i)
    
    elif(N % 2 == 0):
        m = int(N/2)
        i += 1
        regra = 1
        print("Regra "+str(regra))
        function(N-m,i)


print("A resposta e 42!\n")
print("Introduza o valor: ")
num = int(input())
print("")
numInicial = num
itera = 0

function(num,itera)

if(num == 42):
    print(itera)
else:
    print("BAD LUCK")