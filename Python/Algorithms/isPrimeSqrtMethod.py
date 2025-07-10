import math
import numpy as np

def is_prime_sqrt_method(num):
    for i in range(2, round(math.sqrt(num))):
        if num % i == 0:
            print("false")
            return False
    print("true")
    return True
    
is_prime_sqrt_method(23)