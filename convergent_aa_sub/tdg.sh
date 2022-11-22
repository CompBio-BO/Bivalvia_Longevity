#!/bin/bash

for i in *faa; do timeout 5m java -cp /media/storage/mariangelaiannello/OXPHOS_prj_transcriptomes/REVISIONS/0V2_ALL4_TRIMM_AND_CORR_PVALUE/convergence/tdg09-1.1.2/dist/tdg09.jar tdg09.Analyse -alignment $i -tree ${i::-3}tree -groups Sl Ll > $i"_out.txt"; done
