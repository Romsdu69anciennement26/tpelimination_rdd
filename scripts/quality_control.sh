mkdir -p intermediary_results/raw_quality

for FASTQ_GZ_FILES in data/fastq_files/*gz
do
  FASTQ_GZ_NAME=$(basename $FASTQ_GZ_FILES)
  FASTQ_GZ_PREFIX=${FASTQ_GZ_NAME/.fastq.gz}
  echo $FASTQ_GZ_FILES
  echo $FASTQ_GZ_NAME
  echo $FASTQ_GZ_PREFIX
  fastqc $FASTQ_GZ_FILES -o intermediary_results/raw_quality -t 7
done
 
#intégrer fastqc dans la boucle apres avoir enleve les suffixes de nos noms de fichiers
#utilsier echo devant fasqc pour tester si ca marche bien puis l'enlever et RUN
