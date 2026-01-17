#!/bin/bash

samtools view y.sam 2> error.log | grep -v "^@" | sed 's/^chr//' > mapped_reads.txt

