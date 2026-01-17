params.input="/home/hp/exm/P7741_R1.fastq.gz"

process count {
input:
path reads
output:
stdout
script:
"""
gunzip -c ${reads} | awk ' NR % 4 == 2 
         { count ++ }
END{
if ( count > 0 )
 printf "%s\t%.f\t", FILENAME, count
}'
"""
}
workflow {
input_ch=Channel.fromPath(params.input)
count(input_ch)
count.out.view()
}
