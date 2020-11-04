def generate_numbers(N:int, M:int, prefix=None):

    prefix = prefix or []

    if M == 0:
        print(prefix)
        return
    
    for digit in range(N):
        prefix.append(digit)
        generate_numbers(N, M-1, prefix)
        prefix.pop()

def gen_bin(M, prefix=""):
    if M == 0:
        print(prefix)
        return
    gen_bin(M-1, prefix+"0")
    gen_bin(M-1, prefix+"1")
        

generate_numbers(4, 3, None)
gen_bin(4)
