params.file = "/home/hp/test/ag99.fasta"

process count {
 input:
  path reads
 output:
  stdout
 script:
 """
 awk ' 
  /^>/ { count++ }
  END { printf "%s\\t%d\\n", FILENAME, count }
  ' $reads
 """
}
workflow {
file_ch=Channel.fromPath(params.file)
count(file_ch)
count.out.view()
}
