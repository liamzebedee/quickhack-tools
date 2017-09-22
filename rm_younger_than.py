import sys
import os

# Test:
# touch a.jpg b.jpg && sleep 2 && touch c.jpg d.jpg && python test.py 10 && ls

def rm_younger_than(x_seconds):
	print("Deleting younger than %ds" % x_seconds)
	current_date = int(os.popen("date +%s").read())
	files_n_dates = os.popen("stat --printf='%n %X\n' *.jpg").read().strip()
	for line in files_n_dates.split('\n'):
		file, date = line.partition(" ")[::2]
		date = int(date)
		diff = current_date - date
		if diff < x_seconds:
			print("{} - born {}s ago - now gone.".format(file, diff))
			os.system("rm "+file)
		else:
			print("{} - skipped".format(file))

if(len(sys.argv) < 2):
	print("Usage: python rm_younger_than.py <milliseconds>")
else:
	rm_younger_than(int(sys.argv[1]))
