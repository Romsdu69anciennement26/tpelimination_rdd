# TP NGS: Differential genetic expression in Mesorhabditis belari related to genome elimination

TP NGS 2021: genome elimination in Mesorhabditis belari.

# Biological context

The nematode Mesorhabditis belari is one of several organisms showing a particularly interesting process called "genome elimination". This phenomenon consists of a programmed elimination of the genome during embryonic development that occurs in five events, always in somatic cells, and between cell stages 2 and 15. The part of the genome that is eliminated in somatic cells is always the same and mainly codes for repeated sequences. Thus, a potential explanation for this phenomenon could be that it regulates the expression of repeated elements, but this remains to be studied. 

Because the genes involved in this genome silencing are not yet known, the project presented here aims to identify these effectors through a transcriptomic screen, comparing the transcriptome of single embryos before, during and after the genome silencing phenomenon. 

For this purpose, M.belari embryos were sorted according to different developmental stages, the 1 and 2 cell stage before elimination, 4 and 8 cells during elimination, and 8 cells + 5h (about 60 cells) and 8 cells + 7h (about 100 cells) after elimination
The mRNAs were extracted from each of the embryos and duplicates were made for each of the six stages producing a total of 12 samples. These 12 samples were then sequenced by Illumina and mapped to the M.belari reference transcriptome.

# File organization

This project is organized in 4 directories: data, intermediary_results, results, scripts:

-> data: contains raw FastQ files obtained from the 12 samples sequencing
results: not linked to Git
-> intermediary results: contains the index construction from the reference genome, the quality analysis of the raw sequences, the trimming reports and the trimmed samples sequences 
-> results: contains the results from the Kallisto mapping (quantification) 
-> scripts: contains the different detailed scripts used for our analysis

# Timeline of the analysis

## Preprocessing data: cleaning data for the pseudo-mapping

_retrieving the data: retrieved from IGFL site, sequenced reads were in fastQ format: scripts/datadownload.sh

_renaming the data: sequenced data names were unclear so they were renamed with simpler names: scripts/renamed_data.sh. The  Fastq files were copied in the intermediary_results directory under more informative names.

_qualitity analysis: using fastQC: scripts/quality_control.sh. The results show that the data are of good quality except at the end, so the reads will be trimmed and kept to 80bp for further analysis. The GC percentage shows a multimodal distribution which is unusual but will not prevent further analysis.

_cleaning the data: looking at fastq data we saw quality drop around 80 reads so data were cleaned with fastp to stop at 80: scripts/cleaning_the_reads.sh
NB: no need to restart fastqc after fastp as it already generates quality control

_quality analysis post-cleaning: the reports of all samples were aggregated in one reader-friendly file using the multiqc method.

_Index building for pseudomapping of the sample reads: The first step was to import the annotated M.belari DNA Coding Sequences (CDS) from the WormBase Parasite database:scripts/download_fasta_CDS_belari_for_mapping.sh. The annoted coding sequences (cds) will be used for the index construction.

_index constrution: construction of a transcription index using kallisto. The index is based on cds (coding sequences) of M.belari, and will be used for the pseudomapping of the samples read : scripts/fastafiles_indexed.sh

Quantification running: 
_pseudomapping: Each sample was pseudomapped to the index constructed using kallisto, reads were taken at one end. Arbitrary lengths and standard deviation were first provided based on the sequencing quality analysis. We finally chose a fragment length of 552 and a standard deviation of 200, based on the sequencing report of the Illumina data from IGFL: scripts/quantification.sh

_aggregating report: The pseudo-mapping data from each sample was aggregated into a single file: scripts/aggregated_results.sh. By analyzing the aggregation ratio, a low mapping ratio (less than 30%) was measured. Several hypotheses explaining this phenomenon have been ruled out (such as potential contamination or a poorly annotated genome) but it is possible that the Kallisto parameters themselves impact on the mapping ratio.


# JOUR 2

Auj : utilisation de R pour fusionner diff échantillons venant de kallisto : tx import, mais pb pour comparer les echant si on importe nos données brutes de bash : entre echant one st pas sur que ce soit normalisé : meme si on a mis ADN en qtité équimolaire c’est pas sur que ce soit vraiment identique : outil DESeq2 qui permet normaliser données selon un certn modèle et ensuite l’utilise pr faire comparaison 



_ensutie on fait la PCA: principal compoentn analysis :

