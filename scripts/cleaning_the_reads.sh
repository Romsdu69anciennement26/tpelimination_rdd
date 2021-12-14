mkdir -p intermediary_results/trim_data/
mkdir -p intermediary_results/report_trimming/

for FASTQ_GZ_FILES in data/fastq_files/*gz
do
  FASTQ_GZ_NAME=$(basename $FASTQ_GZ_FILES)
  FASTQ_GZ_PREFIX=${FASTQ_GZ_NAME/.fastq.gz}
  echo $FASTQ_GZ_FILES
  echo $FASTQ_GZ_NAME
  echo $FASTQ_GZ_PREFIX
  
  OUT_FASTQ_GZ="intermediary_results/trim_data/${FASTQ_GZ_PREFIX}_trim.fastq.gz"
  OUT_REPORTS_PREFIX="intermediary_results/report_trimming/${FASTQ_GZ_PREFIX}"
  echo $OUT_FASTQ_GZ
  echo $OUT_REPORTS_PREFIX
  
  fastp --thread 7 \
    --qualified_quality_phred 30 \
    --max_len1 80 \
    --in1 ${FASTQ_GZ_FILES} \
    --out1 ${OUT_FASTQ_GZ} \
    --html ${OUT_REPORTS_PREFIX}.html \
    --json ${OUT_REPORTS_PREFIX}_fastp.json \
    --report_title ${FASTQ_GZ_PREFIX}
done

#fastp pour nettoyer nos données et s'arreter à 80 reads : len 80
#on ne trouve pas d'adaptateur normal car on n'a pas séquencé les adaptateurs 