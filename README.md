# TP NGS elimination

REMEMBER ROMANE: quand on crée script toujours mettre .sh à la fin
on s'interesse a sequencer a diff temps pr voir elimination du genome, sequence a etapes 1 cell 5 et 8 cells...

_recuperer les reads séquencées sur site de IGFL qui sont en format fastQ: scripts/datadownload.sh
_déplacer les data séquencées de Fastq_files dans un nouveau dossier fastq_files: data/ fastq_files 
_renomer les séquences obtenues avec des noms plus sympatoches : scripts/renamed_data.sh
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

