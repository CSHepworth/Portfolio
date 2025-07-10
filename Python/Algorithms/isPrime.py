import math

def isPrime(num):
    for i in range(1, num):
        print(i)
        if i != 1 & i != num & num % i == 0:
            print("false")
            return False
    print("true")
    return True

isPrime(7)