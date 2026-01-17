params.file="/home/hp/P7741_R1.fastq.gz"

process amb {

    input:
    path file

    output:
    stdout

    script:
    """
    gunzip -c $file | awk '
    NR % 4 == 2 {
        n_count += gsub(/[Nn]/, "")
        len += length(\$0)
    }
    END {
        if (len > 0)
            printf "%s\\t%.2f\\n", FILENAME, (n_count/len)*100
        else
            print "0"
    }'
    """
}

workflow {
    ch = Channel.fromPath(params.file)
    amb(ch)
    amb.out.view()
}
