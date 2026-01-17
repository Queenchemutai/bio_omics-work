params.file = "/home/hp/test/ag99.fasta"
process seq_length {
input:
path seq
output:
stdout
script:
"""
cat $seq | awk '
 !/^>/ { total += length(\$0) }
 END { printf "%s\\t.2f\\n", FILENAME, total}
 ' $seq
"""
}

workflow {
seq_ch=Channel.fromPath(params.file)
seq_length(seq_ch)
seq_length.out.view()
}
