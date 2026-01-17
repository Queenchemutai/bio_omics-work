params.input="/home/hp/test/P7741_R1.fastq.gz"
/*
process
*/
process npipe {
input:
path file
output:
stdout
script:
"""
gunzip -c $file | awk '
                      NR % 4 == 2 {
                       total += length(\$0)
                       count++ 
                       }
END {
   if ( total > 0 )
   printf "%s\\t%d\\n", FILENAME, total, total/count
}'
"""
}
/*
workflow
*/
workflow {
input_ch=Channel.fromPath(params.input)
npipe(input_ch)
npipe.out.view()
}
