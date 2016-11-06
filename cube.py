n = 3

for x in range(0,2):
	for y in range(0,2):
		for z in range(0,2):
			print("v {} {} {}".format(x,y,z))

for i in range(1,9):
	for j in range(i+1, 9):
		print("l {} {}".format(i,j))
