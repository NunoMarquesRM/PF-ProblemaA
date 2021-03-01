#!/usr/bin/env python3

print("A resposta e 42!\n")
print("Introduza o valor: ")
num = int(input())
m = num

itera = 0

while(True):
    m = 0
    if(num % 5 == 0):
        print("Regra 3")
        m = 42
        itera += 1
    
    elif(num % 2 == 0):
        m = int(num/2)
        itera += 1
        regra = 1
        
        if(num-m < 42):
            aux1 = int(num / 10)
            aux2 = int(num-(aux1*10))
            m = int(aux1*aux2)
            regra = 2
        
        print("Regra "+str(regra))
    
    elif(num % 3 == 0 or num % 4 == 0):
        # Ex: m = 23
        # aux1 = 2
        # aux2 = 23 - 20 = 3
        aux1 = int(num / 10)
        aux2 = int(num-(aux1*10))
        # OU
        #n = 23
        #x = n % 10
        #y = int((n-x)/10)
        # x = 3 e y = 2
        m = int(aux1*aux2)
        itera += 1
        
        regra = 2

        if(num-m < 42):
            m = num/2
            regra = 1
        
        print("Regra "+str(regra))
    
    num = num - m
    print(num)
    if(num == 42):
        print(itera)
        break
    if(num < 42 or m == 0):
        print("BAD LUCK")
        break
