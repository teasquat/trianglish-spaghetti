n = 3

for x in range(0,2):
	for y in range(0,2):
		for z in range(0,2):
			for w in range (0,2):
				print("v {} {} {} {}".format(x,y,z,w))

for i in range(1,17):
	for j in range(i+1, 17):
		print("l {} {}".format(i,j))
