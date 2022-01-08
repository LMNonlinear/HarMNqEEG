# HarMNqEEG

**HarMNqEEG: priovd the MATLAB code for the evaluation of batch harmonized z-scores based on the multinational norms.**

## Installation

1. Extract the ZIP file (or clone the git repository) somewhere you can easily reach it.
2. Add the HarMNqEEG folder to your path in MATLAB: e.g.
   a. using the "setup" dialog in MATLAB;
   b. by running the addpath function from your command window or startup script.
   Note: this package requires Matlab R2021a or latter, since the gridded norm from non-uniform samples utilizes `griddedInterpolant` to interpolate multiple sets of values on same grid for the incoming sample.

## Usage

Folder main comtains the main process code including:

**step 0**: use data_gatherer.m [1] to calulate cross-spectrum

notes:

1. check the electrodes use in  data_gatherer.m
2. you can direct creat the meta information table when you run the data_gatherer.m loop according to the example

*.\data\example\DataInfo_Barbados1978Malnutrition_44.csv*

3. names in the data we provide has been encrypted with argon2.

**step 1**: run step1_preprocess_`<typeDPs>`.m  to get the DPs

**step 2**: run step2_harmonize_`<typeDPs>`.m to get the global z-scores, batch harmonized z-scores and batch harmonized DPs.

**step 3**: run step3_visualize_`<typeDPs>`.m to visualize the scatter plot of z-scores

Note:

1. `<typeDPs>` including traditional log-spectrum DPs (`log`) and Hermitian Riemannian DPs (`riemlogm`).
2. In **step 2**, need select one closed study for calculating batch harmonized z-scores and DPs.

## Example Data Description

The data is avilable [here](), extract data folder to the root of repository. The data include:

1. **example**:
   a. BarbadosMalnutrition contains the cross-spectrum tensor of Barbados 1978 malnutrition dataset [2] which got by running **step 0**.

   b. [DataInfo_Barbados1978Malnutrition_44.csv]() contains meta data including `age`, `frequency`, `sex`, `country`, `device`,  `reference`, `EEG epoch` and the `path` of cross-spectrum. and this table you can creat when calculate the cross-spectrum tensor in step 0.
   Note: take care with the EEG epoch whhihc will use in step2 for Hermitian positive defined (HPD) matrix regularization[3].
   the path of cross-spectrum should inlucing the path and name of .mat file which will used for load data in step 2.
2. **norm**:
   Including norms norm_`<typeDPs>`_`<model>`_`<batch>`.mat for calculate the global z-scores and batch harmonized z-scores for `<typeDPs>` and geometric mean for mapping the corss-spectrum tensor to tanget vector space in step and this only need for Hermitian Riemannian DPs Preprocessing.

## Remarks

1. HarMNqEEG norms including 11 studies, see in paper (HarMNqEEG). We now only support these 11 studies and when run step2, choose the closed one for harmonization.
   In futer work we will provide the function for estimating the batch norms of coming DPs.
2. Octave not fully support yet.

[1] Github location of the script: https://github.com/CCC-members/BC-V_group_stat/blob/master/data_gatherer.m

[2] Bringas Vega, M.L., Guo, Y., Tang, Q., Razzaq, F.A., Calzada Reyes, A., Ren, P., Paz Linares, D., Galan Garcia, L., Rabinowitz, A.G., Galler, J.R., Bosch-Bayard, J., Valdes Sosa, P.A., 2019. An Age-Adjusted EEG Source Classifier Accurately Detects School-Aged Barbadian Children That Had Protein Energy Malnutrition in the First Year of Life. Front. Neurosci. 13, 1222. https://doi.org/10.3389/fnins.2019.01222

[3] Schneider-Luftman, D., Walden, A.T., 2016. Partial Coherence Estimation via Spectral Matrix Shrinkage under Quadratic Loss. IEEE Trans. Signal Process. 64, 5767–5777. https://doi.org/10.1109/TSP.2016.2582464

Author: Ying Wang, Min Li, Pedro Antonio Valdés-Sosa.

Create Time: 2021

Copyright(c): 2020-2022 Ying Wang, <yingwangrigel@gmail.com>; Min Li, <minli.231314@gmail.com>; Pedro Antonio Valdés-Sosa <pedro.valdes@neuroinformatics-collaboratory.org>

Joint China-Cuba LAB, UESTC, Chengdu, China.
