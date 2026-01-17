params.file = "/home/hp/test/P7741_R1.fastq.gz"
process read_length {
input:
path seq
output:
stdout
script:
"""
gunzip -c $seq | awk '
 NR %4 == 2 {
    total += length(\$0)
    count++
    }
 END {
      if ( count > o )
      print "%s\\t.%2f\\n", FILENAME , total/count
    }'
"""
}
workflow {
length_ch=channel.fromPath(params.file)
read_length(length_ch)
read_length.out.view()
}
