import random

def draw_gifts(npersons, ntrials):
    "Simulate drawing gifts with npersons, ntrials times; return number of failures"
    nfail = 0
    for t in range(ntrials):
        hat = [i for i in range(npersons)]
        for i in range(npersons-1):
            # person i draws from the hat
            # hat[0]..hat[i-1] contain numbers already drawn
            # hat[i]..hat[npersons-1] contain eligible numbers
            j = random.randint(i, npersons-1)
            # redraw if necessary
            while hat[j] == i:
                j = random.randint(i, npersons-1)
            temp = hat[i]
            hat[i] = hat[j]
            hat[j] = temp
        if hat[npersons-1] == npersons-1:
            nfail += 1
    return nfail  
	
print(draw_gifts(5, 1000))