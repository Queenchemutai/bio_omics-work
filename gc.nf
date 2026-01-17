params.file = "/home/hp/P7741_R1.fastq.gz"

process gc_count {

    input:
    path file

    output:
    stdout

    script:
    """
    gunzip -c ${file} | awk '
        NR % 4 == 2 {
            g_count += gsub(/[Gg]/,"");
            c_count += gsub(/[Cc]/,"");
            len += length(\$0)
        }
        END {
            if (len > 0)
                printf "%s\\t%.2f\\n", FILENAME, (g_count + c_count)/len*100;
            else
                print "0"
        }
    '
    """
}

workflow {
    input_ch = Channel.fromPath(params.file)
    gc_count(input_ch)
    gc_count.out.view()
}
