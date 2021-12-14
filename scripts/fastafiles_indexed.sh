mkdir -p intermediary_results/quantification/index_belari

CDS_FASTA=data/cds_belari/mesorhabditis_belari.PRJEB30104.WBPS16.CDS_transcripts.fa
INDEX_OUT_PREFIX=intermediary_results/quantification/index_belari/mesorhabditis_belari

kallisto index -k 31 --make-unique -i ${INDEX_OUT_PREFIX}.index ${CDS_FASTA} \
2> ${INDEX_OUT_PREFIX}_kallisto_index_report.txt