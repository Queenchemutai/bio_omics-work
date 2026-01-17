#!/bin/bash
input="/home/hp/test/ag99.fasta"
awk ' /^>/ 
        { seq_count++; next }
        { total_seq += length($0) }
   END { 
       if (seq_count -gt 0)
       printf "%s\\t%f\\n", FILENAME, seq_count, total_seq, total_seq/seq_count
       else
       print "no input"
      }' "$input"

