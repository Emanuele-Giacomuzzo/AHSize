# AHSize

*Ecosystem size tunes the spatial feedback between autotrophic and heterotrophic ecosystems.*

## Abstract

The connection between autotrophic and heterotrophic ecosystems (e.g., the connection between a lake and a forest) can impact their biomass and biodiversity. However, it is uncertain if the size of the ecosystems has any effect on this connection. For example, what would happen if instead of having a lake and a forest of the same size the lake or the forest was larger? Here, we examined how differences in ecosystem size affected the impact of spatial feedback on the biodiversity and functioning of two-patch meta-ecosystems that were connected through non-living resource flows in a protist experiment. We found that when the autotrophic patch was larger, the connection between the patches led to an increase in the total biomass of the meta-ecosystem. Conversely, when the heterotrophic patch was larger, the connection resulted in a decrease in the total biomass of the meta-ecosystem. We also observed that ecosystem size played a critical role in determining the effects of the connection at a local (ecosystem) level. Our findings reveal that differences in patch sizes can significantly influence biodiversity and function in cross-ecosystem dynamics among ecosystems of varying types.

## Content of the repository

This repository contains data and code from a microcosm experiment designed to investigate whether ecosystem size can mediate the effects of the spatial feedback between autotrophic and heterotrophic ecosystems on ecosystem function. To gather this data, cultures were filmed for 28 days. The videos were analyzed using the R package BEMOVI, which is based on ImageJ, by tracking particles and excluding those that couldn't have been protists. The repository includes data files obtained from the video analysis and code used for data analysis. The flow for data analysis can be found in the master r markdown file and its associated code chunks (referred to as "children" in r markdown). This data will be used for the upcoming publication: *Ecosystem size tunes the spatial feedback between autotrophic and heterotrophic ecosystems.* This repository is structured with the following folders and files:

-   1_data: Data files obtained from analysing the culture videos with the R package BEMOVI
-   2_r_files: R files to analyse the data
-   3_results: Results saved during the analysis
-   renv: Files related to the r package `renv`. This package enables you to restore the exact package versions used when working on this project.
-   Design.png: figure with the experimental design
-   library.bib: Bibliography database file
-   master.Rmd: Master file to produce the R markdown with the analysis of the data
-   master.html Results of the analysis from master.Rmd
-   AHSize.Rproj: AHSize project on RStudio
-   [renv.lock](https://github.com/Emanuele-Giacomuzzo/AHSize/blob/master/renv.lock "renv.lock"): File from the package `renv` which contains information on which packages (and versions) were used when working on this project.

## R and R studio versions

This project was developed using the following versions:

-   R: 4.3.2

-   RStudio: 2023.12.1.402

## Installation and Code Execution

1.  Open the AHSize project by opening the AHSize.Rproj file using RStudio.
2.  Install the `knitr` package if you do not have installed installed on your machine. Do not worry about installing other packages (see step 4).
3.  Open the master r markdown file master.Rmd
4.  Press the 'knit' button to generate the HTML file containing the analysed data. By knitting the R markdown file, the R package `renv` installs all the necessary packages with the correct versions in the project, so that you don't need to manually manage package versions.

## R packages

Although the `renv` package should enable you to reinstall all packages with the correct versions, I'm providing you with the necessary packages in case there are any issues with `renv`.

**Attached base packages:**
- stats
- graphics
- grDevices
- utils
- datasets
- methods
- base

**Other attached packages:**
- renv_1.0.7.9000
- lmerTest_3.1-3
- lme4_1.1-35.4
- Matrix_1.6-5
- emmeans_1.8.8

**Loaded via a namespace (and not attached):**
- sandwich_3.1-0
- utf8_1.2.4
- generics_0.1.3
- lattice_0.22-6
- digest_0.6.36
- magrittr_2.0.3
- evaluate_0.24.0
- grid_4.3.2
- estimability_1.4.1
- mvtnorm_1.2-4
- fastmap_1.2.0
- survival_3.5-7
- multcomp_1.4-25
- fansi_1.0.6
- scales_1.3.0
- TH.data_1.1-2
- codetools_0.2-20
- numDeriv_2016.8-1.1
- cli_3.6.3
- rlang_1.1.4
- cowplot_1.1.3
- munsell_0.5.1
- splines_4.3.2
- yaml_2.3.8
- tools_4.3.2
- nloptr_2.1.1
- coda_0.19-4.1
- minqa_1.2.7
- dplyr_1.1.4
- colorspace_2.1-0
- ggplot2_3.5.1
- boot_1.3-30
- vctrs_0.6.5
- R6_2.5.1
- zoo_1.8-12
- lifecycle_1.0.4
- MASS_7.3-60
- pkgconfig_2.0.3
- pillar_1.9.0
- gtable_0.3.5
- glue_1.7.0
- Rcpp_1.0.12
- xfun_0.45
- tibble_3.2.1
- tidyselect_1.2.1
- rstudioapi_0.16.0
- knitr_1.47
- xtable_1.8-4
- htmltools_0.5.8.1
- nlme_3.1-163
- rmarkdown_2.27
- compiler_4.3.2