# Predicting contraceptive use from sociodemographic characteristics

I created this project to get hands-on practice with machine learning techniques using the same dataset I used for my dissertation. 
My aim is to focus entirely on the principles of machine learning and am therefore using a dataset I am very familiar with, 
so my time spent on variable treatment is minimal.

2011 - 2017 data were downloaded from the National Survey of Family Growth website and created from .dat files using the SAS programs provided by NSFG.

## Individual file information
### make_table.R
Create analytic tables from SAS fixed width files provided by NCHS.

### var_tx.R
Clean and transform variables for use in the models.

### model.R
Analysis script for initial model(s).

### 2015_2017_FemRespSetup.sas
Program provided by NCHS and updated by me to download the 2015-2017 dataset. Provided as an example of loading script.