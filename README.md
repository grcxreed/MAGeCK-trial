# mageck trial
```
| 
|-- raw_data/
|   |-- sample1
|
|-- processed_data/
|   |-- leukemia_dataset.csv
|
|-- results/
|
|-- scripts/
|   |--prepare_fq.sh
|   |--run_mageck.sh
|
|-- metadata/
|   |-- sample_info.csv
|   |-- experimental_conditions.csv
|   
|-- quality_control/
|   |-- qc_reports/
|   |-- qc_plots/
|
|-- references/
|   |-- GRCh38.p14.fasta
|
|-- config/
|   |-- settings.yml
|
|-- .gitignore
|
|-- nextflow/               
|   |-- main.nf             
|   |-- nextflow.config      
|   |-- env_configs/         
|   |-- Dockerfile
```
This pipeline sets up an automated workflow for preparing raw data for a CRISPR sceen analysis by MAGeCK, running MAGeCK, and performing quality control. The pipeline is modular and can be easily extended or customized based on specific data analysis needs. The output would be gene-level analysis results which show: genes with their associated log-fold changes, Z-scores, and p-values; genes which are depleted, that is, genes that are critical for leukemia cell survival, meaning their knockout causes cell death, these are potential tumor suppressor genes; and enriched genes that promote leukemia cell survival or growth, meaning their knockout provides a growth disadvantage and these are potential oncogenes; the pipeline also allows MAGeCK to generate visualizations such as volcano plots or ranked gene lists, which visually show which genes are significantly enriched or depleted. 



