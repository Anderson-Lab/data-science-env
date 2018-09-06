usernames = open("usernames.txt").read().split("\n")
start_port = 7001
for username in usernames:
	f = open(username+".sh","w")
	f.write("export PORT="+str(start_port))
	f.write("\n")
	f.write("export NAME=$(basename \"$1\" .sh)")
	f.close()
	start_port += 1
