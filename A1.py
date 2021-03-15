#!/usr/bin/env python3

print("A resposta e 42!\n")
print("Introduza o valor: ")
num = int(input())
print("---")
numInicial = num
itera = 0
dicionario = {}

testeAux = 0

""" while(True):
    m = 0
    teste = num
    print(num)
    if(num <= 42):
        break
    
    if(num % 5 == 0):
        print("Regra 3")
        m = 42
        itera += 1
        dicionario[num] = num-m
        num = num-m
    
    elif(num % 3 == 0 or num % 4 == 0):
        aux1 = int(num % 10)
        aux2 = int(((num-aux1) % 100) / 10)
        m = int(aux1*aux2)
        itera += 1
        regra = 2

        if(m == 0):
            m = int(num/2)
            regra = 1.0
        
        print("Regra "+str(regra))
        dicionario[num] = num-m
        num = num-m
    
    elif(num % 2 == 0):
        m = int(num/2)
        itera += 1
        regra = 1
        print("Regra "+str(regra))
        dicionario[num] = num-m
        num = num-m
    
    if(teste == num):
        break """
i = 0

while(True):
    m = 0
    teste = num
    print(num)
    if(num <= 42):
        break
    
    if(num % 5 == 0):
        print("Regra 3")
        m = 42
        itera += 1
        if(dicionario.get(str(num)) == None):
            dicionario[str(num)] = [(num-m)]
        else:
            dicionario[str(num)].append(num-m)
        
    
    if(num % 3 == 0 or num % 4 == 0):
        aux1 = int(num % 10)
        aux2 = int(((num-aux1) % 100) / 10)
        m = int(aux1*aux2)
        itera += 1
        regra = 2

        if(m == 0):
            m = int(num/2)
            regra = 1.0
        
        print("Regra "+str(regra))
        if(dicionario.get(str(num)) == None):
            dicionario[str(num)] = [(num-m)]
        else:
            dicionario[str(num)].append(num-m)
        
    
    if(num % 2 == 0):
        m = int(num/2)
        itera += 1
        regra = 1
        print("Regra "+str(regra))
        if(dicionario.get(str(num)) == None):
            dicionario[str(num)] = [(num-m)]
        else:
            dicionario[str(num)].append(num-m)
        
    if(len(dicionario.get(str(num))) <= i):
        i=0
        
    num = dicionario[str(num)][i]
    i+= 1
    if(teste == num):
        break


print(dicionario)

if(num == 42):
    print(itera)
else:
    print("BAD LUCK")