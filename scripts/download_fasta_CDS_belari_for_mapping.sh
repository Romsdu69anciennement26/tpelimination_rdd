mkdir -p data/cds_belari

wget https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS16/species/mesorhabditis_belari/PRJEB30104/mesorhabditis_belari.PRJEB30104.WBPS16.CDS_transcripts.fa.gz  -P data/cds_belari

gunzip data/cds_belari/mesorhabditis_belari.PRJEB30104.WBPS16.CDS_transcripts.fa.gz

#recup les données FASTA des CDS de belari sur wormbase parasite pour faire mapping 
