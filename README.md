# Convergent evolution in long-lived bivalves

Among Metazoa, bivalves have the highest lifespan disparity, ranging from 1 to 500+ years, making them an important testing ground to understand aging mechanisms and the evolution of extended longevity. 
We analyzed transcriptomes from 30 bivalve species, including short- and long-lived species, to investigate signaures of convergent evolution in long-lived bivalves. 

Here we report genes showing signatures of convergent dN/dS, convergent positive selection and convergent amino acid substitution in 4 long-lived species: *Arctica islandica*, *Margaritifera margaritifera*, *Elliptio complanata*, *Lampsilis siliquoidea*

## Dataset

- *Tegillarca granosa*
- *Mizuhopecten yessoensis*
- *Amusium pleuronectes*
- *Perna viridis*
- *Bathymodiolus azoricus*
- *Mytilus edulis*
- *Pinna atropurpurea*
- *Pinctada margaritifera*
- *Saccostrea glomerata*
- *Crassostrea angulata*
- *Neotrigonia margaritacea*
- *Margaritifera margaritifera*
- *Cristaria plicata*
- *Lampsilis cardium*
- *Lampsilis siliquoidea*
- *Elliptio complanata*
- *Hyriopsis cumingii*
- *Lyonsia floridana*
- *Laternula elliptica*
- *Galeomma turtoni*
- *Sinonovacula constricta*
- *Sphaerium nucleus*
- *Mya arenaria*
- *Mactra chinensis*
- *Corbicula fluminea*
- *Ruditapes philippinarum*
- *Paphia textile*
- *Ruditapes decussatus*
- *Glossus humanus*
- *Arctica islandica*


## Selection analyses

>##  1. Convergent dN/dS
>**Method**: branch models implemented in codeml, We compared a model where all branches had a single ratio of non-synonymous to synonymous substitution rates (dN/dS) (model=0), with a model where the four long-lived species terminal branches (foreground) had a shared dN/dS value, yet different from all other branches (background) (model=2).

>**Data** in [convergent_dNdS folder](https://github.com/CompBio-BO/Bivalvia_Longevity/tree/main/convergent_dNdS): 
>- nucleatide alignments for each orthogroup showing signatures of convergent dN/dS in long-lived bivalves.
>- [species tree](https://github.com/CompBio-BO/Bivalvia_Longevity/blob/main/convergent_dNdS/species_tree.nwk)
>- [Likelihood Ratio Tests of general and alternative model investigated in codeml](https://github.com/CompBio-BO/Bivalvia_Longevity/blob/main/>convergent_dNdS/0vs2_4spp_FDR_sptree_likelihood.summary)
> - [dN/dS of genes in long-lived species](https://github.com/CompBio-BO/Bivalvia_Longevity/blob/main/convergent_dNdS/0vs2_4spp_FDR_sptree_foreground_dnds.summary)
> - [dN/dS of genes in short-lived species](https://github.com/CompBio-BO/Bivalvia_Longevity/blob/main/convergent_dNdS/0vs2_4spp_FDR_sptree_background_dnds.summary)

>## 2. Convergent positive selection
>**Method**: branch site test implemeted in [BUSTED](https://github.com/veg/hyphy-analyses/tree/master/BUSTED-MH)

>**Data** in [convergent_positive folder](https://github.com/CompBio-BO/Bivalvia_Longevity/tree/main/convergent_positive):
>- nucleatide alignments for each orthogroup showing signatures of positive selection in long-lived bivalves. 
>- busted output for each orthogroup
>- species tree for each orthogroup

>## 3. Convergent amino acid substitutions

>**Method**: inference of converengent change in amino acid profiles, implemented in TDG09

> **Data** in [converget_aa_sub folder](https://github.com/CompBio-BO/Bivalvia_Longevity/tree/main/convergent_aa_sub):
>- protein alignments for each orthogroup showing signatures of convergent amino acid substitutions in long-lived bivalves. 
>- tdg09 output for each orthogroup
>- species tree for each orthogroup


