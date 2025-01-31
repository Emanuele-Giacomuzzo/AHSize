# How this data was produced and how to assemble it

This folder contains the data obtained from the microcosm experiment. Two lowest threshold levels of pixel intensities were used to differentiate between individuals and the background using ImageJ (herein referred to simply as "thresholds") because different protist species were better identified at different thresholds. Specifically, *Colpidium sp.*, *Euglena gracilis*, *Euplotes aediculatus*, *Loxocephalus sp.*, *Paramecium aurelia*, *Paramecium caudatum*, *Spirostomum teres*, and *Tetrahymena cf. pyriformis* were identified with a lower threshold of 13 while *Blepharisma sp.*, *Cephalodella sp.*, and *Spirostomum sp.* were identified with a lower threshold of 40. Data was obtained from video files through the following steps. First, we used the script in 2_r_files \> video_analysis to analyze videos at all time points and training data with threshold set to 13 (thresholds \<- c(13, 255)) and save the results in 1_data. Second, we repeated adjusting the threshold to 40 (thresholds \<- c(40, 255)). To assemble the data, see how we did it in master.html.

# Time point / training data (e.g., 13_threshold_analysis_t0)

Files with the individuals that were filmed during the experiment. The first number in the file name refers to the threshold level (13 or 40), the end of the file name refers to the time point filmed (t0, t1, t2, t3, t4) or to whether the training monocultures were filmed (training). All the columns have been created during movement analysis using BEMOVI, which is based on ImageJ movement analysis. These columns can be found in the output of imageJ. Each row refers to an individual filmed at a certain time point. Each data file represents a time point (t0 = time point 0, t1 = time point 1, t2 = time point 2, etc.), except for training which refers to the monocultures we filmed before the experiment to train the species identification model. All metrics (e.g., mean, standard deviation) refer to an individual across frames.

file: name of the video file\
mean_grey: mean brightness of the individual\
sd_grey: standard deviation of the brightness of the individual\
mean_area: mean area of the individual (µm²)\
sd_area: standard deviation of the area of the individual (µm²)\
mean_perimeter: mean perimeter length of the individual (µm)\
sd_perimeter: standard deviation of the perimeter length of the individual (µm)\
mean_major: mean length of the major body axis of the individual (µm)\
sd_major: standard deviation of the length of the major body axis of the individual (µm)\
mean_minor: mean length of the minor body axis of the individual (µm)\
sd_minor: standard deviation of the length of the minor body axis of the individual (µm)\
mean_ar: mean aspect ratio of the individual, which is the ratio of the major to minor axis\
sd_ar: standard deviation of the aspect ratio of the individual\
mean_turning: mean turning angle of the individual\
sd_turning: standard deviation of the turning angle of the individual\
duration: time for which the individual was filmed (s)\
N_frames: number of frames in which the individual was filmed\
max_net: maximum net displacement, which is the furthest distance achieved from the starting point (µm)\
net_disp: net displacement, which is the distance between the initial and final positions (µm)\
net_speed: net speed, which is how quickly an object moves from its starting point to its ending point (µm/s)\
gross_disp: gross displacement, which is the total distance traveled by an object along its actual path (µm)\
gross_speed: gross speed, which is the speed of an object calculated based on the total distance traveled along its actual path (µm/s)\
max_gross_speed: maximum gross speed (µm/s)\
min_gross_speed: minimum gross speed (µm/s)\
max_step: largest single movement an object between two frames (µm)\
min_step: smallest single movement an object between two frames (µm)\
sd_step: standard deviation of the step lengths (distances traveled between consecutive time points or frames) of an object throughout its trajectory (µm)\
sd_gross_speed: standard deviation of the gross speed of an object over a series of time intervals or frames during its movement analysis (µm/s)\
id: identification number for the individual\
date: date on which the video was taken\
time_point: time point filmed\
day: day after which the experiment started (date of assembly = 0)\
culture_ID: ecosystem ID\
trophic_type (present only in t0): whether a subsample of the autotrophic or the heterotrophic master bottle was filmed\
species (present only in training): species filmed to gather data for training the species ID model

# Ecosystem info

The columns in the ecosystems_info file represent the following (this file uses two synonyms for ecosystem-patch and culture).

culture_ID: ID of the ecosystem\
system_nr: ID of the system (a system is either an unconnected ecosystem or a connected meta-ecosystem; in other words, an unconnected ecosystem has its own system number, while two connected ecosystems share the same system number)\
treatment_replicate: treatment replicate\
patch_size: size of the ecosystem (S = small, M = medium, L = large)\
patch_size_ml: size of the ecosystem (ml)\
trophic_type: whether an ecosystem was autotrophic or heterotrophic metaecosystem: indicates whether the ecosystem is part of a connected meta-ecosystem\
metaecosystem_type: type of connected meta-ecosystem the ecosystem is part of (S_S = small-small, M_M = medium-medium, L_L = large-large, S_L = small-large)\
eco_metaeco_type: ecosystem type followed by the connected meta-ecosystem it is part of in parentheses

## Old

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