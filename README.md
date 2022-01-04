# TP NGS: Differential genetic expression in Mesorhabditis belari related to genome elimination

TP NGS 2021: genome elimination in Mesorhabditis belari.

#Biological context

The nematode Mesorhabditis belari is one of several organisms showing a particularly interesting process called "genome elimination". This phenomenon consists of a programmed elimination of the genome during embryonic development that occurs in five events, always in somatic cells, and between cell stages 2 and 15. The part of the genome that is eliminated in somatic cells is always the same and mainly codes for repeated sequences. Thus, a potential explanation for this phenomenon could be that it regulates the expression of repeated elements, but this remains to be studied. 

Because the genes involved in this genome silencing are not yet known, the project presented here aims to identify these effectors through a transcriptomic screen, comparing the transcriptome of single embryos before, during and after the genome silencing phenomenon. 

For this purpose, M.belari embryos were sorted according to different developmental stages, the 1 and 2 cell stage before elimination, 4 and 8 cells during elimination, and 8 cells + 5h (about 60 cells) and 8 cells + 7h (about 100 cells) after elimination
The mRNAs were extracted from each of the embryos and duplicates were made for each of the six stages producing a total of 12 samples. These 12 samples were then sequenced by Illumina and mapped to the M.belari reference transcriptome.

#File organization

This project is organized in 4 directories: data, intermediary_results, results, scripts.


-> data: contains raw FastQ files obtained from the 12 samples sequencing
results: not linked to Git

-> intermediary results: contains the index construction from the reference genome, the quality analysis of the raw sequences, the trimming reports and the trimmed samples sequences 

-> results: contains the results from the Kallisto mapping (quantification) 

-> scripts: contains the different detailed scripts used for our analysis

# Timeline of the analysis

## Preprocessing data: cleaning data for the pseudo-mapping

_retrieving the sequenced reads from IGFL site which are in fastQ format
_rename the obtained sequences with simpler names: scripts/renamed_data.sh
_simplifier nom des fichiers en enlevant fastq.gz à la fin et analyser qualité des données avec fastQC: scripts/quality_control.sh
_en regardant fastq des données on a vu chute de qualité vers 80 reads donc on nettoie les données avec fastp pour s'arreter à 80 : scripts/cleaning_the_reads.sh
pas besoin de relancer fastqc apres fastp car il genere deja controle qualite
_on regarde nos données nettoyées: on est bien en %GC : bonnes données donc on passe au mapping
_pour kalisto pseudo mapping: recuperer les fichiers FASTA des CDS de belari sur wormbase: scripts/download_fasta_CDS_belari_for_mapping.sh
_indexer fichier fasta pour pouvoir faire la quantif : scripts/fastafiles_indexed.sh
_quantification: changer len 522 sd 200 et enlever boostrap mais laisser bias 
_lancer kallisto: aligne sur les cds et recup pr chacun des echant une table qui asso nmbre de compte par genes 

# JOUR 2

Auj : utilisation de R pour fusionner diff échantillons venant de kallisto : tx import, mais pb pour comparer les echant si on importe nos données brutes de bash : entre echant one st pas sur que ce soit normalisé : meme si on a mis ADN en qtité équimolaire c’est pas sur que ce soit vraiment identique : outil DESeq2 qui permet normaliser données selon un certn modèle et ensuite l’utilise pr faire comparaison 



_ensutie on fait la PCA: principal compoentn analysis :

