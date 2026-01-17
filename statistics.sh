#!/bin/bash
gunzip -c P7741_R1.fastq.gz | awk '
  NR % 4 == 2 {
  total += length($0)
   count++
}
END {
 if (count > 0)
  print "mean read length:", total/count
}'
