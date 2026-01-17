import gzip
import matplotlib.pyplot as plt

file = "/home/hp/test/P7741_R1.fastq.gz"
lines = []

with gzip.open( file, "rt") as f:
 for i, line in enumerate(f):
  if i % 4 ==1:
   lines.append(len(line.strip()))

plt.hist(lines, bins=50)
plt.xlabel("Read length")
plt.ylabel("Frequency")
plt.title("Read length distribution")
plt.show()
