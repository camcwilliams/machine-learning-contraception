*Ran setup file to create sas dataset to move to R so I don't have to pull in .dat file;
*Kept commenting-out as it was in the original script, so applied labels but not formats;

/*--------------------------------------------------------------------------
 |                                                                         
 |           NATIONAL SURVEY OF FAMILY GROWTH (NSFG), 2015-2017
 |
 |                       SAS Female Data Setup File
 |
 |
 | SAS setup sections are provided for the ASCII version of this data
 | collection.  These sections are listed below:
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions. Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set.
 |
 | INFILE:  identifies the input file to be read with the input statement.
 | Users must replace the "data-filename" with a filename specifying the
 | directory on the user's computer system in which the downloaded and
 | unzipped data file is physically located (e.g., "c:\temp\data.dat").
 |
 | INPUT:  assigns the name, type, decimal specification (if any), and
 | specifies the beginning and ending column locations for each variable
 | in the data file.
 |
 | LABEL:  assigns descriptive labels to all variables. Variable labels
 | and variable names may be identical for some variables.
 |
 | MISSING VALUE NOTE:  To maintain the original meaning of missing codes,
 | users may want to take advantage of the SAS missing values (the letters
 | A-Z or an underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .; 
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables named in the INPUT statement.
 |
 | Users should modify this setup file to suit their specific needs.
 | To include these sections in the final SAS setup, users should remove the
 | SAS comment indicators from the desired section(s).
 |
 |-------------------------------------------------------------------------*/

* SAS PROC FORMAT;

/*
PROC FORMAT;
   value ABNPAP3F
      1="Yes"
      5="No"
      6="No Pap test in past 3 years"
      8="Refused"
      9="Don't know" ;
   value ACASILANG
      1="English"
      2="Spanish"
      7="Not ascertained" ;
   value ADDEXP
      0="NO ADDITIONAL BIRTHS"
      5=".5 ADDITIONAL BIRTHS"
      10="1 ADDITIONAL BIRTH"
      15="1.5 ADDITIONAL BIRTHS"
      20="2 ADDITIONAL BIRTHS"
      25="2.5 ADDITIONAL BIRTHS"
      30="3 ADDITIONAL BIRTHS"
      35="3.5 ADDITIONAL BIRTHS"
      40="4 ADDITIONAL BIRTHS"
      45="4.5 ADDITIONAL BIRTHS"
      50="5 ADDITIONAL BIRTHS"
      55="5.5 ADDITIONAL BIRTHS"
      60="6 ADDITIONAL BIRTHS"
      65="6.5 ADDITIONAL BIRTHS"
      70="7 ADDITIONAL BIRTHS"
      75="7.5 ADDITIONAL BIRTHS"
      80="8 ADDITIONAL BIRTHS"
      85="8.5 ADDITIONAL BIRTHS"
      90="9 ADDITIONAL BIRTHS"
      95="9.5 ADDITIONAL BIRTHS"
      100-995="10 OR MORE ADDITIONAL BIRTHS" ;
   value ADPTOTKD
      1="Yes, adopted"
      3="Yes, became guardian"
      5="No, neither"
      8="Refused"
      9="Don't know" ;
   value AG95NRDF
      0-14="UNDER 15 YEARS"
      15-17="15-17 YEARS"
      18-19="18-19 YEARS"
      20-95="20 YEARS OR OLDER"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value AGDGFMT
      1="Strongly agree"
      2="Agree"
      3="Disagree"
      4="Strongly disagree"
      5="If R insists: Neither agree nor disagree"
      8="Refused"
      9="Don't know" ;
   value AGE1944F
      0-19="UNDER 20 YEARS"
      20-24="20-24 YEARS"
      25-29="25-29 YEARS"
      30-34="30-34 YEARS"
      35-49="35-49 YEARS" ;
   value AGE25NRDF
      0-14="UNDER 15 YEARS"
      15-17="15-17 YEARS"
      18-25="18-25 YEARS"
      98="Refused"
      99="Don't know" ;
   value AGE44NRDF
      0-14="UNDER 15 YEARS"
      15-17="15-17 YEARS"
      18-19="18-19 YEARS"
      20-49="20 YEARS OR OLDER"
      98="Refused"
      99="Don't know" ;
   value AGECANCER
      0-17="UNDER 18 YEARS"
      18-24="18-24 YEARS"
      25-49="25-49 YEARS"
      98="Refused"
      99="Don't know" ;
   value AGEF2F
      1="Younger than 18"
      2="18-21"
      3="22-29"
      4="30 or older"
      8="Refused"
      9="Don't know" ;
   value AGEFHPV
      0-19="UNDER 20 YEARS"
      20-24="20-24 YEARS"
      25-29="25-29 YEARS"
      30-49="30-49 YEARS"
      96="R only had 1 HPV exam"
      98="Refused"
      99="Don't know" ;
   value AGEFMT
      15="15 years"
      16="16 years"
      17="17 years"
      18="18 years"
      19="19 years"
      20="20 years"
      21="21 years"
      22="22 years"
      23="23 years"
      24="24 years"
      25="25 years"
      26="26 years"
      27="27 years"
      28="28 years"
      29="29 years"
      30="30 years"
      31="31 years"
      32="32 years"
      33="33 years"
      34="34 years"
      35="35 years"
      36="36 years"
      37="37 years"
      38="38 years"
      39="39 years"
      40="40 years"
      41="41 years"
      42="42 years"
      43="43 years"
      44="44 years"
      45="45 years"
      46="46 years"
      47="47 years"
      48="48 years"
      49-50="49 years" ;
   value AGEFPAP
      0-19="UNDER 20 YEARS"
      20-24="20-24 YEARS"
      25-29="25-29 YEARS"
      30-49="30-49 YEARS"
      96="R only had 1 pap test"
      98="Refused"
      99="Don't know" ;
   value AGEFPEL
      0-19="UNDER 20 YEARS"
      20-24="20-24 YEARS"
      25-29="25-29 YEARS"
      30-49="30-49 YEARS"
      96="R only had 1 pelvic exam"
      98="Refused"
      99="Don't know" ;
   value AGEHP
      10-24="UNDER 25 YEARS"
      25-49="25-49 YEARS"
      50-95="50 YEARS OR OLDER"
      98="Refused"
      99="Don't know" ;
   value AGEHPNA
      10-24="UNDER 25 YEARS"
      25-49="25-49 YEARS"
      50-95="50 YEARS OR OLDER"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value AGEMAM1F
      0-19="UNDER 20 YEARS"
      20-24="20-24 YEARS"
      25-29="25-29 YEARS"
      30-34="30-34 YEARS"
      35-39="35-39 YEARS"
      40-49="40-49 YEARS"
      98="Refused"
      99="Don't know" ;
   value AGEMOMBF
      1="LESS THAN 18 YEARS"
      2="18-19 YEARS"
      3="20-24 YEARS"
      4="25-29 YEARS"
      5="30 OR OLDER"
      95="NO MOTHER OR MOTHER-FIGURE"
      96="MOTHER-FIGURE HAD NO CHILDREN" ;
   value AGERFEMC
      12-17="UNDER 18 YEARS"
      18-49="18-49 YEARS"
      98="Refused"
      99="Don't know" ;
   value AGERFF
      15="15 YEARS"
      16="16 YEARS"
      17="17 YEARS"
      18="18 YEARS"
      19="19 YEARS"
      20="20 YEARS"
      21="21 YEARS"
      22="22 YEARS"
      23="23 YEARS"
      24="24 YEARS"
      25="25 YEARS"
      26="26 YEARS"
      27="27 YEARS"
      28="28 YEARS"
      29="29 YEARS"
      30="30 YEARS"
      31="31 YEARS"
      32="32 YEARS"
      33="33 YEARS"
      34="34 YEARS"
      35="35 YEARS"
      36="36 YEARS"
      37="37 YEARS"
      38="38 YEARS"
      39="39 YEARS"
      40="40 YEARS"
      41="41 YEARS"
      42="42 YEARS"
      43="43 YEARS"
      44="44 YEARS"
      45="45 YEARS"
      46="46 YEARS"
      47="47 YEARS"
      48="48 YEARS"
      49-50="49 YEARS" ;
   value AGESCRN
      15="15 years"
      16="16 years"
      17="17 years"
      18="18 years"
      19="19 years"
      20="20 years"
      21="21 years"
      22="22 years"
      23="23 years"
      24="24 years"
      25="25 years"
      26="26 years"
      27="27 years"
      28="28 years"
      29="29 years"
      30="30 years"
      31="31 years"
      32="32 years"
      33="33 years"
      34="34 years"
      35="35 years"
      36="36 years"
      37="37 years"
      38="38 years"
      39="39 years"
      40="40 years"
      41="41 years"
      42="42 years"
      43="43 years"
      44="44 years"
      45="45 years"
      46="46 years"
      47="47 years"
      48="48 years"
      49="49 years" ;
   value AIDSTALKF
      1="How HIV/AIDS is transmitted"
      2="Other sexually transmitted diseases like gonorrhea, herpes, or Hepatitis C"
      3="The correct use of condoms"
      4="Needle cleaning/using clean needles"
      5="Dangers of needle sharing"
      6="Abstinence from sex (not having sex)"
      7="Reducing your number of sexual partners"
      8="Condom use to prevent HIV or STD transmission"
      9='"Safe sex" practices (abstinence, condom use, etc)'
      10="Getting tested and knowing your HIV status"
      20="Some other topic - not shown separately"
      98="Refused"
      99="Don't know" ;
   value ANYBCF
      1="yes, at least one month of method use"
      2="no, no months of method use" ;
   value APROCESSF
      1="Fees were too high"
      2="There were not enough kids available"
      3="Some other reason"
      8="Refused"
      9="Don't know" ;
   value ATTNDF
      1="More than once a week"
      2="Once a week"
      3="2-3 times a month"
      4="Once a month (about 12 times a year)"
      5="3-11 times a year"
      6="Once or twice a year"
      7="Never"
      8="Refused"
      9="Don't know" ;
   value ATTRACT
      1="Only attracted to males"
      2="Mostly attracted to males"
      3="Equally attracted to males and females"
      4="Mostly attracted to females"
      5="Only attracted to females"
      6="Not sure"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value BARRIERF
      1="I did not need to see a doctor in the last year"
      2="I did not know where to go for care"
      3="I could not afford to pay for a visit"
      4="I was afraid to hear bad news"
      5="I had privacy/confidentiality concerns"
      6="I could not take time off from work"
      7="Insurance"
      8="Not sexually active"
      9="Time/busy"
      10="Didn't make appt"
      11="Don't like/trust doctors"
      20="Something else (please specify)"
      98="Refused"
      99="Don't know" ;
   value BCPLCF
      1="Private doctor's office"
      2="HMO facility"
      3="Community health clinic, community clinic, public health clinic"
      4="Family planning or Planned Parenthood Clinic"
      5="Employer or company clinic"
      6="School or school-based clinic"
      7="Hospital outpatient clinic"
      8="Hospital emergency room"
      9="Hospital regular room"
      10="Urgent care center, urgi-care or walk-in facility"
      11="In-store health clinic (like CVS, Target, or Walmart)"
      20="Some other place"
      98="Refused"
      99="Don't know" ;
   value BCREAS
      1="Yes"
      5="No"
      6="No, not using any method at the time"
      8="Refused"
      9="Don't know" ;
   value BCWHYFF
      1="Health or medical problem"
      2="Some other reason"
      3="Both"
      8="Refused"
      9="Don't know" ;
   value BFAFTF
      1="Before"
      2="After"
      8="Refused"
      9="Don't know" ;
   value BIONUMFF
      1="1 CHILD"
      2="2 CHILDREN"
      3-95="3 OR MORE CHILDREN"
      98="Refused"
      99="Don't know" ;
   value BIRTHS5F
      0="0 BIRTHS"
      1="1 BIRTH"
      2="2 BIRTHS"
      3-6="3 OR MORE BIRTHS" ;
   value BMI
      15-60="15-60"
      95="Could not be defined" ;
   value BNGE30T
      0="NONE"
      1="1 TIME"
      2="2 TIMES"
      3="3 TIMES"
      4="4 TIMES"
      5-95="5 OR MORE TIMES"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value CANCTYPEF
      1="Bladder cancer"
      2="Bone cancer"
      3="Brain cancer or tumor, spinal cord cancer, or other cancer of the central nervous system"
      4="Breast cancer"
      5="Cervical cancer (cancer of the cervix)"
      6="Colon cancer"
      7="Endometrial cancer (cancer of the uterus)"
      8="Head and neck cancer"
      9="Heart cancer"
      10="Leukemia/blood cancer"
      11="Liver cancer"
      12="Lung cancer"
      13="Lymphoma including Hodgkins disease/lymphoma and non-Hodgkins lymphomas"
      14="Melanoma"
      15="Neuroblastoma"
      16="Oral (mouth/tongue/lip) cancer"
      17="Ovarian (ovary) cancer"
      18="Pancreatic (pancreas) cancer"
      19="Pharyngeal (throat) cancer"
      20="BLANK"
      21="Rectal (rectum) cancer"
      22="Renal (kidney) cancer"
      23="Stomach cancer"
      24="Thyroid cancer"
      25="Other"
      26="Blood"
      27="Esophageal (esophagus) cancer"
      29="Gallbladder cancer"
      30="Laryngeal (larynx/windpipe) cancer"
      31="Skin cancer (non-melanoma)"
      32="Skin cancer (DK what kind)"
      33="Soft tissue (muscle or fat) sarcoma"
      34="BLANK"
      98="Refused"
      99="Don't know" ;
   value CASEID
      70622-80715="Respondent ID number" ;
   value CASIGRAD
      1-6="Grades 1-6"
      7-9="Grades 7-9"
      10-12="Grades 10-12"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value CASINUM
      0="NO PREGNANCIES"
      1="1 PREGNANCY"
      2="2 PREGNANCIES"
      3-95="3 OR MORE PREGNANCIES"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value CASISMK
      0="NEVER SMOKED REGULARLY"
      11="11 YEARS OR YOUNGER"
      12="12 YEARS OLD"
      13="13 YEARS OLD"
      14="14 YEARS OLD"
      15="15 YEARS OLD"
      16="16 YEARS OLD"
      17="17 YEARS OLD"
      18="18 YEARS OLD"
      19="19 YEARS OLD"
      20-24="20-24 YEARS OLD"
      25-29="25-29 YEARS OLD"
      30-49="30-49 YEARS OLD"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value CEBOW
      0="NONE"
      1="1 CHILD"
      2="2 CHILDREN"
      3-95="3 OR MORE CHILDREN" ;
   value CHBOTHER
      1="A great deal"
      2="Some"
      3="A little"
      4="Not at all"
      8="Refused"
      9="Don't know" ;
   value CMDATEUSE
      378-1340="Before Sept 2011"
      1341-1352="Sept 2011-Aug 2012"
      1353-1364="Sept 2012-Aug 2013"
      1365-1376="Sept 2013-Aug 2014"
      1377-1388="Sept 2014-Aug 2015"
      1389-1400="Sept 2015-Aug 2016"
      1401-1413="Sept 2016-Sept 2017"
      90000-99999="Date estimated" ;
   value CMFMT
      378-1340="Before Sept 2011"
      1341-1352="Sept 2011-Aug 2012"
      1353-1364="Sept 2012-Aug 2013"
      1365-1376="Sept 2013-Aug 2014"
      1377-1388="Sept 2014-Aug 2015"
      1389-1400="Sept 2015-Aug 2016"
      1401-1413="Sept 2016-Sept 2017"
      9997="Not ascertained"
      9998="Refused"
      9999="Don't know" ;
   value CMFSEX
      378-1340="Before Sept 2011"
      1341-1352="Sept 2011-Aug 2012"
      1353-1364="Sept 2012-Aug 2013"
      1365-1376="Sept 2013-Aug 2014"
      1377-1388="Sept 2014-Aug 2015"
      1389-1400="Sept 2015-Aug 2016"
      1401-1413="Sept 2016-Sept 2017"
      9996="Only had sex once with this partner"
      9998="Refused"
      9999="Don't know" ;
   value CMFSTSEX
      378-1340="Before Sept 2011"
      1341-1352="Sept 2011-Aug 2012"
      1353-1364="Sept 2012-Aug 2013"
      1365-1376="Sept 2013-Aug 2014"
      1377-1388="Sept 2014-Aug 2015"
      1389-1400="Sept 2015-Aug 2016"
      1401-1413="Sept 2016-Sept 2017"
      9996="Never had sex"
      9998="Refused"
      9999="Don't know" ;
   value CMJAN3YRF
      1345="January 2012"
      1357="January 2013"
      1369="January 2014" ;
   value CMJAN4YRF
      1333="January 2011"
      1345="January 2012"
      1357="January 2013" ;
   value CMJAN5YRF
      1321="January 2010"
      1333="January 2011"
      1345="January 2012" ;
   value CMLSEXFP
      378-1340="Before Sept 2011"
      1341-1352="Sept 2011-Aug 2012"
      1353-1364="Sept 2012-Aug 2013"
      1365-1376="Sept 2013-Aug 2014"
      1377-1388="Sept 2014-Aug 2015"
      1389-1400="Sept 2015-Aug 2016"
      1401-1413="Sept 2016-Sept 2017"
      9996="Only had sex once with first partner"
      9998="Refused"
      9999="Don't know" ;
   value CMMHCALF
      1345-1416="Jan 2012-Dec 2017" ;
   value CMPGVISL
      378-1340="Before Sept 2011"
      1341-1352="Sept 2011-Aug 2012"
      1353-1364="Sept 2012-Aug 2013"
      1365-1376="Sept 2013-Aug 2014"
      1377-1388="Sept 2014-Aug 2015"
      1389-1400="Sept 2015-Aug 2016"
      1401-1413="Sept 2016-Sept 2017"
      9996="Only had 1 visit"
      9998="Refused"
      9999="Don't know" ;
   value COHEVER
      1="YES, EVER COHABITED (LIVED WITH A MAN OUTSIDE OF MARRIAGE)"
      2="NO, NEVER COHABITED (LIVED WITH A MAN OUTSIDE OF MARRIAGE)" ;
   value COHNUM
      0="None"
      1="One"
      2="Two"
      3-HIGH="Three or more" ;
   value COHOUT
      1="INTACT COHABITATION"
      2="INTACT MARRIAGE"
      3="DISSOLVED MARRIAGE"
      4="DISSOLVED COHABITATION" ;
   value COHSTAT
      1="NEVER COHABITED OUTSIDE OF MARRIAGE"
      2="FIRST COHABITED BEFORE FIRST MARRIAGE"
      3="FIRST COHABITED AFTER FIRST MARRIAGE" ;
   value CONDTMS
      0="Not at all or never"
      1-50="1 or more times"
      998="Refused"
      999="Don't know" ;
   value CONSTATF
      1="Female sterilization"
      2="Male sterilization"
      3="Norplant or Implanon implant"
      5="Depo-Provera (injectable)"
      6="Pill"
      7="Contraceptive Patch"
      8="Contraceptive Ring"
      9="Emergency contraception"
      10="IUD"
      11="Diaphragm (with or w/out jelly or cream)"
      12="(Male) Condom"
      13="Female condom/vaginal pouch"
      14="Foam"
      15="Cervical Cap"
      16="Today(TM) Sponge"
      17="Suppository or insert"
      18="Jelly or cream (not with diaphragm)"
      19="Periodic abstinence: NFP, cervical mucus test or temperature rhythm"
      20="Periodic abstinence: calendar rhythm"
      21="Withdrawal"
      22="Other method"
      30="Pregnant"
      31="Seeking Pregnancy"
      32="Postpartum"
      33="Sterile--nonsurgical--female"
      34="Sterile--nonsurgical--male"
      35="Sterile--surgical--female (noncontraceptive)"
      36="Sterile--surgical--male (noncontraceptive)"
      37="[code not used]"
      38="Sterile--unknown reasons-male"
      39="[code not used]"
      40="Other nonuser--never had intercourse since first period"
      41="Other nonuser--has had intercourse, but not in the 3 months prior to interview"
      42="Other nonuser--had intercourse in the 3 months prior to interview"
      88="Inapplicable (no 2nd, 3rd, or 4th method reported)" ;
   value COVERHOWF
      1="Private health insurance plan (from employer or workplace; purchased directly; through a state or local government program or community program)"
     
      2="Medicaid-additional name(s) for Medicaid in this state: [MEDICAID_FILL]"
      3="Medicare"
      4="Medi-GAP"
      5="Military health care including: the VA, CHAMPUS, TRICARE, CHAMP-VA"
      6="Indian Health Service, or Single Service Plan"
      7="CHIP"
      8="State-sponsored health plan"
      9="Other government health care"
      98="Refused"
      99="Don't know" ;
   value CSPBIO
      0="No joint biological children"
      1="1 joint biological child"
      2="2 joint biological children"
      3="3 or more joint biological children" ;
   value CSPBIOKD
      0-15="Number of biological children R has had with her current husband or cohabiting partner" ;
   value CSPNOT
      0="No such child"
      1="1 or more such children" ;
   value CURBCAMT
      1="Under $10"
      2="$10-$25"
      3="$26-$50"
      4="$51-$100"
      5="Over $100"
      8="Refused"
      9="Don't know" ;
   value CURR_INS
      1="Currently covered by private health insurance or Medi-Gap"
      2="Currently covered by Medicaid, CHIP, or a state-sponsored health plan"
      3="Currently covered by Medicare, military health care, or other government health care"
      4="Currently covered only by a single-service plan, only by the Indian Health Service, or currently not covered by health insurance" ;
   value CURRPRTS
      0="NONE"
      1="1 PARTNER"
      2-95="2 OR MORE PARTNERS" ;
   value CURRREL
      2="Engaged to him"
      4="Going with him or going steady"
      5="Going out with him once in a while"
      6="Just friends"
      7="Had just met him"
      8="Something else"
      98="Refused"
      99="Don't know" ;
   value DATESEX1F
      378-1340="Before Sept 2011"
      1341-1352="Sept 2011-Aug 2012"
      1353-1364="Sept 2012-Aug 2013"
      1365-1376="Sept 2013-Aug 2014"
      1377-1388="Sept 2014-Aug 2015"
      1389-1400="Sept 2015-Aug 2016"
      1401-1413="Sept 2016-Sept 2017"
      9595="NEVER HAD A MENSTRUAL PERIOD BUT HAS HAD INTERCOURSE" ;
   value DEFPROBF
      1="Definitely yes"
      2="Probably yes"
      3="Probably no"
      4="Definitely no"
      8="Refused"
      9="Don't know" ;
   value DEGREES
      1="Associate's degree"
      2="Bachelor's degree"
      3="Master's degree"
      4="Doctorate degree"
      5="Professional school degree"
      8="Refused"
      9="Don't know" ;
   value DFPRBNAF
      1="Definitely yes"
      2="Probably yes"
      3="Probably no"
      4="Definitely no"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value DGHT918F
      0="No daughters"
      1="1 daughter"
      2="2 or more daughters" ;
   value DIABETES
      1="Yes"
      3="If volunteered: Borderline or Pre-Diabetes"
      5="No"
      8="Refused"
      9="Don't know" ;
   value DIPGED
      1="High school diploma"
      2="GED only"
      3="Both"
      5="Neither"
      8="Refused"
      9="Don't know" ;
   value DOLASTWK
      1="Working"
      2="Working - Maternity leave or temp leave"
      3="Not working, looking for work"
      4="Keeping house or taking care of family"
      5="In school"
      6="Other"
      8="Refused"
      9="Don't know" ;
   value DRINKF
      1="Never"
      2="Once or twice during the year"
      3="Several times during the year"
      4="About once a month"
      5="About once a week"
      6="About once a day"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value DRNK30D
      0="0 DAYS"
      1="1 DAY"
      2="2 DAYS"
      3-30="3 OR MORE DAYS"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value DRNKNUM
      1="1 DRINK"
      2="2 DRINKS"
      3="3 DRINKS"
      4="4 DRINKS"
      5="5 DRINKS"
      6-95="6 OR MORE DRINKS"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value DRUGFRF
      1="Never"
      2="Once or twice during the year"
      3="Several times during the year"
      4="About once a month or more"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value DUCHFREQ
      1="Never"
      2="Once a month or less often"
      3="2-3 times a month"
      4="Once a week"
      5="2-3 times a week"
      6="4-6 times a week"
      7="Every day"
      8="Refused"
      9="Don't know" ;
   value DURFSTER
      1="Less than six months"
      2="At least six months, but less than a year"
      3="At least a year but less than two years"
      4="At least two years but less than three years"
      5="Three years or more"
      8="Refused"
      9="Don't know" ;
   value DURTRY_N
      0-48="0-48"
      95="Not trying to get pregnant"
      98="Refused"
      99="Don't know" ;
   value DURTRY_P
      1="Months"
      2="Years"
      8="Refused"
      9="Don't know" ;
   value EARN
      1="Under $96 (weekly)/Under $417 (monthly)/Under $5,000 (yearly)"
      2="$96-$143 (weekly)/$417-624 (monthly)/$5,000-7,499 (yearly)"
      3="$144-191 (weekly)/$625-832 (monthly)/$7,500-9,999 (yearly)"
      4="$192-239 (weekly)/$833-1,041 (monthly)/$10,000-12,499 (yearly)"
      5="$240-288 (weekly)/$1,042-1,249 (monthly)/$12,500-14,999 (yearly)"
      6="$289-384 (weekly)/$1,250-1,666 (monthly)/$15,000-19,999 (yearly)"
      7="$385-480 (weekly)/$1,667-2,082 (monthly)/$20,000-24,999 (yearly)"
      8="$481-576 (weekly)/$2,083-2,499 (monthly)/$25,000-29,999 (yearly)"
      9="$577-672 (weekly)/$2,500-2,916 (monthly)/$30,000-34,999 (yearly)"
      10="$673-768 (weekly)/$2,917-3,332 (monthly)/$35,000-39,999 (yearly)"
      11="$769-961 (weekly)/$3,333-4,166 (monthly)/$40,000-49,999 (yearly)"
      12="$962-1,153 (weekly)/$4,167-4,999 (monthly)/$50,000-59,999 (yearly)"
      13="$1,154-1,441 (weekly)/$5,000-6,249 (monthly)/$60,000-74,999 (yearly)"
      14="$1,442-1,922 (weekly)/$6,250-8,332 (monthly)/$75,000-99,999 (yearly)"
      15="$1,923 or more (weekly)/$8,333 or more (monthly)/$100,000 or more (yearly)"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value ECREASONF
      1="You were worried your birth control method would not work"
      2="You didn't use birth control that time"
      3="Some other reason"
      8="Refused"
      9="Don't know" ;
   value ECRX
      1="With a prescription"
      2="Without a prescription"
      8="Refused"
      9="Don't know" ;
   value ECWHEN
      1="Yes (Within the last 12 months)"
      2="No (Over 12 months ago)"
      8="Refused"
      9="Don't know" ;
   value EDUCAT
      9="9TH GRADE OR LESS"
      10="10TH GRADE"
      11="11TH GRADE"
      12="12TH GRADE"
      13="1 YEAR OF COLLEGE/GRAD SCHOOL"
      14="2 YEARS OF COLLEGE/GRAD SCHOOL"
      15="3 YEARS OF COLLEGE/GRAD SCHOOL"
      16="4 YEARS OF COLLEGE/GRAD SCHOOL"
      17="5 YEARS OF COLLEGE/GRAD SCHOOL"
      18="6 YEARS OF COLLEGE/GRAD SCHOOL"
      19="7+ YEARS OF COLLEGE/GRAD SCHOOL" ;
   value EDUCFMT
      1="Less than high school"
      2="High school graduate or GED"
      3="Some college but no degree"
      4="2-year college degree (e.g., Associate's degree)"
      5="4-year college graduate (e.g., BA, BS)"
      6="Graduate or professional school"
      8="Refused"
      9="Don't know" ;
   value EDUCMOM
      1="Less than high school"
      2="High school graduate or GED"
      3="Some college, including 2-year degrees"
      4="Bachelor's degree or higher"
      95="No mother-figure identified" ;
   value ENGAGF
      1="YES, ENGAGED TO BE MARRIED"
      3="NOT ENGAGED BUT HAD DEFINITE PLANS TO GET MARRIED"
      5="NO, NEITHER ENGAGED NOR HAD DEFINITE PLANS"
      8="Refused"
      9="Don't know" ;
   value ENGSPEAK
      1="Very well"
      2="Well"
      3="Not well"
      4="Not at all"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value EVERADPT
      1="YES, HAS ADOPTED A CHILD"
      3="NO, BUT IS CURRENTLY TRYING TO ADOPT SPECIFIC CHILD"
      5="NO, AND NOT TRYING TO ADOPT A SPECIFIC CHILD" ;
   value EVERTUBS
      1="Yes"
      3="If volunteered: Operation failed"
      4="If volunteered: Had Essure procedure"
      5="No"
      6="If volunteered: Operation already reversed"
      8="Refused"
      9="Don't know" ;
   value EVHIVTST
      0="NO HIV TEST REPORTED"
      1="YES, ONLY AS PART OF BLOOD DONATION"
      2="YES, ONLY OUTSIDE OF BLOOD DONATION"
      3="YES, IN BOTH CONTEXTS" ;
   value EVMARCOH
      1="YES, EVER MARRIED OR COHABITED"
      2="NO, NEVER MARRIED OR COHABITED" ;
   value EVRMARRY
      0="NEVER MARRIED"
      1="EVER MARRIED" ;
   value EXPGRADE2F
      9="9th grade or less"
      10="10th grade"
      11="11th grade"
      12="12th grade"
      13="1 year of college or less"
      14="2 years of college"
      15="3 years of college"
      16="4 years of college/grad school"
      17="5 years of college/grad school"
      18="6 years of college/grad school"
      19="7 or more years of college and/or grad school"
      98="Refused"
      99="Don't know" ;
   value FECUND
      1="SURGICALLY STERILE, CONTRACEPTIVE"
      2="SURGICALLY STERILE, NONCONTRACEPTIVE"
      3="STERILE, NONSURGICAL"
      4="SUBFECUND"
      5="LONG INTERVAL (INFERTILE FOR 36+ MONTHS)"
      6="FECUND" ;
   value FIRSMETHF
      3="Birth control pills"
      4="Condom"
      5="Partner's vasectomy"
      6="Female sterilizing operation, such as tubal sterilization and hysterectomy"
      7="Withdrawal, pulling out"
      8="Depo-Provera, injectables"
      9="Hormonal implant (Norplant, Implanon, or Nexplanon)"
      10="Calendar rhythm, Standard Days, or Cycle Beads method"
      11="Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
      12="Diaphragm"
      13="Female condom, vaginal pouch"
      14="Foam"
      15="Jelly or cream"
      16="Cervical cap"
      17="Suppository, insert"
      18="Today sponge"
      19="IUD, coil, or loop"
      20="Emergency contraception"
      21="Other method -- specify"
      22="Respondent was sterile"
      23="Respondent's partner was sterile"
      24="Lunelle injectable (monthly shot)"
      25="Contraceptive patch"
      26="Vaginal contraceptive ring"
      98="Refused"
      99="Don't know" ;
   value FIRSTIME1F
      2="The first time you had intercourse"
      3="Less than a month after your first intercourse"
      4="One to three months after first intercourse"
      5="Four to twelve months after first intercourse"
      6="More than twelve months after first intercourse"
      8="Refused"
      9="Don't know" ;
   value FIRSTIME2F
      1="Before your first intercourse"
      2="The first time you had intercourse"
      3="Less than a month after your first intercourse"
      4="One to three months after first intercourse"
      5="Four to twelve months after first intercourse"
      6="More than twelve months after first intercourse"
      8="Refused"
      9="Don't know" ;
   value FMARIT
      0="DON'T KNOW/REFUSED"
      1="MARRIED"
      2="WIDOWED"
      3="DIVORCED"
      4="SEPARATED"
      5="NEVER MARRIED" ;
   value FMARITAL
      1="MARRIED TO A PERSON OF THE OPPOSITE SEX"
      2="WIDOWED"
      3="DIVORCED OR ANNULLED"
      4="SEPARATED"
      5="NEVER MARRIED" ;
   value FMARNO
      0="NEVER BEEN MARRIED"
      1="1 TIME"
      2="2 TIMES"
      3="3 TIMES"
      4-95="4 OR MORE TIMES" ;
   value FMARSTAT
      3="Widowed"
      4="Divorced or annulled"
      5="Separated, because you and your spouse are not getting along"
      6="Never been married"
      8="Refused"
      9="Don't know" ;
   value FMEDREASF
      1="Medical problems with your female organs"
      2="Pregnancy would be dangerous to your health"
      3="You would probably lose a pregnancy"
      4="You would probably have an unhealthy child"
      5="Some other medical reason"
      6="No medical reason for operation"
      8="Refused"
      9="Don't know" ;
   value FMETHODF
      1="Pill"
      2="Condom"
      3="Partner's vasectomy"
      4="Female sterilizing operation/tubal ligation"
      5="Withdrawal"
      6="Depo-Provera, injectables"
      7="Hormonal implant (Norplant, Implanon, or Nexplanon)"
      8="Calendar rhythm, Standard Days, or Cycle Beads method"
      9="Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
      10="Diaphragm"
      11="Female condom, vaginal pouch"
      12="Foam"
      13="Jelly or cream"
      15="Suppository, insert"
      16="Todaytm sponge"
      17="IUD, coil, loop"
      18="Emergency contraception"
      19="Other method"
      20="Respondent sterile (aside from sterilizing operation above)"
      21="Respondent's partner sterile (aside from vasectomy above)"
      22="Lunelle injectable"
      23="Contraceptive patch"
      24="Contraceptive ring" ;
   value FMINCDK1F
      1="Less than $50,000"
      5="$50,000 or more"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value FMT15F
      1="Less than 15 years"
      2="15 years or older"
      8="Refused"
      9="Don't know" ;
   value FMT18F
      1="Less than 18 years"
      2="18 years or older"
      8="Refused"
      9="Don't know" ;
   value FMT20F
      1="Less than 20 years"
      2="20 years or older"
      8="Refused"
      9="Don't know" ;
   value FPDUR
      0-995="Number of months between first and most recent sex with 1st partner"
      997="Only had sex once with first partner" ;
   value FPT12MOS
      1="Full-time"
      2="Part-time"
      3="Some of each"
      8="Refused"
      9="Don't know" ;
   value FPTIT
      1="TITLE X CLINIC"
      2="NON-TITLE X CLINIC" ;
   value FPTITHIV
      1="Clinic: Title X=yes; health department=yes"
      2="Clinic: Title X=yes; health department=no"
      3="Clinic: Title X=no; health department=yes"
      4="Clinic: Title X=no; health department=no"
      5="Clinic: Title X=yes; agency unknown"
      6="Clinic: Title X=no; agency unknown"
      7="Employer or company clinic/worksite"
      8="Private Doctor's office or HMO"
      9="Hospital emergency room/regular room/urgent care"
      10="Home"
      11="Military site"
      12="Lab or blood bank"
      13="Some other place" ;
   value FSAMEREL
      1="Married to her"
      2="Engaged to her"
      3="Living together in a sexual relationship, but not engaged"
      4="Going with her or going steady"
      5="Going out with her once in a while"
      6="Just friends"
      7="Had just met her"
      8="Something else"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value FSEXREL
      1="Married to him"
      2="Engaged to him"
      3="Living together in a sexual relationship, but not engaged"
      4="Going with him or going steady"
      5="Going out with him once in a while"
      6="Just friends"
      7="Had just met him"
      8="Something else"
      98="Refused"
      99="Don't know" ;
   value FUNDAMF
      1="A born again Christian"
      2="A charismatic"
      3="An evangelical"
      4="A fundamentalist"
      5="None of the above"
      8="Refused"
      9="Don't know" ;
   value GENHEALT
      1="Excellent"
      2="Very good"
      3="Good"
      4="Fair"
      5="Poor"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value GRFSTSXF
      6="6th grade or less"
      7="7th grade"
      8="8th grade"
      9="9th grade"
      10="10th grade"
      11="11th grade"
      12="12th grade"
      13="1st year in college"
      14="2nd year in college"
      15="3rd year in college"
      16="4th year in college"
      96="Not in school"
      98="Refused"
      99="Don't know" ;
   value HADSEX
      1="YES, R EVER HAD INTERCOURSE"
      2="NO, R NEVER HAD INTERCOURSE" ;
   value HHADALL
      1="Yes"
      5="No"
      6="If volunteered: R was not in a relationship with a man at the time she had this operation"
      8="Refused"
      9="Don't know" ;
   value HHFAMTYP
      1="No spouse/partner and no child(ren) (of R) 18 or younger"
      2="Spouse/partner, but no child(ren) (of R) 18 or younger"
      3="Spouse and R's child(ren) 18 or younger"
      4="Cohabiting partner and R's child(ren) 18 or younger"
      5="No spouse/partner, but child(ren) of R, 18 or younger" ;
   value HHKIDTYP
      0="No child(ren) 18 or younger in HH or only older child(ren)"
      1="At least one biological child (of R's) under 18 in HH, no nonbiological child(ren)"
      2="Any non-biological child (of R's) 18 or younger in HH" ;
   value HHPARTYP
      1="Both biological or both adoptive parents"
      2="Biological and step- or adoptive parent"
      3="Single parent (biological, adoptive, or stepparent)"
      4="Other" ;
   value HIEDUC
      5="9TH GRADE OR LESS"
      6="10TH GRADE"
      7="11TH GRADE"
      8="12TH GRADE, NO DIPLOMA (NOR GED)"
      9="HIGH SCHOOL GRADUATE (DIPLOMA OR GED)"
      10="SOME COLLEGE BUT NO DEGREE"
      11="ASSOCIATE DEGREE IN COLLEGE/UNIVERSITY"
      12="BACHELOR'S DEGREE"
      13="MASTER'S DEGREE"
      14="DOCTORATE DEGREE"
      15="PROFESSIONAL DEGREE" ;
   value HIGHBP
      1="Yes"
      5="No"
      6="If volunteered: Not told results"
      8="Refused"
      9="Don't know" ;
   value HIGRADE
      9="9th grade or less"
      10="10th grade"
      11="11th grade"
      12="12th grade"
      13="1 year of college or less"
      14="2 years of college"
      15="3 years of college"
      16="4 years of college/grad school"
      17="5 years of college/grad school"
      18="6 years of college/grad school"
      19="7 or more years of college and/or grad school"
      98="Refused"
      99="Don't know" ;
   value HISCHGRD
      1="1st grade"
      2="2nd grade"
      3="3rd grade"
      4="4th grade"
      5="5th grade"
      6="6th grade"
      7="7th grade"
      8="8th grade"
      9="9th grade"
      10="10th grade"
      11="11th grade"
      12="12th grade"
      98="Refused"
      99="Don't know" ;
   value HISPANIC
      1="HISPANIC"
      2="NON-HISPANIC" ;
   value HISPGRPF
      1="Mexican, Mexican American, or Chicana, only"
      2="All other Hispanic or Latina groups, including multiple responses"
      8="Refused"
      9="Don't know" ;
   value HISPRACE
      1="Hispanic"
      2="Non-Hispanic White"
      3="Non-Hispanic Black"
      4="Non-Hispanic Other" ;
   value HISPRACE2F
      1="Hispanic"
      2="Non-Hispanic White, Single Race"
      3="Non-Hispanic Black, Single Race"
      4="Non-Hispanic Other or Multiple Race" ;
   value HIVTST
      1="Part of medical checkup or surgical procedure (a doctor or medical provider asked for the test)"
      2="Required for health or life insurance coverage"
      3="Required for marriage license or to get married"
      4="Required for military service or a job"
      5="You wanted to find out if infected or not (you were the one who asked for the test)"
      6="Someone else suggested you should be tested (followed by WHOSUGG question)"
      7="Intentionally blank (a code used only for females, prenatal testing)"
      8="You might have been exposed through sex or drug use"
      9="You might have been exposed in some other way"
      20="Some other reason - not shown separately"
      21="Required for immigration or travel"
      22="Required for incarceration"
      23="Required for school"
      98="Refused"
      99="Don't know" ;
   value HMOTHMEN
      1="1 MAN"
      2="2 MEN"
      3-95="3 OR MORE MEN"
      98="Refused"
      99="Don't know" ;
   value HOWMANYR
      1="One"
      2="More than one"
      8="Refused"
      9="Don't know" ;
   value HOWPRGF
      0-50="0-50"
      98="Refused"
      99="Don't know" ;
   value HOWPRGWM
      1="Weeks"
      2="Months"
      8="Refused"
      9="Don't know" ;
   value HPLOCALE
      1="In household"
      2="Lives elsewhere"
      8="Refused"
      9="Don't know" ;
   value HPPREGQ
      1="Yes"
      5="No"
      6="(If volunteered:) no current partner"
      8="Refused"
      9="Don't know" ;
   value HPVSEX1F
      1="First intercourse"
      5="First HPV vaccine shot"
      8="Refused"
      9="Don't know" ;
   value IDCLINIC
      0="0"
      1="1"
      2="2"
      3="3"
      4="4"
      5="5"
      6="6"
      7="7"
      8="8"
      9="9"
      10="10"
      11="11"
      12="12" ;
   value IMPFLG
      0="QUESTIONNAIRE DATA (NOT IMPUTED)"
      1="MULTIPLE REGRESSION IMPUTATION"
      2="LOGICAL IMPUTATION" ;
   value INCHES
      60="60 inches or less"
      61="61 inches"
      62="62 inches"
      63="63 inches"
      64="64 inches"
      65="65 inches"
      66="66 inches"
      67="67 inches"
      68="68 inches"
      69="69 inches or more"
      96="Could not be defined" ;
   value INCWMYF
      1="Week"
      2="Month"
      3="Year"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value INFERT
      1="SURGICALLY STERILE"
      2="INFERTILE"
      3="FECUND" ;
   value INFRTPRBF
      1="Problems with ovulation"
      2="Blocked tubes"
      3="Other tube or pelvic problems"
      4="Endometriosis"
      5="Semen or sperm problems"
      6="Any other infertility problems"
      7="None of these problems"
      8="Refused"
      9="Don't know" ;
   value INTACT18F
      1="Yes"
      2="No"
      8="Refused"
      9="Don't know" ;
   value INTCTFAM
      1="TWO BIOLOGICAL OR ADOPTIVE PARENTS FROM BIRTH"
      2="ANYTHING OTHER THAN 2 BIOLOGICAL OR ADOPTIVE PARENTS FROM BIRTH" ;
   value INTENT
      1="R INTENDS TO HAVE (MORE) CHILDREN"
      2="R DOES NOT INTEND TO HAVE (MORE) CHILDREN"
      3="R DOES NOT KNOW HER INTENT" ;
   value INTEXPF
      0="NONE"
      1="1 CHILD"
      2="2 CHILDREN"
      3="3 CHILDREN"
      4-95="4 OR MORE CHILDREN"
      98="Refused"
      99="Don't know" ;
   value INTNEXT
      1="Within the next 2 years"
      2="2-5 years from now"
      3="More than 5 years from now"
      8="Refused"
      9="Don't know" ;
   value INTOFTF
      1="Every year"
      2="Every 2 years"
      3="Every 3 years"
      4="Every 4 years"
      7="Every 5 years"
      8="Less often than every 5 years"
      95="If R volunteers: More than once a year"
      96="If R volunteers: She would never need to be tested"
      98="Refused"
      99="Don't know" ;
   value INTVLNGTH
      14-263.17="14-263.17" ;
   value IUDTYPE
      1="Copper-bearing (such as Copper-T or ParaGard)"
      2="Hormonal IUD (such as Mirena or Skyla)"
      3="Other"
      8="Refused"
      9="Don't know" ;
   value JEXPECTS
      0="NONE"
      1="1 CHILD"
      2-95="2 OR MORE CHILDREN"
      98="Refused"
      99="Don't know" ;
   value KID18BF
      0="NONE"
      1-10="1 OR MORE CHILDREN"
      98="Refused"
      99="Don't know" ;
   value KID1PLUS
      0="NONE"
      1-6="1 OR MORE CHILDREN"
      98="Refused"
      99="Don't know" ;
   value KNDMDHLPF
      1="A method of birth control (or prescription)"
      2="Birth control counseling"
      3="Emergency contraception"
      4="Counseling about Emergency Contraception"
      5="A check-up or test for birth control"
      6="A pregnancy test"
      7="An abortion"
      8="A Pap smear or pelvic exam"
      9="Post-pregnancy care"
      10="STD or HIV testing"
      20="Other"
      98="Refused"
      99="Don't know" ;
   value LABORFOR
      1="Working full-time"
      2="Working part-time"
      3="Working, but on vacation, strike, or had temporary illness"
      4="Working - maternity or family leave"
      5="Not working but looking for work"
      6="In school"
      7="Keeping house"
      8="Caring for family"
      9="Other" ;
   value LASTHPV
      1="A year ago or less"
      2="More than 1 year ago but not more than 2 years"
      3="More than 2 years ago but not more than 3 years"
      4="More than 3 years ago but not more than 5 years"
      5="Over 5 years ago"
      8="Refused"
      9="Don't know" ;
   value LASTPAP
      1="A year ago or less"
      2="More than 1 year ago but not more than 2 years"
      3="More than 2 years ago but not more than 3 years"
      4="More than 3 years ago but not more than 5 years"
      5="Over 5 years ago"
      6="Never had Pap test"
      8="Refused"
      9="Don't know" ;
   value LASTPEL
      1="A year ago or less"
      2="More than 1 year ago but not more than 2 years"
      3="More than 2 years ago but not more than 3 years"
      4="More than 3 years ago but not more than 5 years"
      5="Over 5 years ago"
      6="Never had pelvic exam"
      8="Refused"
      9="Don't know" ;
   value LASTPREG
      1="Less than 1 year"
      2="1 to 5 years ago"
      3="5 years or longer ago" ;
   value LBPREGS
      0="NONE"
      1="1 PREGNANCY"
      2="2 PREGNANCIES"
      3="3 PREGNANCIES"
      4-95="4 OR MORE PREGNANCIES" ;
   value LIFEPRT
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4="4 PARTNERS"
      5="5 PARTNERS"
      6="6 PARTNERS"
      7="7 PARTNERS"
      8="8 PARTNERS"
      9="9 PARTNERS"
      10-19="10-19 PARTNERS"
      20-49="20-49 PARTNERS"
      50="50 OR MORE PARTNERS"
      998="Refused"
      999="Don't know" ;
   value LIFEPRTS
      0="NONE"
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4="4 PARTNERS"
      5="5 PARTNERS"
      6="6 PARTNERS"
      7="7 PARTNERS"
      8="8 PARTNERS"
      9="9 PARTNERS"
      10-19="10-19 PARTNERS"
      20-49="20-49 PARTNERS"
      50="50 OR MORE PARTNERS"
      98="Refused"
      99="Don't know" ;
   value LIFPRTNR
      0="NONE"
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4="4 PARTNERS"
      5="5 PARTNERS"
      6="6 PARTNERS"
      7="7 PARTNERS"
      8="8 PARTNERS"
      9="9 PARTNERS"
      10-19="10-19 PARTNERS"
      20-49="20-49 PARTNERS"
      50="50 OR MORE PARTNERS" ;
   value LIVCHLDR
      1="Child lives with R"
      2="Child is dead"
      3="Child lives with adoptive parents/family"
      4="Child lives with biological father"
      5="Child lives with other relatives"
      6="Child's living arrangements are other or unknown" ;
   value LKNLK2FMT
      1="Very likely"
      2="Somewhat likely"
      3="Not too likely"
      4="Not likely at all"
      8="Refused"
      9="Don't know" ;
   value LSEXRAGE
      0-17="UNDER 18 YEARS"
      18-19="18-19 YEARS"
      20-24="20-24 YEARS"
      25-34="25-34 YEARS"
      35-50="35-49 YEARS" ;
   value LSTGRADE
      0="No formal schooling"
      1-5="5TH GRADE OR LOWER"
      6-8="6TH, 7TH, OR 8TH GRADE"
      9="9TH GRADE"
      10="10TH GRADE"
      11="11TH GRADE"
      12="12TH GRADE"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value LSTSEXFPF
      1-12="January-December"
      13="Winter"
      14="Spring"
      15="Summer"
      16="Fall"
      96="Only had sex once"
      98="Refused"
      99="Don't know" ;
   value LVSIT14F
      1="Biological mother or adoptive mother"
      2="Other mother figure"
      3="No mother figure"
      8="Refused"
      9="Don't know" ;
   value LVSIT14M
      1="Biological father or adoptive father"
      2="Step-father"
      3="No father figure"
      4="Other father figure"
      8="Refused"
      9="Don't know" ;
   value MAINNOUSE
      1="You do not expect to have sex"
      2="You do not think you can get pregnant"
      3="You don't really mind if you get pregnant"
      4="You are worried about the side effects of birth control"
      5="Your male partner does not want you to use a birth control method"
      6="Your male partner himself does not want to use a birth control method"
      7="(IF VOLUNTEERED:)Respondent is using a method"
      8="You could not get a method"
      9="You are not taking, or using, your method consistently"
      98="Refused"
      99="Don't know" ;
   value MALFEMF
      1="Male"
      2="Female"
      8="Refused"
      9="Don't know" ;
   value MALFEMNAF
      1="Male"
      2="Female"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value MANRASDU
      1="Biological father"
      2="Step-father"
      3="No father figure"
      4="Other father figure"
      8="Refused"
      9="Don't know" ;
   value MANRELF
      1="HUSBAND"
      2="MALE COHABITING PARTNER"
      8="Refused"
      9="Don't know" ;
   value MARCATA
      1="0-12 months"
      2="13-24 months"
      3="25-36 months"
      4="37-48 months"
      5="More than 4 years" ;
   value MARCATB
      1="0-12 months"
      2="13-24 months"
      3="25-36 months"
      4="More than 3 years"
      888="First birth occurred before first marriage" ;
   value MARCATC
      1="0-12 months"
      2="13-24 months"
      3="25-36 months"
      4="More than 3 years"
      995="First conception before marriage"
      996="Has been pregnant, but has never been married" ;
   value MARCATD
      1="0-12 months"
      2="13-24 months"
      3="25-36 months"
      4="More than 3 years"
      996="Has been married but has never been pregnant" ;
   value MARCATE
      1="0-12 months"
      2="13-24 months"
      3="25-36 months"
      4="More than 3 years"
      5="First intercourse after first marriage" ;
   value MARCATG
      1="0-12 months"
      2="13-24 months"
      3="25-36 months"
      4="More than 3 years"
      5="First intercourse after first marriage or cohabitation" ;
   value MARENDF
      1="DIVORCED OR ANNULLED"
      2="SEPARATED"
      3="WIDOWED" ;
   value MARENDHX
      1="Death of husband"
      2="Divorce"
      3="Annulment"
      8="Refused"
      9="Don't know" ;
   value MARPRGF
      1="Married"
      2="Divorced"
      3="Widowed"
      4="Separated"
      5="Never married" ;
   value MARSTAT
      1="Married to a person of the opposite sex"
      2="Not married but living together with a partner of the opposite sex"
      3="Widowed"
      4="Divorced or annulled"
      5="Separated, because you and your spouse are not getting along"
      6="Never been married"
      8="Refused"
      9="Don't know" ;
   value MAYBPREG
      1="Probably pregnant"
      5="Probably not pregnant"
      8="Refused"
      9="Don't know" ;
   value MC1SIMSQ
      1="Same time"
      2="Different times"
      8="Refused"
      9="Don't know" ;
   value MCMONS
      0-994="0-994"
      995="R reported a month and year instead"
      998="Refused"
      999="Don't know" ;
   value MDDEGRE
      1="Less than high school"
      2="High school graduate or GED"
      3="Some college, including 2-year degrees"
      4="Bachelor's degree or higher"
      8="Refused"
      9="Don't know" ;
   value MEDREASF
      1="Pregnancy would be dangerous to your health"
      2="You would probably lose a pregnancy"
      3="You would probably have an unhealthy child"
      4="He had health problem that required the operation"
      5="Some other medical reason"
      6="No medical reason for operation"
      8="Refused"
      9="Don't know" ;
   value MENARCHE
      1-9="UNDER 10 YEARS"
      10="10 YEARS"
      11="11 YEARS"
      12="12 YEARS"
      13="13 YEARS"
      14="14 YEARS"
      15-95="15 YEARS OR OLDER"
      96="PERIODS HAVE NOT YET BEGUN"
      98="Refused"
      99="Don't know" ;
   value METH12MF
      1="Pill"
      2="Condom"
      3="Partner's vasectomy"
      4="Female sterilizing operation/tubal ligation"
      5="Withdrawal"
      6="Depo-Provera injectable"
      7="Implant (Norplant, Implanon, or Nexplanon)"
      8="Calendar rhythm, Standard Days, or Cycle Beads method"
      9="Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
      10="Diaphragm"
      11="Female condom, vaginal pouch"
      12="Foam"
      13="Jelly or cream"
      14="Cervical cap"
      15="Suppository, insert"
      16="Today sponge"
      17="IUD, coil, loop"
      18="Emergency contraception"
      19="Other method"
      20="Respondent sterile (aside from sterilizing operation above)"
      21="Respondent's partner sterile (aside from vasectomy above)"
      22="Lunelle injectable"
      23="Contraceptive patch"
      24="Contraceptive ring" ;
   value METH3MF
      1="Pill"
      2="Condom"
      3="Partner's vasectomy"
      4="Female sterilizing operation/tubal ligation"
      5="Withdrawal"
      6="Depo-Provera, injectables"
      7="Implant (Norplant, Implanon, or Nexplanon)"
      8="Calendar rhythm, Standard Days, or Cycle Beads method"
      9="Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
      10="Diaphragm"
      11="Female condom, vaginal pouch"
      12="Foam"
      13="Jelly or cream"
      14="Cervical cap"
      15="Suppository, insert"
      16="Today sponge"
      17="IUD, coil, loop"
      18="Emergency contraception"
      19="Other method"
      20="Respondent sterile (aside from sterilizing operation above)"
      21="Respondent's partner sterile (aside from vasectomy above)"
      22="Lunelle injectable"
      23="Contraceptive patch"
      24="Contraceptive ring" ;
   value METHHXF
      1="No method used"
      2="EMPTY (IF JAN)/Same as previous month"
      3="Birth control pills"
      4="Condom"
      5="Partner's vasectomy"
      6="Female sterilizing operation, such as tubal sterilization and hysterectomy"
      7="Withdrawal, pulling out"
      8="Depo-Provera, injectables"
      9="Hormonal implant (Norplant, Implanon, or Nexplanon)"
      10="Calendar rhythm, Standard Days, or Cycle Beads method"
      11="Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
      12="Diaphragm"
      13="Female condom, vaginal pouch"
      14="Foam"
      15="Jelly or cream"
      16="Cervical cap"
      17="Suppository, insert"
      18="Today sponge"
      19="IUD, coil, or loop"
      20="Emergency contraception"
      21="Other method -- specify"
      22="Respondent was sterile"
      23="Respondent's partner was sterile"
      25="Contraceptive patch"
      26="Vaginal contraceptive ring"
      55="EMPTY (IF JAN)/Same method used thru end of year"
      98="Refused"
      99="Don't know" ;
   value METHPRSF
      0="1st meth was nonprescription"
      1="1st meth was prescription" ;
   value METHSTOPF
      3="Birth control pills"
      4="Condom"
      5="Partner's vasectomy"
      6="Female sterilizing operation, such as tubal sterilization and hysterectomy"
      7="Withdrawal, pulling out"
      8="Depo-Provera, injectables (shots)"
      9="Hormonal implant (Norplant, Implanon, or Nexplanon)"
      10="Calendar rhythm, Standard Days, or Cycle Beads method"
      11="Safe period by temperature or cervical mucus test (Two Day, Billings Ovulation, or Sympto-thermal Method)"
      12="Diaphragm"
      13="Female condom, vaginal pouch"
      14="Foam"
      15="Jelly or cream"
      16="Cervical cap"
      17="Suppository, insert"
      18="Today sponge"
      19="IUD, coil, or loop"
      21="Other method"
      24="Lunelle injectable (monthly shot)"
      25="Contraceptive patch"
      26="Vaginal contraceptive ring"
      98="Refused"
      99="Don't know" ;
   value METHYNF
      1="Used in past 12 months"
      5="Not used in past 12 mos or dk/rf"
      8="Refused"
      9="Don't know" ;
   value METRO
      1="PRINCIPAL CITY OF MSA"
      2="OTHER MSA"
      3="NOT MSA" ;
   value MINCDNF
      1="You had all the children you wanted"
      2="Your husband or partner had all the children he wanted"
      3="Medical reasons"
      4="Problems with other methods of birth control"
      5="Some other reason not mentioned above"
      8="Refused"
      9="Don't know" ;
   value MISSPILL
      1="Never missed"
      2="Missed only one"
      3="Missed two or more"
      4="Did not use pill over past 4 weeks"
      8="Refused"
      9="Don't know" ;
   value MNTHFMT
      1-12="January-December"
      13="Winter"
      14="Spring"
      15="Summer"
      16="Fall"
      98="Refused"
      99="Don't know" ;
   value MNYFSTER
      1="1 setting or location"
      2="2 settings or locations"
      3="3 settings or locations"
      4-20="4 or more settings or locations"
      98="Refused"
      99="Don't know" ;
   value MOM18F
      1="Under 18"
      2="18-19"
      3="20-24"
      4="25 or older"
      8="Refused"
      9="Don't know" ;
   value MOMFSTCH
      1="LESS THAN 18 YEARS"
      2="18-19 YEARS"
      3="20-24 YEARS"
      4="25-29 YEARS"
      5="30 OR OLDER"
      96="MOTHER OR MOTHER-FIGURE DID NOT HAVE ANY CHILDREN"
      98="Refused"
      99="Don't know" ;
   value MOMWORKD
      1="Full-time"
      2="Part-time"
      3="Equal amounts full-time and part-time"
      4="Not at all (for pay)"
      8="Refused"
      9="Don't know" ;
   value MON12PRT
      0="NONE"
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4-995="4 OR MORE PARTNERS"
      998="Refused"
      999="Don't know" ;
   value MOSPRGF
      0-11="0-11 Months"
      98="Refused"
      99="Don't know" ;
   value MREASFMT
      1="Part of a routine exam"
      2="Because of a medical problem"
      3="Other reason"
      8="Refused"
      9="Don't know" ;
   value MTCHMANF
      1="Your first former husband, [NAME], married [DATE], marriage ended [DATE]"
      2="Your second former husband, [NAME], married [DATE], marriage ended [DATE]"
      3="Your third former husband, [NAME], married [DATE], marriage ended [DATE]"
      4="Your fourth former husband, [NAME], married [DATE], marriage ended [DATE]"
      5="Your fifth former husband, [NAME], married [DATE], marriage ended [DATE]"
      6="Your sixth former husband, [NAME], married [DATE], marriage ended [DATE]"
      7="Your current husband, [NAME], married [DATE], still married or (Your husband, from whom you are separated, married [DATE], still married"
      8="Your current partner, [NAME], began living together [DATE], still living together"
      9="Your first former partner [NAME], began living together [DATE], stopped living together [DATE]"
      10="Your second cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
      11="Your third cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
      12="Your fourth cohabiting partner, [NAME], began living together [DATE], stopped living together [DATE]"
      20="None of the Above"
      98="Refused"
      99="Don't know" ;
   value MTHUSE12F
      1="USED A METHOD"
      2="DID NOT USE A METHOD"
      95="NEVER USED A METHOD" ;
   value MTHUSE3F
      1="USED A METHOD AT LAST INTERCOURSE IN PAST 3 MONTHS"
      2="DID NOT USE A METHOD AT LAST INTERCOURSE IN PAST 3 MONTHS"
      95="NEVER USED A METHOD" ;
   value N0Y1F
      0="No"
      1="Yes" ;
   value NCHILDHH
      0="No children of respondent age 18 or younger in the household"
      1="1 of respondent's children 18 or younger in the household"
      2="2 of respondent's children 18 or younger in the household"
      3="3 or more of respondent's children 18 or younger in the household" ;
   value NEWMETHF
      1="Abstinence"
      2="Tubal ligation/female sterilization"
      3="Vaginal contraceptive film"
      4="Other method, not shown separately"
      5="Response was coded as a method in EA-1 through EA-14"
      8="Refused"
      9="Don't know" ;
   value NNONMONOG1F
      1="1 partner"
      2="2 or more partners"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value NNONMONOG2F
      1="1 other partner besides you"
      2="2 other partners besides you"
      3="3 or more other partners besides you"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value NOHIVTST
      1="You have never been offered an HIV test"
      2="You are worried about what other people would think if you got tested for HIV"
      3="It's unlikely you've been exposed to HIV"
      4="You were afraid to find out if you were HIV positive (that you had HIV)"
      5="You don't like needles"
      20="Some other reason"
      21="R reported spouse or partner tested negative"
      22="Never had sexual intercourse"
      23="No health insurance or coverage, or R couldn't afford an HIV test"
      24="Part of blood donation"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value NOSEX12F
      0="NONE"
      1="1 MONTH"
      2="2 MONTHS"
      3="3 MONTHS"
      4="4 MONTHS"
      5="5 MONTHS"
      6="6 MONTHS"
      7="7 MONTHS"
      8="8 MONTHS"
      9="9 MONTHS"
      10="10 MONTHS"
      11="11 MONTHS"
      12="12 MONTHS"
      95="NEVER HAD INTERCOURSE" ;
   value NOSEX36F
      1="No, no months of non-intercourse -- intercourse in all months"
      2="Yes, one or more months of non-intercourse" ;
   value NOUSEINSF
      1="Insurance doesn't cover my method supplies"
      2="I had not yet met my insurance deductible"
      3="I did not want to use insurance because someone might find out about it"
      4="I did not need to use insurance because the method supplies were free"
      5="Some other reason"
      8="Refused"
      9="Don't know" ;
   value NOWPRGDK
      1="First trimester"
      2="Second trimester"
      3="Third trimester"
      8="Refused"
      9="Don't know" ;
   value NRACED
      1="Hispanic"
      2="Non-Hispanic White, Single Race"
      3="Non-Hispanic Black, Single Race"
      4="Non-Hispanic Other or Multiple Race"
      5="NA/DK/RF" ;
   value NUMBCVIS
      1="Single visit"
      5="More than one visit"
      8="Refused"
      9="Don't know" ;
   value NUMFMHH
      0="NO FAMILY MEMBERS"
      1="1 FAMILY MEMBER"
      2="2 FAMILY MEMBERS"
      3="3 FAMILY MEMBERS"
      4="4 FAMILY MEMBERS"
      5="5 FAMILY MEMBERS"
      6="6 FAMILY MEMBERS"
      7="7 FAMILY MEMBERS OR MORE" ;
   value NUMJOBF
      1="1 job"
      2="2 jobs"
      3="3 jobs"
      4="4 jobs"
      5="5 jobs"
      6="6 jobs"
      8="Refused"
      9="Don't know" ;
   value NUMKDHH
      0="NO CHILDREN"
      1="1 CHILD"
      2="2 CHILDREN"
      3="3 CHILDREN"
      4="4 CHILDREN OR MORE" ;
   value NUMMCMOF
      0-48="0-48" ;
   value NUMMTH12A
      0="No methods"
      1="1 method"
      2-4="2 or more methods"
      8="Refused"
      9="Don't know" ;
   value NUMNOCOV
      1="1 Month"
      2="2 Months"
      3="3 Months"
      4="4 Months"
      5="5 Months"
      6="6 Months"
      7="7 Months"
      8="8 Months"
      9="9 Months"
      10="10 Months"
      11="11 Months"
      12="12 Months"
      98="Refused"
      99="Don't know" ;
   value NUMP3MOS
      0="NONE"
      1="1 PARTNER"
      2-95="2 OR MORE PARTNERS" ;
   value NUMPILLS
      1="1 month"
      2="2 months"
      3="3 months"
      4-11="4-11 months"
      12="12 months"
      13-25="13-25 months"
      98="Refused"
      99="Don't know" ;
   value NUMPREGF
      0="NONE"
      1="1 PREGNANCY"
      2="2 PREGNANCIES"
      3="3 PREGNANCIES"
      4="4 PREGNANCIES"
      5="5 PREGNANCIES"
      6="6 PREGNANCIES"
      7-95="7 OR MORE PREGNANCIES"
      98="Refused"
      99="Don't know" ;
   value NUMSVC12A
      0="No services"
      1="1 service"
      2="2 services"
      3-12="3 or more services"
      98="Refused"
      99="Don't know" ;
   value NUMVSTPG
      1="1 VISIT"
      2="2 VISITS"
      3="3 VISITS"
      4="4 VISITS"
      5-95="5 OR MORE VISITS"
      98="Refused"
      99="Don't know" ;
   value NWWANTRPF
      1="Later, overdue"
      2="Right time"
      3="Too soon: by less than 2 years"
      4="Too soon: by 2 years or more"
      5="Didn't care, indifferent"
      6="Unwanted"
      7="Don't know, not sure" ;
   value OKBORNUS
      1="United States"
      5="Another country"
      8="Refused"
      9="Don't know" ;
   value OKDISABLF
      1="Physical disability"
      2="Emotional disturbance"
      3="Mental retardation"
      4="None of the above"
      8="Refused"
      9="Don't know" ;
   value ONETWO2F
      1="1"
      2-96="2 OR MORE"
      98="Refused"
      99="Don't know" ;
   value ONETWOF
      0="0"
      1="1"
      2-96="2 OR MORE"
      98="Refused"
      99="Don't know" ;
   value ORIENT_A
      1="Heterosexual or straight"
      2="Homosexual, gay, or lesbian"
      3="Bisexual"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value ORIENT_B
      1="Lesbian or gay"
      2="Straight, that is, not lesbian or gay"
      3="Bisexual"
      4="Something else"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value OTHRMETHF
      9="Hormonal implant (Norplant, Implanon, or Nexplanon)"
      12="Diaphragm"
      13="Female condom, vaginal pouch"
      14="Foam"
      15="Jelly or cream"
      16="Cervical cap"
      17="Suppository, insert"
      18="Today sponge"
      19="IUD, coil, or loop"
      21="Other method -- specify"
      24="Lunelle"
      95="No other methods ever used"
      98="Refused"
      99="Don't know" ;
   value OTMEDHEPF
      1="Surgery or drug treatment for endometriosis"
      2="In vitro fertilization (IVF)"
      3="Surgery or drug treatment for uterine fibroids"
      4="Some other female pelvic surgery"
      5="Other medical help"
      8="Refused"
      9="Don't know" ;
   value OUTCOMRF
      1="LIVE BIRTH"
      2="INDUCED ABORTION"
      3="STILLBIRTH"
      4="MISCARRIAGE"
      5="ECTOPIC PREGNANCY"
      6="CURRENT PREGNANCY" ;
   value OWWNTF
      1="LATER, OVERDUE"
      2="RIGHT TIME"
      3="TOO SOON, MISTIMED"
      4="DIDN'T CARE, INDIFFERENT"
      5="UNWANTED"
      6="DON'T KNOW, NOT SURE" ;
   value P_ASTYP
      1="Public assist prog, e.g. AFDC or ADC"
      2="General/Emergency/Other assistance"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value P12METHF
      1="Every time"
      2="Most of the time"
      3="About half of the time"
      4="Some of the time"
      5="None of the time"
      8="Refused"
      9="Don't know" ;
   value P12MOCON
      1="Every time"
      2="Most of the time"
      3="About half of the time"
      4="Some of the time"
      5="None of the time"
      8="Refused"
      9="Don't know" ;
   value P1YFSEXF
      1-12="January-December"
      13="Winter"
      14="Spring"
      15="Summer"
      16="Fall"
      96="Only had sex once with this partner"
      98="Refused"
      99="Don't know" ;
   value P1YHSAGE
      0-17="UNDER 18 YEARS"
      18-19="18-19 YEARS"
      20-24="20-24 YEARS"
      25-34="25-34 YEARS"
      35-49="35-49 YEARS"
      50-95="50 YEARS OR OLDER"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value P1YRAGE
      0-17="UNDER 18 YEARS"
      18-19="18-19 YEARS"
      20-24="20-24 YEARS"
      25-34="25-34 YEARS"
      35-49="35-49 YEARS"
      98="Refused"
      99="Don't know" ;
   value P1YRELP
      1="First former husband"
      2="Second former husband"
      3="Third former husband"
      4="Fourth former husband"
      5="Fifth former husband"
      6="Sixth former husband"
      7="Current husband or (current husband from whom she is separated)"
      8="Current cohabiting partner"
      9="First former cohabiting partner"
      10="Second former cohabiting partner"
      11="Third former cohabiting partner"
      12="Fourth former cohabiting partner"
      13="First sexual partner"
      20="None of the above"
      98="Refused"
      99="Don't know" ;
   value PARAGEF
      1="R LIVED WITH BOTH BIOLOGICAL OR BOTH ADOPTIVE PARENTS AT AGE 14"
      2="R LIVED WITH BIOLOGICAL MOTHER AND STEPFATHER AT AGE 14"
      3="R LIVED IN ANY OTHER PARENTAL SITUATION OR A NONPARENTAL SITUATION AT AGE 14" ;
   value PARITY
      0="0 BABIES"
      1="1 BABY"
      2="2 BABIES"
      3="3 BABIES"
      4="4 BABIES"
      5-95="5 OR MORE BABIES" ;
   value PARTDURF
      0-995="Number of months between first and most recent sex with this partner"
      997="Only had sex once with partner" ;
   value PARTLIF
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4="4 PARTNERS"
      5="5 PARTNERS"
      6="6 PARTNERS"
      7="7 PARTNERS"
      8="8 PARTNERS"
      9="9 PARTNERS"
      10="10 PARTNERS"
      11-19="11-19 PARTNERS"
      20-49="20-49 PARTNERS"
      50="50 OR MORE PARTNERS"
      997="Not ascertained"
      998="Refused"
      999="Don't know" ;
   value PARTS12F
      0="NONE"
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4="4 PARTNERS"
      5="5 PARTNERS"
      6="6 PARTNERS"
      7="7 OR MORE PARTNERS"
      9998="REFUSED"
      9999="DON'T KNOW" ;
   value PARTS1YR
      0="NONE"
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4="4 PARTNERS"
      5="5 PARTNERS"
      6="6 PARTNERS"
      7="7 OR MORE PARTNERS" ;
   value PAYFMT
      1="Insurance"
      2="Co-payment"
      3="Out-of-pocket payment"
      4="Medicaid"
      5="No payment required"
      6="Some other way"
      8="Refused"
      9="Don't know" ;
   value PAYFMT2F
      1="Insurance"
      2="Co-payment or out-of-pocket payment"
      3="Medicaid"
      4="No payment required"
      5="Some other way"
      8="Refused"
      9="Don't know" ;
   value PIDTX
      1="1 TIME"
      2-95="2 OR MORE TIMES"
      98="Refused"
      99="Don't know" ;
   value PLACE1FMT
      1="Private doctor's office"
      2="HMO facility"
      3="Community health clinic, community clinic, public health clinic"
      4="Family planning or Planned Parenthood clinic"
      5="Employer or company clinic"
      6="School or school-based clinic"
      7="Hospital outpatient clinic"
      8="Hospital emergency room"
      9="Hospital regular room"
      10="Urgent care center, urgi-care, or walk-in facility"
      11="Friend"
      12="Partner or spouse"
      13="Drug store"
      14="Mail order/Internet"
      15="In-store health clinic (like CVS, Target, or Walmart)"
      20="Some other place"
      98="Refused"
      99="Don't know" ;
   value PLCHIV
      1="Private doctor's office"
      2="HMO facility"
      3="Community health clinic, community clinic, public health clinic"
      4="Family planning or Planned Parenthood clinic"
      5="Employer or company clinic"
      6="School or school-based clinic (including college or university)"
      7="Hospital outpatient clinic"
      8="Hospital emergency room"
      9="Hospital regular room"
      10="Urgent care center, urgi-care, or walk-in facility"
      11="Your worksite"
      12="Your home"
      13="Military induction or military service site"
      14="Sexually transmitted disease (STD) clinic"
      15="Laboratory or blood bank"
      20="Some other place -- specify"
      21="Prison or jail"
      22="Mobile testing or community testing site"
      23="Drug, alcohol, or rehabilitation center"
      98="Refused"
      99="Don't know" ;
   value PLCOPF
      1="Private doctor's office"
      2="HMO facility"
      3="Community health clinic, community clinic, or public health clinic"
      4="Family planning or Planned Parenthood clinic"
      5="Employer or company clinic"
      6="School or school-based"
      7="Hospital outpatient clinic"
      8="Hospital emergency room"
      9="Hospital regular room"
      10="Urgent care center, urgi-care or walk-in facility"
      11="In-store health clinic (like CVS, Target, or Walmart)"
      20="Some other place"
      98="Refused"
      99="Don't know" ;
   value POTFRF
      1="Never"
      2="Once or twice during the year"
      3="Several times during the year"
      4="About once a month"
      5="About once a week"
      6="About once a day or more"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value POVERTY
      0-99="0-99 percent of poverty level"
      100-199="100-199 percent of poverty level"
      200-299="200-299 percent of poverty level"
      300-399="300-399 percent of poverty level"
      400-499="400-499 percent of poverty level"
      500="500 percent of poverty level or greater" ;
   value PRECANCER
      1="Abnormal Pap test result, suspicious for cancer, but no real cancer found"
      2="Pre-cancer (cervical intraepithelial lesion or CIN)"
      3="Cervical cancer"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value PREGAGE
      0-19="Under 20 years"
      20-24="20-24 years"
      25-29="25-29 years"
      30-34="30-34 years"
      35-39="35-39 years"
      40-49="40-49 years" ;
   value PREGHIV
      1="Yes"
      5="No"
      6="Never went for prenatal care"
      8="Refused"
      9="Don't know" ;
   value PREGINT
      1="0-5 months"
      2="6-11 months"
      3="12-17 months"
      4="18-23 months"
      5="24-59 months"
      6="60 months or longer"
      7="Could not be defined" ;
   value PREGNUMF
      0="NONE"
      1="1 PREGNANCY"
      2="2 PREGNANCIES"
      3="3 PREGNANCIES"
      4="4 PREGNANCIES"
      5="5 PREGNANCIES"
      6="6 PREGNANCIES"
      7-95="7 OR MORE PREGNANCIES" ;
   value PREVCOHB
      0="NONE"
      1="1 FORMER COHABITING PARTNER"
      2="2 FORMER COHABITING PARTNER"
      3-95="3 OR MORE FORMER COHABITATING PARTNERS"
      98="Refused"
      99="Don't know" ;
   value PREVHUSB
      0="NONE"
      1="1 FORMER HUSBAND"
      2-6="2 OR MORE FORMER HUSBANDS"
      98="Refused"
      99="Don't know" ;
   value PRGVISIT
      0="NO VISITS IN LAST 12 MONTHS"
      1="1 VISIT"
      2="2 VISITS"
      3="3 VISITS"
      4="4 VISITS"
      5-95="5 OR MORE VISITS"
      98="Refused"
      99="Don't know" ;
   value PRIMLANG
      1="English"
      2="Spanish"
      7="Other"
      8="Refused"
      9="Don't know" ;
   value PROBWANT
      1="Probably want"
      2="Probably do not want"
      8="Refused"
      9="Don't know" ;
   value PRT12F
      0="0 PARTNERS"
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4-995="4 OR MORE PARTNERS"
      997="Not ascertained"
      998="Refused"
      999="Don't know" ;
   value PRTS12MB
      0="0 PARTNERS"
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4="4 PARTNERS"
      5="5 PARTNERS"
      6="6 PARTNERS"
      7="7 PARTNERS"
      8="8 PARTNERS"
      9="9 PARTNERS"
      10="10 PARTNERS"
      11-19="11-19 PARTNERS"
      20="20 OR MORE PARTNERS"
      997="Not ascertained"
      998="Refused"
      999="Don't know" ;
   value PSTWKSF
      0-995="0-995"
      998="Refused"
      999="Don't know" ;
   value PTSB4MAR
      0="NONE"
      1="1 PARTNER"
      2="2 PARTNERS"
      3="3 PARTNERS"
      4="4 PARTNERS"
      5="5 PARTNERS"
      6="6 PARTNERS"
      7="7 PARTNERS"
      8="8 PARTNERS"
      9="9 PARTNERS"
      10-19="10-19 PARTNERS"
      20="20 OR MORE PARTNERS"
      998="REFUSED"
      999="DON'T KNOW" ;
   value PUBASSIS
      1="Yes (received public assistance in [INTERVIEW YEAR-1])"
      2="No (did not receive public assistance in [INTERVIEW YEAR-1])" ;
   value R_FOSTER
      1="YES FOSTER"
      3="NO FOSTER, NOT INTACT"
      5="NO FOSTER, INTACT" ;
   value RACE
      1="BLACK"
      2="WHITE"
      3="OTHER" ;
   value RACEFMTD
      1="Black"
      2="White"
      3="Other"
      4="NA/DK/RF" ;
   value RCNTPGHF
      1-12="January-December"
      13="Winter"
      14="Spring"
      15="Summer"
      16="Fall"
      96="R only had one visit for help to become pregnant"
      98="Refused"
      99="Don't know" ;
   value RCURPREG
      1="YES (CURRENTLY PREGNANT)"
      2="NO (NOT CURRENTLY PREGNANT)" ;
   value REACTSLF
      1="Very upset"
      2="A little upset"
      3="A little pleased"
      4="Very pleased"
      5="If R insists: She wouldn't care"
      8="Refused"
      9="Don't know" ;
   value REASDIFFF
      1="You have difficulty getting pregnant"
      2="You have difficulty carrying baby to term"
      3="Pregnancy is dangerous to your health"
      4="You are likely to have an unhealthy baby"
      5="Some other reason"
      8="Refused"
      9="Don't know" ;
   value REASMAMF
      1="Part of a routine exam"
      2="Because of a problem or lump"
      3="Because of family or personal history of cancer"
      4="Other reason"
      8="Refused"
      9="Don't know" ;
   value REASMFMT
      1="Too expensive"
      2="Insurance did not cover it"
      3="Too difficult to use"
      4="Too messy"
      5="Your partner did not like it"
      6="You had side effects"
      7="You were worried you might have side effects"
      8="You worried the method would not work"
      9="The method failed, you became pregnant"
      10="The method did not protect against disease"
      11="Because of other health problems, a doctor told you that you should not use the method again"
      12="The method decreased your sexual pleasure"
      13="Too difficult to obtain the method"
      14="Did not like the changes to your menstrual cycle"
      15="Other -- specify"
      98="Refused"
      99="Don't know" ;
   value REASNONOF
      1="Dangerous for you"
      2="Dangerous for your baby"
      3="Some other reason"
      8="Refused"
      9="Don't know" ;
   value REASP
      1="Impossible due to problems with sperm or semen"
      2="Impossible due to testicular problems or varicocele"
      3="Impossible due to other illnesses or treatment for other illnesses"
      4="Impossible for other reasons"
      8="Refused"
      9="Don't know" ;
   value REASR
      1="Impossible due to problems with ovulation"
      2="Impossible due to problems with uterus, cervix, or fallopian tubes"
      3="Impossible due to other illnesses or treatment for other illnesses such as cancer"
      4="Impossible due to menopause"
      20="Impossible for other reasons"
      30="R volunteers it is not impossible for her"
      98="Refused"
      99="Don't know" ;
   value REGCAR12F
      1="Regular place"
      2="Regular place, but go to more than 1 place regularly"
      3="Usually go somewhere else"
      4="No usual place"
      8="Refused"
      9="Don't know" ;
   value RELATPF
      1="Married to him"
      2="Engaged to him"
      3="Living together in a sexual relationship, but not engaged"
      4="Going out with him or going steady"
      5="Going out with him once in a while"
      6="Just friends"
      7="Had just met him"
      8="Something else" ;
   value RELCURR
      1="No religion"
      2="Catholic"
      3="Baptist/Southern Baptist"
      4="Methodist, Lutheran, Presbyterian, Episcopal"
      5="Fundamentalist Protestant"
      6="Other Protestant denomination"
      7="Protestant - No specific denomination"
      8="Other religion"
      9="Refused"
      10="Don't know" ;
   value RELDLIFE
      1="Very important"
      2="Somewhat important"
      3="Not important"
      8="Refused"
      9="Don't know" ;
   value RELIGION
      1="NO RELIGION"
      2="CATHOLIC"
      3="PROTESTANT"
      4="OTHER RELIGIONS" ;
   value RELOTHKD
      1="Your husband's child (stepchild)"
      2="The child of a blood relative"
      3="The child of a relative by marriage"
      4="The child of a friend"
      5="Your boyfriend or partner's child"
      6="Related to you in some other way"
      7="Unrelated to you previously in any way"
      8="Refused"
      9="Don't know" ;
   value RELTRAD
      1="Evangelical Prot"
      2="Mainline Prot"
      3="Black Prot"
      4="Catholic"
      5="Other religion"
      6="No religious affiilation"
      8="Refused"
      9="Don't know" ;
   value REPORTF
      1="REPORTED"
      2="NOT REPORTED" ;
   value RETROVIR
      1="Definitely true"
      2="Probably true"
      3="Probably false"
      4="Definitely false"
      5="Don't know if true or false"
      8="Refused"
      9="Don't know" ;
   value RHHIVT2F
      1="I didn't want to get tested by a doctor or at an HIV testing site"
      2="I didn't want other people to know I am getting tested"
      3="I wanted to get tested together with someone, before we had sex"
      4="I wanted to get tested by myself, before having sex"
      5="I wanted to get tested by myself, after having sex"
      6="A sex partner asked me to take a rapid home HIV test"
      20="Other reason"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value RISKF
      1="A lot"
      2="A little"
      3="Not at all"
      4="No opinion"
      8="Refused"
      9="Don't know" ;
   value RMARFMT
      1="Married"
      2="Divorced"
      3="Widowed"
      4="Separated"
      5="Cohabiting"
      6="Never married, not cohabiting" ;
   value RMARITAL
      1="CURRENTLY MARRIED TO A PERSON OF THE OPPOSITE SEX"
      2="NOT MARRIED BUT LIVING WITH OPP SEX PARTNER"
      3="WIDOWED"
      4="DIVORCED OR ANNULLED"
      5="SEPARATED FOR REASONS OF MARITAL DISCORD"
      6="NEVER BEEN MARRIED" ;
   value ROSCNT
      1="1 HOUSEHOLD MEMBER"
      2="2 HOUSEHOLD MEMBERS"
      3="3 HOUSEHOLD MEMBERS"
      4="4 HOUSEHOLD MEMBERS"
      5="5 HOUSEHOLD MEMBERS"
      6="6 HOUSEHOLD MEMBERS"
      7="7 HOUSEHOLD MEMBERS"
      8="8 OR MORE HOUSEHOLD MEMBERS"
      98="Refused"
      99="Don't know" ;
   value ROST2TOP
      0="No children"
      1="1 child"
      2="2 or more children" ;
   value ROST4TOP
      0="No children"
      1="1 child"
      2="2 children"
      3="3 children"
      4="4 children or more" ;
   value ROST5TOP
      0="No children"
      1="1 child"
      2="2 children"
      3="3 children"
      4="4 children"
      5="5 or more children" ;
   value RSCRRACE
      1="Other race groups"
      2="Black or African American"
      3="White"
      4="Hispanic"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value RSTRSTAT
      0="NOT STERILE"
      1="SURGICALLY STERILE"
      2="NONSURGICALLY STERILE"
      8="Refused"
      9="Don't know" ;
   value RWEIGHT
      110="110 POUNDS OR LESS"
      111-259="111-259 POUNDS"
      260="260 POUNDS OR MORE"
      997="Not ascertained"
      998="Refused"
      999="Don't know" ;
   value SAMESEX1F
      0-14="UNDER 15 YEARS"
      15-19="15-19 YEARS"
      20-49="20-49 YEARS"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value SEEKWHO1F
      1="Current husband/partner"
      5="Another partner"
      8="Refused"
      9="Don't know" ;
   value SEX1MTHDF
      1="Pill"
      2="Condom"
      3="Partner's vasectomy"
      4="Female sterilizing operation/tubal ligation"
      5="Withdrawal"
      6="Depo-Provera, injectables"
      7="Implant (Norplant, Implanon, or Nexplanon)"
      8="Calendar rhythm, Standard Days, or Cycle Beads method"
      9="Safe period by temperature or cervical mucus test (Two Day, Billing Ovulation, or Sympto-thermal Method)"
      10="Diaphragm"
      11="Female condom, vaginal pouch"
      12="Foam"
      13="Jelly or cream"
      14="Cervical cap"
      15="Suppository, insert"
      16="Today sponge"
      17="IUD, coil, loop"
      18="Emergency contraception"
      19="Other method"
      20="Respondent sterile (aside from sterilizing operation above)"
      21="Respondent sterile (aside from vasectomy above)"
      22="Lunelle injectable"
      23="Contraceptive patch"
      24="Contraceptive ring"
      95="Never used a method"
      96="Did not use a method at 1st intercourse" ;
   value SEX1RECF
      0-14="UNDER 15 YEARS"
      15-17="15-17 YEARS"
      18-19="18-19 YEARS"
      20-49="20 YEARS OR OLDER" ;
   value SEXEVER
      1="YES (R HAS HAD SEX AFTER 1ST PERIOD)"
      2="NO (NO PERIOD, NO SEX AT ALL, OR NO SEX SINCE 1ST PERIOD)" ;
   value SEXONCE
      1="YES (R HAS HAD SEX ONLY ONCE)"
      2="NO (R HAS HAD SEX MORE THAN ONCE)" ;
   value SEXOUT
      1="Intact cohabitation"
      2="Intact marriage"
      3="Dissolved marriage"
      4="Dissolved cohabitation"
      5="Never married or cohabited with 1st sexual partner" ;
   value SMOKE12F
      1="None"
      2="About one cigarette a day or less"
      3="Just a few cigarettes a day, between 2 to 4 cigarettes"
      4="About half a pack a day, between 5 to 14 cigarettes"
      5="About a pack a day, between 15 to 24 cigarettes"
      6="More than a pack a day, 25 or more cigarettes"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value SON918F
      0="0 SONS"
      1="1 SON"
      2="2 OR MORE SONS" ;
   value SPLSTWKF
      1="Working"
      2="Working - Paternity leave or temp leave"
      3="Not working, looking for work"
      4="Keeping house or taking care of family"
      5="Other"
      8="Refused"
      9="Don't know" ;
   value SRCSRV
      1="CLINIC: TITLE X=YES HEALTH DEPT=YES"
      2="CLINIC: TITLE X=YES HEALTH DEPT=NO"
      3="CLINIC: TITLE X=NO HEALTH DEPT=YES"
      4="CLINIC: TITLE X=NO HEALTH DEPT=NO"
      5="CLINIC: TITLE X=YES AGENCY UNKNOWN"
      6="CLINIC: TITLE X=NO AGENCY UNKNOWN"
      7="EMPLOYER OR COMPANY CLINIC"
      8="PRIVATE DOCTOR'S OFFICE OR HMO"
      9="HOSPITAL EMERGENCY REGULAR ROOM/REGULAR ROOM/URGENT CARE"
      10="SOME OTHER PLACE" ;
   value STOPCONDFMT
      1="Allergy (latex/spermicide)"
      2="Didn't like it / Didn't like how it felt"
      3="Pain/discomfort/irritation"
      4="Yeast infection"
      5="Worried it would fall off / break / not prevent pregnancy"
      6="Inconvenient"
      7="Not spontaneous"
      8="Frustrating to use"
      9="Other (Too few cases, not classifiable elsewhere)"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value STOPIUDFMT
      1="Weight gain"
      2="Bleeding problems (spotting, too much, irregularly)"
      3="Headaches/migraines"
      4="Mood swings/depression"
      5="Hair loss or growth"
      6="Vaginal infection"
      7="Abdominal pain or cramping; back pain"
      8="Skin problems"
      9="Pain or discomfort during intercourse"
      10="Nausea/sickness"
      11="IUD moved or was expelled"
      12="Other side effects"
      13="Other (Too few cases, not classifiable elsewhere)"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value STOPPILLFMT
      1="Can't remember to take pill (regularly)"
      2="Interfered with other medications"
      3="Weight gain"
      4="Headaches/migraines"
      5="Mood swings/depression"
      6="Bleeding problems (spotting, too much, irregularly)"
      7="Hair loss"
      8="Nausea/sickness"
      9="Skin problems"
      10="Hormonal problems/changes"
      11="Didn't like/Didn't want to use"
      12="Concerns about risks, such as breast cancer"
      13="Not effective at preventing cramps"
      14="Weight loss"
      15="Menstrual cramps"
      16="Leg cramps"
      17="Dizziness"
      18="Decreased sex drive"
      19="High blood pressure"
      20="Blood clots"
      21="Fatigue"
      22="Other side effects"
      23="Other (Too few cases, not classifiable elsewhere)"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value STRLOPER
      1="TUBAL LIGATION OR STERILIZATION"
      2="HYSTERECTOMY"
      3="VASECTOMY"
      4="OTHER OPERATION OR TYPE UNKNOWN"
      5="NOT SURGICALLY STERILE" ;
   value SUREINTCHP
      1="Very sure"
      2="Somewhat sure"
      3="Not at all sure"
      8="Refused"
      9="Don't know" ;
   value SXEDGRF
      1="1st grade"
      2="2nd grade"
      3="3rd grade"
      4="4th grade"
      5="5th grade"
      6="6th grade"
      7="7th grade"
      8="8th grade"
      9="9th grade"
      10="10th grade"
      11="11th grade"
      12="12th grade"
      13="1st year of college"
      14="2nd year of college"
      15="3rd year of college"
      16="4th year of college"
      96="Not in school when received instruction"
      98="Refused"
      99="Don't know" ;
   value SXEDWHRINS
      1="School"
      2="Church"
      3="A community center"
      4="Some other place"
      8="Refused"
      9="Don't know" ;
   value TALKPARF
      1="How to say no to sex"
      2="Methods of birth control"
      3="Where to get birth control"
      4="Sexually transmitted diseases"
      5="How to prevent HIV/AIDS"
      6="How to use a condom"
      8="Waiting until marriage to have sex"
      95="None of the above"
      98="Refused"
      99="Don't know" ;
   value TELLWGHT
      1="Underweight"
      2="Normal weight"
      3="Overweight"
      4="Obese"
      5="Not told"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value TIMALON
      1="Yes"
      5="No"
      6="Did not have a health care visit in the past 12 months"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value TIMESMAR
      1="1 TIME"
      2="2 TIMES"
      3="3 TIMES"
      4="4 TIMES"
      5="5 TIMES"
      6="6 TIMES"
      98="Refused"
      99="Don't know" ;
   value TIMING
      1="Before first vaginal intercourse"
      3="After first vaginal intercourse"
      5="Same occasion"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value TMWK12MO
      1="Full-time"
      2="Part-time"
      3="Some of each"
      8="Refused"
      9="Don't know" ;
   value TOTINCR
      1="Under $5000"
      2="$5000-$7499"
      3="$7500-$9999"
      4="$10,000-$12,499"
      5="$12,500-$14,999"
      6="$15,000-$19,999"
      7="$20,000-$24,999"
      8="$25,000-$29,999"
      9="$30,000-$34,999"
      10="$35,000-$39,999"
      11="$40,000-$49,999"
      12="$50,000-$59,999"
      13="$60,000-$74,999"
      14="$75,000-$99,999"
      15="$100,000 or more" ;
   value TPRGMISS
      0="NONE"
      1="1 PREGNANCY"
      2="2 PREGNANCIES"
      3-95="3 OR MORE PREGNANCIES"
      98="Refused"
      99="Don't know" ;
   value TPRGOUTF
      0="NONE"
      1="1 PREGNANCY"
      2="2 PREGNANCIES"
      3-95="3 OR MORE PREGNANCIES" ;
   value TRYEITHRF
      1="Yes, trying to adopt"
      3="Yes, trying to become guardian"
      5="No, neither"
      8="Refused"
      9="Don't know" ;
   value TRYLONG
      1="Less than 1 year"
      2="1-2 years"
      3="Or longer than 2 years"
      8="Refused"
      9="Don't know" ;
   value TRYLONG2F
      0-95="0-95"
      98="Refused"
      99="Don't know" ;
   value TURNDOWN
      1="Turned down"
      2="Unable to find child"
      3="Decided not to pursue"
      8="Refused"
      9="Don't know" ;
   value TYPALLMCF
      1="Instructions to take complete bed rest"
      2="Instructions to limit your physical activity"
      3="Testing to diagnose problems related to miscarriage"
      4="Drugs to prevent miscarriage, such as progesterone suppositories"
      5="Stitches in your cervix, also known as the 'purse-string' procedure"
      6="Other types of medical help"
      8="Refused"
      9="Don't know" ;
   value TYPALLPGF
      1="Advice"
      2="Infertility testing"
      3="Drugs to improve your ovulation"
      4="Surgery to correct blocked tubes"
      5="Artificial insemination"
      6="Other types of medical help"
      8="Refused"
      9="Don't know" ;
   value UNIT_TRYLONG
      1="Months"
      5="Years"
      8="Refused"
      9="Don't know" ;
   value UNIT30D
      1="Days per week"
      5="Days per month"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value USEFSTSX
      1="YES"
      5="NO"
      98="Refused"
      99="Don't know" ;
   value USLPLACE
      1="Private doctor's office or HMO"
      2="Community health clinic, community clinic, public health clinic"
      3="Family planning or Planned Parenthood Clinic"
      4="Employer or company clinic"
      5="School or school-based clinic"
      6="Hospital outpatient clinic"
      7="Hospital emergency room"
      8="Hospital regular room"
      9="Urgent care center, urgi-care, or walk-in facility"
      10="Sexually transmitted disease (STD) clinic"
      11="In-store health clinic (like CVS, Target, or Walmart)"
      20="Some other place"
      98="Refused"
      99="Don't know" ;
   value VOLSEX1F
      1="Voluntary"
      5="Not voluntary"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value VRY1STSX
      378-1340="Before Sept 2011"
      1341-1352="Sept 2011-Aug 2012"
      1353-1364="Sept 2012-Aug 2013"
      1365-1376="Sept 2013-Aug 2014"
      1377-1388="Sept 2014-Aug 2015"
      1389-1400="Sept 2015-Aug 2016"
      1401-1413="Sept 2016-Sept 2017"
      9996="RESPONDED SHE NEVER HAD INTERCOURSE" ;
   value WANTP5F
      0="No wanted pregnancies in last 5 years"
      1-20="1-20 wanted pregnancies in last 5 years" ;
   value WANTSEXF
      1="I really didn't want it to happen at the time"
      2="I had mixed feelings -- part of me wanted it to happen at the time and part of me didn't"
      3="I really wanted it to happen at the time"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value WGTFMT
      1924.916-106774.4= "1924.916-106774.4" ;
   value WHARTIN
      1="Husband or partner"
      3="Donor"
      5="Both husband or partner and donor"
      8="Refused"
      9="Don't know" ;
   value WHATOPSM
      1="Vasectomy"
      2="Other operation"
      5="If volunteered: Operation failed"
      6="If volunteered: Operation already reversed"
      8="Refused"
      9="Don't know" ;
   value WHENMTHF
      1="Yes (stopped within the last 12 months)"
      5="No (stopped over 12 months ago)"
      8="Refused"
      9="Don't know" ;
   value WHICH1ST
      1="Sexual intercourse"
      2="Menstrual period"
      8="Refused"
      9="Don't know" ;
   value WHOSUGG
      1="Doctor or other medical care provider"
      2="Sexual partner"
      3="Someone else"
      8="Refused"
      9="Don't know" ;
   value WHOTEST
      1="You"
      3="Him"
      5="Both of you"
      8="Refused"
      9="Don't know" ;
   value WHRKDSF
      1="In this household"
      2="With their mother"
      3="With grandparents or other relatives"
      4="Somewhere else"
      8="Refused"
      9="Don't know" ;
   value WHTOOPRC
      1="Operation affects only one tube"
      2="Operation affects only one ovary"
      3="Some other operation"
      4="Other sterilizing operation"
      8="Refused"
      9="Don't know" ;
   value WHYCONDL
      1="To prevent pregnancy"
      2="To prevent diseases like syphilis, gonorrhea or AIDS"
      3="For both reasons"
      4="For some other reason"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value WHYNOGET
      1="You thought the testing site would contact you"
      2="You were afraid to find out if you were HIV positive (that you had HIV)"
      3="You didn't want to know your HIV test results"
      4="You didn't know where or how to get your test result"
      20="Some other reason"
      98="Refused"
      99="Don't know" ;
   value WHYNOTPGF
      1="Diagnosis of repro problems/condition"
      2="Prior preg or attempt: problems with or treatments/ART needed"
      3="Prior unprotected sex, no preg"
      4="Perceive infertile or difficulty getting preg/carrying to term"
      5="Menopause related"
      6="One ovary/fallopian tube/low or no ovulation"
      7="Endometriosis"
      8="Breastfeeding"
      9="Partner sterile"
      10="Not having sex"
      11="Other"
      12="Too old (R or partner)"
      97="Not ascertained"
      98="Refused"
      99="Don't know" ;
   value WHYNOUSNG
      1="You do not expect to have sex"
      2="You do not think you can get pregnant"
      3="You don't really mind if you get pregnant"
      4="You are worried about the side effects of birth control"
      5="Your male partner does not want you to use a birth control method"
      6="Your male partner himself does not want to use a birth control method"
      7="(IF VOLUNTEERED:)Respondent is using a method"
      8="You could not get a method"
      9="You are not taking, or using, your method consistently"
      98="Refused"
      99="Don't know" ;
   value WHYPSTDF
      1="Could walk in or get same-day appointment"
      2="Cost"
      3="Privacy concern"
      4="Expert care here"
      5="Embarrassed to go to usual provider"
      6="Other"
      8="Refused"
      9="Don't know" ;
   value WNFSTSEXF
      1-12="January-December"
      13="Winter"
      14="Spring"
      15="Summer"
      16="Fall"
      96="If R insists: Never had sex"
      98="Refused"
      99="Don't know" ;
   value WNSEXAFMF
      1-12="January-December"
      13="Winter"
      14="Spring"
      15="Summer"
      16="Fall"
      96="If R insists: no sex since first menstrual period"
      98="Refused"
      99="Don't know" ;
   value WOMRASDU
      1="Biological mother"
      2="Other mother figure"
      3="No mother figure"
      8="Refused"
      9="Don't know" ;
   value WRK12MOS
      0="No months"
      1="1 Month"
      2="2 Months"
      3="3 Months"
      4="4 Months"
      5="5 Months"
      6="6 Months"
      7="7 Months"
      8="8 Months"
      9="9 Months"
      10="10 Months"
      11="11 Months"
      12="12 Months"
      98="Refused"
      99="Don't know" ;
   value WTHPARNW
      1="Both biological or adoptive parents"
      2="Other or no parental figures"
      8="Refused"
      9="Don't know" ;
   value Y1N2RECF
      1="YES"
      2="NO" ;
   value Y1N52D
      1="Yes"
      5="No"
      98="Refused"
      99="Don't know" ;
   value Y1N5C
      1="YES"
      5="NO" ;
   value Y1N5JPC
      1="Yes"
      5="No"
      6="IF VOLUNTEERED : JOINT PHYSICAL CUSTODY"
      8="Refused"
      9="Don't know" ;
   value Y1N5NAC
      1="YES"
      5="NO"
      7="Not ascertained" ;
   value Y1N5NALC
      1="Yes"
      5="No"
      7="Not ascertained" ;
   value Y1N5RDF
      1="Yes"
      5="No"
      8="Refused"
      9="Don't know" ;
   value YEARFMT
      1931-2017="1931-2017"
      9997="Not ascertained"
      9998="Refused"
      9999="Don't know" ;
   value YESNONAF
      1="Yes"
      5="No"
      7="Not ascertained"
      8="Refused"
      9="Don't know" ;
   value YNOSEX
      1="Against religion or morals"
      2="Don't want to get pregnant"
      3="Don't want to get a sexually transmitted disease"
      4="Haven't found the right person yet"
      5="In a relationship, but waiting for the right time"
      6="Other"
      8="Refused"
      9="Don't know" ;
   value YQUITTRY
      1="Adoption process only"
      2="Own situation only"
      3="Both"
      8="Refused"
      9="Don't know" ;
   value YUSEMTHF
      1="Birth control"
      2="Cramps, or pain during menstrual periods"
      3="Treatment for acne"
      4="Treatment for endometriosis"
      5="Other reasons"
      6="To regulate your menstrual periods"
      7="To reduce menstrual bleeding"
      8="Treatment for hot flashes or other peri-menopausal symptoms"
      98="Refused"
      99="Don't know" ;
   value $PHASE
      "1"="First 10 weeks of quarter"
      "2"="Last 2 weeks of quarter (double sample)" ;
   value $QUARTER
      "17"="17"
      "18"="18"
      "19"="19"
      "20"="20"
      "21"="21"
      "22"="22"
      "23"="23"
      "24"="24" ;
   value $YEARF
      "2015"="2015"
      "2016"="2016"
      "2017"="2017" ;
*/


* SAS DATA, INFILE, INPUT STATEMENTS;

DATA;
INFILE "C:\Users\Christine McWilliams\Documents\Box\ML_Practice\2015_2017_FemRespData.dat" LRECL=4522;
INPUT
   CASEID  1-5              RSCRNINF  6              RSCRAGE  7-8          
   RSCRHISP  9              RSCRRACE  10             AGE_A  11-12          
   AGE_R  13-14             AGESCRN  15-16           HISP  17              
   HISPGRP  18              PRIMLANG1  19            PRIMLANG2  20         
   PRIMLANG3  21            ROSCNT  22               NUMCHILD  23          
   HHKIDS18  24             DAUGHT918  25            SON918  26            
   NONBIOKIDS  27           MARSTAT  28              FMARSTAT  29          
   FMARIT  30               EVRMARRY  31             HPLOCALE  32          
   MANREL  33               GOSCHOL  34              VACA  35              
   HIGRADE  36-37           COMPGRD  38              DIPGED  39            
   EARNHS_Y  40-43          HISCHGRD  44-45          LSTGRADE  46-47       
   MYSCHOL_Y  48-51         HAVEDEG  52              DEGREES  53           
   EARNBA_Y  54-57          EXPSCHL  58              EXPGRADE  59-60       
   WTHPARNW  61             ONOWN  62                ONOWN18  63           
   INTACT  64               PARMARR  65              INTACT18  66          
   LVSIT14F  67             LVSIT14M  68             WOMRASDU  69          
   MOMDEGRE  70             MOMWORKD  71             MOMFSTCH  72-73       
   MOM18  74                MANRASDU  75             R_FOSTER  76          
   EVRFSTER  77             MNYFSTER  78-79          DURFSTER  80          
   MENARCHE  81-82          PREGNOWQ  83             MAYBPREG  84          
   NUMPREGS  85-86          EVERPREG  87             CURRPREG  88          
   HOWPREG_N  89-90         HOWPREG_P  91            NOWPRGDK  92          
   MOSCURRP  93             NPREGS_S  94-95          HASBABES  96          
   NUMBABES  97-98          NBABES_S  99-100         CMLASTLB  101-104     
   CMLSTPRG  105-108        CMFSTPRG  109-112        CMPG1BEG  113-116     
   NPLACED  117             NDIED  118               NADOPTV  119          
   TOTPLACD  120            OTHERKID  121            NOTHRKID  122-123     
   SEXOTHKD  124            RELOTHKD  125            ADPTOTKD  126         
   TRYADOPT  127            TRYEITHR  128            STILHERE  129         
   DATKDCAM_Y  130-133      OTHKDFOS  134            OKDDOB_Y  135-138     
   OKBORNUS  139            OKDISABL1  140           OKDISABL2  141        
   SEXOTHKD2  142           RELOTHKD2  143           ADPTOTKD2  144        
   TRYADOPT2  145           TRYEITHR2  146           STILHERE2  147        
   DATKDCAM_Y2  148-151     OTHKDFOS2  152           OKDDOB_Y2  153-156    
   OKBORNUS2  157           OKDISABL5  158           OKDISABL6  159        
   SEXOTHKD3  160           RELOTHKD3  161           ADPTOTKD3  162        
   TRYADOPT3  163           TRYEITHR3  164           STILHERE3  165        
   DATKDCAM_Y3  166-169     OTHKDFOS3  170           OKDDOB_Y3  171-174    
   OKBORNUS3  175           OKDISABL9  176           OKDISABL10  177       
   SEXOTHKD4  178           RELOTHKD4  179           ADPTOTKD4  180        
   TRYADOPT4  181           TRYEITHR4  182           STILHERE4  183        
   DATKDCAM_Y4  184-187     OTHKDFOS4  188           OKDDOB_Y4  189-192    
   OKBORNUS4  193           OKDISABL13  194          OKDISABL14  195       
   SEXOTHKD5  196           RELOTHKD5  197           ADPTOTKD5  198        
   TRYADOPT5  199           TRYEITHR5  200           STILHERE5  201        
   DATKDCAM_Y5  202-205     OTHKDFOS5  206           OKDDOB_Y5  207-210    
   OKBORNUS5  211           OKDISABL17  212          OKDISABL18  213       
   SEXOTHKD6  214           RELOTHKD6  215           ADPTOTKD6  216        
   TRYADOPT6  217           TRYEITHR6  218           STILHERE6  219        
   DATKDCAM_Y6  220-223     OTHKDFOS6  224           OKDDOB_Y6  225-228    
   OKBORNUS6  229           OKDISABL21  230          OKDISABL22  231       
   SEXOTHKD7  232           RELOTHKD7  233           ADPTOTKD7  234        
   TRYADOPT7  235           TRYEITHR7  236           STILHERE7  237        
   DATKDCAM_Y7  238         OTHKDFOS7  239           OKDDOB_Y7  240        
   OKBORNUS7  241           OKDISABL25  242          OKDISABL26  243       
   SEXOTHKD8  244           RELOTHKD8  245           ADPTOTKD8  246        
   TRYADOPT8  247           TRYEITHR8  248           STILHERE8  249        
   DATKDCAM_Y8  250         OTHKDFOS8  251           OKDDOB_Y8  252        
   OKBORNUS8  253           OKDISABL29  254          OKDISABL30  255       
   SEXOTHKD9  256           RELOTHKD9  257           ADPTOTKD9  258        
   TRYADOPT9  259           TRYEITHR9  260           STILHERE9  261        
   DATKDCAM_Y9  262         OTHKDFOS9  263           OKDDOB_Y9  264        
   OKBORNUS9  265           OKDISABL33  266          OKDISABL34  267       
   SEXOTHKD10  268          RELOTHKD10  269          ADPTOTKD10  270       
   TRYADOPT10  271          TRYEITHR10  272          STILHERE10  273       
   DATKDCAM_Y10  274        OTHKDFOS10  275          OKDDOB_Y10  276       
   OKBORNUS10  277          OKDISABL37  278          OKDISABL38  279       
   SEXOTHKD11  280          RELOTHKD11  281          ADPTOTKD11  282       
   TRYADOPT11  283          TRYEITHR11  284          STILHERE11  285       
   DATKDCAM_Y11  286        OTHKDFOS11  287          OKDDOB_Y11  288       
   OKBORNUS11  289          OKDISABL41  290          OKDISABL42  291       
   SEXOTHKD12  292          RELOTHKD12  293          ADPTOTKD12  294       
   TRYADOPT12  295          TRYEITHR12  296          STILHERE12  297       
   DATKDCAM_Y12  298        OTHKDFOS12  299          OKDDOB_Y12  300       
   OKBORNUS12  301          OKDISABL45  302          OKDISABL46  303       
   SEXOTHKD13  304          RELOTHKD13  305          ADPTOTKD13  306       
   TRYADOPT13  307          TRYEITHR13  308          STILHERE13  309       
   DATKDCAM_Y13  310        OTHKDFOS13  311          OKDDOB_Y13  312       
   OKBORNUS13  313          OKDISABL49  314          OKDISABL50  315       
   SEXOTHKD14  316          RELOTHKD14  317          ADPTOTKD14  318       
   TRYADOPT14  319          TRYEITHR14  320          STILHERE14  321       
   DATKDCAM_Y14  322        OTHKDFOS14  323          OKDDOB_Y14  324       
   OKBORNUS14  325          OKDISABL53  326          OKDISABL54  327       
   SEXOTHKD15  328          RELOTHKD15  329          ADPTOTKD15  330       
   TRYADOPT15  331          TRYEITHR15  332          STILHERE15  333       
   DATKDCAM_Y15  334        OTHKDFOS15  335          OKDDOB_Y15  336       
   OKBORNUS15  337          OKDISABL57  338          OKDISABL58  339       
   SEXOTHKD16  340          RELOTHKD16  341          ADPTOTKD16  342       
   TRYADOPT16  343          TRYEITHR16  344          STILHERE16  345       
   DATKDCAM_Y16  346        OTHKDFOS16  347          OKDDOB_Y16  348       
   OKBORNUS16  349          OKDISABL61  350          OKDISABL62  351       
   SEXOTHKD17  352          RELOTHKD17  353          ADPTOTKD17  354       
   TRYADOPT17  355          TRYEITHR17  356          STILHERE17  357       
   DATKDCAM_Y17  358        OTHKDFOS17  359          OKDDOB_Y17  360       
   OKBORNUS17  361          OKDISABL65  362          OKDISABL66  363       
   SEXOTHKD18  364          RELOTHKD18  365          ADPTOTKD18  366       
   TRYADOPT18  367          TRYEITHR18  368          STILHERE18  369       
   DATKDCAM_Y18  370        OTHKDFOS18  371          OKDDOB_Y18  372       
   OKBORNUS18  373          OKDISABL69  374          OKDISABL70  375       
   SEXOTHKD19  376          RELOTHKD19  377          ADPTOTKD19  378       
   TRYADOPT19  379          TRYEITHR19  380          STILHERE19  381       
   DATKDCAM_Y19  382        OTHKDFOS19  383          OKDDOB_Y19  384       
   OKBORNUS19  385          OKDISABL73  386          OKDISABL74  387       
   SEXOTHKD20  388          RELOTHKD20  389          ADPTOTKD20  390       
   TRYADOPT20  391          TRYEITHR20  392          STILHERE20  393       
   DATKDCAM_Y20  394        OTHKDFOS20  395          OKDDOB_Y20  396       
   OKBORNUS20  397          OKDISABL77  398          OKDISABL78  399       
   EVERADPT  400            SEEKADPT  401            CONTAGEM  402         
   TRYLONG  403             KNOWADPT  404            EVWNTANO  405         
   EVCONTAG  406            TURNDOWN  407            YQUITTRY  408         
   APROCESS1  409           APROCESS2  410           APROCESS3  411        
   HRDEMBRYO  412           TIMESMAR  413            HSBVERIF  414         
   WHMARHX_Y  415-418       AGEMARHX  419-420        HXAGEMAR  421-422     
   DOBHUSBX_Y  423-426      LVTOGHX  427             STRTOGHX_Y  428-431   
   ENGAGHX  432             HSBRACE1  433            HSBNRACE1  434        
   CHEDMARN  435            MARBEFHX  436            KIDSHX  437           
   NUMKDSHX  438-439        KIDLIVHX  440            CHKID18A  441         
   CHKID18B  442            WHRCHKDS1  443           WHRCHKDS2  444        
   SUPPORCH  445            BIOHUSBX  446            BIONUMHX  447         
   MARENDHX  448            WNDIEHX_Y  449-452       DIVDATHX_Y  453-456   
   WNSTPHX_Y  457-460       WHMARHX_Y2  461-464      AGEMARHX2  465-466    
   HXAGEMAR2  467-468       DOBHUSBX_Y2  469-472     LVTOGHX2  473         
   STRTOGHX_Y2  474-477     ENGAGHX2  478            HSBRACE2  479         
   HSBNRACE2  480           CHEDMARN2  481           MARBEFHX2  482        
   KIDSHX2  483             NUMKDSHX2  484           KIDLIVHX2  485        
   CHKID18A2  486           CHKID18B2  487           WHRCHKDS5  488        
   WHRCHKDS6  489           SUPPORCH2  490           BIOHUSBX2  491        
   BIONUMHX2  492           MARENDHX2  493           WNDIEHX_Y2  494-497   
   DIVDATHX_Y2  498-501     WNSTPHX_Y2  502-505      WHMARHX_Y3  506-509   
   AGEMARHX3  510-511       HXAGEMAR3  512-513       DOBHUSBX_Y3  514-517  
   LVTOGHX3  518            STRTOGHX_Y3  519-522     ENGAGHX3  523         
   HSBRACE3  524            HSBNRACE3  525           CHEDMARN3  526        
   MARBEFHX3  527           KIDSHX3  528             NUMKDSHX3  529        
   KIDLIVHX3  530           CHKID18A3  531           CHKID18B3  532        
   WHRCHKDS9  533           WHRCHKDS10  534          SUPPORCH3  535        
   BIOHUSBX3  536           BIONUMHX3  537-538       MARENDHX3  539        
   WNDIEHX_Y3  540-543      DIVDATHX_Y3  544-547     WNSTPHX_Y3  548-551   
   WHMARHX_Y4  552-555      AGEMARHX4  556-557       HXAGEMAR4  558-559    
   DOBHUSBX_Y4  560-563     LVTOGHX4  564            STRTOGHX_Y4  565-568  
   ENGAGHX4  569            HSBRACE4  570            HSBNRACE4  571        
   CHEDMARN4  572           MARBEFHX4  573           KIDSHX4  574          
   NUMKDSHX4  575           KIDLIVHX4  576           CHKID18A4  577        
   CHKID18B4  578           WHRCHKDS13  579          WHRCHKDS14  580       
   SUPPORCH4  581           BIOHUSBX4  582           BIONUMHX4  583        
   MARENDHX4  584           WNDIEHX_Y4  585          DIVDATHX_Y4  586-589  
   WNSTPHX_Y4  590-593      WHMARHX_Y5  594-597      AGEMARHX5  598        
   HXAGEMAR5  599-600       DOBHUSBX_Y5  601-604     LVTOGHX5  605         
   STRTOGHX_Y5  606-609     ENGAGHX5  610            HSBRACE5  611         
   HSBNRACE5  612           CHEDMARN5  613           MARBEFHX5  614        
   KIDSHX5  615             NUMKDSHX5  616           KIDLIVHX5  617        
   CHKID18A5  618           CHKID18B5  619           WHRCHKDS17  620       
   WHRCHKDS18  621          SUPPORCH5  622           BIOHUSBX5  623        
   BIONUMHX5  624           MARENDHX5  625           WNDIEHX_Y5  626       
   DIVDATHX_Y5  627-630     WNSTPHX_Y5  631-634      WHMARHX_Y6  635-638   
   AGEMARHX6  639           HXAGEMAR6  640-641       DOBHUSBX_Y6  642-645  
   LVTOGHX6  646            STRTOGHX_Y6  647-650     ENGAGHX6  651         
   HSBRACE6  652            HSBNRACE6  653           CHEDMARN6  654        
   MARBEFHX6  655           KIDSHX6  656             NUMKDSHX6  657        
   KIDLIVHX6  658           CHKID18A6  659           CHKID18B6  660        
   WHRCHKDS21  661          WHRCHKDS22  662          SUPPORCH6  663        
   BIOHUSBX6  664           BIONUMHX6  665           MARENDHX6  666        
   WNDIEHX_Y6  667          DIVDATHX_Y6  668         WNSTPHX_Y6  669-672   
   CMMARRCH  673-676        PREVHUSB  677            WNSTRTCP_Y  678-681   
   CPHERAGE  682-683        CPHISAGE  684-685        WNCPBRN_Y  686-689    
   CPENGAG1  690            WILLMARR  691            CURCOHRACE  692       
   CURCOHNRACE  693         CPEDUC  694              CPMARBEF  695         
   CPKIDS  696              CPNUMKDS  697-698        CPKIDLIV  699         
   CPKID18A  700            CPKID18B  701            WHRCPKDS1  702        
   WHRCPKDS2  703           SUPPORCP  704            BIOCP  705            
   BIONUMCP  706            CMSTRTHP  707-710        LIVEOTH  711          
   EVRCOHAB  712            HMOTHMEN  713-714        PREVCOHB  715-716     
   STRTOTHX_Y  717-720      HERAGECX  721-722        HISAGECX  723-724     
   WNBRNCX_Y  725-728       ENGAG1CX  729            COH1RACE  730         
   COH1NRACE  731           MAREVCX  732             CXKIDS  733           
   BIOFCPX  734             BIONUMCX  735            STPTOGCX_Y  736-739   
   STRTOTHX_Y2  740-743     HERAGECX2  744-745       HISAGECX2  746-747    
   WNBRNCX_Y2  748-751      ENGAG1CX2  752           MAREVCX2  753         
   CXKIDS2  754             BIOFCPX2  755            BIONUMCX2  756        
   STPTOGCX_Y2  757-760     STRTOTHX_Y3  761-764     HERAGECX3  765-766    
   HISAGECX3  767-768       WNBRNCX_Y3  769-772      ENGAG1CX3  773        
   MAREVCX3  774            CXKIDS3  775             BIOFCPX3  776         
   BIONUMCX3  777           STPTOGCX_Y3  778-781     STRTOTHX_Y4  782-785  
   HERAGECX4  786-787       HISAGECX4  788-789       WNBRNCX_Y4  790-793   
   ENGAG1CX4  794           MAREVCX4  795            CXKIDS4  796          
   BIOFCPX4  797            BIONUMCX4  798           STPTOGCX_Y4  799-802  
   COHCHANCE  803           MARRCHANCE  804          PMARCOH  805          
   EVERSEX  806             RHADSEX  807             YNOSEX  808           
   WNFSTSEX_M  809-810      WNFSTSEX_Y  811-814      CMFSTSEX  815-818     
   AGEFSTSX  819-820        C_SEX18  821             C_SEX15  822          
   C_SEX20  823             GRFSTSX  824-825         SXMTONCE  826         
   TALKPAR1  827-828        TALKPAR2  829            TALKPAR3  830         
   TALKPAR4  831            TALKPAR5  832            TALKPAR6  833         
   TALKPAR7  834            SEDNO  835               SEDNOG  836-837       
   SEDNOSX  838             SEDBC  839               SEDBCLC1  840         
   SEDBCLC2  841            SEDBCLC3  842            SEDBCLC4  843         
   SEDBCG  844-845          SEDBCSX  846             SEDWHBC  847          
   SEDWHBCG  848-849        SEDWBCSX  850            SEDCOND  851          
   SEDCONDG  852-853        SEDCONSX  854            SEDSTD  855           
   SEDSTDG  856-857         SEDSTDSX  858            SEDHIV  859           
   SEDHIVG  860-861         SEDHIVSX  862            SEDABST  863          
   SEDABLC1  864            SEDABLC2  865            SEDABLC3  866         
   SEDABLC4  867            SEDABSTG  868-869        SEDABSSX  870         
   SAMEMAN  871             WHOFSTPR  872-873        KNOWFP  874-875       
   STILFPSX  876            LSTSEXFP_M  877-878      LSTSEXFP_Y  879-882   
   CMLSEXFP  883-886        CMFPLAST  887-890        FPOTHREL  891-892     
   FPEDUC  893              FSEXRACE  894            FSEXNRACE  895        
   FPRN  896                WHICH1ST  897            SEXAFMEN  898         
   WNSEXAFM_M  899-900      WNSEXAFM_Y  901-904      CMSEXAFM  905-908     
   AGESXAFM  909-910        AFMEN18  911             AFMEN15  912          
   AFMEN20  913             LIFEPRT  914-916         LIFEPRT_LO  917-919   
   LIFEPRT_HI  920-922      PTSB4MAR  923-925        PTSB4MAR_LO  926-928  
   PTSB4MAR_HI  929-931     MON12PRT  932-934        MON12PRT_LO  935-937  
   MON12PRT_HI  938-940     PARTS12  941-944         LIFEPRTS  945-946     
   WHOSNC1Y  947            MATCHFP  948             MATCHHP  949-950      
   P1YRELP  951-952         CMLSEX  953-956          P1YLSEX_M  957-958    
   P1YLSEX_Y  959-962       P1YCURRP  963            PCURRNT  964          
   MATCHFP2  965            MATCHHP2  966-967        P1YRELP2  968-969     
   CMLSEX2  970-973         P1YLSEX_M2  974-975      P1YLSEX_Y2  976-979   
   P1YCURRP2  980           PCURRNT2  981            MATCHFP3  982         
   MATCHHP3  983-984        P1YRELP3  985-986        CMLSEX3  987-990      
   P1YLSEX_M3  991-992      P1YLSEX_Y3  993-996      P1YCURRP3  997        
   PCURRNT3  998            P1YOTHREL  999-1000      P1YRAGE  1001-1002    
   P1YHSAGE  1003-1004      P1YRF  1005-1006         P1YFSEX_M  1007-1008  
   P1YFSEX_Y  1009-1012     CMFSEX  1013-1016        CMFSEXTOT  1017-1020  
   P1YEDUC  1021            P1YRACE1  1022           P1YNRACE1  1023       
   P1YRN  1024              P1YOTHREL2  1025-1026    P1YRAGE2  1027-1028   
   P1YHSAGE2  1029-1030     P1YRF2  1031-1032        P1YFSEX_M2  1033-1034 
   P1YFSEX_Y2  1035-1038    CMFSEX2  1039-1042       CMFSEXTOT2  1043-1046 
   P1YEDUC2  1047           P1YRACE2  1048           P1YNRACE2  1049       
   P1YRN2  1050             P1YOTHREL3  1051-1052    P1YRAGE3  1053-1054   
   P1YHSAGE3  1055-1056     P1YRF3  1057-1058        P1YFSEX_M3  1059-1060 
   P1YFSEX_Y3  1061-1064    CMFSEX3  1065-1068       CMFSEXTOT3  1069-1072 
   P1YEDUC3  1073           P1YRACE3  1074           P1YNRACE3  1075       
   P1YRN3  1076             CURRPRTT  1077           CURRPRTS  1078        
   CMCURRP1  1079-1082      CMCURRP2  1083-1086      CMCURRP3  1087        
   EVERTUBS  1088           ESSURE  1089             EVERHYST  1090        
   EVEROVRS  1091           EVEROTHR  1092           WHTOOPRC  1093        
   ONOTFUNC  1094           DFNLSTRL  1095           ANYTUBAL  1096        
   HYST  1097               OVAREM  1098             OTHR  1099            
   ANYFSTER  1100           ANYOPSMN  1101           WHATOPSM  1102        
   DFNLSTRM  1103           ANYMSTER  1104           ANYVAS  1105          
   OTHRM  1106              DATFEMOP_Y  1107-1110    PLCFEMOP  1111-1112   
   PAYRSTER1  1113          PAYRSTER2  1114          PAYRSTER3  1115       
   RHADALL  1116            HHADALL  1117            FMEDREAS1  1118       
   FMEDREAS2  1119          FMEDREAS3  1120          FMEDREAS4  1121       
   FMEDREAS5  1122          BCREAS  1123             BCWHYF  1124          
   MINCDNNR  1125           DATFEMOP_Y2  1126-1129   PLCFEMOP2  1130       
   PAYRSTER6  1131          PAYRSTER7  1132          PAYRSTER8  1133       
   RHADALL2  1134           HHADALL2  1135           FMEDREAS7  1136       
   FMEDREAS8  1137          FMEDREAS9  1138          FMEDREAS10  1139      
   FMEDREAS11  1140         BCREAS2  1141            BCWHYF2  1142         
   MINCDNNR2  1143          DATFEMOP_Y3  1144-1147   PLCFEMOP3  1148       
   PAYRSTER11  1149         PAYRSTER12  1150         PAYRSTER13  1151      
   RHADALL3  1152           HHADALL3  1153           FMEDREAS13  1154      
   FMEDREAS14  1155         FMEDREAS15  1156         FMEDREAS16  1157      
   FMEDREAS17  1158         BCREAS3  1159            BCWHYF3  1160         
   MINCDNNR3  1161          DATFEMOP_Y4  1162-1165   PLCFEMOP4  1166-1167  
   PAYRSTER16  1168         PAYRSTER17  1169         PAYRSTER18  1170      
   RHADALL4  1171           HHADALL4  1172           FMEDREAS19  1173      
   FMEDREAS20  1174         FMEDREAS21  1175         FMEDREAS22  1176      
   FMEDREAS23  1177         BCREAS4  1178            BCWHYF4  1179         
   MINCDNNR4  1180          OPERSAME1  1181          OPERSAME2  1182       
   OPERSAME3  1183          OPERSAME4  1184          OPERSAME5  1185       
   OPERSAME6  1186          DATEOPMN_Y  1187-1190    WITHIMOP  1191        
   VASJAN4YR  1192          PLACOPMN  1193-1194      PAYMSTER1  1195       
   PAYMSTER2  1196          RHADALLM  1197           HHADALLM  1198        
   MEDREAS1  1199           MEDREAS2  1200           BCREASM  1201         
   BCWHYM  1202             MINCDNMN  1203           REVSTUBL  1204        
   DATRVSTB_Y  1205-1208    REVSVASX  1209           DATRVVEX_Y  1210-1213 
   TUBS  1214               VASECT  1215             RSURGSTR  1216        
   PSURGSTR  1217           ONLYTBVS  1218           RWANTRVT  1219        
   MANWANTT  1220           RWANTREV  1221           MANWANTR  1222        
   POSIBLPG  1223           REASIMPR  1224-1225      POSIBLMN  1226        
   REASIMPP  1227           CANHAVER  1228           REASDIFF1  1229       
   REASDIFF2  1230          REASDIFF3  1231          CANHAVEM  1232        
   PREGNONO  1233           REASNONO1  1234          REASNONO2  1235       
   REASNONO3  1236          RSTRSTAT  1237           PSTRSTAT  1238        
   PILL  1239               CONDOM  1240             VASECTMY  1241        
   DEPOPROV  1242           WIDRAWAL  1243           RHYTHM  1244          
   SDAYCBDS  1245           TEMPSAFE  1246           PATCH  1247           
   RING  1248               MORNPILL  1249           ECTIMESX  1250-1251   
   ECREASON1  1252          ECREASON2  1253          ECREASON3  1254       
   ECRX  1255               ECWHERE  1256-1257       ECWHEN  1258          
   OTHRMETH01  1259-1260    OTHRMETH02  1261-1262    OTHRMETH03  1263-1264 
   OTHRMETH04  1265-1266    OTHRMETH05  1267-1268    OTHRMETH06  1269-1270 
   OTHRMETH07  1271         EVIUDTYP1  1272          EVIUDTYP2  1273       
   NEWMETH  1274            EVERUSED  1275           METHDISS  1276        
   METHSTOP01  1277-1278    METHSTOP02  1279-1280    METHSTOP03  1281-1282 
   METHSTOP04  1283-1284    METHSTOP05  1285-1286    METHSTOP06  1287-1288 
   METHSTOP07  1289-1290    METHSTOP08  1291         METHSTOP09  1292      
   METHSTOP10  1293         WHENPILL  1294           REASPILL01  1295-1296 
   REASPILL02  1297-1298    REASPILL03  1299-1300    REASPILL04  1301-1302 
   REASPILL05  1303-1304    REASPILL06  1305-1306    REASPILL07  1307-1308 
   STOPPILL1  1309-1310     STOPPILL2  1311-1312     STOPPILL3  1313-1314  
   STOPPILL4  1315-1316     STOPPILL5  1317-1318     STOPPILL6  1319-1320  
   WHENCOND  1321           REASCOND01  1322-1323    REASCOND02  1324-1325 
   REASCOND03  1326-1327    REASCOND04  1328-1329    REASCOND05  1330-1331 
   REASCOND06  1332-1333    REASCOND07  1334         STOPCOND1  1335-1336  
   STOPCOND2  1337          WHENIUD  1338            TYPEIUD_1  1339       
   TYPEIUD_2  1340          REASIUD01  1341-1342     REASIUD02  1343-1344  
   REASIUD03  1345-1346     REASIUD04  1347-1348     REASIUD05  1349-1350  
   REASIUD06  1351-1352     REASIUD07  1353-1354     REASIUD08  1355-1356  
   STOPIUD1  1357-1358      STOPIUD2  1359-1360      STOPIUD3  1361-1362   
   STOPIUD4  1363-1364      STOPIUD5  1365           FIRSMETH1  1366-1367  
   FIRSMETH2  1368-1369     FIRSMETH3  1370-1371     FIRSMETH4  1372-1373  
   NUMFIRSM  1374           DRUGDEV  1375-1376       DRUGDEV2  1377        
   DRUGDEV3  1378           DRUGDEV4  1379           FIRSTIME1  1380       
   FIRSTIME2  1381          USEFSTSX  1382-1383      CMFIRSM  1384-1387    
   MTHFSTSX1  1388-1389     MTHFSTSX2  1390-1391     MTHFSTSX3  1392-1393  
   MTHFSTSX4  1394-1395     WNFSTUSE_M  1396-1397    WNFSTUSE_Y  1398-1401 
   CMFSTUSE  1402-1405      FMETHPRS  1406           FMETHPRS2  1407       
   FMETHPRS3  1408          FMETHPRS4  1409          AGEFSTUS  1410-1411   
   PLACGOTF  1412-1413      PLACGOTF2  1414-1415     PLACGOTF3  1416-1417  
   PLACGOTF4  1418          USEFRSTS  1419           MTHFRSTS1  1420-1421  
   MTHFRSTS2  1422-1423     MTHFRSTS3  1424          MTHFRSTS4  1425       
   INTR_EC3  1426           CMMONSX  1427-1430       MONSX  1431           
   CMMONSX2  1432-1435      MONSX2  1436             CMMONSX3  1437-1440   
   MONSX3  1441             CMMONSX4  1442-1445      MONSX4  1446          
   CMMONSX5  1447-1450      MONSX5  1451             CMMONSX6  1452-1455   
   MONSX6  1456             CMMONSX7  1457-1460      MONSX7  1461          
   CMMONSX8  1462-1465      MONSX8  1466             CMMONSX9  1467-1470   
   MONSX9  1471             CMMONSX10  1472-1475     MONSX10  1476         
   CMMONSX11  1477-1480     MONSX11  1481            CMMONSX12  1482-1485  
   MONSX12  1486            CMMONSX13  1487-1490     MONSX13  1491         
   CMMONSX14  1492-1495     MONSX14  1496            CMMONSX15  1497-1500  
   MONSX15  1501            CMMONSX16  1502-1505     MONSX16  1506         
   CMMONSX17  1507-1510     MONSX17  1511            CMMONSX18  1512-1515  
   MONSX18  1516            CMMONSX19  1517-1520     MONSX19  1521         
   CMMONSX20  1522-1525     MONSX20  1526            CMMONSX21  1527-1530  
   MONSX21  1531            CMMONSX22  1532-1535     MONSX22  1536         
   CMMONSX23  1537-1540     MONSX23  1541            CMMONSX24  1542-1545  
   MONSX24  1546            CMMONSX25  1547-1550     MONSX25  1551         
   CMMONSX26  1552-1555     MONSX26  1556            CMMONSX27  1557-1560  
   MONSX27  1561            CMMONSX28  1562-1565     MONSX28  1566         
   CMMONSX29  1567-1570     MONSX29  1571            CMMONSX30  1572-1575  
   MONSX30  1576            CMMONSX31  1577-1580     MONSX31  1581         
   CMMONSX32  1582-1585     MONSX32  1586            CMMONSX33  1587-1590  
   MONSX33  1591            CMMONSX34  1592-1595     MONSX34  1596         
   CMMONSX35  1597-1600     MONSX35  1601            CMMONSX36  1602-1605  
   MONSX36  1606            CMMONSX37  1607-1610     MONSX37  1611         
   CMMONSX38  1612-1615     MONSX38  1616            CMMONSX39  1617-1620  
   MONSX39  1621            CMMONSX40  1622-1625     MONSX40  1626         
   CMMONSX41  1627-1630     MONSX41  1631            CMMONSX42  1632-1635  
   MONSX42  1636            CMMONSX43  1637-1640     MONSX43  1641         
   CMMONSX44  1642-1645     MONSX44  1646            CMMONSX45  1647-1650  
   MONSX45  1651            CMMONSX46  1652-1655     MONSX46  1656         
   CMMONSX47  1657-1660     MONSX47  1661            CMMONSX48  1662-1665  
   MONSX48  1666            CMSTRTMC  1667-1670      CMENDMC  1671-1674    
   INTR_ED4a  1675          NUMMCMON  1676-1677      MC1MONS1  1678-1680   
   MC1SIMSQ  1681           MC1MONS2  1682-1684      MC1MONS3  1685-1687   
   DATBEGIN_M  1688-1689    DATBEGIN_Y  1690-1693    CMDATBEGIN  1694-1697 
   CURRMETH1  1698-1699     CURRMETH2  1700-1701     CURRMETH3  1702-1703  
   CURRMETH4  1704          LSTMONMETH1  1705-1706   LSTMONMETH2  1707-1708
   LSTMONMETH3  1709-1710   LSTMONMETH4  1711-1712   PILL_12  1713         
   DIAPH_12  1714           IUD_12  1715             IMPLANT_12  1716      
   DEPO_12  1717            CERVC_12  1718           MPILL_12  1719        
   PATCH_12  1720           RING_12  1721            METHX1  1722-1723     
   METHX2  1724-1725        METHX3  1726-1727        METHX4  1728-1729     
   METHX5  1730-1731        METHX6  1732-1733        METHX7  1734-1735     
   METHX8  1736-1737        METHX9  1738-1739        METHX10  1740-1741    
   METHX11  1742-1743       METHX12  1744-1745       METHX13  1746-1747    
   METHX14  1748-1749       METHX15  1750-1751       METHX16  1752-1753    
   METHX17  1754-1755       METHX18  1756-1757       METHX19  1758-1759    
   METHX20  1760-1761       METHX21  1762-1763       METHX22  1764-1765    
   METHX23  1766-1767       METHX24  1768-1769       METHX25  1770-1771    
   METHX26  1772-1773       METHX27  1774-1775       METHX28  1776-1777    
   METHX29  1778-1779       METHX30  1780-1781       METHX31  1782-1783    
   METHX32  1784-1785       METHX33  1786-1787       METHX34  1788-1789    
   METHX35  1790-1791       METHX36  1792-1793       METHX37  1794-1795    
   METHX38  1796-1797       METHX39  1798-1799       METHX40  1800-1801    
   METHX41  1802-1803       METHX42  1804-1805       METHX43  1806-1807    
   METHX44  1808-1809       METHX45  1810-1811       METHX46  1812-1813    
   METHX47  1814-1815       METHX48  1816-1817       METHX49  1818-1819    
   METHX50  1820-1821       METHX51  1822-1823       METHX52  1824-1825    
   METHX53  1826-1827       METHX54  1828-1829       METHX55  1830-1831    
   METHX56  1832-1833       METHX57  1834-1835       METHX58  1836-1837    
   METHX59  1838-1839       METHX60  1840-1841       METHX61  1842-1843    
   METHX62  1844-1845       METHX63  1846-1847       METHX64  1848-1849    
   METHX65  1850-1851       METHX66  1852-1853       METHX67  1854-1855    
   METHX68  1856-1857       METHX69  1858-1859       METHX70  1860-1861    
   METHX71  1862-1863       METHX72  1864-1865       METHX73  1866-1867    
   METHX74  1868-1869       METHX75  1870-1871       METHX76  1872-1873    
   METHX77  1874-1875       METHX78  1876-1877       METHX79  1878-1879    
   METHX80  1880-1881       METHX81  1882-1883       METHX82  1884-1885    
   METHX83  1886-1887       METHX84  1888-1889       METHX85  1890-1891    
   METHX86  1892-1893       METHX87  1894-1895       METHX88  1896-1897    
   METHX89  1898-1899       METHX90  1900-1901       METHX91  1902-1903    
   METHX92  1904-1905       METHX93  1906-1907       METHX94  1908-1909    
   METHX95  1910-1911       METHX96  1912-1913       METHX97  1914-1915    
   METHX98  1916-1917       METHX99  1918-1919       METHX100  1920-1921   
   METHX101  1922-1923      METHX102  1924-1925      METHX103  1926-1927   
   METHX104  1928-1929      METHX105  1930-1931      METHX106  1932-1933   
   METHX107  1934-1935      METHX108  1936-1937      METHX109  1938-1939   
   METHX110  1940-1941      METHX111  1942-1943      METHX112  1944-1945   
   METHX113  1946-1947      METHX114  1948-1949      METHX115  1950-1951   
   METHX116  1952-1953      METHX117  1954-1955      METHX118  1956-1957   
   METHX119  1958-1959      METHX120  1960-1961      METHX121  1962-1963   
   METHX122  1964-1965      METHX123  1966-1967      METHX124  1968-1969   
   METHX125  1970-1971      METHX126  1972-1973      METHX127  1974-1975   
   METHX128  1976-1977      METHX129  1978-1979      METHX130  1980-1981   
   METHX131  1982-1983      METHX132  1984-1985      METHX133  1986-1987   
   METHX134  1988-1989      METHX135  1990-1991      METHX136  1992-1993   
   METHX137  1994-1995      METHX138  1996-1997      METHX139  1998-1999   
   METHX140  2000-2001      METHX141  2002-2003      METHX142  2004-2005   
   METHX143  2006-2007      METHX144  2008-2009      METHX145  2010-2011   
   METHX146  2012-2013      METHX147  2014-2015      METHX148  2016-2017   
   METHX149  2018-2019      METHX150  2020-2021      METHX151  2022-2023   
   METHX152  2024-2025      METHX153  2026-2027      METHX154  2028-2029   
   METHX155  2030-2031      METHX156  2032-2033      METHX157  2034-2035   
   METHX158  2036-2037      METHX159  2038-2039      METHX160  2040-2041   
   METHX161  2042-2043      METHX162  2044-2045      METHX163  2046-2047   
   METHX164  2048-2049      METHX165  2050-2051      METHX166  2052-2053   
   METHX167  2054-2055      METHX168  2056           METHX169  2057-2058   
   METHX170  2059-2060      METHX171  2061-2062      METHX172  2063-2064   
   METHX173  2065-2066      METHX174  2067-2068      METHX175  2069-2070   
   METHX176  2071           METHX177  2072-2073      METHX178  2074-2075   
   METHX179  2076-2077      METHX180  2078           METHX181  2079-2080   
   METHX182  2081-2082      METHX183  2083-2084      METHX184  2085        
   METHX185  2086-2087      METHX186  2088-2089      METHX187  2090-2091   
   METHX188  2092           METHX189  2093-2094      METHX190  2095-2096   
   METHX191  2097-2098      METHX192  2099           CMMHCALX1  2100-2103  
   CMMHCALX2  2104-2107     CMMHCALX3  2108-2111     CMMHCALX4  2112-2115  
   CMMHCALX5  2116-2119     CMMHCALX6  2120-2123     CMMHCALX7  2124-2127  
   CMMHCALX8  2128-2131     CMMHCALX9  2132-2135     CMMHCALX10  2136-2139 
   CMMHCALX11  2140-2143    CMMHCALX12  2144-2147    CMMHCALX13  2148-2151 
   CMMHCALX14  2152-2155    CMMHCALX15  2156-2159    CMMHCALX16  2160-2163 
   CMMHCALX17  2164-2167    CMMHCALX18  2168-2171    CMMHCALX19  2172-2175 
   CMMHCALX20  2176-2179    CMMHCALX21  2180-2183    CMMHCALX22  2184-2187 
   CMMHCALX23  2188-2191    CMMHCALX24  2192-2195    CMMHCALX25  2196-2199 
   CMMHCALX26  2200-2203    CMMHCALX27  2204-2207    CMMHCALX28  2208-2211 
   CMMHCALX29  2212-2215    CMMHCALX30  2216-2219    CMMHCALX31  2220-2223 
   CMMHCALX32  2224-2227    CMMHCALX33  2228-2231    CMMHCALX34  2232-2235 
   CMMHCALX35  2236-2239    CMMHCALX36  2240-2243    CMMHCALX37  2244-2247 
   CMMHCALX38  2248-2251    CMMHCALX39  2252-2255    CMMHCALX40  2256-2259 
   CMMHCALX41  2260-2263    CMMHCALX42  2264-2267    CMMHCALX43  2268-2271 
   CMMHCALX44  2272-2275    CMMHCALX45  2276-2279    CMMHCALX46  2280-2283 
   CMMHCALX47  2284-2287    CMMHCALX48  2288-2291    NUMMULTX1  2292       
   NUMMULTX2  2293          NUMMULTX3  2294          NUMMULTX4  2295       
   NUMMULTX5  2296          NUMMULTX6  2297          NUMMULTX7  2298       
   NUMMULTX8  2299          NUMMULTX9  2300          NUMMULTX10  2301      
   NUMMULTX11  2302         NUMMULTX12  2303         NUMMULTX13  2304      
   NUMMULTX14  2305         NUMMULTX15  2306         NUMMULTX16  2307      
   NUMMULTX17  2308         NUMMULTX18  2309         NUMMULTX19  2310      
   NUMMULTX20  2311         NUMMULTX21  2312         NUMMULTX22  2313      
   NUMMULTX23  2314         NUMMULTX24  2315         NUMMULTX25  2316      
   NUMMULTX26  2317         NUMMULTX27  2318         NUMMULTX28  2319      
   NUMMULTX29  2320         NUMMULTX30  2321         NUMMULTX31  2322      
   NUMMULTX32  2323         NUMMULTX33  2324         NUMMULTX34  2325      
   NUMMULTX35  2326         NUMMULTX36  2327         NUMMULTX37  2328      
   NUMMULTX38  2329         NUMMULTX39  2330         NUMMULTX40  2331      
   NUMMULTX41  2332         NUMMULTX42  2333         NUMMULTX43  2334      
   NUMMULTX44  2335         NUMMULTX45  2336         NUMMULTX46  2337      
   NUMMULTX47  2338         NUMMULTX48  2339         SALMX1  2340          
   SALMX2  2341             SALMX3  2342             SALMX4  2343          
   SALMX5  2344             SALMX6  2345             SALMX7  2346          
   SALMX8  2347             SALMX9  2348             SALMX10  2349         
   SALMX11  2350            SALMX12  2351            SALMX13  2352         
   SALMX14  2353            SALMX15  2354            SALMX16  2355         
   SALMX17  2356            SALMX18  2357            SALMX19  2358         
   SALMX20  2359            SALMX21  2360            SALMX22  2361         
   SALMX23  2362            SALMX24  2363            SALMX25  2364         
   SALMX26  2365            SALMX27  2366            SALMX28  2367         
   SALMX29  2368            SALMX30  2369            SALMX31  2370         
   SALMX32  2371            SALMX33  2372            SALMX34  2373         
   SALMX35  2374            SALMX36  2375            SALMX37  2376         
   SALMX38  2377            SALMX39  2378            SALMX40  2379         
   SALMX41  2380            SALMX42  2381            SALMX43  2382         
   SALMX44  2383            SALMX45  2384            SALMX46  2385         
   SALMX47  2386            SALMX48  2387            SAYX1  2388           
   SAYX2  2389              SAYX3  2390              SAYX4  2391           
   SAYX5  2392              SAYX6  2393              SAYX7  2394           
   SAYX8  2395              SAYX9  2396              SAYX10  2397          
   SAYX11  2398             SAYX12  2399             SAYX13  2400          
   SAYX14  2401             SAYX15  2402             SAYX16  2403          
   SAYX17  2404             SAYX18  2405             SAYX19  2406          
   SAYX20  2407             SAYX21  2408             SAYX22  2409          
   SAYX23  2410             SAYX24  2411             SAYX25  2412          
   SAYX26  2413             SAYX27  2414             SAYX28  2415          
   SAYX29  2416             SAYX30  2417             SAYX31  2418          
   SAYX32  2419             SAYX33  2420             SAYX34  2421          
   SAYX35  2422             SAYX36  2423             SAYX37  2424          
   SAYX38  2425             SAYX39  2426             SAYX40  2427          
   SAYX41  2428             SAYX42  2429             SAYX43  2430          
   SAYX44  2431             SAYX45  2432             SAYX46  2433          
   SAYX47  2434             SAYX48  2435             SIMSEQX1  2436        
   SIMSEQX2  2437           SIMSEQX3  2438           SIMSEQX4  2439        
   SIMSEQX5  2440           SIMSEQX6  2441           SIMSEQX7  2442        
   SIMSEQX8  2443           SIMSEQX9  2444           SIMSEQX10  2445       
   SIMSEQX11  2446          SIMSEQX12  2447          SIMSEQX13  2448       
   SIMSEQX14  2449          SIMSEQX15  2450          SIMSEQX16  2451       
   SIMSEQX17  2452          SIMSEQX18  2453          SIMSEQX19  2454       
   SIMSEQX20  2455          SIMSEQX21  2456          SIMSEQX22  2457       
   SIMSEQX23  2458          SIMSEQX24  2459          SIMSEQX25  2460       
   SIMSEQX26  2461          SIMSEQX27  2462          SIMSEQX28  2463       
   SIMSEQX29  2464          SIMSEQX30  2465          SIMSEQX31  2466       
   SIMSEQX32  2467          SIMSEQX33  2468          SIMSEQX34  2469       
   SIMSEQX35  2470          SIMSEQX36  2471          SIMSEQX37  2472       
   SIMSEQX38  2473          SIMSEQX39  2474          SIMSEQX40  2475       
   SIMSEQX41  2476          SIMSEQX42  2477          SIMSEQX43  2478       
   SIMSEQX44  2479          SIMSEQX45  2480          SIMSEQX46  2481       
   SIMSEQX47  2482          SIMSEQX48  2483          USELSTP  2484         
   WYNOLSTP  2485           HPLSTP  2486             LSTMTHP1  2487-2488   
   LSTMTHP2  2489-2490      LSTMTHP3  2491-2492      LSTMTHP4  2493-2494   
   LPIUDTYP  2495           USEFSTP  2496            FSTMTHP1  2497-2498   
   FSTMTHP2  2499-2500      FSTMTHP3  2501-2502      FSTMTHP4  2503-2504   
   USELSTP2  2505           WYNOLSTP2  2506          HPLSTP2  2507         
   LSTMTHP5  2508-2509      LSTMTHP6  2510-2511      LSTMTHP7  2512-2513   
   LSTMTHP8  2514           LPIUDTYP2  2515          USEFSTP2  2516        
   FSTMTHP5  2517-2518      FSTMTHP6  2519-2520      FSTMTHP7  2521-2522   
   FSTMTHP8  2523           USELSTP3  2524           WYNOLSTP3  2525       
   HPLSTP3  2526            LSTMTHP9  2527-2528      LSTMTHP10  2529-2530  
   LSTMTHP11  2531          LSTMTHP12  2532          LPIUDTYP3  2533       
   USEFSTP3  2534           FSTMTHP9  2535-2536      FSTMTHP10  2537-2538  
   FSTMTHP11  2539          FSTMTHP12  2540          WYNOTUSE  2541        
   HPPREGQ  2542            DURTRY_N  2543-2544      DURTRY_P  2545        
   WHYNOUSING1  2546-2547   WHYNOUSING2  2548        WHYNOUSING3  2549     
   WHYNOUSING4  2550        WHYNOUSING5  2551        WHYNOTPG1  2552-2553  
   WHYNOTPG2  2554-2555     MAINNOUSE  2556          YUSEPILL1  2557       
   YUSEPILL2  2558          YUSEPILL3  2559          YUSEPILL4  2560       
   YUSEPILL5  2561          YUSEPILL6  2562          YUSEPILL7  2563       
   IUDTYPE  2564            YUSEIUD1  2565           YUSEIUD2  2566        
   YUSEIUD3  2567           YUSEIUD4  2568           YUSEIUD5  2569        
   EKMETHOD  2570-2571      CURBCPLC  2572-2573      NUMPILLS  2574-2575   
   CURBCPAY1  2576          CURBCPAY2  2577          CURBCPAY3  2578       
   CURBCINS  2579           NOUSEINS1  2580          NOUSEINS2  2581       
   NOUSEINS3  2582          CURBCAMT  2583           NOCOST1  2584         
   NOCOST2  2585            PST4WKSX  2586-2588      PSWKCOND1  2589       
   PSWKCOND2  2590-2591     COND1BRK  2592           COND1OFF  2593        
   CONDBRFL  2594           CONDOFF  2595-2597       MISSPILL  2598        
   P12MOCON  2599           PXNOFREQ  2600           BTHCON12  2601        
   MEDTST12  2602           BCCNS12  2603            STEROP12  2604        
   STCNS12  2605            EMCON12  2606            ECCNS12  2607         
   NUMMTH12  2608           PRGTST12  2609           ABORT12  2610         
   PAP12  2611              PELVIC12  2612           PRENAT12  2613        
   PARTUM12  2614           STDSVC12  2615           BARRIER1  2616-2617   
   BARRIER2  2618-2619      BARRIER3  2620-2621      BARRIER4  2622-2623   
   BARRIER5  2624           BARRIER6  2625           NUMSVC12  2626-2627   
   NUMBCVIS  2628           BC12PLCX  2629-2630      BC12PLCX2  2631-2632  
   BC12PLCX3  2633-2634     BC12PLCX4  2635-2636     BC12PLCX5  2637-2638  
   BC12PLCX6  2639          BC12PLCX7  2640-2641     BC12PLCX8  2642-2643  
   BC12PLCX9  2644-2645     BC12PLCX10  2646-2647    BC12PLCX11  2648-2649 
   BC12PLCX12  2650-2651    BC12PLCX13  2652-2653    BC12PLCX14  2654-2655 
   BC12PLCX15  2656-2657    IDCLINIC  2658-2659      PGTSTBC2  2660        
   PAPPLBC2  2661           PAPPELEC  2662           STDTSCON  2663        
   WHYPSTD  2664            BCCLARC  2665            BC12PAYX1  2666       
   BC12PAYX2  2667          BC12PAYX3  2668          BC12PAYX4  2669       
   BC12PAYX7  2670          BC12PAYX8  2671          BC12PAYX9  2672       
   BC12PAYX10  2673         BC12PAYX13  2674         BC12PAYX14  2675      
   BC12PAYX15  2676         BC12PAYX16  2677         BC12PAYX19  2678      
   BC12PAYX20  2679         BC12PAYX21  2680         BC12PAYX22  2681      
   BC12PAYX25  2682         BC12PAYX26  2683         BC12PAYX27  2684      
   BC12PAYX28  2685         BC12PAYX31  2686         BC12PAYX32  2687      
   BC12PAYX33  2688         BC12PAYX34  2689         BC12PAYX37  2690      
   BC12PAYX38  2691         BC12PAYX39  2692         BC12PAYX40  2693      
   BC12PAYX43  2694         BC12PAYX44  2695         BC12PAYX45  2696      
   BC12PAYX46  2697         BC12PAYX49  2698         BC12PAYX50  2699      
   BC12PAYX51  2700         BC12PAYX52  2701         BC12PAYX55  2702      
   BC12PAYX56  2703         BC12PAYX57  2704         BC12PAYX58  2705      
   BC12PAYX61  2706         BC12PAYX62  2707         BC12PAYX63  2708      
   BC12PAYX64  2709         BC12PAYX67  2710         BC12PAYX68  2711      
   BC12PAYX69  2712         BC12PAYX70  2713         BC12PAYX73  2714      
   BC12PAYX74  2715         BC12PAYX75  2716         BC12PAYX76  2717      
   BC12PAYX79  2718         BC12PAYX80  2719         BC12PAYX81  2720      
   BC12PAYX82  2721         BC12PAYX85  2722         BC12PAYX86  2723      
   BC12PAYX87  2724         BC12PAYX88  2725         REGCAR12_F_01  2726   
   REGCAR12_F_02  2727      REGCAR12_F_03  2728      REGCAR12_F_04  2729   
   REGCAR12_F_05  2730      REGCAR12_F_06  2731      REGCAR12_F_07  2732   
   REGCAR12_F_08  2733      REGCAR12_F_09  2734      REGCAR12_F_10  2735   
   REGCAR12_F_11  2736      REGCAR12_F_12  2737      REGCAR12_F_13  2738   
   REGCAR12_F_14  2739      REGCAR12_F_15  2740      EVERFPC  2741         
   KNDMDHLP01  2742-2743    KNDMDHLP02  2744-2745    KNDMDHLP03  2746-2747 
   KNDMDHLP04  2748-2749    KNDMDHLP05  2750-2751    KNDMDHLP06  2752-2753 
   KNDMDHLP07  2754-2755    KNDMDHLP08  2756         LASTPAP  2757         
   MREASPAP  2758           AGEFPAP  2759-2760       AGEFPAP2  2761        
   ABNPAP3  2762            INTPAP  2763-2764        PELWPAP  2765         
   LASTPEL  2766            MREASPEL  2767           AGEFPEL  2768-2769    
   AGEPEL2  2770            INTPEL  2771-2772        EVHPVTST  2773        
   HPVWPAP  2774            LASTHPV  2775            MREASHPV  2776        
   AGEFHPV  2777-2778       AGEHPV2  2779            INTHPV  2780-2781     
   ASKSMOKE  2782           ASKPREG  2783            ASKFOLIC  2784        
   RWANT  2785              PROBWANT  2786           PWANT  2787           
   JINTEND  2788            JSUREINT  2789           JINTENDN  2790-2791   
   JEXPECTL  2792-2793      JEXPECTS  2794           JINTNEXT  2795        
   INTEND  2796             SUREINT  2797            INTENDN  2798-2799    
   EXPECTL  2800-2801       EXPECTS  2802-2803       INTNEXT  2804         
   HLPPRG  2805             HOWMANYR  2806           SEEKWHO1  2807        
   SEEKWHO2  2808           TYPALLPG1  2809          TYPALLPG2  2810       
   TYPALLPG3  2811          TYPALLPG4  2812          TYPALLPG5  2813       
   TYPALLPG6  2814          WHOTEST  2815            WHARTIN  2816         
   OTMEDHEP1  2817          OTMEDHEP2  2818          OTMEDHEP3  2819       
   OTMEDHEP4  2820          OTMEDHEP5  2821          INSCOVPG  2822        
   FSTHLPPG_M  2823-2824    FSTHLPPG_Y  2825-2828    CMPGVIS1  2829-2832   
   TRYLONG2  2833-2834      UNIT_TRYLONG  2835       HLPPGNOW  2836        
   RCNTPGH_M  2837-2838     RCNTPGH_Y  2839-2842     CMPGVISL  2843-2846   
   NUMVSTPG  2847-2848      PRGVISIT  2849-2850      HLPMC  2851           
   TYPALLMC1  2852          TYPALLMC2  2853          TYPALLMC3  2854       
   TYPALLMC4  2855          TYPALLMC5  2856          TYPALLMC6  2857       
   MISCNUM  2858            INFRTPRB1  2859          INFRTPRB2  2860       
   INFRTPRB3  2861          INFRTPRB4  2862          INFRTPRB5  2863       
   DUCHFREQ  2864           PID  2865                PIDSYMPT  2866        
   PIDTX  2867-2868         LSTPIDTX_M  2869-2870    LSTPIDTX_Y  2871-2874 
   CMPIDLST  2875-2878      DIABETES  2879           GESTDIAB  2880        
   UF  2881                 ENDO  2882               OVUPROB  2883         
   DEAF  2884               BLIND  2885              DIFDECIDE  2886       
   DIFWALK  2887            DIFDRESS  2888           DIFOUT  2889          
   EVRCANCER  2890          AGECANCER  2891-2892     CANCTYPE  2893-2894   
   PRECANCER  2895          MAMMOG  2896             AGEMAMM1  2897-2898   
   REASMAMM1  2899          CLINEXAM  2900           FAMHYST  2901         
   MOMRISK70  2902          MOMRISK40  2903          ALCORISK  2904        
   BFEEDRISK  2905          DONBLOOD  2906           HIVTEST  2907         
   NOHIVTST  2908-2909      WHENHIV_M  2910-2911     WHENHIV_Y  2912-2915  
   CMHIVTST  2916-2919      HIVTSTYR  2920           HIVRESULT  2921       
   WHYNOGET  2922-2923      PLCHIV  2924-2925        RHHIVT1  2926         
   RHHIVT21  2927-2928      HIVTST  2929-2930        WHOSUGG  2931         
   TALKDOCT  2932           AIDSTALK01  2933-2934    AIDSTALK02  2935-2936 
   AIDSTALK03  2937-2938    AIDSTALK04  2939-2940    AIDSTALK05  2941-2942 
   AIDSTALK06  2943-2944    AIDSTALK07  2945-2946    AIDSTALK08  2947-2948 
   AIDSTALK09  2949-2950    AIDSTALK10  2951-2952    AIDSTALK11  2953-2954 
   RETROVIR  2955           PREGHIV  2956            EVERVACC  2957        
   HPVSHOT1  2958-2959      HPVSEX1  2960            VACCPROB  2961        
   BLDPRESS  2962           HIGHBP  2963             BPMEDS  2964          
   USUALCAR  2965           USLPLACE  2966-2967      USL12MOS  2968        
   CURRCOV  2969            COVERHOW01  2970-2971    COVERHOW02  2972      
   COVERHOW03  2973         PARINSUR  2974           INS_EXCH  2975        
   INS_PREM  2976           COVER12  2977            NUMNOCOV  2978-2979   
   SAMEADD  2980            CNTRY10  2981            BRNOUT  2982          
   YRSTRUS  2983-2986       RELRAISD  2987-2988      ATTND14  2989         
   RELCURR  2990-2991       RELTRAD  2992            FUNDAM1  2993         
   FUNDAM2  2994            FUNDAM3  2995            FUNDAM4  2996         
   RELDLIFE  2997           ATTNDNOW  2998           MILSVC  2999          
   WRK12MOS  3000-3001      FPT12MOS  3002           DOLASTWK1  3003       
   DOLASTWK2  3004          DOLASTWK3  3005          DOLASTWK4  3006       
   DOLASTWK5  3007          RWRKST  3008             WORKP12  3009         
   RPAYJOB  3010            RNUMJOB  3011            RFTPTX  3012          
   REARNTY  3013            SPLSTWK1  3014           SPLSTWK2  3015        
   SPLSTWK3  3016           SPLSTWK4  3017           SPLSTWK5  3018        
   SPWRKST  3019            SPPAYJOB  3020           SPNUMJOB  3021        
   SPFTPTX  3022            SPEARNTY  3023           SAMESEX  3024         
   CHSUPPOR  3025           REACTSLF  3026           CHBOTHER  3027        
   ACASILANG  3028          GENHEALT  3029           INCHES  3030-3031     
   RWEIGHT  3032-3034       BMI  3035-3036           DRWEIGH  3037         
   TELLWGHT  3038           WGHTSCRN  3039           ENGSPEAK  3040        
   CASIBIRTH  3041-3042     CASILOSS  3043-3044      CASIABOR  3045-3046   
   CASIADOP  3047           NOBEDYR  3048            STAYREL  3049         
   EVSUSPEN  3050           GRADSUSP  3051-3052      SMK100  3053          
   AGESMK  3054-3055        SMOKE12  3056            SMKSTOP  3057         
   DRINK12  3058            UNIT30D  3059            DRINK30D  3060-3061   
   DRINKDAY  3062-3063      BINGE30  3064-3065       DRNKMOST  3066-3067   
   BINGE12  3068            POT12  3069              COC12  3070           
   CRACK12  3071            CRYSTMTH12  3072         INJECT12  3073        
   VAGSEX  3074             AGEVAGR  3075-3076       CONDVAG  3077         
   WHYCONDL  3078           GETORALM  3079           GIVORALM  3080        
   CONDFELL  3081           ANYORAL  3082            TIMING  3083          
   ANALSEX  3084            CONDANAL  3085           OPPSEXANY  3086       
   OPPSEXGEN  3087          CONDSEXL  3088           WANTSEX1  3089        
   VOLSEX1  3090            HOWOLD  3091-3092        GIVNDRUG  3093        
   HEBIGOLD  3094           ENDRELAT  3095           WORDPRES  3096        
   THRTPHYS  3097           PHYSHURT  3098           HELDDOWN  3099        
   EVRFORCD  3100           AGEFORC1  3101-3102      GIVNDRG2  3103        
   HEBIGOL2  3104           ENDRELA2  3105           WRDPRES2  3106        
   THRTPHY2  3107           PHYSHRT2  3108           HELDDWN2  3109        
   PARTSLIF_1  3110-3112    PARTSLFV  3113           PARTSLIF_2  3114-3116 
   OPPLIFENUM  3117-3119    PARTS12M_1  3120-3122    PARTS12V  3123        
   PARTS12M_2  3124-3126    OPPYEARNUM  3127-3129    NEWYEAR  3130-3132    
   NEWLIFE  3133-3135       VAGNUM12  3136-3138      ORALNUM12  3139-3141  
   ANALNUM12  3142-3144     BISEXPRT  3145           NONMONOG  3146        
   NNONMONOG1  3147         NNONMONOG2  3148         NNONMONOG3  3149      
   MALSHT12  3150           PROSTFRQ  3151           JOHNFREQ  3152        
   HIVMAL12  3153           GIVORALF  3154           GETORALF  3155        
   FEMSEX  3156             SAMESEXANY  3157         FEMPARTS_1  3158-3160 
   FEMLIFEV  3161           FEMPARTS_2  3162-3164    SAMLIFENUM  3165-3167 
   FEMPRT12_1  3168-3170    FEM12V  3171             FEMPRT12_2  3172-3174 
   SAMYEARNUM  3175-3177    SAMESEX1  3178-3179      FSAMEREL  3180-3181   
   MFLASTP  3182            ATTRACT  3183            ORIENT_A  3184        
   ORIENT_B  3185           CONFCONC  3186           TIMALON  3187         
   RISKCHEK1  3188          RISKCHEK2  3189          RISKCHEK3  3190       
   RISKCHEK4  3191          CHLAMTST  3192           STDOTHR12  3193       
   STDTRT12  3194           GON  3195                CHLAM  3196           
   HERPES  3197             GENWARTS  3198           SYPHILIS  3199        
   EVRINJECT  3200          EVRSHARE  3201           EARNTYPE  3202        
   EARN  3203-3204          EARNDK1  3205            EARNDK2  3206         
   EARNDK3  3207            EARNDK4  3208            TOINCWMY  3209        
   TOTINC  3210-3211        FMINCDK1  3212           FMINCDK2  3213        
   FMINCDK3  3214           FMINCDK4  3215           FMINCDK5  3216        
   PUBASST  3217            PUBASTYP1  3218          FOODSTMP  3219        
   WIC  3220                HLPTRANS  3221           HLPCHLDC  3222        
   HLPJOB  3223             FREEFOOD  3224           HUNGRY  3225          
   MED_COST  3226           AGER  3227-3228          FMARITAL  3229        
   RMARITAL  3230           EDUCAT  3231-3232        HIEDUC  3233-3234     
   HISPANIC  3235           RACE  3236               HISPRACE  3237        
   HISPRACE2  3238          NUMKDHH  3239            NUMFMHH  3240         
   HHFAMTYP  3241           HHPARTYP  3242           NCHILDHH  3243        
   HHKIDTYP  3244           CSPBBHH  3245            CSPBSHH  3246         
   CSPOKDHH  3247           INTCTFAM  3248           PARAGE14  3249        
   EDUCMOM  3250-3251       AGEMOMB1  3252-3253      AGER_I  3254          
   FMARITAL_I  3255         RMARITAL_I  3256         EDUCAT_I  3257        
   HIEDUC_I  3258           HISPANIC_I  3259         RACE_I  3260          
   HISPRACE_I  3261         HISPRACE2_I  3262        NUMKDHH_I  3263       
   NUMFMHH_I  3264          HHFAMTYP_I  3265         HHPARTYP_I  3266      
   NCHILDHH_I  3267         HHKIDTYP_I  3268         CSPBBHH_I  3269       
   CSPBSHH_I  3270          CSPOKDHH_I  3271         INTCTFAM_I  3272      
   PARAGE14_I  3273         EDUCMOM_I  3274          AGEMOMB1_I  3275      
   RCURPREG  3276           PREGNUM  3277-3278       COMPREG  3279-3280    
   LOSSNUM  3281-3282       ABORTION  3283           LBPREGS  3284-3285    
   PARITY  3286-3287        BIRTHS5  3288            BIRTH1  3289          
   OUTCOM01  3290           OUTCOM02  3291           OUTCOM03  3292        
   OUTCOM04  3293           OUTCOM05  3294           OUTCOM06  3295        
   OUTCOM07  3296           OUTCOM08  3297           OUTCOM09  3298        
   OUTCOM10  3299           OUTCOM11  3300           OUTCOM12  3301        
   OUTCOM13  3302           OUTCOM14  3303           OUTCOM15  3304        
   OUTCOM16  3305           OUTCOM17  3306           OUTCOM18  3307        
   OUTCOM19  3308           OUTCOM20  3309           DATEND01  3310-3313   
   DATEND02  3314-3317      DATEND03  3318-3321      DATEND04  3322-3325   
   DATEND05  3326-3329      DATEND06  3330-3333      DATEND07  3334-3337   
   DATEND08  3338-3341      DATEND09  3342-3345      DATEND10  3346-3349   
   DATEND11  3350-3353      DATEND12  3354-3357      DATEND13  3358-3361   
   DATEND14  3362-3365      DATEND15  3366-3369      DATEND16  3370-3373   
   DATEND17  3374-3377      DATEND18  3378-3381      DATEND19  3382-3385   
   DATEND20  3386-3389      AGEPRG01  3390-3391      AGEPRG02  3392-3393   
   AGEPRG03  3394-3395      AGEPRG04  3396-3397      AGEPRG05  3398-3399   
   AGEPRG06  3400-3401      AGEPRG07  3402-3403      AGEPRG08  3404-3405   
   AGEPRG09  3406-3407      AGEPRG10  3408-3409      AGEPRG11  3410-3411   
   AGEPRG12  3412-3413      AGEPRG13  3414-3415      AGEPRG14  3416-3417   
   AGEPRG15  3418-3419      AGEPRG16  3420-3421      AGEPRG17  3422-3423   
   AGEPRG18  3424-3425      AGEPRG19  3426-3427      AGEPRG20  3428-3429   
   DATCON01  3430-3433      DATCON02  3434-3437      DATCON03  3438-3441   
   DATCON04  3442-3445      DATCON05  3446-3449      DATCON06  3450-3453   
   DATCON07  3454-3457      DATCON08  3458-3461      DATCON09  3462-3465   
   DATCON10  3466-3469      DATCON11  3470-3473      DATCON12  3474-3477   
   DATCON13  3478-3481      DATCON14  3482-3485      DATCON15  3486-3489   
   DATCON16  3490-3493      DATCON17  3494-3497      DATCON18  3498-3501   
   DATCON19  3502-3505      DATCON20  3506-3509      AGECON01  3510-3511   
   AGECON02  3512-3513      AGECON03  3514-3515      AGECON04  3516-3517   
   AGECON05  3518-3519      AGECON06  3520-3521      AGECON07  3522-3523   
   AGECON08  3524-3525      AGECON09  3526-3527      AGECON10  3528-3529   
   AGECON11  3530-3531      AGECON12  3532-3533      AGECON13  3534-3535   
   AGECON14  3536-3537      AGECON15  3538-3539      AGECON16  3540-3541   
   AGECON17  3542-3543      AGECON18  3544-3545      AGECON19  3546-3547   
   AGECON20  3548-3549      MAROUT01  3550           MAROUT02  3551        
   MAROUT03  3552           MAROUT04  3553           MAROUT05  3554        
   MAROUT06  3555           MAROUT07  3556           MAROUT08  3557        
   MAROUT09  3558           MAROUT10  3559           MAROUT11  3560        
   MAROUT12  3561           MAROUT13  3562           MAROUT14  3563        
   MAROUT15  3564           MAROUT16  3565           MAROUT17  3566        
   MAROUT18  3567           MAROUT19  3568           MAROUT20  3569        
   RMAROUT01  3570          RMAROUT02  3571          RMAROUT03  3572       
   RMAROUT04  3573          RMAROUT05  3574          RMAROUT06  3575       
   RMAROUT07  3576          RMAROUT08  3577          RMAROUT09  3578       
   RMAROUT10  3579          RMAROUT11  3580          RMAROUT12  3581       
   RMAROUT13  3582          RMAROUT14  3583          RMAROUT15  3584       
   RMAROUT16  3585          RMAROUT17  3586          RMAROUT18  3587       
   RMAROUT19  3588          RMAROUT20  3589          MARCON01  3590        
   MARCON02  3591           MARCON03  3592           MARCON04  3593        
   MARCON05  3594           MARCON06  3595           MARCON07  3596        
   MARCON08  3597           MARCON09  3598           MARCON10  3599        
   MARCON11  3600           MARCON12  3601           MARCON13  3602        
   MARCON14  3603           MARCON15  3604           MARCON16  3605        
   MARCON17  3606           MARCON18  3607           MARCON19  3608        
   MARCON20  3609           RMARCON01  3610          RMARCON02  3611       
   RMARCON03  3612          RMARCON04  3613          RMARCON05  3614       
   RMARCON06  3615          RMARCON07  3616          RMARCON08  3617       
   RMARCON09  3618          RMARCON10  3619          RMARCON11  3620       
   RMARCON12  3621          RMARCON13  3622          RMARCON14  3623       
   RMARCON15  3624          RMARCON16  3625          RMARCON17  3626       
   RMARCON18  3627          RMARCON19  3628          RMARCON20  3629       
   CEBOW  3630-3631         CEBOWC  3632             DATBABY1  3633-3636   
   AGEBABY1  3637-3638      LASTPREG  3639           PREG_INT1  3640       
   PREG_INT2  3641          PREG_INT3  3642          PREG_INT4  3643       
   LIVCHILD01  3644         LIVCHILD02  3645         LIVCHILD03  3646      
   LIVCHILD04  3647         LIVCHILD05  3648         LIVCHILD06  3649      
   LIVCHILD07  3650         LIVCHILD08  3651         LIVCHILD09  3652      
   LIVCHILD10  3653         LIVCHILD11  3654         LIVCHILD12  3655      
   LIVCHILD13  3656         LIVCHILD14  3657         LIVCHILD15  3658      
   LIVCHILD16  3659         LIVCHILD17  3660         LIVCHILD18  3661      
   LIVCHILD19  3662         LIVCHILD20  3663         RCURPREG_I  3664      
   PREGNUM_I  3665          COMPREG_I  3666          LOSSNUM_I  3667       
   ABORTION_I  3668         LBPREGS_I  3669          PARITY_I  3670        
   BIRTHS5_I  3671          OUTCOM01_I  3672         OUTCOM02_I  3673      
   OUTCOM03_I  3674         OUTCOM04_I  3675         OUTCOM05_I  3676      
   OUTCOM06_I  3677         OUTCOM07_I  3678         OUTCOM08_I  3679      
   OUTCOM09_I  3680         OUTCOM10_I  3681         OUTCOM11_I  3682      
   OUTCOM12_I  3683         OUTCOM13_I  3684         OUTCOM14_I  3685      
   OUTCOM15_I  3686         OUTCOM16_I  3687         OUTCOM17_I  3688      
   OUTCOM18_I  3689         OUTCOM19_I  3690         OUTCOM20_I  3691      
   DATEND01_I  3692         DATEND02_I  3693         DATEND03_I  3694      
   DATEND04_I  3695         DATEND05_I  3696         DATEND06_I  3697      
   DATEND07_I  3698         DATEND08_I  3699         DATEND09_I  3700      
   DATEND10_I  3701         DATEND11_I  3702         DATEND12_I  3703      
   DATEND13_I  3704         DATEND14_I  3705         DATEND15_I  3706      
   DATEND16_I  3707         DATEND17_I  3708         DATEND18_I  3709      
   DATEND19_I  3710         DATEND20_I  3711         AGEPRG01_I  3712      
   AGEPRG02_I  3713         AGEPRG03_I  3714         AGEPRG04_I  3715      
   AGEPRG05_I  3716         AGEPRG06_I  3717         AGEPRG07_I  3718      
   AGEPRG08_I  3719         AGEPRG09_I  3720         AGEPRG10_I  3721      
   AGEPRG11_I  3722         AGEPRG12_I  3723         AGEPRG13_I  3724      
   AGEPRG14_I  3725         AGEPRG15_I  3726         AGEPRG16_I  3727      
   AGEPRG17_I  3728         AGEPRG18_I  3729         AGEPRG19_I  3730      
   AGEPRG20_I  3731         DATCON01_I  3732         DATCON02_I  3733      
   DATCON03_I  3734         DATCON04_I  3735         DATCON05_I  3736      
   DATCON06_I  3737         DATCON07_I  3738         DATCON08_I  3739      
   DATCON09_I  3740         DATCON10_I  3741         DATCON11_I  3742      
   DATCON12_I  3743         DATCON13_I  3744         DATCON14_I  3745      
   DATCON15_I  3746         DATCON16_I  3747         DATCON17_I  3748      
   DATCON18_I  3749         DATCON19_I  3750         DATCON20_I  3751      
   AGECON01_I  3752         AGECON02_I  3753         AGECON03_I  3754      
   AGECON04_I  3755         AGECON05_I  3756         AGECON06_I  3757      
   AGECON07_I  3758         AGECON08_I  3759         AGECON09_I  3760      
   AGECON10_I  3761         AGECON11_I  3762         AGECON12_I  3763      
   AGECON13_I  3764         AGECON14_I  3765         AGECON15_I  3766      
   AGECON16_I  3767         AGECON17_I  3768         AGECON18_I  3769      
   AGECON19_I  3770         AGECON20_I  3771         MAROUT01_I  3772      
   MAROUT02_I  3773         MAROUT03_I  3774         MAROUT04_I  3775      
   MAROUT05_I  3776         MAROUT06_I  3777         MAROUT07_I  3778      
   MAROUT08_I  3779         MAROUT09_I  3780         MAROUT10_I  3781      
   MAROUT11_I  3782         MAROUT12_I  3783         MAROUT13_I  3784      
   MAROUT14_I  3785         MAROUT15_I  3786         MAROUT16_I  3787      
   MAROUT17_I  3788         MAROUT18_I  3789         MAROUT19_I  3790      
   MAROUT20_I  3791         RMAROUT01_I  3792        RMAROUT02_I  3793     
   RMAROUT03_I  3794        RMAROUT04_I  3795        RMAROUT05_I  3796     
   RMAROUT06_I  3797        RMAROUT07_I  3798        RMAROUT08_I  3799     
   RMAROUT09_I  3800        RMAROUT10_I  3801        RMAROUT11_I  3802     
   RMAROUT12_I  3803        RMAROUT13_I  3804        RMAROUT14_I  3805     
   RMAROUT15_I  3806        RMAROUT16_I  3807        RMAROUT17_I  3808     
   RMAROUT18_I  3809        RMAROUT19_I  3810        RMAROUT20_I  3811     
   MARCON01_I  3812         MARCON02_I  3813         MARCON03_I  3814      
   MARCON04_I  3815         MARCON05_I  3816         MARCON06_I  3817      
   MARCON07_I  3818         MARCON08_I  3819         MARCON09_I  3820      
   MARCON10_I  3821         MARCON11_I  3822         MARCON12_I  3823      
   MARCON13_I  3824         MARCON14_I  3825         MARCON15_I  3826      
   MARCON16_I  3827         MARCON17_I  3828         MARCON18_I  3829      
   MARCON19_I  3830         MARCON20_I  3831         RMARCON01_I  3832     
   RMARCON02_I  3833        RMARCON03_I  3834        RMARCON04_I  3835     
   RMARCON05_I  3836        RMARCON06_I  3837        RMARCON07_I  3838     
   RMARCON08_I  3839        RMARCON09_I  3840        RMARCON10_I  3841     
   RMARCON11_I  3842        RMARCON12_I  3843        RMARCON13_I  3844     
   RMARCON14_I  3845        RMARCON15_I  3846        RMARCON16_I  3847     
   RMARCON17_I  3848        RMARCON18_I  3849        RMARCON19_I  3850     
   RMARCON20_I  3851        CEBOW_I  3852            CEBOWC_I  3853        
   DATBABY1_I  3854         AGEBABY1_I  3855         LIVCHILD01_I  3856    
   LIVCHILD02_I  3857       LIVCHILD03_I  3858       LIVCHILD04_I  3859    
   LIVCHILD05_I  3860       LIVCHILD06_I  3861       LIVCHILD07_I  3862    
   LIVCHILD08_I  3863       LIVCHILD09_I  3864       LIVCHILD10_I  3865    
   LIVCHILD11_I  3866       LIVCHILD12_I  3867       LIVCHILD13_I  3868    
   LIVCHILD14_I  3869       LIVCHILD15_I  3870       LIVCHILD16_I  3871    
   LIVCHILD17_I  3872       LIVCHILD18_I  3873       LIVCHILD19_I  3874    
   LIVCHILD20_I  3875       FMARNO  3876             CSPBIOKD  3877        
   MARDAT01  3878-3881      MARDAT02  3882-3885      MARDAT03  3886-3889   
   MARDAT04  3890-3893      MARDAT05  3894-3897      MARDAT06  3898-3901   
   MARDIS01  3902-3905      MARDIS02  3906-3909      MARDIS03  3910-3913   
   MARDIS04  3914-3917      MARDIS05  3918-3921      MARDIS06  3922-3925   
   MAREND01  3926           MAREND02  3927           MAREND03  3928        
   MAREND04  3929           MAREND05  3930           MAREND06  3931        
   FMAR1AGE  3932-3933      AGEDISS1  3934-3935      AGEDD1  3936-3937     
   MAR1DISS  3938           DD1REMAR  3939           MAR1BIR1  3940-3942   
   MAR1CON1  3943-3945      CON1MAR1  3946-3948      B1PREMAR  3949        
   COHEVER  3950            EVMARCOH  3951           PMARRNO  3952-3953    
   NONMARR  3954-3955       TIMESCOH  3956-3957      COHAB1  3958-3961     
   COHSTAT  3962            COHOUT  3963             COH1DUR  3964         
   HADSEX  3965             SEXONCE  3966            SEXEVER  3967         
   VRY1STAG  3968-3969      SEX1AGE  3970-3971       VRY1STSX  3972-3975   
   DATESEX1  3976-3979      SEXMAR  3980             SEX1FOR  3981         
   SEXUNION  3982           SEXOUT  3983             FPDUR  3984-3986      
   PARTS1YR  3987           LSEXDATE  3988-3991      LSEXPREG  3992        
   SEX3MO  3993             NUMP3MOS  3994           LSEXRAGE  3995-3996   
   PARTDUR1  3997-3999      PARTDUR2  4000-4002      PARTDUR3  4003-4005   
   RELATP1  4006            RELATP2  4007            RELATP3  4008         
   LIFPRTNR  4009-4010      FMARNO_I  4011           CSPBIOKD_I  4012      
   MARDAT01_I  4013         MARDAT02_I  4014         MARDAT03_I  4015      
   MARDAT04_I  4016         MARDAT05_I  4017         MARDAT06_I  4018      
   MARDIS01_I  4019         MARDIS02_I  4020         MARDIS03_I  4021      
   MARDIS04_I  4022         MARDIS05_I  4023         MARDIS06_I  4024      
   MAREND01_I  4025         MAREND02_I  4026         MAREND03_I  4027      
   MAREND04_I  4028         MAREND05_I  4029         MAREND06_I  4030      
   FMAR1AGE_I  4031         AGEDISS1_I  4032         AGEDD1_I  4033        
   MAR1DISS_I  4034         DD1REMAR_I  4035         MAR1BIR1_I  4036      
   MAR1CON1_I  4037         CON1MAR1_I  4038         B1PREMAR_I  4039      
   COHEVER_I  4040          EVMARCOH_I  4041         PMARRNO_I  4042       
   NONMARR_I  4043          TIMESCOH_I  4044         COHAB1_I  4045        
   COHSTAT_I  4046          COHOUT_I  4047           COH1DUR_I  4048       
   HADSEX_I  4049           SEXEVER_I  4050          VRY1STAG_I  4051      
   SEX1AGE_I  4052          VRY1STSX_I  4053         DATESEX1_I  4054      
   SEXONCE_I  4055          SEXMAR_I  4056           SEX1FOR_I  4057       
   SEXUNION_I  4058         SEXOUT_I  4059           FPDUR_I  4060         
   PARTS1YR_I  4061         LSEXDATE_I  4062         SEXP3MO_I  4063       
   NUMP3MOS_I  4064         LSEXRAGE_I  4065         PARTDUR1_I  4066      
   PARTDUR2_I  4067         PARTDUR3_I  4068         RELATP1_I  4069       
   RELATP2_I  4070          RELATP3_I  4071          LIFPRTNR_I  4072      
   STRLOPER  4073           FECUND  4074             ANYBC36  4075         
   NOSEX36  4076            INFERT  4077             ANYBC12  4078         
   ANYMTHD  4079            NOSEX12  4080-4081       SEXP3MO  4082         
   CONSTAT1  4083-4084      CONSTAT2  4085-4086      CONSTAT3  4087-4088   
   CONSTAT4  4089-4090      PILLR  4091              CONDOMR  4092         
   SEX1MTHD1  4093-4094     SEX1MTHD2  4095-4096     SEX1MTHD3  4097-4098  
   SEX1MTHD4  4099-4100     MTHUSE12  4101-4102      METH12M1  4103-4104   
   METH12M2  4105-4106      METH12M3  4107-4108      METH12M4  4109-4110   
   MTHUSE3  4111-4112       METH3M1  4113-4114       METH3M2  4115-4116    
   METH3M3  4117-4118       METH3M4  4119            FMETHOD1  4120-4121   
   FMETHOD2  4122-4123      FMETHOD3  4124-4125      FMETHOD4  4126-4127   
   DATEUSE1  4128-4132      OLDWP01  4133            OLDWP02  4134         
   OLDWP03  4135            OLDWP04  4136            OLDWP05  4137         
   OLDWP06  4138            OLDWP07  4139            OLDWP08  4140         
   OLDWP09  4141            OLDWP10  4142            OLDWP11  4143         
   OLDWP12  4144            OLDWP13  4145            OLDWP14  4146         
   OLDWP15  4147            OLDWP16  4148            OLDWP17  4149         
   OLDWP18  4150            OLDWP19  4151            OLDWP20  4152         
   OLDWR01  4153            OLDWR02  4154            OLDWR03  4155         
   OLDWR04  4156            OLDWR05  4157            OLDWR06  4158         
   OLDWR07  4159            OLDWR08  4160            OLDWR09  4161         
   OLDWR10  4162            OLDWR11  4163            OLDWR12  4164         
   OLDWR13  4165            OLDWR14  4166            OLDWR15  4167         
   OLDWR16  4168            OLDWR17  4169            OLDWR18  4170         
   OLDWR19  4171            OLDWR20  4172            WANTRP01  4173        
   WANTRP02  4174           WANTRP03  4175           WANTRP04  4176        
   WANTRP05  4177           WANTRP06  4178           WANTRP07  4179        
   WANTRP08  4180           WANTRP09  4181           WANTRP10  4182        
   WANTRP11  4183           WANTRP12  4184           WANTRP13  4185        
   WANTRP14  4186           WANTRP15  4187           WANTRP16  4188        
   WANTRP17  4189           WANTRP18  4190           WANTRP19  4191        
   WANTRP20  4192           WANTP01  4193            WANTP02  4194         
   WANTP03  4195            WANTP04  4196            WANTP05  4197         
   WANTP06  4198            WANTP07  4199            WANTP08  4200         
   WANTP09  4201            WANTP10  4202            WANTP11  4203         
   WANTP12  4204            WANTP13  4205            WANTP14  4206         
   WANTP15  4207            WANTP16  4208            WANTP17  4209         
   WANTP18  4210            WANTP19  4211            WANTP20  4212         
   NWWANTRP01  4213         NWWANTRP02  4214         NWWANTRP03  4215      
   NWWANTRP04  4216         NWWANTRP05  4217         NWWANTRP06  4218      
   NWWANTRP07  4219         NWWANTRP08  4220         NWWANTRP09  4221      
   NWWANTRP10  4222         NWWANTRP11  4223         NWWANTRP12  4224      
   NWWANTRP13  4225         NWWANTRP14  4226         NWWANTRP15  4227      
   NWWANTRP16  4228         NWWANTRP17  4229         NWWANTRP18  4230      
   NWWANTRP19  4231         NWWANTRP20  4232         WANTP5  4233          
   STRLOPER_I  4234         FECUND_I  4235           INFERT_I  4236        
   ANYMTHD_I  4237          NOSEX12_I  4238          SEX3MO_I  4239        
   CONSTAT1_I  4240         CONSTAT2_I  4241         CONSTAT3_I  4242      
   CONSTAT4_I  4243         PILLR_I  4244            CONDOMR_I  4245       
   SEX1MTHD1_I  4246        SEX1MTHD2_I  4247        SEX1MTHD3_I  4248     
   SEX1MTHD4_I  4249        MTHUSE12_I  4250         METH12M1_I  4251      
   METH12M2_I  4252         METH12M3_I  4253         METH12M4_I  4254      
   MTHUSE3_I  4255          METH3M1_I  4256          METH3M2_I  4257       
   METH3M3_I  4258          METH3M4_I  4259          FMETHOD1_I  4260      
   FMETHOD2_I  4261         FMETHOD3_I  4262         FMETHOD4_I  4263      
   DATEUSE1_I  4264         OLDWP01_I  4265          OLDWP02_I  4266       
   OLDWP03_I  4267          OLDWP04_I  4268          OLDWP05_I  4269       
   OLDWP06_I  4270          OLDWP07_I  4271          OLDWP08_I  4272       
   OLDWP09_I  4273          OLDWP10_I  4274          OLDWP11_I  4275       
   OLDWP12_I  4276          OLDWP13_I  4277          OLDWP14_I  4278       
   OLDWP15_I  4279          OLDWP16_I  4280          OLDWP17_I  4281       
   OLDWP18_I  4282          OLDWP19_I  4283          OLDWP20_I  4284       
   OLDWR01_I  4285          OLDWR02_I  4286          OLDWR03_I  4287       
   OLDWR04_I  4288          OLDWR05_I  4289          OLDWR06_I  4290       
   OLDWR07_I  4291          OLDWR08_I  4292          OLDWR09_I  4293       
   OLDWR10_I  4294          OLDWR11_I  4295          OLDWR12_I  4296       
   OLDWR13_I  4297          OLDWR14_I  4298          OLDWR15_I  4299       
   OLDWR16_I  4300          OLDWR17_I  4301          OLDWR18_I  4302       
   OLDWR19_I  4303          OLDWR20_I  4304          WANTRP01_I  4305      
   WANTRP02_I  4306         WANTRP03_I  4307         WANTRP04_I  4308      
   WANTRP05_I  4309         WANTRP06_I  4310         WANTRP07_I  4311      
   WANTRP08_I  4312         WANTRP09_I  4313         WANTRP10_I  4314      
   WANTRP11_I  4315         WANTRP12_I  4316         WANTRP13_I  4317      
   WANTRP14_I  4318         WANTRP15_I  4319         WANTRP16_I  4320      
   WANTRP17_I  4321         WANTRP18_I  4322         WANTRP19_I  4323      
   WANTRP20_I  4324         WANTP01_I  4325          WANTP02_I  4326       
   WANTP03_I  4327          WANTP04_I  4328          WANTP05_I  4329       
   WANTP06_I  4330          WANTP07_I  4331          WANTP08_I  4332       
   WANTP09_I  4333          WANTP10_I  4334          WANTP11_I  4335       
   WANTP12_I  4336          WANTP13_I  4337          WANTP14_I  4338       
   WANTP15_I  4339          WANTP16_I  4340          WANTP17_I  4341       
   WANTP18_I  4342          WANTP19_I  4343          WANTP20_I  4344       
   NWWANTRP01_I  4345       NWWANTRP02_I  4346       NWWANTRP03_I  4347    
   NWWANTRP04_I  4348       NWWANTRP05_I  4349       NWWANTRP06_I  4350    
   NWWANTRP07_I  4351       NWWANTRP08_I  4352       NWWANTRP09_I  4353    
   NWWANTRP10_I  4354       NWWANTRP11_I  4355       NWWANTRP12_I  4356    
   NWWANTRP13_I  4357       NWWANTRP14_I  4358       NWWANTRP15_I  4359    
   NWWANTRP16_I  4360       NWWANTRP17_I  4361       NWWANTRP18_I  4362    
   NWWANTRP19_I  4363       NWWANTRP20_I  4364       WANTP5_I  4365        
   FPTIT12  4366            FPTITMED  4367           FPTITSTE  4368-4369   
   FPTITBC  4370-4371       FPTITCHK  4372-4373      FPTITCBC  4374-4375   
   FPTITCST  4376-4377      FPTITEC  4378-4379       FPTITCEC  4380-4381   
   FPTITPRE  4382-4383      FPTITABO  4384-4385      FPTITPAP  4386-4387   
   FPTITPEL  4388-4389      FPTITPRN  4390-4391      FPTITPPR  4392-4393   
   FPTITSTD  4394-4395      FPREGFP  4396            FPREGMED  4397        
   FPTIT12_I  4398          FPTITMED_I  4399         FPTITSTE_I  4400      
   FPTITBC_I  4401          FPTITCHK_I  4402         FPTITCBC_I  4403      
   FPTITCST_I  4404         FPTITEC_I  4405          FPTITCEC_I  4406      
   FPTITPRE_I  4407         FPTITABO_I  4408         FPTITPAP_I  4409      
   FPTITPEL_I  4410         FPTITPRN_I  4411         FPTITPPR_I  4412      
   FPTITSTD_I  4413         FPREGFP_I  4414          FPREGMED_I  4415      
   INTENT  4416             ADDEXP  4417-4419        INTENT_I  4420        
   ADDEXP_I  4421           ANYPRGHP  4422           ANYMSCHP  4423        
   INFEVER  4424            OVULATE  4425            TUBES  4426           
   INFERTR  4427            INFERTH  4428            ADVICE  4429          
   INSEM  4430              INVITRO  4431            ENDOMET  4432         
   FIBROIDS  4433           PIDTREAT  4434           EVHIVTST  4435        
   FPTITHIV  4436-4437      ANYPRGHP_I  4438         ANYMSCHP_I  4439      
   INFEVER_I  4440          OVULATE_I  4441          TUBES_I  4442         
   INFERTR_I  4443          INFERTH_I  4444          ADVICE_I  4445        
   INSEM_I  4446            INVITRO_I  4447          ENDOMET_I  4448       
   FIBROIDS_I  4449         PIDTREAT_I  4450         EVHIVTST_I  4451      
   FPTITHIV_I  4452         CURR_INS  4453           METRO  4454           
   RELIGION  4455           LABORFOR  4456           CURR_INS_I  4457      
   METRO_I  4458            RELIGION_I  4459         LABORFOR_I  4460      
   POVERTY  4461-4463       TOTINCR  4464-4465       PUBASSIS  4466        
   POVERTY_I  4467          TOTINCR_I  4468          PUBASSIS_I  4469      
   WGT2015_2017  4470-4485   SECU  4486               SEST  4487-4489       
   CMINTVW  4490-4493       CMLSTYR  4494-4497       CMJAN3YR  4498-4501   
   CMJAN4YR  4502-4505      CMJAN5YR  4506-4509      QUARTER $ 4510-4511   
   PHASE $ 4512             INTVWYEAR $ 4513-4516    INTVLNGTH  4517-4522  
 ;                       


* SAS LABEL STATEMENT;

LABEL
   CASEID = "Respondent ID number"
   RSCRNINF = "Whether R was also the screener informant"
   RSCRAGE = "R's age as reported in screener"
   RSCRHISP = "R's Hispanic origin as reported in screener"
   RSCRRACE = "R's race as reported in screener"
   AGE_A = "AA-1 R's age at interview"
   AGE_R = "R's age at interview"
   AGESCRN = "R's age at screener"
   HISP = "AC-1 R is of Hispanic/Latina origin"
   HISPGRP = "AC-2 Hispanic/Latina origin -- group"
   PRIMLANG1 = "AC-6 Language spoken in home - 1st mention"
   PRIMLANG2 = "AC-6 Language spoken in home - 2nd mention"
   PRIMLANG3 = "AC-6 Language spoken in home - 3rd mention"
   ROSCNT = "Number of HH members based on HH roster"
   NUMCHILD = "Number of children in HH < 13 yrs with RELAR = codes 3 to 8"
   HHKIDS18 = "Number of children in HH < 19 yrs with RELAR = codes 3 to 10"
   DAUGHT918 = "Number of daughters in HH 9-18 yrs with RELAR = 3 or 5"
   SON918 = "Number of sons in HH 9-18 yrs with RELAR = 3 or 5"
   NONBIOKIDS = "Number of children in HH < 19 yrs with RELAR = codes 4 to 10"
   MARSTAT = "AD-7b R's marital status"
   FMARSTAT = "AD-7c R's formal marital status"
   FMARIT = "Formal marital status at time of interview"
   EVRMARRY = "Whether R was ever married"
   HPLOCALE = "AD-8 Where H/P currently lives, if not on HH roster"
   MANREL = "Man in HH is R's husband or cohabiting partner"
   GOSCHOL = "AF-1 R currently enrolled in regular school"
   VACA = "AF-2 R on vacation from school"
   HIGRADE = "AF-3 R's current grade in school or highest grade/year attended"
   COMPGRD = "AF-4 R completed current grade or highest grade/year attended"
   DIPGED = "AF-6 Which - high school diploma, GED, or both - does R have?"
   EARNHS_Y = "AF-7 Year high school diploma obtained"
   HISCHGRD = "AF-8 R not in sch, no dipl-last grade of elem/jr/hi sch attended"
   LSTGRADE = "Highest grade of elem/junior/high school R attended"
   MYSCHOL_Y = "AF-9 Year R last attended elem/jr/hi sch-R not in sch/no dipl"
   HAVEDEG = "AF-10 R has college or university degree"
   DEGREES = "AF-11 R's highest college or university degree received"
   EARNBA_Y = "AF-12 Year R received her Bachelor's degree"
   EXPSCHL = "AF-13 Expect to go back to school"
   EXPGRADE = "AF-14 Highest grade/degree expect to complete"
   WTHPARNW = "R is living with parents or parent figures - based on HH roster"
   ONOWN = "AG-0a Did R ever live away from parents/guardians before age 18"
   ONOWN18 = "Whether R lived on own before age 18"
   INTACT = "AG-1 R always lived with both biological/adoptive parents"
   PARMARR = "AG-2 R's biological parents married at R's birth"
   INTACT18 = "Whether R lived in intact family from birth to age 18"
   LVSIT14F = "AG-3 Female parent/parent-figure at age 14 - fam not intact thru 18"
   LVSIT14M = "AG-4 Male parent/parent-figure at age 14 - fam not intact thru 18"
   WOMRASDU = "AG-5 Woman who raised R during teens - fam not intact thru 18"
   MOMDEGRE = "AG-6 Highest level of education female parent (figure) completed"
   MOMWORKD = "AG-7 Female parent (figure) worked full/parttime when R was 5-15"
   MOMFSTCH = "AG-9 Age of female parent (figure) at her first birth"
   MOM18 = "AG-10 Estimated age of female parent (figure) at her first birth"
   MANRASDU = "AG-11 Man who raised R during teens - fam not intact thru 18"
   R_FOSTER = "Whether R is living/has lived with a foster parent (FC A-32a)"
   EVRFSTER = "AG-13 R ever lived in a foster home"
   MNYFSTER = "AG-14 Number of foster homes R lived in"
   DURFSTER = "AG-15 Total time spent in foster care"
   MENARCHE = "BA-1 Age at first menstrual period"
   PREGNOWQ = "BA-2 Whether R is currently pregnant"
   MAYBPREG = "BA-3 Whether R is probably pregnant now"
   NUMPREGS = "BB-1 Number of pregnancies in lifetime (including current)"
   EVERPREG = "Whether R has ever been pregnant"
   CURRPREG = "Whether R is currently pregnant"
   HOWPREG_N = "BB-2 Number of Weeks or Months Currently Pregnant"
   HOWPREG_P = "BB-2 Current pregnancy length reported in months or weeks"
   NOWPRGDK = "BB-3 Which Trimester -- Current Pregnancy"
   MOSCURRP = "Number of Months Currently Pregnant"
   NPREGS_S = "Total number of pregnancies (based on CCSD)"
   HASBABES = "Whether R has had any live births"
   NUMBABES = "Total number of liveborn babies (before CCSD)"
   NBABES_S = "Total number of liveborn babies (based on CCSD)"
   CMLASTLB = "Year of R's most recent live birth"
   CMLSTPRG = "Year of R's most recent completed pregnancy"
   CMFSTPRG = "Year of R's 1st completed pregnancy"
   CMPG1BEG = "Year when R's 1st pregnancy began"
   NPLACED = "# of R's bio children R placed for adoption (based on BPA)"
   NDIED = "# of R's bio children that died shortly after birth (BDS)"
   NADOPTV = "# of R's bio children living with adoptive families (based on BG-5 WHERENOW)"
   TOTPLACD = "# of R's bio children she (or someone) placed for adoption"
   OTHERKID = "BJ-1 Have any nonbiological children lived with R"
   NOTHRKID = "BJ-2 Number of nonbiological children who lived with R"
   SEXOTHKD = "BJ-4 Sex of nonbiological child who lived w/R - 1st child"
   RELOTHKD = "BJ-5 Relationship of nonbiological child to R - 1st child"
   ADPTOTKD = "BJ-6 R legally adopted nonbiological child - 1st child"
   TRYADOPT = "BJ-7a R trying to adopt nonbiological child - 1st child"
   TRYEITHR = "BJ-7b R trying to adopt/become guardian of nonbio child-1st child"
   STILHERE = "BJ-8 Nonbiological child still living with R - 1st child"
   DATKDCAM_Y = "BJ-9 Year nonbiological child began living with R - 1st child"
   OTHKDFOS = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 1st child"
   OKDDOB_Y = "BJ-11 Year of nonbiological child's birth - 1st child"
   OKBORNUS = "BJ-15 Nonbiological child born outside the U.S. - 1st child"
   OKDISABL1 = "BJ-16 Nonbio child has phys/ment disability - 1st child, 1st mention"
   OKDISABL2 = "BJ-16 Nonbio child has phys/ment disability - 1st child, 2nd mention"
   SEXOTHKD2 = "BJ-4 Sex of nonbiological child who lived w/R - 2nd child"
   RELOTHKD2 = "BJ-5 Relationship of nonbiological child to R - 2nd child"
   ADPTOTKD2 = "BJ-6 R legally adopted nonbiological child - 2nd child"
   TRYADOPT2 = "BJ-7a R trying to adopt nonbiological child - 2nd child"
   TRYEITHR2 = "BJ-7b R trying to adopt/become guardian of nonbio child - 2nd child"
   STILHERE2 = "BJ-8 Nonbiological child still living with R - 2nd child"
   DATKDCAM_Y2 = "BJ-9 Year nonbiological child began living with R - 2nd child"
   OTHKDFOS2 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 2nd child"
   OKDDOB_Y2 = "BJ-11 Year of nonbiological child's birth - 2nd child"
   OKBORNUS2 = "BJ-15 Nonbiological child born outside the U.S. - 2nd child"
   OKDISABL5 = "BJ-16 Nonbio child has phys/ment disability - 2nd child, 1st mention"
   OKDISABL6 = "BJ-16 Nonbio child has phys/ment disability - 2nd child, 2nd mention"
   SEXOTHKD3 = "BJ-4 Sex of nonbiological child who lived w/R - 3rd child"
   RELOTHKD3 = "BJ-5 Relationship of nonbiological child to R - 3rd child"
   ADPTOTKD3 = "BJ-6 R legally adopted nonbiological child - 3rd child"
   TRYADOPT3 = "BJ-7a R trying to adopt nonbiological child - 3rd child"
   TRYEITHR3 = "BJ-7b R trying to adopt/become guardian of nonbio child - 3rd child"
   STILHERE3 = "BJ-8 Nonbiological child still living with R - 3rd child"
   DATKDCAM_Y3 = "BJ-9 Year nonbiological child began living with R - 3rd child"
   OTHKDFOS3 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 3rd child"
   OKDDOB_Y3 = "BJ-11 Year of nonbiological child's birth - 3rd child"
   OKBORNUS3 = "BJ-15 Nonbiological child born outside the U.S. - 3rd child"
   OKDISABL9 = "BJ-16 Nonbio child has phys/ment disability - 3rd child, 1st mention"
   OKDISABL10 = "BJ-16 Nonbio child has phys/ment disability - 3rd child, 2nd mention"
   SEXOTHKD4 = "BJ-4 Sex of nonbiological child who lived w/R - 4th child"
   RELOTHKD4 = "BJ-5 Relationship of nonbiological child to R - 4th child"
   ADPTOTKD4 = "BJ-6 R legally adopted nonbiological child - 4th child"
   TRYADOPT4 = "BJ-7a R trying to adopt nonbiological child - 4th child"
   TRYEITHR4 = "BJ-7b R trying to adopt/become guardian of nonbio child - 4th child"
   STILHERE4 = "BJ-8 Nonbiological child still living with R - 4th child"
   DATKDCAM_Y4 = "BJ-9 Year nonbiological child began living with R - 4th child"
   OTHKDFOS4 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 4th child"
   OKDDOB_Y4 = "BJ-11 Year of nonbiological child's birth - 4th child"
   OKBORNUS4 = "BJ-15 Nonbiological child born outside the U.S. - 4th child"
   OKDISABL13 = "BJ-16 Nonbio child has phys/ment disability - 4th child, 1st mention"
   OKDISABL14 = "BJ-16 Nonbio child has phys/ment disability - 4th child, 2nd mention"
   SEXOTHKD5 = "BJ-4 Sex of nonbiological child who lived w/R - 5th child"
   RELOTHKD5 = "BJ- 5 Relationship of nonbiological child to R - 5th child"
   ADPTOTKD5 = "BJ-6 R legally adopted nonbiological child - 5th child"
   TRYADOPT5 = "BJ-7a R trying to adopt nonbiological child - 5th child"
   TRYEITHR5 = "BJ-7b R trying to adopt/become guardian of nonbio child - 5th child"
   STILHERE5 = "BJ-8 Nonbiological child still living with R - 5th child"
   DATKDCAM_Y5 = "BJ-9 Year nonbiological child began living with R - 5th child"
   OTHKDFOS5 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 5th child"
   OKDDOB_Y5 = "BJ-11 Year of nonbiological child's birth - 5th child"
   OKBORNUS5 = "BJ-15 Nonbiological child born outside the U.S. - 5th child"
   OKDISABL17 = "BJ-16 Nonbio child has phys/ment disability - 5th child, 1st mention"
   OKDISABL18 = "BJ-16 Nonbio child has phys/ment disability - 5th child, 2nd mention"
   SEXOTHKD6 = "BJ-4 Sex of nonbiological child who lived w/R - 6th child"
   RELOTHKD6 = "BJ-5 Relationship of nonbiological child to R - 6th child"
   ADPTOTKD6 = "BJ-6 R legally adopted nonbiological child - 6th child"
   TRYADOPT6 = "BJ-7a R trying to adopt nonbiological child - 6th child"
   TRYEITHR6 = "BJ-7b R trying to adopt/become guardian of nonbio child - 6th child"
   STILHERE6 = "BJ-8 Nonbiological child still living with R - 6th child"
   DATKDCAM_Y6 = "BJ-9 Year nonbiological child began living with R - 6th child"
   OTHKDFOS6 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 6th child"
   OKDDOB_Y6 = "BJ-11 Year of nonbiological child's birth - 6th child"
   OKBORNUS6 = "BJ-15 Nonbiological child born outside the U.S. - 6th child"
   OKDISABL21 = "BJ-16 Nonbio child has phys/ment disability - 6th child, 1st mention"
   OKDISABL22 = "BJ-16 Nonbio child has phys/ment disability - 6th child, 2nd mention"
   SEXOTHKD7 = "BJ-4 Sex of nonbiological child who lived w/R - 7th child"
   RELOTHKD7 = "BJ-5 Relationship of nonbiological child to R - 7th child"
   ADPTOTKD7 = "BJ-6 R legally adopted nonbiological child - 7th child"
   TRYADOPT7 = "BJ-7a R trying to adopt nonbiological child - 7th child"
   TRYEITHR7 = "BJ-7b R trying to adopt/become guardian of nonbio child -7th child"
   STILHERE7 = "BJ-8 Nonbiological child still living with R - 7th child"
   DATKDCAM_Y7 = "BJ-9 Year nonbiological child began living with R - 7th child"
   OTHKDFOS7 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs -7th child"
   OKDDOB_Y7 = "BJ-11 Year of nonbiological child's birth - 7th child"
   OKBORNUS7 = "BJ-15 Nonbiological child born outside the U.S. - 7th child"
   OKDISABL25 = "BJ-16 Nonbio child has phys/ment disability - 7th child, 1st mention"
   OKDISABL26 = "BJ-16 Nonbio child has phys/ment disability - 7th child, 2nd mention"
   SEXOTHKD8 = "BJ-4 Sex of nonbiological child who lived w/R - 8th child"
   RELOTHKD8 = "BJ-5 Relationship of nonbiological child to R - 8th child"
   ADPTOTKD8 = "BJ-6 R legally adopted nonbiological child - 8th child"
   TRYADOPT8 = "BJ-7a R trying to adopt nonbiological child - 8th child"
   TRYEITHR8 = "BJ-7b R trying to adopt/become guardian of nonbio child - 8th child"
   STILHERE8 = "BJ-8 Nonbiological child still living with R - 8th child"
   DATKDCAM_Y8 = "BJ-9 Year nonbiological child began living with R - 8th child"
   OTHKDFOS8 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 8th child"
   OKDDOB_Y8 = "BJ-11 Year of nonbiological child's birth - 8th child"
   OKBORNUS8 = "BJ-15 Nonbiological child born outside the U.S. - 8th child"
   OKDISABL29 = "BJ-16 Nonbio child has phys/ment disability - 8th child, 1st mention"
   OKDISABL30 = "BJ-16 Nonbio child has phys/ment disability - 8th child, 2nd mention"
   SEXOTHKD9 = "BJ-4 Sex of nonbiological child who lived w/R - 9th child"
   RELOTHKD9 = "BJ-5 Relationship of nonbiological child to R - 9th child"
   ADPTOTKD9 = "BJ-6 R legally adopted nonbiological child - 9th child"
   TRYADOPT9 = "BJ-7a R trying to adopt nonbiological child - 9th child"
   TRYEITHR9 = "BJ-7b R trying to adopt/become guardian of nonbio child 9th child"
   STILHERE9 = "BJ-8 Nonbiological child still living with R - 9th child"
   DATKDCAM_Y9 = "BJ-9 Year nonbiological child began living with R - 9th child"
   OTHKDFOS9 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 9th child"
   OKDDOB_Y9 = "BJ-11 Year of nonbiological child's birth - 9th child"
   OKBORNUS9 = "BJ-15 Nonbiological child born outside the U.S. - 9th child"
   OKDISABL33 = "BJ-16 Nonbio child has phys/ment disability - 9th child, 1st mention"
   OKDISABL34 = "BJ-16 Nonbio child has phys/ment disability - 9th child, 2nd mention"
   SEXOTHKD10 = "BJ-4 Sex of nonbiological child who lived w/R - 10th child"
   RELOTHKD10 = "BJ-5 Relationship of nonbiological child to R - 10th child"
   ADPTOTKD10 = "BJ-6 R legally adopted nonbiological child - 10th child"
   TRYADOPT10 = "BJ-7a R trying to adopt nonbiological child - 10th child"
   TRYEITHR10 = "BJ-7b R trying to adopt/become guardian of nonbio child - 10th child"
   STILHERE10 = "BJ-8 Nonbiological child still living with R - 10th child"
   DATKDCAM_Y10 = "BJ-9 Year nonbiological child began living with R - 10th child"
   OTHKDFOS10 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 10th child"
   OKDDOB_Y10 = "BJ-11 Year of nonbiological child's birth - 10th child"
   OKBORNUS10 = "BJ-15 Nonbiological child born outside the U.S. - 10th child"
   OKDISABL37 = "BJ-16 Nonbio child has phys/ment disability - 10th child, 1st mention"
   OKDISABL38 = "BJ-16 Nonbio child has phys/ment disability - 10th child, 2nd mention"
   SEXOTHKD11 = "BJ-4 Sex of nonbiological child who lived w/R - 11th child"
   RELOTHKD11 = "BJ-5 Relationship of nonbiological child to R - 11th child"
   ADPTOTKD11 = "BJ-6 R legally adopted nonbiological child - 11th child"
   TRYADOPT11 = "BJ-7a R trying to adopt nonbiological child - 11th child"
   TRYEITHR11 = "BJ-7b R trying to adopt/become guardian of nonbio child - 11th child"
   STILHERE11 = "BJ-8 Nonbiological child still living with R - 11th child"
   DATKDCAM_Y11 = "BJ-9 Year nonbiological child began living with R - 11th child"
   OTHKDFOS11 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 11th child"
   OKDDOB_Y11 = "BJ-11 Year of nonbiological child's birth - 11th child"
   OKBORNUS11 = "BJ-15 Nonbiological child born outside the U.S. - 11th child"
   OKDISABL41 = "BJ-16 Nonbio child has phys/ment disability - 11th child, 1st mention"
   OKDISABL42 = "BJ-16 Nonbio child has phys/ment disability - 11th child, 2nd mention"
   SEXOTHKD12 = "BJ-4 Sex of nonbiological child who lived w/R - 12th child"
   RELOTHKD12 = "BJ-5 Relationship of nonbiological child to R - 12th child"
   ADPTOTKD12 = "BJ-6 R legally adopted nonbiological child - 12th child"
   TRYADOPT12 = "BJ-7a R trying to adopt nonbiological child - 12th child"
   TRYEITHR12 = "BJ-7b R trying to adopt/become guardian of nonbio child - 12th child"
   STILHERE12 = "BJ-8 Nonbiological child still living with R - 12th child"
   DATKDCAM_Y12 = "BJ-9 Year nonbiological child began living with R - 12th child"
   OTHKDFOS12 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 12th child"
   OKDDOB_Y12 = "BJ-11 Year of nonbiological child's birth - 12th child"
   OKBORNUS12 = "BJ-15 Nonbiological child born outside the U.S. - 12th child"
   OKDISABL45 = "BJ-16 Nonbio child has phys/ment disability - 12th child, 1st mention"
   OKDISABL46 = "BJ-16 Nonbio child has phys/ment disability - 12th child, 2nd mention"
   SEXOTHKD13 = "BJ-4 Sex of nonbiological child who lived w/R - 13th child"
   RELOTHKD13 = "BJ-5 Relationship of nonbiological child to R - 13th child"
   ADPTOTKD13 = "BJ-6 R legally adopted nonbiological child - 13th child"
   TRYADOPT13 = "BJ-7a R trying to adopt nonbiological child - 13th child"
   TRYEITHR13 = "BJ-7b R trying to adopt/become guardian of nonbio child - 13th child"
   STILHERE13 = "BJ-8 Nonbiological child still living with R - 13th child"
   DATKDCAM_Y13 = "BJ-9 Year nonbiological child began living with R - 13th child"
   OTHKDFOS13 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 13th child"
   OKDDOB_Y13 = "BJ-11 Year of nonbiological child's birth - 13th child"
   OKBORNUS13 = "BJ-15 Nonbiological child born outside the U.S. - 13th child"
   OKDISABL49 = "BJ-16 Nonbio child has phys/ment disability - 13th child, 1st mention"
   OKDISABL50 = "BJ-16 Nonbio child has phys/ment disability - 13th child, 2nd mention"
   SEXOTHKD14 = "BJ-4 Sex of nonbiological child who lived w/R - 14th child"
   RELOTHKD14 = "BJ-5 Relationship of nonbiological child to R - 14th child"
   ADPTOTKD14 = "BJ-6 R legally adopted nonbiological child - 14th child"
   TRYADOPT14 = "BJ-7a R trying to adopt nonbiological child - 14th child"
   TRYEITHR14 = "BJ-7b R trying to adopt/become guardian of nonbio child - 14th child"
   STILHERE14 = "BJ-8 Nonbiological child still living with R - 14th child"
   DATKDCAM_Y14 = "BJ-9 Year nonbiological child began living with R - 14th child"
   OTHKDFOS14 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 14th child"
   OKDDOB_Y14 = "BJ-11 Year of nonbiological child's birth - 14th child"
   OKBORNUS14 = "BJ-15 Nonbiological child born outside the U.S. - 14th child"
   OKDISABL53 = "BJ-16 Nonbio child has phys/ment disability - 14th child, 1st mention"
   OKDISABL54 = "BJ-16 Nonbio child has phys/ment disability - 14th child, 2nd mention"
   SEXOTHKD15 = "BJ-4 Sex of nonbiological child who lived w/R - 15th child"
   RELOTHKD15 = "BJ-5 Relationship of nonbiological child to R - 15th child"
   ADPTOTKD15 = "BJ-6 R legally adopted nonbiological child - 15th child"
   TRYADOPT15 = "BJ-7a R trying to adopt nonbiological child - 15th child"
   TRYEITHR15 = "BJ-7b R trying to adopt/become guardian of nonbio child - 15th child"
   STILHERE15 = "BJ-8 Nonbiological child still living with R - 15th child"
   DATKDCAM_Y15 = "BJ-9 Year nonbiological child began living with R - 15th child"
   OTHKDFOS15 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 15th child"
   OKDDOB_Y15 = "BJ-11 Year of nonbiological child's birth - 15th child"
   OKBORNUS15 = "BJ-15 Nonbiological child born outside the U.S. - 15th child"
   OKDISABL57 = "BJ-16 Nonbio child has phys/ment disability - 15th child, 1st mention"
   OKDISABL58 = "BJ-16 Nonbio child has phys/ment disability - 15th child, 2nd mention"
   SEXOTHKD16 = "BJ-4 Sex of nonbiological child who lived w/R - 16th child"
   RELOTHKD16 = "BJ-5 Relationship of nonbiological child to R - 16th child"
   ADPTOTKD16 = "BJ-6 R legally adopted nonbiological child - 16th child"
   TRYADOPT16 = "BJ-7a R trying to adopt nonbiological child - 16th child"
   TRYEITHR16 = "BJ-7b R trying to adopt/become guardian of nonbio child - 16th child"
   STILHERE16 = "BJ-8 Nonbiological child still living with R - 16th child"
   DATKDCAM_Y16 = "BJ-9 Year nonbiological child began living with R - 16th child"
   OTHKDFOS16 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 16th child"
   OKDDOB_Y16 = "BJ-11 Year of nonbiological child's birth - 16th child"
   OKBORNUS16 = "BJ-15 Nonbiological child born outside the U.S. - 16th child"
   OKDISABL61 = "BJ-16 Nonbio child has phys/ment disability - 16th child, 1st mention"
   OKDISABL62 = "BJ-16 Nonbio child has phys/ment disability - 16th child, 2nd mention"
   SEXOTHKD17 = "BJ-4 Sex of nonbiological child who lived w/R - 17th child"
   RELOTHKD17 = "BJ-5 Relationship of nonbiological child to R - 17th child"
   ADPTOTKD17 = "BJ-6 R legally adopted nonbiological child - 17th child"
   TRYADOPT17 = "BJ-7a R trying to adopt nonbiological child - 17th child"
   TRYEITHR17 = "BJ-7b R trying to adopt/become guardian of nonbio child - 17th child"
   STILHERE17 = "BJ-8 Nonbiological child still living with R - 17th child"
   DATKDCAM_Y17 = "BJ-9 Year nonbiological child began living with R - 17th child"
   OTHKDFOS17 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 17th child"
   OKDDOB_Y17 = "BJ-11 Year of nonbiological child's birth - 17th child"
   OKBORNUS17 = "BJ-15 Nonbiological child born outside the U.S. - 17th child"
   OKDISABL65 = "BJ-16 Nonbio child has phys/ment disability - 17th child, 1st mention"
   OKDISABL66 = "BJ-16 Nonbio child has phys/ment disability - 17th child, 2nd mention"
   SEXOTHKD18 = "BJ-4 Sex of nonbiological child who lived w/R - 18th child"
   RELOTHKD18 = "BJ-5 Relationship of nonbiological child to R - 18th child"
   ADPTOTKD18 = "BJ-6 R legally adopted nonbiological child - 18th child"
   TRYADOPT18 = "BJ-7a R trying to adopt nonbiological child - 18th child"
   TRYEITHR18 = "BJ-7b R trying to adopt/become guardian of nonbio child - 18th child"
   STILHERE18 = "BJ-8 Nonbiological child still living with R - 18th child"
   DATKDCAM_Y18 = "BJ-9 Year nonbiological child began living with R - 18th child"
   OTHKDFOS18 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 18th child"
   OKDDOB_Y18 = "BJ-11 Year of nonbiological child's birth - 18th child"
   OKBORNUS18 = "BJ-15 Nonbiological child born outside the U.S. - 18th child"
   OKDISABL69 = "BJ-16 Nonbio child has phys/ment disability - 18th child, 1st mention"
   OKDISABL70 = "BJ-16 Nonbio child has phys/ment disability - 18th child, 2nd mention"
   SEXOTHKD19 = "BJ-4 Sex of nonbiological child who lived w/R - 19th child"
   RELOTHKD19 = "BJ-5 Relationship of nonbiological child to R - 19th child"
   ADPTOTKD19 = "BJ-6 R legally adopted nonbiological child - 19th child"
   TRYADOPT19 = "BJ-7a R trying to adopt nonbiological child - 19th child"
   TRYEITHR19 = "BJ-7b R trying to adopt/become guardian of nonbio child - 19th child"
   STILHERE19 = "BJ-8 Nonbiological child still living with R - 19th child"
   DATKDCAM_Y19 = "BJ-9 Year nonbiological child began living with R - 19th child"
   OTHKDFOS19 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 19th child"
   OKDDOB_Y19 = "BJ-11 Year of nonbiological child's birth - 19th child"
   OKBORNUS19 = "BJ-15 Nonbiological child born outside the U.S. - 19th child"
   OKDISABL73 = "BJ-16 Nonbio child has phys/ment disability - 19th child, 1st mention"
   OKDISABL74 = "BJ-16 Nonbio child has phys/ment disability - 19th child, 2nd mention"
   SEXOTHKD20 = "BJ-4 Sex of nonbiological child who lived w/R - 20th child"
   RELOTHKD20 = "BJ-5 Relationship of nonbiological child to R - 20th child"
   ADPTOTKD20 = "BJ-6 R legally adopted nonbiological child - 20th child"
   TRYADOPT20 = "BJ-7a R trying to adopt nonbiological child - 20th child"
   TRYEITHR20 = "BJ-7b R trying to adopt/become guardian of nonbio child - 20th child"
   STILHERE20 = "BJ-8 Nonbiological child still living with R - 20th child"
   DATKDCAM_Y20 = "BJ-9 Year nonbiological child began living with R - 20th child"
   OTHKDFOS20 = "BJ-10 Child was foster/related child placed w/R by Soc Svcs - 20th child"
   OKDDOB_Y20 = "BJ-11 Year of nonbiological child's birth - 20th child"
   OKBORNUS20 = "BJ-15 Nonbiological child born outside the U.S. - 20th child"
   OKDISABL77 = "BJ-16 Nonbio child has phys/ment disability - 20th child, 1st mention"
   OKDISABL78 = "BJ-16 Nonbio child has phys/ment disability - 20th child, 2nd mention"
   EVERADPT = "R's experience with adoption (based on BJ series)"
   SEEKADPT = "BK-1 R is currently seeking to adopt"
   CONTAGEM = "BK-2 R has taken specific steps to adopt"
   TRYLONG = "BK-3 How long R has been seeking to adopt"
   KNOWADPT = "BK-4 R is seeking to adopt a child she knows"
   EVWNTANO = "BL-1 R has ever considered adopting a child"
   EVCONTAG = "BL-2 R has ever taken specific steps to adopt a child"
   TURNDOWN = "BL-3 R was turned down for/decided not to pursue adoption"
   YQUITTRY = "BL-4 R decided not to pursue adoption because of adoption process or own situation"
   APROCESS1 = "BL-5 If adoption process, reason R stopped seeking to adopt - 1st mention"
   APROCESS2 = "BL-5 If adoption process, reason R stopped seeking to adopt - 2nd mention"
   APROCESS3 = "BL-5 If adoption process, reason R stopped seeking to adopt - 3rd mention"
   HRDEMBRYO = "BL-6 R has heard of frozen embryo donation or adoption"
   TIMESMAR = "CA-1 Number of Times R Has Been Married"
   HSBVERIF = "CA-2b Verify Current Husband's Name"
   WHMARHX_Y = "CB-1y Year Married to 1st Husband"
   AGEMARHX = "CB-2 R's Age at Marriage-1st Husband"
   HXAGEMAR = "CB-3 Husband's Age At Marriage-1st Husband"
   DOBHUSBX_Y = "CB-4y Year Husband Was Born-1st Husband"
   LVTOGHX = "CB-5 Cohabited Before Marriage-1st Husband"
   STRTOGHX_Y = "CB-6y Year Began 1st Cohabitation-1st Husband"
   ENGAGHX = "CB-7 Engaged When R Began Premarital Cohabitation-1st Husband"
   HSBRACE1 = "RACE-recode-like variable for 1st husband"
   HSBNRACE1 = "HISPRACE2-recode-like variable for 1st husband"
   CHEDMARN = "CB-11 Highest Level of Education-1st Husband"
   MARBEFHX = "CB-12 Was He Married Before-1st Husband"
   KIDSHX = "CB-13 Did He Have Kids From Prior Relationship-1st Husband"
   NUMKDSHX = "CB-14 Number of Kids From Prior Relationships-1st Husband"
   KIDLIVHX = "CB-15 Any Kids From Prior Relationships Live w/R & 1st Husband"
   CHKID18A = "CB-16a Is This Child 18 or Younger - Curr (if 1st) Husband"
   CHKID18B = "CB-16b # of These Children 18 or Younger - Curr (if 1st) Husband"
   WHRCHKDS1 = "CB-17 Where Current (if 1st) Husband's Child(ren) Lives Now-1st Mention"
   WHRCHKDS2 = "CB-17 Where Current (if 1st) Husband's Child(ren) Lives Now-2nd Mention"
   SUPPORCH = "CB-18 Does Current (if 1st) Husband Financially Support Kids <=18 Elsewhere"
   BIOHUSBX = "CB-18b Did R have bio kids with this husband- 1st Husband"
   BIONUMHX = "CB-18c Number of bio kids R and husband had together-1st Husband"
   MARENDHX = "CB-19 How Marriage Ended-1st Husband"
   WNDIEHX_Y = "CB-20y Year of Death-1st Husband"
   DIVDATHX_Y = "CB-21y Year of Divorce-1st Husband"
   WNSTPHX_Y = "CB-22y Year Stopped Living Together-1st Husband"
   WHMARHX_Y2 = "CB-1y Year Married to 2nd Husband"
   AGEMARHX2 = "CB-2 R's Age at Marriage-2nd Husband"
   HXAGEMAR2 = "CB-3 Husband's Age At Marriage-2nd Husband"
   DOBHUSBX_Y2 = "CB-4y Year Husband Was Born-2nd Husband"
   LVTOGHX2 = "CB-5 Cohabited Before Marriage-2nd Husband"
   STRTOGHX_Y2 = "CB-6y Year Began 1st Cohabitation-2nd Husband"
   ENGAGHX2 = "CB-7 Engaged When R Began Premarital Cohabitation-2nd Husband"
   HSBRACE2 = "RACE-recode-like variable for 2nd husband"
   HSBNRACE2 = "HISPRACE2-recode-like variable for 2nd husband"
   CHEDMARN2 = "CB-11 Highest Level of Education-2nd Husband"
   MARBEFHX2 = "CB-12 Was He Married Before-2nd Husband"
   KIDSHX2 = "CB-13 Did He Have Kids From Prior Relationship-2nd Husband"
   NUMKDSHX2 = "CB-14 Number of Kids From Prior Relationships-2nd Husband"
   KIDLIVHX2 = "CB-15 Any Kids From Prior Relationships Live w/R & 2nd Husband"
   CHKID18A2 = "CB-16a Is This Child 18 or Younger - Curr (if 2nd) Husband"
   CHKID18B2 = "CB-16b # of These Children 18 or Younger - Curr (if 2nd) Husband"
   WHRCHKDS5 = "CB-17 Where Current (if 2nd) Husband's Child(ren) Lives Now-1st Mention"
   WHRCHKDS6 = "CB-17 Where Current (if 2nd) Husband's Child(ren) Lives Now-2nd Mention"
   SUPPORCH2 = "CB-18 Does Current (if 2nd) Husband Financially Support Kids <=18 Elsewhere"
   BIOHUSBX2 = "CB-18b Did R have bio kids with this husband-2nd Husband"
   BIONUMHX2 = "CB-18c Number of bio kids R and husband had together-2nd Husband"
   MARENDHX2 = "CB-19 How Marriage Ended-2nd Husband"
   WNDIEHX_Y2 = "CB-20y Year of Death-2nd Husband"
   DIVDATHX_Y2 = "CB-21y Year of Divorce-2nd Husband"
   WNSTPHX_Y2 = "CB-22y Year Stopped Living Together-2nd Husband"
   WHMARHX_Y3 = "CB-1y Year Married to 3rd Husband"
   AGEMARHX3 = "CB-2 R's Age at Marriage-3rd Husband"
   HXAGEMAR3 = "CB-3 Husband's Age At Marriage-3rd Husband"
   DOBHUSBX_Y3 = "CB-4y Year Husband Was Born-3rd Husband"
   LVTOGHX3 = "CB-5 Cohabited Before Marriage-3rd Husband"
   STRTOGHX_Y3 = "CB-6y Year Began 1st Cohabitation-3rd Husband"
   ENGAGHX3 = "CB-7 Engaged When R Began Premarital Cohabitation-3rd Husband"
   HSBRACE3 = "RACE-recode-like variable for 3rd husband"
   HSBNRACE3 = "HISPRACE2-recode-like variable for 3rd husband"
   CHEDMARN3 = "CB-11 Highest Level of Education-3rd Husband"
   MARBEFHX3 = "CB-12 Was He Married Before-3rd Husband"
   KIDSHX3 = "CB-13 Did He Have Kids From Prior Relationship-3rd Husband"
   NUMKDSHX3 = "CB-14 Number of Kids From Prior Relationships-3rd Husband"
   KIDLIVHX3 = "CB-15 Any Kids From Prior Relationships Live w/R & 3rd Husband"
   CHKID18A3 = "CB-16a Is This Child 18 or Younger - Curr (if 3rd) Husband"
   CHKID18B3 = "CB-16b # of These Children 18 or Younger - Curr (if 3rd) Husband"
   WHRCHKDS9 = "CB-17 Where Current (if 3rd) Husband's Child(ren) Lives Now-1st Mention"
   WHRCHKDS10 = "CB-17 Where Current (if 3rd) Husband's Child(ren) Lives Now-2nd Mention"
   SUPPORCH3 = "CB-18 Does Current (if 3rd) Husband Financially Support Kids <=18 Elsewhere"
   BIOHUSBX3 = "CB-18b Did R have bio kids with this husband-3rd Husband"
   BIONUMHX3 = "CB-18c Number of bio kids R and  husband had together-3rd Husband"
   MARENDHX3 = "CB-19 How Marriage Ended-3rd Husband"
   WNDIEHX_Y3 = "CB-20 Year of Death-3rd Husband"
   DIVDATHX_Y3 = "CB-21y Year of Divorce-3rd Husband"
   WNSTPHX_Y3 = "CB-22y Year Stopped Living Together-3rd Husband"
   WHMARHX_Y4 = "CB-1y Year Married to 4th Husband"
   AGEMARHX4 = "CB-2 R's Age at Marriage-4th Husband"
   HXAGEMAR4 = "CB-3 Husband's Age At Marriage-4th Husband"
   DOBHUSBX_Y4 = "CB-4y Year Husband Was Born-4th Husband"
   LVTOGHX4 = "CB-5 Cohabited Before Marriage-4th Husband"
   STRTOGHX_Y4 = "CB-6y Year Began 1st Cohabitation-4th Husband"
   ENGAGHX4 = "CB-7 Engaged When R Began Premarital Cohabitation-4th Husband"
   HSBRACE4 = "RACE-recode-like variable for 4th husband"
   HSBNRACE4 = "HISPRACE2-recode-like variable for 4th husband"
   CHEDMARN4 = "CB-11 Highest Level of Education-4th Husband"
   MARBEFHX4 = "CB-12 Was He Married Before-4th Husband"
   KIDSHX4 = "CB-13 Did He Have Kids From Prior Relationship-4th Husband"
   NUMKDSHX4 = "CB-14 Number of Kids From Prior Relationships-4th Husband"
   KIDLIVHX4 = "CB-15 Any Kids From Prior Relationships Live w/R & 4th Husband"
   CHKID18A4 = "CB-16a Is This Child 18 or Younger - Curr (if 4th) Husband"
   CHKID18B4 = "CB-16b # of These Children 18 or Younger - Curr (if 4th) Husband"
   WHRCHKDS13 = "CB-17 Where Current (if 4th) Husband's Child(ren) Lives Now-1st Mention"
   WHRCHKDS14 = "CB-17 Where Current (if 4th) Husband's Child(ren) Lives Now-2nd Mention"
   SUPPORCH4 = "CB-18 Does Current (if 4th) Husband Financially Support Kids <=18 Elsewhere"
   BIOHUSBX4 = "CB-18b Did R have bio kids with this husband-4th Husband"
   BIONUMHX4 = "CB-18c Number of bio kids R and  husband had together-4th Husband"
   MARENDHX4 = "CB-19 How Marriage Ended-4th Husband"
   WNDIEHX_Y4 = "CB-20y Year of Death-4th Husband"
   DIVDATHX_Y4 = "CB-21y Year of Divorce-4th Husband"
   WNSTPHX_Y4 = "CB-22y Year Stopped Living Together-4th Husband"
   WHMARHX_Y5 = "CB-1y Year Married to 5th Husband"
   AGEMARHX5 = "CB-2 R's Age at Marriage-5th Husband"
   HXAGEMAR5 = "CB-3 Husband's Age At Marriage-5th Husband"
   DOBHUSBX_Y5 = "CB-4y Year Husband Was Born-5th Husband"
   LVTOGHX5 = "CB-5 Cohabited Before Marriage-5th Husband"
   STRTOGHX_Y5 = "CB-6y Year Began 1st Cohabitation-5th Husband"
   ENGAGHX5 = "CB-7 Engaged When R Began Premarital Cohabitation-5th Husband"
   HSBRACE5 = "RACE-recode-like variable for 5th husband"
   HSBNRACE5 = "HISPRACE2-recode-like variable for 5th husband"
   CHEDMARN5 = "CB-11 Highest Level of Education-5th Husband"
   MARBEFHX5 = "CB-12 Was He Married Before-5th Husband"
   KIDSHX5 = "CB-13 Did He Have Kids From Prior Relationship-5th Husband"
   NUMKDSHX5 = "CB-14 Number of Kids From Prior Relationships-5th Husband"
   KIDLIVHX5 = "CB-15 Any Kids From Prior Relationships Live w/R & 5th Husband"
   CHKID18A5 = "CB-16a Is This Child 18 or Younger - Curr (if 5th) Husband"
   CHKID18B5 = "CB-16b # of These Children 18 or Younger - Curr (if 5th) Husband"
   WHRCHKDS17 = "CB-17 Where Current (if 5th) Husband's Child(ren) Lives Now-1st Mention"
   WHRCHKDS18 = "CB-17 Where Current (if 5th) Husband's Child(ren) Lives Now-2nd Mention"
   SUPPORCH5 = "CB-18 Does Current (if 5th) Husband Financially Support Kids <=18 Elsewhere"
   BIOHUSBX5 = "CB-18b Did R have bio kids with this  husband-5th Husband"
   BIONUMHX5 = "CB-18c Number of bio kids R and  husband had together-5th Husband"
   MARENDHX5 = "CB-19 How Marriage Ended-5th Husband"
   WNDIEHX_Y5 = "CB-20y Year of Death-5th Husband"
   DIVDATHX_Y5 = "CB-21y Year of Divorce-5th Husband"
   WNSTPHX_Y5 = "CB-22y Year Stopped Living Together-5th Husband"
   WHMARHX_Y6 = "CB-1y Year Married to 6th Husband"
   AGEMARHX6 = "CB-2 R's Age at Marriage-6th Husband"
   HXAGEMAR6 = "CB-3 Husband's Age At Marriage-6th Husband"
   DOBHUSBX_Y6 = "CB-4y Year Husband Was Born-6th Husband"
   LVTOGHX6 = "CB-5 Cohabited Before Marriage-6th Husband"
   STRTOGHX_Y6 = "CB-6y Year Began 1st Cohabitation-6th Husband"
   ENGAGHX6 = "CB-7 Engaged When R Began Premarital Cohabitation-6th Husband"
   HSBRACE6 = "RACE-recode-like variable for 6th husband"
   HSBNRACE6 = "HISPRACE2-recode-like variable for 6th husband"
   CHEDMARN6 = "CB-11 Highest Level of Education-6th Husband"
   MARBEFHX6 = "CB-12 Was He Married Before-6th Husband"
   KIDSHX6 = "CB-13 Did He Have Kids From Prior Relationship-6th Husband"
   NUMKDSHX6 = "CB-14 Number of Kids From Prior Relationships-6th Husband"
   KIDLIVHX6 = "CB-15 Any Kids From Prior Relationships Live w/R & 6th Husband"
   CHKID18A6 = "CB-16a Is This Child 18 or Younger - Curr Husband"
   CHKID18B6 = "CB-16b # of These Children 18 or Younger - Curr Husband"
   WHRCHKDS21 = "CB-17 Where Curr Husband's Child(ren) Lives Now-1st Mention"
   WHRCHKDS22 = "CB-17 Where Curr Husband's Child(ren) Lives Now-2nd Mention"
   SUPPORCH6 = "CB-18 Does Curr Husband Financially Support Kids <=18 Elsewhere"
   BIOHUSBX6 = "CB-18b Did R have bio kids with this  husband-6th Husband"
   BIONUMHX6 = "CB-18c Number of bio kids R and husband had together-6th Husband"
   MARENDHX6 = "CB-19 How Marriage Ended-6th Husband"
   WNDIEHX_Y6 = "CB-20y Year of Death-6th Husband"
   DIVDATHX_Y6 = "CB-21y Year of Divorce-6th Husband"
   WNSTPHX_Y6 = "CB-22y Year Stopped Living Together-6th Husband"
   CMMARRCH = "Year of Marriage to Current Husband"
   PREVHUSB = "Number of Previous Husbands (incl. separated)"
   WNSTRTCP_Y = "CC-2y Year Began Cohabitation - Current Partner"
   CPHERAGE = "CC-3 R's Age When Began Cohabiting w/Current Partner"
   CPHISAGE = "CC-4 Partner's Age When Began Cohabiting - Current Partner"
   WNCPBRN_Y = "CC-5y Year Partner Was Born- Current Cohabiting Partner"
   CPENGAG1 = "CC-6 Engaged When Began Cohabiting-Current Cohabiting Partner"
   WILLMARR = "CC-7 R Thinks She Will Marry-Curr Cohabiting Partner"
   CURCOHRACE = "RACE-recode-like variable for current cohab partner"
   CURCOHNRACE = "HISPRACE2-recode-like variable for current cohab partner"
   CPEDUC = "CC-11 Level of Education-Current Cohabiting Partner"
   CPMARBEF = "CC-12 Was He Married Before - Current Cohabiting Partner"
   CPKIDS = "CC-13 Kids From Prior Relationships-Current Cohabiting Partner"
   CPNUMKDS = "CC-14 # of Kids From Prior Relationships-Curr Cohab Partner"
   CPKIDLIV = "CC-15 Kids From Prior Relationships Live w/R"
   CPKID18A = "CC-16a Is This Child 18 or Younger-Curr Cohabiting Partner"
   CPKID18B = "CC-16b # of His Children 18 or Younger-Curr Cohabiting Partner"
   WHRCPKDS1 = "CC-17 Where Curr Cohab s Child(ren) Lives Now-1st Mention"
   WHRCPKDS2 = "CC-17 Where Curr Cohab s Child(ren) Lives Now-2nd Mention"
   SUPPORCP = "CC-18 Does Curr Cohab Financially Support Kids <=18 Elsewhere"
   BIOCP = "CC-19 Did R have bio kids with current partner?"
   BIONUMCP = "CC-20 Number of bio kids R and current partner have together"
   CMSTRTHP = "Year R began living with current husband or cohab partner"
   LIVEOTH = "CD-1 Ever Cohabited With Any (Other) Man"
   EVRCOHAB = "Whether R Has Ever Lived With a Non Marital Partner"
   HMOTHMEN = "CD-2 Number of Other Men R Has Cohabited With"
   PREVCOHB = "Number of former cohabiting partners"
   STRTOTHX_Y = "CD-4y Year Began Cohabitation - 1st former partner"
   HERAGECX = "CD-5 R's Age When Began Cohabiting w/ 1st Former Partner"
   HISAGECX = "CD-6 Partner's Age When Began Cohabiting - 1st Former Partner"
   WNBRNCX_Y = "CD-7y Year Partner Was Born-1st former cohab partner"
   ENGAG1CX = "CD-8 Engaged When Began Cohabiting-1st former cohab partner"
   COH1RACE = "RACE-recode-like variable for 1st former cohabiting partner"
   COH1NRACE = "HISPRACE2-recode-like variable for 1st former cohabiting partner"
   MAREVCX = "CD-12 Was He Married Before-1st former cohabiting partner"
   CXKIDS = "CD-13 Any Kids From Prior Relationhips-1st former cohab partner"
   BIOFCPX = "CD-13b Did R have bio kids with this cohab partner-1st former cohab partner"
   BIONUMCX = "CD-13c Number of bio kids R and cohab partner have together-1st former cohab partner"
   STPTOGCX_Y = "CD-14y Year Stopped Cohabiting-1st former cohabiting partner"
   STRTOTHX_Y2 = "CD-4y Year Began Cohabitation - 2nd former partner"
   HERAGECX2 = "CD-5 R's Age When Began Cohabiting w/ 2nd Former Partner"
   HISAGECX2 = "CD-6 Partner's Age When Began Cohabiting - 2nd Former Partner"
   WNBRNCX_Y2 = "CD-7y Year Partner Was Born-2nd former cohab partner"
   ENGAG1CX2 = "CD-8 Engaged When Began Cohabiting-2nd former cohab partner"
   MAREVCX2 = "CD-12 Was He Married Before-2nd former cohabiting partner"
   CXKIDS2 = "CD-13 Any Kids From Prior Relationhips-2nd former cohab partner"
   BIOFCPX2 = "CD-13b Did R have bio kids with this cohab partner-2nd former cohab partner"
   BIONUMCX2 = "CD-13c Number of bio kids R and cohab partner have together-2nd former cohab partner"
   STPTOGCX_Y2 = "CD-14y Year Stopped Cohabiting-2nd former cohabiting partner"
   STRTOTHX_Y3 = "CD-4y Year Began Cohabitation - 3rd former partner"
   HERAGECX3 = "CD-5 R's Age When Began Cohabiting w/ 3rd Former Partner"
   HISAGECX3 = "CD-6 Partner's Age When Began Cohabiting - 3rd Former Partner"
   WNBRNCX_Y3 = "CD-7y Year Partner Was Born-3rd former cohab partner"
   ENGAG1CX3 = "CD-8 Engaged When Began Cohabiting-3rd former cohab partner"
   MAREVCX3 = "CD-12 Was He Married Before-3rd former cohabiting partner"
   CXKIDS3 = "CD-13 Any Kids From Prior Relationships-3rd former cohab partner"
   BIOFCPX3 = "CD-13b Did R have bio kids with this cohab partner-3rd former cohab partner"
   BIONUMCX3 = "CD-13c Number of bio kids R and cohab partner have together-3rd former cohab partner"
   STPTOGCX_Y3 = "CD-14y Year Stopped Cohabiting-3rd former cohabiting partner"
   STRTOTHX_Y4 = "CD-4y Year Began Cohabitation - 4th former partner"
   HERAGECX4 = "CD-5 R's Age When Began Cohabiting w/ 4th Former Partner"
   HISAGECX4 = "CD-6 Partner's Age When Began Cohabiting - 4th Former Partner"
   WNBRNCX_Y4 = "CD-7y Year Partner Was Born-4th former cohab partner"
   ENGAG1CX4 = "CD-8 Engaged When Began Cohabiting-4th former cohab partner"
   MAREVCX4 = "CD-12 Was He Married Before-4th former cohabiting partner"
   CXKIDS4 = "CD-13 Any Kids From Prior Relationhips-4th former cohab partner"
   BIOFCPX4 = "CD-13b Did R have bio kids with this cohab partner-4th former cohab partner"
   BIONUMCX4 = "CD-13c Number of bio kids R and cohab partner have together-4th former cohab partner"
   STPTOGCX_Y4 = "CD-14y Year Stopped Cohabiting-4th former cohabiting partner"
   COHCHANCE = "CD-15 R thinks she will cohabit in the future"
   MARRCHANCE = "CD-16 R thinks she will (re)marry in the future"
   PMARCOH = "CD-17 R thinks she will live with a future husband before marriage"
   EVERSEX = "CE-1 Ever Had Sexual Intercourse with a Man"
   RHADSEX = "Whether R Has Ever Had Sex (Vaginal Intercourse)"
   YNOSEX = "CE-2 Main Reason R Has Not Had Sex With a Man"
   WNFSTSEX_M = "CE-3m Month of First Sexual Intercourse"
   WNFSTSEX_Y = "CE-3y Year of First Sexual Intercourse"
   CMFSTSEX = "CM for Date of First Sexual Intercourse"
   AGEFSTSX = "CE-4 Age at First Sexual Intercourse"
   C_SEX18 = "CE-5 Was R less than 18 or 18+ at 1st sex"
   C_SEX15 = "CE-6 Was R less than 15 or 15+ at 1st sex"
   C_SEX20 = "CE-7 Was R less than 20 or 20+ at 1st sex"
   GRFSTSX = "CE-8 Grade R Was in at First Sexual Intercourse"
   SXMTONCE = "CE-9 Has R Had Sexual Intercourse More Than Once"
   TALKPAR1 = "CF-1 Sex Ed Topics R Has Discussed with Parents -1st Mention"
   TALKPAR2 = "CF-1 Sex Ed Topics R Has Discussed with Parents -2nd Mention"
   TALKPAR3 = "CF-1 Sex Ed Topics R Has Discussed with Parents -3rd Mention"
   TALKPAR4 = "CF-1 Sex Ed Topics R Has Discussed with Parents -4th Mention"
   TALKPAR5 = "CF-1 Sex Ed Topics R Has Discussed with Parents -5th Mention"
   TALKPAR6 = "CF-1 Sex Ed Topics R Has Discussed with Parents -6th Mention"
   TALKPAR7 = "CF-1 Sex Ed Topics R Has Discussed with Parents -7th Mention"
   SEDNO = "CF-2 Formal Sex Ed Before 18: How to Say No to Sex"
   SEDNOG = "CF-3 Grade R Received Sex Ed on How to Say No to Sex"
   SEDNOSX = "CF-4 Rec d Sex Ed on How to Say No to Sex Before/After 1st Sex"
   SEDBC = "CF-5 Formal Sex Ed Before 18: Methods of Birth Control"
   SEDBCLC1 = "CF-5a Place where received instruction about methods of birth control-1st Mention"
   SEDBCLC2 = "CF-5a Place where received instruction about methods of birth control-2nd Mention"
   SEDBCLC3 = "CF-5a Place where received instruction about methods of birth control-3rd Mention"
   SEDBCLC4 = "CF-5a Place where received instruction about methods of birth control-4th Mention"
   SEDBCG = "CF-6 R's Grade When Received Instruction on Birth Control"
   SEDBCSX = "CF-7 Rec d Sex Ed on Birth Control Methods Before/After 1st Sex"
   SEDWHBC = "CF-8 Formal Sex Ed Before 18: Where to Get Birth Control"
   SEDWHBCG = "CF-9 R's Grade When Received Instruction on Where to Get Birth Control"
   SEDWBCSX = "CF-10 R rec d Instruction-Where to Get Birth Control before/after 1st sex"
   SEDCOND = "CF-11 Formal Sex Ed Before 18: How to Use a Condom"
   SEDCONDG = "CF-12 R's Grade When Received Instruction on How to Use a Condom"
   SEDCONSX = "CF-13 R rec d Instruction-How to Use a Condom before/after 1st sex"
   SEDSTD = "CF-14 Formal Sex Ed Before 18: STD"
   SEDSTDG = "CF-15 Grade R 1st Received Sex Ed on STDs"
   SEDSTDSX = "CF-16 Received Sex Ed on STD before/after 1st sex"
   SEDHIV = "CF-17 Formal Sex Ed Before 18: HIV/AIDS"
   SEDHIVG = "CF-18 Grade R 1st Received Sex Ed on HIV/AIDS"
   SEDHIVSX = "CF-19 Received Sex Ed on HIV/AIDS before/after 1st sex"
   SEDABST = "CF-20 Formal Sex Ed Before 18: Waiting Until Marriage"
   SEDABLC1 = "CF-20a Place where received instruction about waiting until marriage to have sex-1st Mention"
   SEDABLC2 = "CF-20a Place where received instruction about waiting until marriage to have sex-2nd Mention"
   SEDABLC3 = "CF-20a Place where received instruction about waiting until marriage to have sex-3rd Mention"
   SEDABLC4 = "CF-20a Place where received instruction about waiting until marriage to have sex-4th Mention"
   SEDABSTG = "CF-21 R's Grade When Received Instruction on Waiting Until Marriage"
   SEDABSSX = "CF-22 R rec d instruction-Waiting Until Marriage before/after 1st sex"
   SAMEMAN = "CG-2 1st Partner Already Discussed as a Husband or Cohab Partner?"
   WHOFSTPR = "CG-3 Which man already discussed was R's 1st Sexual Partner?"
   KNOWFP = "CG-5 Relationship with 1st Partner at 1st Sex"
   STILFPSX = "CG-6 Is 1st Sexual Partner a Current Sexual Partner"
   LSTSEXFP_M = "CG-7m Month R Last Had Sex With 1st Sexual Partner"
   LSTSEXFP_Y = "CG-7y Year R Last Had Sex With 1st Sexual Partner"
   CMLSEXFP = "CM for Date of Last Sex With 1st Sexual Partner"
   CMFPLAST = "CM for Date of Last or Only Sex with 1st Sexual Partner"
   FPOTHREL = "CG-7a Relationship with Partner at Last Sex"
   FPEDUC = "CG-7b Highest level of education - 1st Sexual Partner"
   FSEXRACE = "RACE-recode-like variable for 1st sexual partner"
   FSEXNRACE = "HISPRACE2-recode-like variable for 1st sexual partner"
   FPRN = "CG-7f Describe Current Relationship with 1st Sexual Partner"
   WHICH1ST = "CG-8 First Sexual Intercourse Before or After Menarche"
   SEXAFMEN = "CG-9 Whether R Had Sex Since Menarche"
   WNSEXAFM_M = "CG-10m Month of 1st Sex After Menarche"
   WNSEXAFM_Y = "CG-10y Year of 1st Sex After Menarche"
   CMSEXAFM = "CM for Date of 1st Sex After Menarche"
   AGESXAFM = "CG-11 Age at 1st Sex After Menarche"
   AFMEN18 = "CG-12 Was R less than 18 or 18+ at 1st sex after menarche"
   AFMEN15 = "CG-13 Was R less than 15 or 15+ at 1st sex after menarche"
   AFMEN20 = "CG-14 Was R less than 20 or 20+ at 1st sex after menarche"
   LIFEPRT = "CH-1 # of Male Sex Partners in Entire Life"
   LIFEPRT_LO = "CH-1b # of Male Sex Partners in Entire Life: Low end of range"
   LIFEPRT_HI = "CH-1c # of Male Sex Partners in Entire Life: High end of range"
   PTSB4MAR = "CH-2 # of Male Sex Partners Prior to 1st Marriage"
   PTSB4MAR_LO = "CH-2b # of Male Sex Partners Prior to 1st Marriage: Low end of range"
   PTSB4MAR_HI = "CH-2c # of Male Sex Partners Prior to 1st Marriage: High end of range"
   MON12PRT = "CH-3 # of Male Sex Partners in Last 12 Months"
   MON12PRT_LO = "CH-3b # of Male Sex Partners in Last 12 Months: Low end of range"
   MON12PRT_HI = "CH-3c # of Male Sex Partners in Last 12 Months: High end of range"
   PARTS12 = "Number of Partners in Last 12 Months"
   LIFEPRTS = "Number of Male Sexual Partners in Lifetime"
   WHOSNC1Y = "CI-1 Is R's One Partner in Last 12 Mos Her Current H/P?"
   MATCHFP = "CI-4 Is last partner same as 1st partner ever?"
   MATCHHP = "CI-5 Which H/P already discussed, if any, is last partner?"
   P1YRELP = "Relationship of last partner to R"
   CMLSEX = "CM of last sex with last partner"
   P1YLSEX_M = "CI-6m Month of Last Sex-last partner"
   P1YLSEX_Y = "CI-6y Year of Last Sex-last partner"
   P1YCURRP = "CI-7 Whether partner is current-last partner"
   PCURRNT = "Whether partner is current - last partner"
   MATCHFP2 = "CI-4 Is 2nd-to-last partner same as 1st partner ever?"
   MATCHHP2 = "CI-5 Which H/P already discussed, if any, is 2nd-to-last partner?"
   P1YRELP2 = "Relationship of 2nd-to-last partner to R"
   CMLSEX2 = "CM of last sex with 2nd-to-last partner in last 12 mos"
   P1YLSEX_M2 = "CI-6m Month of Last Sex-2nd-to-last partner"
   P1YLSEX_Y2 = "CI-6y Year of Last Sex-2nd-to-last partner"
   P1YCURRP2 = "CI-7 Whether partner is current (2nd-to-last partner)"
   PCURRNT2 = "Whether partner is current (2nd-to-last partner)"
   MATCHFP3 = "CI-4 Is 3rd-to-last partner same as 1st partner ever?"
   MATCHHP3 = "CI-5 Which H/P already discussed, if any, is 3rd-to-last partner?"
   P1YRELP3 = "Relationship of 3rd-to-last partner to R"
   CMLSEX3 = "CM of last sex with 3rd-to-last partner in last 12 mos"
   P1YLSEX_M3 = "CI-6m Month of Last Sex-3rd-to-last partner"
   P1YLSEX_Y3 = "CI-6y Year of Last Sex-3rd-to-last partner"
   P1YCURRP3 = "CI-7 Whether partner is current (3rd-to-last partner)"
   PCURRNT3 = "Whether partner is current (3rd-to-last partner)"
   P1YOTHREL = "CI-8 Relationship at last Sex with last partner"
   P1YRAGE = "CI-9 R's Age at 1st Sex with last partner"
   P1YHSAGE = "CI-10 Partner's Age at 1st Sex with R -last partner"
   P1YRF = "CI-11 Relationship with last partner at 1st Sex with him"
   P1YFSEX_M = "CI-12m Month of 1st Sex with last partner"
   P1YFSEX_Y = "CI-12y Year of 1st Sex with last Partner"
   CMFSEX = "CM of first sex with last partner"
   CMFSEXTOT = "CM of first or only sex with last partner"
   P1YEDUC = "CI-13 Highest Level of Education-last Partner"
   P1YRACE1 = "RACE-recode-like variable for most recent partner in last 12 mos"
   P1YNRACE1 = "HISPRACE2-recode-like variable for most recent partner in last 12mos"
   P1YRN = "CI-17 Type of Current Relationship-last Partner"
   P1YOTHREL2 = "CI-8 Relationship at last Sex with 2nd-to-last partner"
   P1YRAGE2 = "CI-9 R's Age at 1st Sex with 2nd-to-last partner"
   P1YHSAGE2 = "CI-10 Partner's Age at 1st Sex with R -2nd-to-last partner"
   P1YRF2 = "CI-11 Relationship with 2nd-to-last partner at 1st Sex with him"
   P1YFSEX_M2 = "CI-12m Month of 1st Sex with 2nd-to-last partner"
   P1YFSEX_Y2 = "CI-12y Year of 1st Sex with 2nd-to-last partner"
   CMFSEX2 = "CM of first sex with 2nd-to-last partner"
   CMFSEXTOT2 = "CM of first or only sex with 2nd-to-last partner"
   P1YEDUC2 = "CI-13 Highest Level of Education-2nd-to-last partner"
   P1YRACE2 = "RACE-recode-like variable for 2nd-to-last partner in last 12 mos"
   P1YNRACE2 = "HISPRACE2-recode-like variable for 2nd-to-last partner in last 12 mos"
   P1YRN2 = "CI-17 Type of Current Relationship-2nd-to-last partner"
   P1YOTHREL3 = "CI-8 Relationship at last Sex with 3rd-to-last partner"
   P1YRAGE3 = "CI-9 R's Age at 1st Sex with 3rd-to-last partner"
   P1YHSAGE3 = "CI-10 Partner's Age at 1st Sex with R -3rd-to-last partner"
   P1YRF3 = "CI-11 Relationship with 3rd-to-last partner at 1st Sex with him"
   P1YFSEX_M3 = "CI-12m Month of 1st Sex with 3rd-to-last partner"
   P1YFSEX_Y3 = "CI-12y Year of 1st Sex with 3rd-to-last partner"
   CMFSEX3 = "CM of first sex with 3rd-to-last partner"
   CMFSEXTOT3 = "CM of first or only sex with 3rd-to-last partner"
   P1YEDUC3 = "CI-13 Highest Level of Education-3rd-to-last partner"
   P1YRACE3 = "RACE-recode-like variable for 3rd-to-last partner in last 12 mos"
   P1YNRACE3 = "HISPRACE2-recode-like variable for 3rd-to-last partner in last 12 mos"
   P1YRN3 = "CI-17 Type of Current Relationship-3rd-to-last partner"
   CURRPRTT = "# of Current Male Sexual Partners-including curr H/P"
   CURRPRTS = "# of Current Male Sexual Partners, not including curr H/P"
   CMCURRP1 = "CM for Date of Last or Only Sex With CURPART1"
   CMCURRP2 = "CM for Date of Last or Only Sex With CURPART2"
   CMCURRP3 = "CM for Date of Last or Only Sex With CURPART3"
   EVERTUBS = "DA-1 R Ever Had Tubes Tied/Cut/Removed"
   ESSURE = "DA-1b Ever had tubal sterilization procedure called ESSURE"
   EVERHYST = "DA-2 R Ever Had Hysterectomy"
   EVEROVRS = "DA-3 R Ever Had Both Ovaries Removed"
   EVEROTHR = "DA-4 R Ever Had Any Other Sterilizing Operation"
   WHTOOPRC = "DA-5a Codes for Spontaneous Description of Other Operation"
   ONOTFUNC = "DA-6 R Sterile from Operation on 1 Tube/Ovary"
   DFNLSTRL = "DA-7 R Sterile From This Other Operation"
   ANYTUBAL = "R ever had a tubal sterilization (Regardless of reversal)"
   HYST = "R is surgically sterile at interview due to hysterectomy"
   OVAREM = "R is surgically sterile at interview due to ovary removal"
   OTHR = "R is surgically sterile at interview due to other female operation"
   ANYFSTER = "R Ever Had Sterilizing Operation (Regardless of Reversal)"
   ANYOPSMN = "DA-8 R's Curr H/P Ever Had Vasectomy or Other Sterilizing Operation"
   WHATOPSM = "DA-9 Type of Sterilizing Operation R's Current H/P Had"
   DFNLSTRM = "DA-10 is R's Curr H/P completely sterile/impossible to become father"
   ANYMSTER = "R's H/P Ever Had Sterilizing Operation Regardless of Reversal"
   ANYVAS = "R's H/P ever had a vasectomy, regardless of later reversal"
   OTHRM = "R's H/P curr sterile from operation other than vasectomy (computed in Flow Check D-7)"
   DATFEMOP_Y = "DB-1 Year of R's tubal sterilization"
   PLCFEMOP = "DB-2 Site of R's tubal sterilization"
   PAYRSTER1 = "DB-2b How Paid for Tubal Sterilization-1st Mention"
   PAYRSTER2 = "DB-2b How Paid for Tubal Sterilization-2nd Mention"
   PAYRSTER3 = "DB-2b How Paid for Tubal Sterilization-3rd Mention"
   RHADALL = "DB-3a R Had All The Kids She Wanted-Tubal Steril"
   HHADALL = "DB-3b H/P Had All The Kids He Wanted-Tubal Steril"
   FMEDREAS1 = "DB-4 Medical reason for tubal sterilization-1st mention"
   FMEDREAS2 = "DB-4 Medical reason for tubal sterilization-2nd mention"
   FMEDREAS3 = "DB-4 Medical reason for tubal sterilization-3rd mention"
   FMEDREAS4 = "DB-4 Medical reason for tubal sterilization-4th mention"
   FMEDREAS5 = "DB-4 Medical reason for tubal sterilization-5th mention"
   BCREAS = "DB-5a Problems with Birth Control Method-tubal steril"
   BCWHYF = "DB-5b Medical Problems with Birth Control-tubal steril"
   MINCDNNR = "DB-6 Main reason for tubal sterilization"
   DATFEMOP_Y2 = "DB-1 Year of R's hysterectomy"
   PLCFEMOP2 = "DB-2 Site of R's hysterectomy"
   PAYRSTER6 = "DB-2b How Paid for Hysterectomy-1st Mention"
   PAYRSTER7 = "DB-2b How Paid for Hysterectomy-2nd Mention"
   PAYRSTER8 = "DB-2b How Paid for Hysterectomy-3rd Mention"
   RHADALL2 = "DB-3a R Had All The Kids She Wanted-Hysterectomy"
   HHADALL2 = "DB-3b H/P Had All The Kids He Wanted-Hysterectomy"
   FMEDREAS7 = "DB-4 Medical reason for hysterectomy-1st mention"
   FMEDREAS8 = "DB-4 Medical reason for hysterectomy-2nd mention"
   FMEDREAS9 = "DB-4 Medical reason for hysterectomy-3rd mention"
   FMEDREAS10 = "DB-4 Medical reason for hysterectomy-4th mention"
   FMEDREAS11 = "DB-4 Medical reason for hysterectomy-5th mention"
   BCREAS2 = "DB-5a Problems with Birth Control Method-hysterectomy"
   BCWHYF2 = "DB-5b Medical Problems with Birth Control-hysterectomy"
   MINCDNNR2 = "DB-6 Main reason for hysterectomy"
   DATFEMOP_Y3 = "DB-1 Year of R's ovary removal"
   PLCFEMOP3 = "DB-2 Site of R's ovary removal"
   PAYRSTER11 = "DB-2b How Paid for Ovary Removal-1st Mention"
   PAYRSTER12 = "DB-2b How Paid for Ovary Removal-2nd Mention"
   PAYRSTER13 = "DB-2b How Paid for Ovary Removal-3rd Mention"
   RHADALL3 = "DB-3a R Had All The Kids She Wanted-Ovary Removal"
   HHADALL3 = "DB-3b H/P Had All The Kids He Wanted-Ovary Removal"
   FMEDREAS13 = "DB-4 Medical reason for ovary removal-1st mention"
   FMEDREAS14 = "DB-4 Medical reason for ovary removal-2nd mention"
   FMEDREAS15 = "DB-4 Medical reason for ovary removal-3rd mention"
   FMEDREAS16 = "DB-4 Medical reason for ovary removal-4th mention"
   FMEDREAS17 = "DB-4 Medical reason for ovary removal-5th mention"
   BCREAS3 = "DB-5a Problems with Birth Control Method-ovary removal"
   BCWHYF3 = "DB-5b Medical Problems with Birth Control-ovary removal"
   MINCDNNR3 = "DB-6 Main reason for ovary removal"
   DATFEMOP_Y4 = "DB-1 Year of R's other sterilizing operation"
   PLCFEMOP4 = "DB-2 Site of R's other sterilizing operation"
   PAYRSTER16 = "DB-2b How Paid for Other Sterilizing Operation-1st Mention"
   PAYRSTER17 = "DB-2b How Paid for Other Sterilizing Operation-2nd Mention"
   PAYRSTER18 = "DB-2b How Paid for Other Sterilizing Operation-3rd Mention"
   RHADALL4 = "DB-3a R Had All The Kids She Wanted-Other Sterilizing Operation"
   HHADALL4 = "DB-3b H/P Had All The Kids He Wanted-Other Sterilizing Operation"
   FMEDREAS19 = "DB-4 Medical reason for Other Sterilizing operation-1st mention"
   FMEDREAS20 = "DB-4 Medical reason for Other Sterilizing operation-2nd mention"
   FMEDREAS21 = "DB-4 Medical reason for Other Sterilizing operation-3rd mention"
   FMEDREAS22 = "DB-4 Medical reason for Other Sterilizing operation-4th mention"
   FMEDREAS23 = "DB-4 Medical reason for Other Sterilizing operation-5th mention"
   BCREAS4 = "DB-5a Problems with Birth Control Method-Other Sterilizing Operation"
   BCWHYF4 = "DB-5b Medical Problems with Birth Control-Other Sterilizing Operation"
   MINCDNNR4 = "DB-6 Main reason for other sterilizing operation"
   OPERSAME1 = "DB-6b Tubal & Hysterectomy in Same Mo/Yr Done at Same Time"
   OPERSAME2 = "DB-6b Tubal & Ovary Removal in Same Mo/Yr Done at Same Time"
   OPERSAME3 = "DB-6b Tubal & Other Female Operation in Same Mo/Yr Done at Same Time"
   OPERSAME4 = "DB-6b Hysterectomy & Ovary Removal in Same Mo/Yr Done at Same Time"
   OPERSAME5 = "DB-6b Hysterectomy & Other Female Operation in Same Mo/Yr Done at Same Time"
   OPERSAME6 = "DB-6b Ovary Removal & Other Female Operation in Same Mo/Yr Done at Same Time"
   DATEOPMN_Y = "DB-7 Year When Current H/P Had Sterilizing Operation"
   WITHIMOP = "DB-8 Was R in Relationship with H/P When He Had Sterilization Operation"
   VASJAN4YR = "DB-8b Had Sterilization Operation since CMJAN4YR"
   PLACOPMN = "DB-9 Site of H/P's Sterilizing Operation"
   PAYMSTER1 = "DB-10 How paid for current H/P's operation-1st mention"
   PAYMSTER2 = "DB-10 How paid for current H/P's operation-2nd mention"
   RHADALLM = "DB-11a At H/P's Operation, R Had All The Children She Wanted"
   HHADALLM = "DB-11b At H/P's Operation, H/P Had All The Children He Wanted"
   MEDREAS1 = "DB-12 Medical reason for H/P's operation-1st mention"
   MEDREAS2 = "DB-12 Medical reason for H/P's operation-2nd mention"
   BCREASM = "DB-13a At H/P's Operation, Had Problems with Birth Control Method"
   BCWHYM = "DB-13b At H/P's Operation, Had Medical Problems with Birth Control"
   MINCDNMN = "DB-14 Main Reason for H/P's Sterilizing Operation"
   REVSTUBL = "DC-1 Ever had surgery to reverse tubal sterilization"
   DATRVSTB_Y = "DC-2 Year of Tubal Sterilization Reversal"
   REVSVASX = "DC-3 R's Current H/P Ever Had Surgery to Reverse Vasectomy"
   DATRVVEX_Y = "DC-4 Year of Current H/P's Vasectomy Reversal"
   TUBS = "R currently sterile from tubal ligation"
   VASECT = "R's H/P currently sterile from vasectomy"
   RSURGSTR = "Whether R is Surgically Sterile at Interview"
   PSURGSTR = "Whether R's Current H/P is Surgically Sterile at Interview"
   ONLYTBVS = "Whether R & H/P's Only Sterile Ops=Tubal or Vasectomy"
   RWANTRVT = "DC-5 R Wants to Reverse Her Tubal Ligation"
   MANWANTT = "DC-6 R's H/P Wants R to Reverse Her Tubal Ligation"
   RWANTREV = "DC-7 R Wants H/P to Reverse His Vasectomy"
   MANWANTR = "DC-8 R's H/P Wants to Reverse His Vasectomy"
   POSIBLPG = "DE-1 Physically Possible for R to Have a Baby"
   REASIMPR = "DE-2 Why Impossible for R to Have a Baby"
   POSIBLMN = "DE-3 Physically Possible for R's Current H/P to Father a Baby"
   REASIMPP = "DE-4 Why Impossible for R's Current H/P to Father a Baby"
   CANHAVER = "DF-1 Physically Difficult for R to Have a Baby"
   REASDIFF1 = "DF-2 Why Physically Difficult for R to Have Baby-1st mention"
   REASDIFF2 = "DF-2 Why Physically Difficult for R to Have Baby-2nd mention"
   REASDIFF3 = "DF-2 Why Physically Difficult for R to Have Baby-3rd mention"
   CANHAVEM = "DF-3 R's Current H/P Has Physical Difficulty Fathering a Baby"
   PREGNONO = "DF-4 Doctor Ever Advised R Never to Become Pregnant"
   REASNONO1 = "DF-5 Why R was Advised Against Pregnancy-1st mention"
   REASNONO2 = "DF-5 Why R was Advised Against Pregnancy-2nd mention"
   REASNONO3 = "DF-5 Why R was Advised Against Pregnancy-3rd mention"
   RSTRSTAT = "R's Sterility Status at Time of Interview"
   PSTRSTAT = "R's Current H/P's Sterility Status at Time of Interview"
   PILL = "EA-1 R ever used Birth Control Pills?"
   CONDOM = "EA-2 R ever used Condoms?"
   VASECTMY = "EA-3 R ever used partner's vasectomy?"
   DEPOPROV = "EA-4 R ever used Depo-Provera, Injectables?"
   WIDRAWAL = "EA-6 R ever used withdrawal?"
   RHYTHM = "EA-7 R ever used calendar rhythm method?"
   SDAYCBDS = "EA-7b R ever used Standard Days or CycleBeads method?"
   TEMPSAFE = "EA-8 R ever used symptothermal method?"
   PATCH = "EA-9 R ever used contraceptive patch?"
   RING = "EA-10 R ever used vaginal contraceptive ring or "NuvaRing"?"
   MORNPILL = "EA-11 R ever used emergency contraception?"
   ECTIMESX = "EA-12 Number of times R used emergency contraception"
   ECREASON1 = "EA-13 Reason R Used Emergency Contraception-1st Reason"
   ECREASON2 = "EA-13 Reason R Used Emergency Contraception-2nd Reason"
   ECREASON3 = "EA-13 Reason R Used Emergency Contraception-3rd Reason"
   ECRX = "EA-13aa Get emergency contraception with or without prescription?"
   ECWHERE = "EA-13a Where R last got emergency contraception"
   ECWHEN = "EA-13b R last got emergency contraception within past 12 mons or longer ago"
   OTHRMETH01 = "EA-14 Which other method ever used(if any)? - 1st mention"
   OTHRMETH02 = "EA-14 Which other method ever used(if any)? - 2nd mention"
   OTHRMETH03 = "EA-14 Which other method ever used(if any)? - 3rd mention"
   OTHRMETH04 = "EA-14 Which other method ever used(if any)? - 4th mention"
   OTHRMETH05 = "EA-14 Which other method ever used(if any)? - 5th mention"
   OTHRMETH06 = "EA-14 Which other method ever used(if any)? - 6th mention"
   OTHRMETH07 = "EA-14 Which other method ever used(if any)? - 7th mention"
   EVIUDTYP1 = "EA-15a Types of IUD ever used - 1st mention"
   EVIUDTYP2 = "EA-15a Types of IUD ever used - 2nd mention"
   NEWMETH = "Code for other method specified in EA-15 SP_OTHRMETH"
   EVERUSED = "R ever used any method (from EA  series & sterilization info from D)"
   METHDISS = "EA-16 R ever stop using method because dissatisfied with it"
   METHSTOP01 = "EA-17 Method Stopped Using Due to Dissatisfaction-1st Method"
   METHSTOP02 = "EA-17 Method Stopped Using Due to Dissatisfaction-2nd Method"
   METHSTOP03 = "EA-17 Method Stopped Using Due to Dissatisfaction-3rd Method"
   METHSTOP04 = "EA-17 Method Stopped Using Due to Dissatisfaction-4th Method"
   METHSTOP05 = "EA-17 Method Stopped Using Due to Dissatisfaction-5th Method"
   METHSTOP06 = "EA-17 Method Stopped Using Due to Dissatisfaction-6th Method"
   METHSTOP07 = "EA-17 Method Stopped Using Due to Dissatisfaction-7th Method"
   METHSTOP08 = "EA-17 Method Stopped Using Due to Dissatisfaction-8th Method"
   METHSTOP09 = "EA-17 Method Stopped Using Due to Dissatisfaction-9th Method"
   METHSTOP10 = "EA-17 Method Stopped Using Due to Dissatisfaction-10th Method"
   WHENPILL = "EA-17a If discontinued pill within past 12 months"
   REASPILL01 = "EA-18 Reason not satisfied with the pill - 1st mention"
   REASPILL02 = "EA-18 Reason not satisfied with the pill - 2nd mention"
   REASPILL03 = "EA-18 Reason not satisfied with the pill - 3rd mention"
   REASPILL04 = "EA-18 Reason not satisfied with the pill - 4th mention"
   REASPILL05 = "EA-18 Reason not satisfied with the pill - 5th mention"
   REASPILL06 = "EA-18 Reason not satisfied with the pill - 6th mention"
   REASPILL07 = "EA-18 Reason not satisfied with the pill - 7th mention"
   STOPPILL1 = "Open-ended response to reason(s) for discontinuation of pill: 1st mention"
   STOPPILL2 = "Open-ended response to reason(s) for discontinuation of pill: 2nd mention"
   STOPPILL3 = "Open-ended response to reason(s) for discontinuation of pill: 3rd mention"
   STOPPILL4 = "Open-ended response to reason(s) for discontinuation of pill: 4th mention"
   STOPPILL5 = "Open-ended response to reason(s) for discontinuation of pill: 5th mention"
   STOPPILL6 = "Open-ended response to reason(s) for discontinuation of pill: 6th mention"
   WHENCOND = "EA-18e If discontinued condom within past 12 months"
   REASCOND01 = "EA-19 Reason not satisfied with condom - 1st mention"
   REASCOND02 = "EA-19 Reason not satisfied with condom - 2nd mention"
   REASCOND03 = "EA-19 Reason not satisfied with condom - 3rd mention"
   REASCOND04 = "EA-19 Reason not satisfied with condom - 4th mention"
   REASCOND05 = "EA-19 Reason not satisfied with condom - 5th mention"
   REASCOND06 = "EA-19 Reason not satisfied with condom - 6th mention"
   REASCOND07 = "EA-19 Reason not satisfied with condom - 7th mention"
   STOPCOND1 = "Open-ended response to reason(s) for discontinuation of condom: 1st mention"
   STOPCOND2 = "Open-ended response to reason(s) for discontinuation of condom: 2nd mention"
   WHENIUD = "EA-20e If discontinued IUD within past 12 months"
   TYPEIUD_1 = "EA-21 Type of IUD that was discontinued due to dissatisfaction - 1st mention"
   TYPEIUD_2 = "EA-21 Type of IUD that was discontinued due to dissatisfaction - 2nd mention"
   REASIUD01 = "EA-21a Reason not satisfied with IUD - 1st mention"
   REASIUD02 = "EA-21a Reason not satisfied with IUD - 2nd mention"
   REASIUD03 = "EA-21a Reason not satisfied with IUD - 3rd mention"
   REASIUD04 = "EA-21a Reason not satisfied with IUD - 4th mention"
   REASIUD05 = "EA-21a Reason not satisfied with IUD - 5th mention"
   REASIUD06 = "EA-21a Reason not satisfied with IUD - 6th mention"
   REASIUD07 = "EA-21a Reason not satisfied with IUD - 7th mention"
   REASIUD08 = "EA-21a Reason not satisfied with IUD - 8th mention"
   STOPIUD1 = "Open-ended response to reason(s) for discontinuation of IUD: 1st mention"
   STOPIUD2 = "Open-ended response to reason(s) for discontinuation of IUD: 2nd mention"
   STOPIUD3 = "Open-ended response to reason(s) for discontinuation of IUD: 3rd mention"
   STOPIUD4 = "Open-ended response to reason(s) for discontinuation of IUD: 4th mention"
   STOPIUD5 = "Open-ended response to reason(s) for discontinuation of IUD: 5th mention"
   FIRSMETH1 = "EB-1 First method ever used - 1st mention"
   FIRSMETH2 = "EB-1 First method ever used - 2nd mention"
   FIRSMETH3 = "EB-1 First method ever used - 3rd mention"
   FIRSMETH4 = "EB-1 First method ever used - 4th mention"
   NUMFIRSM = "Total number of responses in EB-1 FIRSMETH"
   DRUGDEV = "Yes if 1st method was drug or device, no otherwise (1st meth)"
   DRUGDEV2 = "Yes if 1st method was drug or device, no otherwise (2nd meth)"
   DRUGDEV3 = "Yes if 1st method was drug or device, no otherwise (3rd meth)"
   DRUGDEV4 = "Yes if 1st method was drug or device, no otherwise (4th meth)"
   FIRSTIME1 = "EB-2 when 1st method use vis-a-vis 1st sex (noncontinuous meth)"
   FIRSTIME2 = "EB-2 when first method use vis-a-vis 1st sex (continuous method)"
   USEFSTSX = "Whether R used a method at first sex (total universe)"
   CMFIRSM = "CM for date of first method use (total universe)"
   MTHFSTSX1 = "Method used at first sex-1st mention (tot universe)"
   MTHFSTSX2 = "Method used at first sex-2nd mention (tot universe)"
   MTHFSTSX3 = "Method used at first sex-3rd mention (tot universe)"
   MTHFSTSX4 = "Method used at first sex-4th mention (tot universe)"
   WNFSTUSE_M = "EB-3 Month R First Used a Method"
   WNFSTUSE_Y = "EB-3 Year R First Used a Method"
   CMFSTUSE = "Century month for date first used a method (if not at first sex) (partial univ)"
   FMETHPRS = "Whether 1st method prescrip or non prescrip (1st meth)"
   FMETHPRS2 = "Whether 1st method prescrip or non prescrip (2nd meth)"
   FMETHPRS3 = "Whether 1st method prescrip or non prescrip (3rd meth)"
   FMETHPRS4 = "Whether 1st method prescrip or non prescrip (4th meth)"
   AGEFSTUS = "EB-4 Age When First Used Method"
   PLACGOTF = "EB-5 Where R Got 1st Method-1st method mentioned"
   PLACGOTF2 = "EB-5 Where R Got 1st Method-2nd method mentioned"
   PLACGOTF3 = "EB-5 Where R Got 1st Method-3rd method mentioned"
   PLACGOTF4 = "EB-5 Where R Got 1st Method-4th method mentioned"
   USEFRSTS = "EB-6 R Use Any Method at First Sex (1st meth use was bef 1st sx)"
   MTHFRSTS1 = "EB-8 Method Used at  First Sex (1st meth use was bef 1st sx) -1st mention"
   MTHFRSTS2 = "EB-8 Method Used at  First Sex (1st meth use was bef 1st sx) -2nd mention"
   MTHFRSTS3 = "EB-8 Method Used at  First Sex (1st meth use was bef 1st sx) -3rd mention"
   MTHFRSTS4 = "EB-8 Method Used at  First Sex (1st meth use was bef 1st sx) -4th mention"
   INTR_EC3 = "EC-3 Any times since [Jan,intvw yr-3/date 1st sex] no sex for 1  mon?"
   CMMONSX = "Century month of this entry in the months of nonintercourse series (Jan, intvw yr-3)"
   MONSX = "EC-8 Sex in January [intvw yr-3]?"
   CMMONSX2 = "Century month of this entry in the months of nonintercourse series (Feb, intvw yr-3)"
   MONSX2 = "EC-8 Sex in February [intvw yr-3]?"
   CMMONSX3 = "Century month of this entry in the months of nonintercourse series (March, intvw yr-3)"
   MONSX3 = "EC-8 Sex in March [intvw yr-3]?"
   CMMONSX4 = "Century month of this entry in the months of nonintercourse series (April, intvw yr-3)"
   MONSX4 = "EC-8 Sex in April [intvw yr-3]?"
   CMMONSX5 = "Century month of this entry in the months of nonintercourse series (May, intvw yr-3)"
   MONSX5 = "EC-8 Sex in May [intvw yr-3]?"
   CMMONSX6 = "Century month of this entry in the months of nonintercourse series (June, intvw yr-3)"
   MONSX6 = "EC-8 Sex in June [intvw yr-3]?"
   CMMONSX7 = "Century month of this entry in the months of nonintercourse series (July, intvw yr-3)"
   MONSX7 = "EC-8 Sex in July [intvw yr-3]?"
   CMMONSX8 = "Century month of this entry in the months of nonintercourse series (Aug, intvw yr-3)"
   MONSX8 = "EC-8 Sex in August [intvw yr-3]?"
   CMMONSX9 = "Century month of this entry in the months of nonintercourse series (Sept, intvw yr-3)"
   MONSX9 = "EC-8 Sex in September [intvw yr-3]?"
   CMMONSX10 = "Century month of this entry in the months of nonintercourse series (Oct, intvw yr-3)"
   MONSX10 = "EC-8 Sex in October [intvw yr-3]?"
   CMMONSX11 = "Century month of this entry in the months of nonintercourse series (Nov, intvw yr-3)"
   MONSX11 = "EC-8 Sex in November [intvw yr-3]?"
   CMMONSX12 = "Century month of this entry in the months of nonintercourse series (Dec, intvw yr-3)"
   MONSX12 = "EC-8 Sex in December [intvw yr-3]?"
   CMMONSX13 = "Century month of this entry in the months of nonintercourse series (Jan, intvw yr-2)"
   MONSX13 = "EC-8 Sex in January [intvw yr-2]?"
   CMMONSX14 = "Century month of this entry in the months of nonintercourse series (Feb, intvw yr-2)"
   MONSX14 = "EC-8 Sex in February [intvw yr-2]?"
   CMMONSX15 = "Century month of this entry in the months of nonintercourse series (March, intvw yr-2)"
   MONSX15 = "EC-8 Sex in March [intvw yr-2]?"
   CMMONSX16 = "Century month of this entry in the months of nonintercourse series (April, intvw yr-2)"
   MONSX16 = "EC-8 Sex in April [intvw yr-2]?"
   CMMONSX17 = "Century month of this entry in the months of nonintercourse series (May, intvw yr-2)"
   MONSX17 = "EC-8 Sex in May [intvw yr-2]?"
   CMMONSX18 = "Century month of this entry in the months of nonintercourse series (June, intvw yr-2)"
   MONSX18 = "EC-8 Sex in June [intvw yr-2]?"
   CMMONSX19 = "Century month of this entry in the months of nonintercourse series (July, intvw yr-2)"
   MONSX19 = "EC-8 Sex in July [intvw yr-2]?"
   CMMONSX20 = "Century month of this entry in the months of nonintercourse series (Aug, intvw yr-2)"
   MONSX20 = "EC-8 Sex in August [intvw yr-2]?"
   CMMONSX21 = "Century month of this entry in the months of nonintercourse series (Sept, intvw yr-2)"
   MONSX21 = "EC-8 Sex in September [intvw yr-2]?"
   CMMONSX22 = "Century month of this entry in the months of nonintercourse series (Oct, intvw yr-2)"
   MONSX22 = "EC-8 Sex in October [intvw yr-2]?"
   CMMONSX23 = "Century month of this entry in the months of nonintercourse series (Nov, intvw yr-2)"
   MONSX23 = "EC-8 Sex in November [intvw yr-2]?"
   CMMONSX24 = "Century month of this entry in the months of nonintercourse series (Dec, intvw yr-2)"
   MONSX24 = "EC-8 Sex in December [intvw yr-2]?"
   CMMONSX25 = "Century month of this entry in the months of nonintercourse series (Jan, intvw yr-1)"
   MONSX25 = "EC-8 Sex in January [intvw yr-1]?"
   CMMONSX26 = "Century month of this entry in the months of nonintercourse series (Feb, intvw yr-1)"
   MONSX26 = "EC-8 Sex in February [intvw yr-1]?"
   CMMONSX27 = "Century month of this entry in the months of nonintercourse series (March, intvw yr-1)"
   MONSX27 = "EC-8 Sex in March [intvw yr-1]?"
   CMMONSX28 = "Century month of this entry in the months of nonintercourse series (April, intvw yr-1)"
   MONSX28 = "EC-8 Sex in April [intvw yr-1]?"
   CMMONSX29 = "Century month of this entry in the months of nonintercourse series (May, intvw yr-1)"
   MONSX29 = "EC-8 Sex in May [intvw yr-1]?"
   CMMONSX30 = "Century month of this entry in the months of nonintercourse series (June, intvw yr-1)"
   MONSX30 = "EC-8 Sex in June [intvw yr-1]?"
   CMMONSX31 = "Century month of this entry in the months of nonintercourse series (July, intvw yr-1)"
   MONSX31 = "EC-8 Sex in July [intvw yr-1]?"
   CMMONSX32 = "Century month of this entry in the months of nonintercourse series (Aug, intvw yr-1)"
   MONSX32 = "EC-8 Sex in August [intvw yr-1]?"
   CMMONSX33 = "Century month of this entry in the months of nonintercourse series (Sept, intvw yr-1)"
   MONSX33 = "EC-8 Sex in September [intvw yr-1]?"
   CMMONSX34 = "Century month of this entry in the months of nonintercourse series (Oct, intvw yr-1)"
   MONSX34 = "EC-8 Sex in October [intvw yr-1]?"
   CMMONSX35 = "Century month of this entry in the months of nonintercourse series (Nov, intvw yr-1)"
   MONSX35 = "EC-8 Sex in November [intvw yr-1]?"
   CMMONSX36 = "Century month of this entry in the months of nonintercourse series (Dec, intvw yr-1)"
   MONSX36 = "EC-8 Sex in December [intvw yr-1]?"
   CMMONSX37 = "Century month of this entry in the months of nonintercourse series (Jan, intvw yr)"
   MONSX37 = "EC-8 Sex in January [intvw yr]?"
   CMMONSX38 = "Century month of this entry in the months of nonintercourse series (Feb, intvw yr)"
   MONSX38 = "EC-8 Sex in February [intvw yr]?"
   CMMONSX39 = "Century month of this entry in the months of nonintercourse series (March, intvw yr)"
   MONSX39 = "EC-8 Sex in March [intvw yr]?"
   CMMONSX40 = "Century month of this entry in the months of nonintercourse series (April, intvw yr)"
   MONSX40 = "EC-8 Sex in April [intvw yr]?"
   CMMONSX41 = "Century month of this entry in the months of nonintercourse series (May, intvw yr)"
   MONSX41 = "EC-8 Sex in May [intvw yr]?"
   CMMONSX42 = "Century month of this entry in the months of nonintercourse series (June, intvw yr)"
   MONSX42 = "EC-8 Sex in June [intvw yr]?"
   CMMONSX43 = "Century month of this entry in the months of nonintercourse series (July, intvw yr)"
   MONSX43 = "EC-8 Sex in July [intvw yr]?"
   CMMONSX44 = "Century month of this entry in the months of nonintercourse series (Aug, intvw yr)"
   MONSX44 = "EC-8 Sex in August [intvw yr]?"
   CMMONSX45 = "Century month of this entry in the months of nonintercourse series (Sept, intvw yr)"
   MONSX45 = "EC-8 Sex in September [intvw yr]?"
   CMMONSX46 = "Century month of this entry in the months of nonintercourse series (Oct, intvw yr)"
   MONSX46 = "EC-8 Sex in October [intvw yr]?"
   CMMONSX47 = "Century month of this entry in the months of nonintercourse series (Nov, intvw yr)"
   MONSX47 = "EC-8 Sex in November [intvw yr]?"
   CMMONSX48 = "Century month of this entry in the months of nonintercourse series (Dec, intvw yr)"
   MONSX48 = "EC-8 Sex in December [intvw yr]?"
   CMSTRTMC = "Century month for date of starting month of method calendar"
   CMENDMC = "Century month for date of ending month of method calendar"
   INTR_ED4a = "ED-4a For Rs who had hysterectomies before start of meth cal: use any method since Jan [interview yr - 3]/start of method calendar]?"
   NUMMCMON = "Number of months of meth. calendar asked about"
   MC1MONS1 = "ED-9a # of months using method specified in 1st MC month (one method mentioned)"
   MC1SIMSQ = "ED-9b Using methods in 1st MC month at same or diff times (2+ methods mentioned)"
   MC1MONS2 = "ED-9c # of months using methods together (1st MC month) (2+ methods mentioned, used at same time)"
   MC1MONS3 = "ED-9d # of months using method combinations (1st MC month) (2+ methods mentioned, used at diff times)"
   DATBEGIN_M = "ED-9 Month R Began Using method/method combo used in Jan [interview yr-3]"
   DATBEGIN_Y = "ED-9 Year R Began Using method/method combo used in Jan [interview yr-3]"
   CMDATBEGIN = "CM date  R Began Using method/method combo used in Jan [interview yr-3]"
   CURRMETH1 = "Method used in month of interview (1st mention)"
   CURRMETH2 = "Method used in month of interview (2nd mention)"
   CURRMETH3 = "Method used in month of interview (3rd mention)"
   CURRMETH4 = "Method used in month of interview (4th mention)"
   LSTMONMETH1 = "Method used in month before interview (1st mention)"
   LSTMONMETH2 = "Method used in month before interview (2nd mention)"
   LSTMONMETH3 = "Method used in month before interview (3rd mention)"
   LSTMONMETH4 = "Method used in month before interview (4th mention)"
   PILL_12 = "FC E-55 R used pill in 12 mos before interview?"
   DIAPH_12 = "FC E-55 R used diaphragm in the 12 mos before interview?"
   IUD_12 = "FC E-55 R used IUD in the 12 mos before interview?"
   IMPLANT_12 = "FC E-55 R used hormonal implants (Norplant or Implanon) in 12 mos before interview?"
   DEPO_12 = "FC E-55 R used Depo-provera injectables in the 12 mos before interview?"
   CERVC_12 = "FC E-55 R used cervical cap in the 12 mos before interview"
   MPILL_12 = "FC E-55 R used emergency contraceptive in the 12 mos before interview?"
   PATCH_12 = "FC E-55 R used contraceptive patch in the 12 mos before interview?"
   RING_12 = "FC E-55 R used contraceptive ring in the 12 mos before interview?"
   METHX1 = "ED-6 Method(s) used in Jan [interview yr-3] - 1st mention"
   METHX2 = "ED-6 Method(s) used in Jan [interview yr-3]-2nd mention"
   METHX3 = "ED-6 Method(s) used in Jan [interview yr-3]-3rd mention"
   METHX4 = "ED-6 Method(s) used in Jan [interview yr-3]-4th mention"
   METHX5 = "ED-6 Method(s) used in Feb [interview yr-3] - 1st mention"
   METHX6 = "ED-6 Method(s) used in Feb [interview yr-3]-2nd mention"
   METHX7 = "ED-6 Method(s) used in Feb [interview yr-3] - 3rd mention"
   METHX8 = "ED-6 Method(s) used in Feb [interview yr-3]-4th mention"
   METHX9 = "ED-6 Method(s) used in March [interview yr-3] - 1st mention"
   METHX10 = "ED-6 Method(s) used in March [interview yr-3]-2nd mention"
   METHX11 = "ED-6 Method(s) used in March [interview yr-3] - 3rd mention"
   METHX12 = "ED-6 Method(s) used in March [interview yr-3]-4th mention"
   METHX13 = "ED-6 Method(s) used in April [interview yr-3] - 1st mention"
   METHX14 = "ED-6 Method(s) used in April [interview yr-3]-2nd mention"
   METHX15 = "ED-6 Method(s) used in April [interview yr-3] - 3rd mention"
   METHX16 = "ED-6 Method(s) used in April [interview yr-3]-4th mention"
   METHX17 = "ED-6 Method(s) used in May [interview yr-3] - 1st mention"
   METHX18 = "ED-6 Method(s) used in May [interview yr-3]-2nd mention"
   METHX19 = "ED-6 Method(s) used in May [interview yr-3] - 3rd mention"
   METHX20 = "ED-6 Method(s) used in May [interview yr-3]-4th mention"
   METHX21 = "ED-6 Method(s) used in June [interview yr-3] - 1st mention"
   METHX22 = "ED-6 Method(s) used in June [interview yr-3]-2nd mention"
   METHX23 = "ED-6 Method(s) used in June [interview yr-3] - 3rd mention"
   METHX24 = "ED-6 Method(s) used in June [interview yr-3]-4th mention"
   METHX25 = "ED-6 Method(s) used in July [interview yr-3] - 1st mention"
   METHX26 = "ED-6 Method(s) used in July [interview yr-3]-2nd mention"
   METHX27 = "ED-6 Method(s) used in July [interview yr-3] - 3rd mention"
   METHX28 = "ED-6 Method(s) used in July [interview yr-3]-4th mention"
   METHX29 = "ED-6 Method(s) used in Aug [interview yr-3] - 1st mention"
   METHX30 = "ED-6 Method(s) used in Aug [interview yr-3]-2nd mention"
   METHX31 = "ED-6 Method(s) used in Aug [interview yr-3] - 3rd mention"
   METHX32 = "ED-6 Method(s) used in Aug [interview yr-3]-4th mention"
   METHX33 = "ED-6 Method(s) used in Sept [interview yr-3] - 1st mention"
   METHX34 = "ED-6 Method(s) used in Sept [interview yr-3]-2nd mention"
   METHX35 = "ED-6 Method(s) used in Sept [interview yr-3] - 3rd mention"
   METHX36 = "ED-6 Method(s) used in Sept [interview yr-3]-4th mention"
   METHX37 = "ED-6 Method(s) used in Oct [interview yr-3] - 1st mention"
   METHX38 = "ED-6 Method(s) used in Oct [interview yr-3]-2nd mention"
   METHX39 = "ED-6 Method(s) used in Oct [interview yr-3] - 3rd mention"
   METHX40 = "ED-6 Method(s) used in Oct [interview yr-3]-4th mention"
   METHX41 = "ED-6 Method(s) used in Nov [interview yr-3] - 1st mention"
   METHX42 = "ED-6 Method(s) used in Nov [interview yr-3]-2nd mention"
   METHX43 = "ED-6 Method(s) used in Nov [interview yr-3] - 3rd mention"
   METHX44 = "ED-6 Method(s) used in Nov [interview yr-3]-4th mention"
   METHX45 = "ED-6 Method(s) used in Dec [interview yr-3] - 1st mention"
   METHX46 = "ED-6 Method(s) used in Dec [interview yr-3]-2nd mention"
   METHX47 = "ED-6 Method(s) used in Dec [interview yr-3] - 3rd mention"
   METHX48 = "ED-6 Method(s) used in Dec [interview yr-3]-4th mention"
   METHX49 = "ED-6 Method(s) used in Jan [interview yr-2] - 1st mention"
   METHX50 = "ED-6 Method(s) used in Jan [interview yr-2]-2nd mention"
   METHX51 = "ED-6 Method(s) used in Jan [interview yr-2]-3rd mention"
   METHX52 = "ED-6 Method(s) used in Jan [interview yr-2]-4th mention"
   METHX53 = "ED-6 Method(s) used in Feb [interview yr-2] - 1st mention"
   METHX54 = "ED-6 Method(s) used in Feb [interview yr-2]-2nd mention"
   METHX55 = "ED-6 Method(s) used in Feb [interview yr-2] - 3rd mention"
   METHX56 = "ED-6 Method(s) used in Feb [interview yr-2]-4th mention"
   METHX57 = "ED-6 Method(s) used in March [interview yr-2] - 1st mention"
   METHX58 = "ED-6 Method(s) used in March [interview yr-2]-2nd mention"
   METHX59 = "ED-6 Method(s) used in March [interview yr-2] - 3rd mention"
   METHX60 = "ED-6 Method(s) used in March [interview yr-2]-4th mention"
   METHX61 = "ED-6 Method(s) used in April [interview yr-2] - 1st mention"
   METHX62 = "ED-6 Method(s) used in April [interview yr-2]-2nd mention"
   METHX63 = "ED-6 Method(s) used in April [interview yr-2] - 3rd mention"
   METHX64 = "ED-6 Method(s) used in April [interview yr-2]-4th mention"
   METHX65 = "ED-6 Method(s) used in May [interview yr-2] - 1st mention"
   METHX66 = "ED-6 Method(s) used in May [interview yr-2]-2nd mention"
   METHX67 = "ED-6 Method(s) used in May [interview yr-2] - 3rd mention"
   METHX68 = "ED-6 Method(s) used in May [interview yr-2]-4th mention"
   METHX69 = "ED-6 Method(s) used in June [interview yr-2] - 1st mention"
   METHX70 = "ED-6 Method(s) used in June [interview yr-2]-2nd mention"
   METHX71 = "ED-6 Method(s) used in June [interview yr-2] - 3rd mention"
   METHX72 = "ED-6 Method(s) used in June [interview yr-2]-4th mention"
   METHX73 = "ED-6 Method(s) used in July [interview yr-2] - 1st mention"
   METHX74 = "ED-6 Method(s) used in July [interview yr-2]-2nd mention"
   METHX75 = "ED-6 Method(s) used in July [interview yr-2] - 3rd mention"
   METHX76 = "ED-6 Method(s) used in July [interview yr-2]-4th mention"
   METHX77 = "ED-6 Method(s) used in Aug [interview yr-2] - 1st mention"
   METHX78 = "ED-6 Method(s) used in Aug [interview yr-2]-2nd mention"
   METHX79 = "ED-6 Method(s) used in Aug [interview yr-2] - 3rd mention"
   METHX80 = "ED-6 Method(s) used in Aug [interview yr-2]-4th mention"
   METHX81 = "ED-6 Method(s) used in Sept [interview yr-2] - 1st mention"
   METHX82 = "ED-6 Method(s) used in Sept [interview yr-2]-2nd mention"
   METHX83 = "ED-6 Method(s) used in Sept [interview yr-2] - 3rd mention"
   METHX84 = "ED-6 Method(s) used in Sept [interview yr-2]-4th mention"
   METHX85 = "ED-6 Method(s) used in Oct [interview yr-2] - 1st mention"
   METHX86 = "ED-6 Method(s) used in Oct [interview yr-2]-2nd mention"
   METHX87 = "ED-6 Method(s) used in Oct [interview yr-2] - 3rd mention"
   METHX88 = "ED-6 Method(s) used in Oct [interview yr-2]-4th mention"
   METHX89 = "ED-6 Method(s) used in Nov [interview yr-2] - 1st mention"
   METHX90 = "ED-6 Method(s) used in Nov [interview yr-2]-2nd mention"
   METHX91 = "ED-6 Method(s) used in Nov [interview yr-2] - 3rd mention"
   METHX92 = "ED-6 Method(s) used in Nov [interview yr-2]-4th mention"
   METHX93 = "ED-6 Method(s) used in Dec [interview yr-2] - 1st mention"
   METHX94 = "ED-6 Method(s) used in Dec [interview yr-2]-2nd mention"
   METHX95 = "ED-6 Method(s) used in Dec [interview yr-2] - 3rd mention"
   METHX96 = "ED-6 Method(s) used in Dec [interview yr-2]-4th mention"
   METHX97 = "ED-6 Method(s) used in Jan [interview yr-1] - 1st mention"
   METHX98 = "ED-6 Method(s) used in Jan [interview yr-1]-2nd mention"
   METHX99 = "ED-6 Method(s) used in Jan [interview yr-1]-3rd mention"
   METHX100 = "ED-6 Method(s) used in Jan [interview yr-1]-4th mention"
   METHX101 = "ED-6 Method(s) used in Feb [interview yr-1] - 1st mention"
   METHX102 = "ED-6 Method(s) used in Feb [interview yr-1]-2nd mention"
   METHX103 = "ED-6 Method(s) used in Feb [interview yr-1] - 3rd mention"
   METHX104 = "ED-6 Method(s) used in Feb [interview yr-1]-4th mention"
   METHX105 = "ED-6 Method(s) used in March [interview yr-1] - 1st mention"
   METHX106 = "ED-6 Method(s) used in March [interview yr-1]-2nd mention"
   METHX107 = "ED-6 Method(s) used in March [interview yr-1] - 3rd mention"
   METHX108 = "ED-6 Method(s) used in March [interview yr-1]-4th mention"
   METHX109 = "ED-6 Method(s) used in April [interview yr-1] - 1st mention"
   METHX110 = "ED-6 Method(s) used in April [interview yr-1]-2nd mention"
   METHX111 = "ED-6 Method(s) used in April [interview yr-1] - 3rd mention"
   METHX112 = "ED-6 Method(s) used in April [interview yr-1]-4th mention"
   METHX113 = "ED-6 Method(s) used in May [interview yr-1] - 1st mention"
   METHX114 = "ED-6 Method(s) used in May [interview yr-1]-2nd mention"
   METHX115 = "ED-6 Method(s) used in May [interview yr-1] - 3rd mention"
   METHX116 = "ED-6 Method(s) used in May [interview yr-1]-4th mention"
   METHX117 = "ED-6 Method(s) used in June [interview yr-1] - 1st mention"
   METHX118 = "ED-6 Method(s) used in June [interview yr-1]-2nd mention"
   METHX119 = "ED-6 Method(s) used in June [interview yr-1] - 3rd mention"
   METHX120 = "ED-6 Method(s) used in June [interview yr-1]-4th mention"
   METHX121 = "ED-6 Method(s) used in July [interview yr-1] - 1st mention"
   METHX122 = "ED-6 Method(s) used in July [interview yr-1]-2nd mention"
   METHX123 = "ED-6 Method(s) used in July [interview yr-1] - 3rd mention"
   METHX124 = "ED-6 Method(s) used in July [interview yr-1]-4th mention"
   METHX125 = "ED-6 Method(s) used in Aug [interview yr-1] - 1st mention"
   METHX126 = "ED-6 Method(s) used in Aug [interview yr-1]-2nd mention"
   METHX127 = "ED-6 Method(s) used in Aug [interview yr-1] - 3rd mention"
   METHX128 = "ED-6 Method(s) used in Aug [interview yr-1]-4th mention"
   METHX129 = "ED-6 Method(s) used in Sept [interview yr-1] - 1st mention"
   METHX130 = "ED-6 Method(s) used in Sept [interview yr-1]-2nd mention"
   METHX131 = "ED-6 Method(s) used in Sept [interview yr-1] - 3rd mention"
   METHX132 = "ED-6 Method(s) used in Sept [interview yr-1]-4th mention"
   METHX133 = "ED-6 Method(s) used in Oct [interview yr-1] - 1st mention"
   METHX134 = "ED-6 Method(s) used in Oct [interview yr-1]-2nd mention"
   METHX135 = "ED-6 Method(s) used in Oct [interview yr-1] - 3rd mention"
   METHX136 = "ED-6 Method(s) used in Oct [interview yr-1]-4th mention"
   METHX137 = "ED-6 Method(s) used in Nov [interview yr-1] - 1st mention"
   METHX138 = "ED-6 Method(s) used in Nov [interview yr-1]-2nd mention"
   METHX139 = "ED-6 Method(s) used in Nov [interview yr-1] - 3rd mention"
   METHX140 = "ED-6 Method(s) used in Nov [interview yr-1]-4th mention"
   METHX141 = "ED-6 Method(s) used in Dec [interview yr-1] - 1st mention"
   METHX142 = "ED-6 Method(s) used in Dec [interview yr-1]-2nd mention"
   METHX143 = "ED-6 Method(s) used in Dec [interview yr-1] - 3rd mention"
   METHX144 = "ED-6 Method(s) used in Dec [interview yr-1]-4th mention"
   METHX145 = "ED-6 Method(s) used in Jan [interview yr] - 1st mention"
   METHX146 = "ED-6 Method(s) used in Jan [interview yr]-2nd mention"
   METHX147 = "ED-6 Method(s) used in Jan [interview yr]-3rd mention"
   METHX148 = "ED-6 Method(s) used in Jan [interview yr]-4th mention"
   METHX149 = "ED-6 Method(s) used in Feb [interview yr] - 1st mention"
   METHX150 = "ED-6 Method(s) used in Feb [interview yr]-2nd mention"
   METHX151 = "ED-6 Method(s) used in Feb [interview yr] - 3rd mention"
   METHX152 = "ED-6 Method(s) used in Feb [interview yr]-4th mention"
   METHX153 = "ED-6 Method(s) used in March [interview yr] - 1st mention"
   METHX154 = "ED-6 Method(s) used in March [interview yr]-2nd mention"
   METHX155 = "ED-6 Method(s) used in March [interview yr] - 3rd mention"
   METHX156 = "ED-6 Method(s) used in March [interview yr]-4th mention"
   METHX157 = "ED-6 Method(s) used in April [interview yr] - 1st mention"
   METHX158 = "ED-6 Method(s) used in April [interview yr]-2nd mention"
   METHX159 = "ED-6 Method(s) used in April [interview yr] - 3rd mention"
   METHX160 = "ED-6 Method(s) used in April [interview yr]-4th mention"
   METHX161 = "ED-6 Method(s) used in May [interview yr] - 1st mention"
   METHX162 = "ED-6 Method(s) used in May [interview yr]-2nd mention"
   METHX163 = "ED-6 Method(s) used in May [interview yr] - 3rd mention"
   METHX164 = "ED-6 Method(s) used in May [interview yr]-4th mention"
   METHX165 = "ED-6 Method(s) used in June [interview yr] - 1st mention"
   METHX166 = "ED-6 Method(s) used in June [interview yr]-2nd mention"
   METHX167 = "ED-6 Method(s) used in June [interview yr] - 3rd mention"
   METHX168 = "ED-6 Method(s) used in June [interview yr]-4th mention"
   METHX169 = "ED-6 Method(s) used in July [interview yr] - 1st mention"
   METHX170 = "ED-6 Method(s) used in July [interview yr]-2nd mention"
   METHX171 = "ED-6 Method(s) used in July [interview yr] - 3rd mention"
   METHX172 = "ED-6 Method(s) used in July [interview yr]-4th mention"
   METHX173 = "ED-6 Method(s) used in Aug [interview yr] - 1st mention"
   METHX174 = "ED-6 Method(s) used in Aug [interview yr]-2nd mention"
   METHX175 = "ED-6 Method(s) used in Aug [interview yr] - 3rd mention"
   METHX176 = "ED-6 Method(s) used in Aug [interview yr]-4th mention"
   METHX177 = "ED-6 Method(s) used in Sept [interview yr] - 1st mention"
   METHX178 = "ED-6 Method(s) used in Sept [interview yr]-2nd mention"
   METHX179 = "ED-6 Method(s) used in Sept [interview yr] - 3rd mention"
   METHX180 = "ED-6 Method(s) used in Sept [interview yr]-4th mention"
   METHX181 = "ED-6 Method(s) used in Oct [interview yr] - 1st mention"
   METHX182 = "ED-6 Method(s) used in Oct [interview yr]-2nd mention"
   METHX183 = "ED-6 Method(s) used in Oct [interview yr] - 3rd mention"
   METHX184 = "ED-6 Method(s) used in Oct [interview yr]-4th mention"
   METHX185 = "ED-6 Method(s) used in Nov [interview yr] - 1st mention"
   METHX186 = "ED-6 Method(s) used in Nov [interview yr]-2nd mention"
   METHX187 = "ED-6 Method(s) used in Nov [interview yr] - 3rd mention"
   METHX188 = "ED-6 Method(s) used in Nov [interview yr]-4th mention"
   METHX189 = "ED-6 Method(s) used in Dec [interview yr] - 1st mention"
   METHX190 = "ED-6 Method(s) used in Dec [interview yr]-2nd mention"
   METHX191 = "ED-6 Method(s) used in Dec [interview yr] - 3rd mention"
   METHX192 = "ED-6 Method(s) used in Dec [interview yr]-4th mention"
   CMMHCALX1 = "Century month of Jan [interview yr-3] in the method history calendar"
   CMMHCALX2 = "Century month of  Feb [interview yr-3] in the method history calendar"
   CMMHCALX3 = "Century month of  March [interview yr-3] in the method history calendar"
   CMMHCALX4 = "Century month of  April [interview yr-3] in the method history calendar"
   CMMHCALX5 = "Century month of  May [interview yr-3] in the method history calendar"
   CMMHCALX6 = "Century month of  June [interview yr-3] in the method history calendar"
   CMMHCALX7 = "Century month of  July [interview yr-3] in the method history calendar"
   CMMHCALX8 = "Century month of  Aug [interview yr-3] in the method history calendar"
   CMMHCALX9 = "Century month of  Sept [interview yr-3] in the method history calendar"
   CMMHCALX10 = "Century month of  Oct [interview yr-3] in the method history calendar"
   CMMHCALX11 = "Century month of  Nov [interview yr-3] in the method history calendar"
   CMMHCALX12 = "Century month of  Dec [interview yr-3] in the method history calendar"
   CMMHCALX13 = "Century month of Jan [interview yr-2] in the method history calendar"
   CMMHCALX14 = "Century month of  Feb [interview yr-2] in the method history calendar"
   CMMHCALX15 = "Century month of  March [interview yr-2] in the method history calendar"
   CMMHCALX16 = "Century month of  April [interview yr-2] in the method history calendar"
   CMMHCALX17 = "Century month of  May [interview yr-2] in the method history calendar"
   CMMHCALX18 = "Century month of  June [interview yr-2] in the method history calendar"
   CMMHCALX19 = "Century month of  July [interview yr-2] in the method history calendar"
   CMMHCALX20 = "Century month of  Aug [interview yr-2] in the method history calendar"
   CMMHCALX21 = "Century month of  Sept [interview yr-2] in the method history calendar"
   CMMHCALX22 = "Century month of  Oct [interview yr-2] in the method history calendar"
   CMMHCALX23 = "Century month of  Nov [interview yr-2] in the method history calendar"
   CMMHCALX24 = "Century month of  Dec [interview yr-2] in the method history calendar"
   CMMHCALX25 = "Century month of Jan [interview yr-1] in the method history calendar"
   CMMHCALX26 = "Century month of  Feb [interview yr-1] in the method history calendar"
   CMMHCALX27 = "Century month of  March [interview yr-1] in the method history calendar"
   CMMHCALX28 = "Century month of  April [interview yr-1] in the method history calendar"
   CMMHCALX29 = "Century month of  May [interview yr-1] in the method history calendar"
   CMMHCALX30 = "Century month of  June [interview yr-1] in the method history calendar"
   CMMHCALX31 = "Century month of  July [interview yr-1] in the method history calendar"
   CMMHCALX32 = "Century month of  Aug [interview yr-1] in the method history calendar"
   CMMHCALX33 = "Century month of  Sept [interview yr-1] in the method history calendar"
   CMMHCALX34 = "Century month of  Oct [interview yr-1] in the method history calendar"
   CMMHCALX35 = "Century month of  Nov [interview yr-1] in the method history calendar"
   CMMHCALX36 = "Century month of  Dec [interview yr-1] in the method history calendar"
   CMMHCALX37 = "Century month of Jan [interview yr] in the method history calendar"
   CMMHCALX38 = "Century month of  Feb [interview yr] in the method history calendar"
   CMMHCALX39 = "Century month of  March [interview yr] in the method history calendar"
   CMMHCALX40 = "Century month of  April [interview yr] in the method history calendar"
   CMMHCALX41 = "Century month of  May [interview yr] in the method history calendar"
   CMMHCALX42 = "Century month of  June [interview yr] in the method history calendar"
   CMMHCALX43 = "Century month of  July [interview yr] in the method history calendar"
   CMMHCALX44 = "Century month of  Aug [interview yr] in the method history calendar"
   CMMHCALX45 = "Century month of  Sept [interview yr] in the method history calendar"
   CMMHCALX46 = "Century month of  Oct [interview yr] in the method history calendar"
   CMMHCALX47 = "Century month of  Nov [interview yr] in the method history calendar"
   CMMHCALX48 = "Century month of  Dec [interview yr] in the method history calendar"
   NUMMULTX1 = "Number of Methods Reported in Jan [interview yr-3]"
   NUMMULTX2 = "Number of Methods Reported in Feb [interview yr-3]"
   NUMMULTX3 = "Number of Methods Reported in March [interview yr-3]"
   NUMMULTX4 = "Number of Methods Reported in April [interview yr-3]"
   NUMMULTX5 = "Number of Methods Reported in May [interview yr-3]"
   NUMMULTX6 = "Number of Methods Reported in June [interview yr-3]"
   NUMMULTX7 = "Number of Methods Reported in July [interview yr-3]"
   NUMMULTX8 = "Number of Methods Reported in Aug [interview yr-3]"
   NUMMULTX9 = "Number of Methods Reported in Sept [interview yr-3]"
   NUMMULTX10 = "Number of Methods Reported in Oct [interview yr-3]"
   NUMMULTX11 = "Number of Methods Reported in Nov [interview yr-3]"
   NUMMULTX12 = "Number of Methods Reported in Dec [interview yr-3]"
   NUMMULTX13 = "Number of Methods Reported in Jan [interview yr-2]"
   NUMMULTX14 = "Number of Methods Reported in Feb [interview yr-2]"
   NUMMULTX15 = "Number of Methods Reported in March [interview yr-2]"
   NUMMULTX16 = "Number of Methods Reported in April [interview yr-2]"
   NUMMULTX17 = "Number of Methods Reported in May [interview yr-2]"
   NUMMULTX18 = "Number of Methods Reported in June [interview yr-2]"
   NUMMULTX19 = "Number of Methods Reported in July [interview yr-2]"
   NUMMULTX20 = "Number of Methods Reported in Aug [interview yr-2]"
   NUMMULTX21 = "Number of Methods Reported in Sept [interview yr-2]"
   NUMMULTX22 = "Number of Methods Reported in Oct [interview yr-2]"
   NUMMULTX23 = "Number of Methods Reported in Nov [interview yr-2]"
   NUMMULTX24 = "Number of Methods Reported in Dec [interview yr-2]"
   NUMMULTX25 = "Number of Methods Reported in Jan [interview yr-1]"
   NUMMULTX26 = "Number of Methods Reported in Feb [interview yr-1]"
   NUMMULTX27 = "Number of Methods Reported in March [interview yr-1]"
   NUMMULTX28 = "Number of Methods Reported in April [interview yr-1]"
   NUMMULTX29 = "Number of Methods Reported in May [interview yr-1]"
   NUMMULTX30 = "Number of Methods Reported in June [interview yr-1]"
   NUMMULTX31 = "Number of Methods Reported in July [interview yr-1]"
   NUMMULTX32 = "Number of Methods Reported in Aug [interview yr-1]"
   NUMMULTX33 = "Number of Methods Reported in Sept [interview yr-1]"
   NUMMULTX34 = "Number of Methods Reported in Oct [interview yr-1]"
   NUMMULTX35 = "Number of Methods Reported in Nov [interview yr-1]"
   NUMMULTX36 = "Number of Methods Reported in Dec [interview yr-1]"
   NUMMULTX37 = "Number of Methods Reported in Jan [interview yr]"
   NUMMULTX38 = "Number of Methods Reported in Feb [interview yr]"
   NUMMULTX39 = "Number of Methods Reported in March [interview yr]"
   NUMMULTX40 = "Number of Methods Reported in April [interview yr]"
   NUMMULTX41 = "Number of Methods Reported in May [interview yr]"
   NUMMULTX42 = "Number of Methods Reported in June [interview yr]"
   NUMMULTX43 = "Number of Methods Reported in July [interview yr]"
   NUMMULTX44 = "Number of Methods Reported in Aug [interview yr]"
   NUMMULTX45 = "Number of Methods Reported in Sept [interview yr]"
   NUMMULTX46 = "Number of Methods Reported in Oct [interview yr]"
   NUMMULTX47 = "Number of Methods Reported in Nov [interview yr]"
   NUMMULTX48 = "Number of Methods Reported in Dec [interview yr]"
   SALMX1 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Jan [interview yr-3]"
   SALMX2 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Feb [interview yr-3]"
   SALMX3 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST -Mar [interview yr-3]"
   SALMX4 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - April [interview yr-3]"
   SALMX5 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - May [interview yr-3]"
   SALMX6 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - June [interview yr-3]"
   SALMX7 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - July [interview yr-3]"
   SALMX8 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Aug [interview yr-3]"
   SALMX9 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Sept [interview yr-3]"
   SALMX10 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Oct [interview yr-3]"
   SALMX11 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Nov [interview yr-3]"
   SALMX12 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Dec [interview yr-3]"
   SALMX13 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Jan [interview yr-2]"
   SALMX14 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Feb [interview yr-2]"
   SALMX15 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Mar [interview yr-2]"
   SALMX16 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - April [interview yr-2]"
   SALMX17 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - May [interview yr-2]"
   SALMX18 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - June [interview yr-2]"
   SALMX19 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - July [interview yr-2]"
   SALMX20 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Aug [interview yr-2]"
   SALMX21 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Sept [interview yr-2]"
   SALMX22 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Oct [interview yr-2]"
   SALMX23 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Nov [interview yr-2]"
   SALMX24 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Dec [interview yr-2]"
   SALMX25 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Jan [interview yr-1]"
   SALMX26 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Feb [interview yr-1]"
   SALMX27 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Mar [interview yr-1]"
   SALMX28 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - April [interview yr-1]"
   SALMX29 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - May [interview yr-1]"
   SALMX30 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - June [interview yr-1]"
   SALMX31 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - July [interview yr-1]"
   SALMX32 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Aug [interview yr-1]"
   SALMX33 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Sept [interview yr-1]"
   SALMX34 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Oct [interview yr-1]"
   SALMX35 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Nov [interview yr-1]"
   SALMX36 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Dec [interview yr-1]"
   SALMX37 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Jan [interview yr]"
   SALMX38 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Feb [interview yr]"
   SALMX39 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Mar [interview yr]"
   SALMX40 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - April [interview yr]"
   SALMX41 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - May [interview yr]"
   SALMX42 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - June [interview yr]"
   SALMX43 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - July [interview yr]"
   SALMX44 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Aug [interview yr]"
   SALMX45 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Sept [interview yr]"
   SALMX46 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Oct [interview yr]"
   SALMX47 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Nov [interview yr]"
   SALMX48 = "Flag indicating whether " Same as last month"  was original answer to ED-6 METHHIST - Dec [interview yr]"
   SAYX1 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Jan [interview yr-3]"
   SAYX2 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Feb [interview yr-3]"
   SAYX3 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Mar [interview yr-3]"
   SAYX4 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - April [interview yr-3]"
   SAYX5 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - May [interview yr-3]"
   SAYX6 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - June [interview yr-3]"
   SAYX7 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - July [interview yr-3]"
   SAYX8 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Aug [interview yr-3]"
   SAYX9 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Sept [interview yr-3]"
   SAYX10 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Oct [interview yr-3]"
   SAYX11 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Nov [interview yr-3]"
   SAYX12 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Dec [interview yr-3]"
   SAYX13 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Jan [interview yr-2]"
   SAYX14 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Feb [interview yr-2]"
   SAYX15 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Mar [interview yr-2]"
   SAYX16 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - April [interview yr-2]"
   SAYX17 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - May [interview yr-2]"
   SAYX18 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - June [interview yr-2]"
   SAYX19 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - July [interview yr-2]"
   SAYX20 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Aug [interview yr-2]"
   SAYX21 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Sept [interview yr-2]"
   SAYX22 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Oct [interview yr-2]"
   SAYX23 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Nov [interview yr-2]"
   SAYX24 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Dec [interview yr-2]"
   SAYX25 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Jan [interview yr-1]"
   SAYX26 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Feb [interview yr-1]"
   SAYX27 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Mar [interview yr-1]"
   SAYX28 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - April [interview yr-1]"
   SAYX29 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - May [interview yr-1]"
   SAYX30 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - June [interview yr-1]"
   SAYX31 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - July [interview yr-1]"
   SAYX32 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Aug [interview yr-1]"
   SAYX33 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Sept [interview yr-1]"
   SAYX34 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Oct [interview yr-1]"
   SAYX35 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Nov [interview yr-1]"
   SAYX36 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Dec [interview yr-1]"
   SAYX37 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Jan [interview yr]"
   SAYX38 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Feb [interview yr]"
   SAYX39 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Mar [interview yr]"
   SAYX40 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - April [interview yr]"
   SAYX41 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - May [interview yr]"
   SAYX42 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - June [interview yr]"
   SAYX43 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - July [interview yr]"
   SAYX44 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Aug [interview yr]"
   SAYX45 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Sept [interview yr]"
   SAYX46 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Oct [interview yr]"
   SAYX47 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Nov [interview yr]"
   SAYX48 = "Flag indicating whether " Same all year"  was original answer to ED-6 METHHIST - Dec [interview yr]"
   SIMSEQX1 = "ED-10 Use Methods Together or at Different Times - Jan [interview yr-3]"
   SIMSEQX2 = "ED-10 Use Methods Together or at Different Times - Feb [interview yr-3]"
   SIMSEQX3 = "ED-10 Use Methods Together or at Different Times - Mar [interview yr-3]"
   SIMSEQX4 = "ED-10 Use Methods Together or at Different Times - April [interview yr-3]"
   SIMSEQX5 = "ED-10 Use Methods Together or at Different Times - May [interview yr-3]"
   SIMSEQX6 = "ED-10 Use Methods Together or at Different Times - June [interview yr-3]"
   SIMSEQX7 = "ED-10 Use Methods Together or at Different Times - July [interview yr-3]"
   SIMSEQX8 = "ED-10 Use Methods Together or at Different Times - Aug [interview yr-3]"
   SIMSEQX9 = "ED-10 Use Methods Together or at Different Times - Sept [interview yr-3]"
   SIMSEQX10 = "ED-10 Use Methods Together or at Different Times - Oct [interview yr-3]"
   SIMSEQX11 = "ED-10 Use Methods Together or at Different Times - Nov [interview yr-3]"
   SIMSEQX12 = "ED-10 Use Methods Together or at Different Times - Dec [interview yr-3]"
   SIMSEQX13 = "ED-10 Use Methods Together or at Different Times - Jan [interview yr-2]"
   SIMSEQX14 = "ED-10 Use Methods Together or at Different Times - Feb [interview yr-2]"
   SIMSEQX15 = "ED-10 Use Methods Together or at Different Times - Mar [interview yr-2]"
   SIMSEQX16 = "ED-10 Use Methods Together or at Different Times - April [interview yr-2]"
   SIMSEQX17 = "ED-10 Use Methods Together or at Different Times - May [interview yr-2]"
   SIMSEQX18 = "ED-10 Use Methods Together or at Different Times - June [interview yr-2]"
   SIMSEQX19 = "ED-10 Use Methods Together or at Different Times - July [interview yr-2]"
   SIMSEQX20 = "ED-10 Use Methods Together or at Different Times - Aug [interview yr-2]"
   SIMSEQX21 = "ED-10 Use Methods Together or at Different Times - Sept [interview yr-2]"
   SIMSEQX22 = "ED-10 Use Methods Together or at Different Times - Oct [interview yr-2]"
   SIMSEQX23 = "ED-10 Use Methods Together or at Different Times - Nov [interview yr-2]"
   SIMSEQX24 = "ED-10 Use Methods Together or at Different Times - Dec [interview yr-2]"
   SIMSEQX25 = "ED-10 Use Methods Together or at Different Times - Jan [interview yr-1]"
   SIMSEQX26 = "ED-10 Use Methods Together or at Different Times - Feb [interview yr-1]"
   SIMSEQX27 = "ED-10 Use Methods Together or at Different Times - Mar [interview yr-1]"
   SIMSEQX28 = "ED-10 Use Methods Together or at Different Times - April [interview yr-1]"
   SIMSEQX29 = "ED-10 Use Methods Together or at Different Times - May [interview yr-1]"
   SIMSEQX30 = "ED-10 Use Methods Together or at Different Times - June [interview yr-1]"
   SIMSEQX31 = "ED-10 Use Methods Together or at Different Times - July [interview yr-1]"
   SIMSEQX32 = "ED-10 Use Methods Together or at Different Times - Aug [interview yr-1]"
   SIMSEQX33 = "ED-10 Use Methods Together or at Different Times - Sept [interview yr-1]"
   SIMSEQX34 = "ED-10 Use Methods Together or at Different Times - Oct [interview yr-1]"
   SIMSEQX35 = "ED-10 Use Methods Together or at Different Times - Nov [interview yr-1]"
   SIMSEQX36 = "ED-10 Use Methods Together or at Different Times - Dec [interview yr-1]"
   SIMSEQX37 = "ED-10 Use Methods Together or at Different Times - Jan [interview yr]"
   SIMSEQX38 = "ED-10 Use Methods Together or at Different Times - Feb [interview yr]"
   SIMSEQX39 = "ED-10 Use Methods Together or at Different Times - Mar [interview yr]"
   SIMSEQX40 = "ED-10 Use Methods Together or at Different Times - April [interview yr]"
   SIMSEQX41 = "ED-10 Use Methods Together or at Different Times - May [interview yr]"
   SIMSEQX42 = "ED-10 Use Methods Together or at Different Times - June [interview yr]"
   SIMSEQX43 = "ED-10 Use Methods Together or at Different Times - July [interview yr]"
   SIMSEQX44 = "ED-10 Use Methods Together or at Different Times - Aug [interview yr]"
   SIMSEQX45 = "ED-10 Use Methods Together or at Different Times - Sept [interview yr]"
   SIMSEQX46 = "ED-10 Use Methods Together or at Different Times - Oct [interview yr]"
   SIMSEQX47 = "ED-10 Use Methods Together or at Different Times - Nov [interview yr]"
   SIMSEQX48 = "ED-10 Use Methods Together or at Different Times - Dec [interview yr]"
   USELSTP = "EF-1 Use Method at Last Sex with last partner in past 12 months?"
   WYNOLSTP = "EF-1b No BC use with last partner bec you wanted preg?"
   HPLSTP = "EF-1c No BC use with last partner bec he wanted you to become preg?"
   LSTMTHP1 = "EF-2 Method Used at Last Sex with last partner in past 12 mons -1st mention"
   LSTMTHP2 = "EF-2 Method Used at Last Sex with last partner in past 12 mons -2nd mention"
   LSTMTHP3 = "EF-2 Method Used at Last Sex with last partner in past 12 mons -3rd mention"
   LSTMTHP4 = "EF-2 Method Used at Last Sex with last partner in past 12 mons -4th mention"
   LPIUDTYP = "EF-2b Type of IUD used with last partner"
   USEFSTP = "EF-3 Use Method at First Sex with last partner in past 12 months?"
   FSTMTHP1 = "EF-4 Method used at first sex with last partner in past 12 mons -1st mention"
   FSTMTHP2 = "EF-4 Method used at first sex with last partner in past 12 mons -2nd mention"
   FSTMTHP3 = "EF-4 Method used at first sex with last partner in past 12 mons -3rd mention"
   FSTMTHP4 = "EF-4 Method used at first sex with last partner in past 12 mons -4th mention"
   USELSTP2 = "EF-1 Use Method at Last Sex with 2nd-to-last partner in past 12 months?"
   WYNOLSTP2 = "EF-1b No BC use with 2nd-to-last partner bec you wanted preg?"
   HPLSTP2 = "EF-1c No BC use with 2nd-to-last partner bec he wanted you to become preg?"
   LSTMTHP5 = "EF-2 Method Used at Last Sex with 2nd-to-last partner in past 12 mons -1st mention"
   LSTMTHP6 = "EF-2 Method Used at Last Sex with 2nd-to-last partner in past 12 mons -2nd mention"
   LSTMTHP7 = "EF-2 Method Used at Last Sex with 2nd-to-last partner in past 12 mons -3rd mention"
   LSTMTHP8 = "EF-2 Method Used at Last Sex with 2nd-to-last partner in past 12 mons -4th mention"
   LPIUDTYP2 = "EF-2b Type of IUD used with 2nd-to-last partner"
   USEFSTP2 = "EF-3 Use Method at First Sex with 2nd-to-last partner in past 12 months?"
   FSTMTHP5 = "EF-4 Method used at first sex with 2nd-to-last partner in past 12 mons -1st mention"
   FSTMTHP6 = "EF-4 Method used at first sex with 2nd-to-last partner in past 12 mons -2nd mention"
   FSTMTHP7 = "EF-4 Method used at first sex with 2nd-to-last partner in past 12 mons -3rd mention"
   FSTMTHP8 = "EF-4 Method used at first sex with 2nd-to-last partner in past 12 mons -4th mention"
   USELSTP3 = "EF-1 Use Method at Last Sex with 3rd-to-last partner in past 12 months?"
   WYNOLSTP3 = "EF-1b No BC use with 3rd-to-last partner bec you wanted preg?"
   HPLSTP3 = "EF-1c No BC use with 3rd-to-last partner bec he wanted you to become preg?"
   LSTMTHP9 = "EF-2 Method Used at Last Sex with 3rd-to-last partner in past 12 mons - 1st mention"
   LSTMTHP10 = "EF-2 Method Used at Last Sex with 3rd-to-last partner in past 12 mons -2nd mention"
   LSTMTHP11 = "EF-2 Method Used at Last Sex with 3rd-to-last partner in past 12 mons -3rd mention"
   LSTMTHP12 = "EF-2 Method Used at Last Sex with 3rd-to-last partner in past 12 mons -4th mention"
   LPIUDTYP3 = "EF-2b Type of IUD used with 3rd-to-last partner"
   USEFSTP3 = "EF-3 use method at first sex with 3rd-to-last partner in past 12 months?"
   FSTMTHP9 = "EF-4 Method used at first sex with 3rd-to-last partner in past 12 mons -1st mention"
   FSTMTHP10 = "EF-4 Method used at first sex with 3rd-to-last partner in past 12 mons -2nd mention"
   FSTMTHP11 = "EF-4 Method used at first sex with 3rd-to-last partner in past 12 mons -3rd mention"
   FSTMTHP12 = "EF-4 Method used at first sex with 3rd-to-last partner in past 12 mons -4th mention"
   WYNOTUSE = "EH-1 Reason not using birth control because you want to become pregnant?"
   HPPREGQ = "EH-2 Does partner want you to become pregnant?"
   DURTRY_N = "EH-2a How long have you been trying to get pregnant?  (number)"
   DURTRY_P = "EH-2b How long have you been trying to get pregnant? (unit: Mons/Yrs)"
   WHYNOUSING1 = "EH-2c Reason not using birth control (at risk of unint preg) - 1st mention"
   WHYNOUSING2 = "EH-2c Reason not using birth control (at risk of unint preg) - 2nd mention"
   WHYNOUSING3 = "EH-2c Reason not using birth control (at risk of unint preg) - 3rd mention"
   WHYNOUSING4 = "EH-2c Reason not using birth control (at risk of unint preg) - 4th mention"
   WHYNOUSING5 = "EH-2c Reason not using birth control (at risk of unint preg) - 5th mention"
   WHYNOTPG1 = "EH-2cc open-ended response: reason don't think can get preg - 1st"
   WHYNOTPG2 = "EH-2cc open-ended response: reason don't think can get preg - 2nd"
   MAINNOUSE = "EH-2d Main reason not using birth control (at risk of unint preg)"
   YUSEPILL1 = "EJ-1 Reasons for recent pill use-1st mention"
   YUSEPILL2 = "EJ-1 Reasons for recent pill use-2nd mention"
   YUSEPILL3 = "EJ-1 Reasons for recent pill use-3rd mention"
   YUSEPILL4 = "EJ-1 Reasons for recent pill use-4th mention"
   YUSEPILL5 = "EJ-1 Reasons for recent pill use-5th mention"
   YUSEPILL6 = "EJ-1 Reasons for recent pill use-6th mention"
   YUSEPILL7 = "EJ-1 Reasons for recent pill use-7th mention"
   IUDTYPE = "EJ-3 Type of IUD used the last two months"
   YUSEIUD1 = "EJ-3a Reasons for recent IUD use-1st mention"
   YUSEIUD2 = "EJ-3a Reasons for recent IUD use-2nd mention"
   YUSEIUD3 = "EJ-3a Reasons for recent IUD use-3rd mention"
   YUSEIUD4 = "EJ-3a Reasons for recent IUD use-4th mention"
   YUSEIUD5 = "EJ-3a Reasons for recent IUD use-5th mention"
   EKMETHOD = "EKMETHOD - Recently used method chosen for use in EK Series (CURBCPLC-CURBCAMT)"
   CURBCPLC = "EK-1 Source of recent method use"
   NUMPILLS = "EK-2 How many months of pills did you get, last time got some?"
   CURBCPAY1 = "EK-3 How pay for current method?-1st mention"
   CURBCPAY2 = "EK-3 How pay for current method?-2nd mention"
   CURBCPAY3 = "EK-3 How pay for current method?-3rd mention"
   CURBCINS = "EK-4 Have health ins when got curr method?"
   NOUSEINS1 = "EK-5 Why not use health ins to pay for curr method?-1st mention"
   NOUSEINS2 = "EK-5 Why not use health ins to pay for curr method?-2nd mention"
   NOUSEINS3 = "EK-5 Why not use health ins to pay for curr method?-3rd mention"
   CURBCAMT = "EK-6 How much paid for curr method"
   NOCOST1 = "EK-7 If cost not an issue, want to use diff method?"
   NOCOST2 = "EK-8 If cost not an issue, want to use a method?"
   PST4WKSX = "EL-1 # times sex with male in last 4 weeks"
   PSWKCOND1 = "EL-2 Use a condom during sex with male in last 4 wks"
   PSWKCOND2 = "EL-3 How many times use condom during sex last 4 wks"
   COND1BRK = "EL-3a Did condom break"
   COND1OFF = "EL-3b When was the condom used"
   CONDBRFL = "EL-3c How many times use condom break or completely fall off"
   CONDOFF = "EL-3d How many times was the condom put on after or taken off during sex"
   MISSPILL = "EL-3e number of pills missed"
   P12MOCON = "EL-4 How many times used condom during sex last 12 mons"
   PXNOFREQ = "EL-5 How many times used any method during sex last 12 mons"
   BTHCON12 = "FA-1b Rec'd Method Birth Control/Prescription-Last 12 Months"
   MEDTST12 = "FA-1c Rec'd Checkup for Birth Control Last 12 Months"
   BCCNS12 = "FA-1d Rec'd Counseling About Birth Control Last 12 Months"
   STEROP12 = "FA-1e Rec'd sterilizing operation in last 12 months?"
   STCNS12 = "FA-1f Rec'd Counseling re Getting Sterilized Last 12 Months"
   EMCON12 = "FA-1g Rec'd Emergency Contraception/Prescription Last 12 Months"
   ECCNS12 = "FA-1h Rec'd Counseling re Emergency Contraception Last 12 Months"
   NUMMTH12 = "# of BC Methods used (drug/device) Last 12 Months"
   PRGTST12 = "FA-3a Received Pregnancy Test Last 12 Months"
   ABORT12 = "FA-3b Received Abortion Last 12 Months"
   PAP12 = "FA-3c Received Pap Smear Last 12 Months"
   PELVIC12 = "FA-3d Received Pelvic Exam Last 12 Months"
   PRENAT12 = "FA-3e Received Prenatal Care Last 12 Months"
   PARTUM12 = "FA-3f Received Post-Pregnancy Care Last 12 Months"
   STDSVC12 = "FA-3g  Rec'd test for STD Last 12 Months"
   BARRIER1 = "FA-3h Reason Did Not See a Doctor in Last 12 months - 1st mention"
   BARRIER2 = "FA-3h Reason Did Not See a Doctor in Last 12 months - 2nd mention"
   BARRIER3 = "FA-3h Reason Did Not See a Doctor in Last 12 months - 3rd mention"
   BARRIER4 = "FA-3h Reason Did Not See a Doctor in Last 12 months - 4th mention"
   BARRIER5 = "FA-3h Reason Did Not See a Doctor in Last 12 months - 5th mention"
   BARRIER6 = "FA-3h Reason Did Not See a Doctor in Last 12 months - 6th mention"
   NUMSVC12 = "# of Services Received in Last 12 Months"
   NUMBCVIS = "FA-4 Received Services Last 12 Months at 1 or More Visits"
   BC12PLCX = "FA-5 Where R Rec'd all services in one visit"
   BC12PLCX2 = "FA-5 Where R Rec'd Method of Birth Control/Prescription in Last 12 Months"
   BC12PLCX3 = "FA-5 Where R Rec'd Check-up for Birth Control in Last 12 Months"
   BC12PLCX4 = "FA-5 Where R Rec'd Counseling about Birth Control in Last 12 Months"
   BC12PLCX5 = "FA-5 Where R Rec'd sterilizing operation in Last 12 Months"
   BC12PLCX6 = "FA-5 Where R Rec'd Counseling on Getting Sterilized in Last 12 Months"
   BC12PLCX7 = "FA-5 Where R Rec'd Emergency Contraception in Last 12 Months"
   BC12PLCX8 = "FA-5 Where R Rec'd Counseling on Emerg. Contraception in Last 12 Months"
   BC12PLCX9 = "FA-5 Where R Rec'd Pregnancy Test in Last 12 Months"
   BC12PLCX10 = "FA-5 Where R Rec'd Abortion in Last 12 Months"
   BC12PLCX11 = "FA-5 Where R Rec'd Pap Smear in Last 12 Months"
   BC12PLCX12 = "FA-5 Where R Rec'd Pelvic Exam in Last 12 Months"
   BC12PLCX13 = "FA-5 Where R Rec'd Prenatal Care in Last 12 Months"
   BC12PLCX14 = "FA-5 Where R Rec'd Post-pregnancy care in Last 12 Months"
   BC12PLCX15 = "FA-5 Where R Rec'd testing for STD in Last 12 Months"
   IDCLINIC = "Number of times identified a clinic"
   PGTSTBC2 = "FA-5a During Visit For Preg Test, Dr. Talk About BC"
   PAPPLBC2 = "FA-5b During Visit For Pap/Pelvic, Dr. Talk About BC"
   PAPPELEC = "FA-5c During Visit Pap/Pelvic,Dr Talk-Emergency Contraception"
   STDTSCON = "FA-5d During Visit STD,Dr Talk-Using Condom to Prevent Disease"
   WHYPSTD = "FA-5e Main reason chose place for STD test"
   BCCLARC = "FA-5f When info about birth control whether provider talked about LARC"
   BC12PAYX1 = "Fa-6 Way Bill Was Paid-all services in one visit, 1st method"
   BC12PAYX2 = "Fa-6 Way Bill Was Paid-all services in one visit, 2nd method"
   BC12PAYX3 = "Fa-6 Way Bill Was Paid-all services in one visit, 3rd method"
   BC12PAYX4 = "Fa-6 Way Bill Was Paid-all services in one visit, 4th method"
   BC12PAYX7 = "Fa-6 Way Bill Was Paid-method BC/prescription, 1st method"
   BC12PAYX8 = "Fa-6 Way Bill Was Paid-method BC/prescription, 2nd method"
   BC12PAYX9 = "Fa-6 Way Bill Was Paid-method BC/prescription, 3rd method"
   BC12PAYX10 = "Fa-6 Way Bill Was Paid-method BC/prescription, 4th method"
   BC12PAYX13 = "Fa-6 Way Bill Was Paid-check up for BC, 1st method"
   BC12PAYX14 = "Fa-6 Way Bill Was Paid-check up for BC, 2nd method"
   BC12PAYX15 = "Fa-6 Way Bill Was Paid-check up for BC, 3rd method"
   BC12PAYX16 = "Fa-6 Way Bill Was Paid-check up for BC, 4th method"
   BC12PAYX19 = "Fa-6 Way Bill Was Paid-counseling about BC, 1st method"
   BC12PAYX20 = "Fa-6 Way Bill Was Paid-counseling about BC, 2nd  method"
   BC12PAYX21 = "Fa-6 Way Bill Was Paid-counseling about BC, 3rd method"
   BC12PAYX22 = "Fa-6 Way Bill Was Paid-counseling about BC, 4th method"
   BC12PAYX25 = "Fa-6 Ways Bill Was paid-sterilizing operation, 1st method"
   BC12PAYX26 = "Fa-6 Ways Bill Was paid-sterilizing operation, 2nd method"
   BC12PAYX27 = "Fa-6 Ways Bill Was paid-sterilizing operation, 3rd method"
   BC12PAYX28 = "Fa-6 Ways Bill Was paid-sterilizing operation, 4th method"
   BC12PAYX31 = "Fa-6 Way Bill Was Paid-counseling sterilization,  1st method"
   BC12PAYX32 = "Fa-6 Way Bill Was Paid-counseling sterilization,  2nd method"
   BC12PAYX33 = "Fa-6 Way Bill Was Paid-counseling sterilization,  3rd method"
   BC12PAYX34 = "Fa-6 Way Bill Was Paid-counseling sterilization,  4th method"
   BC12PAYX37 = "Fa-6 Way Bill Was Paid-EC/prescription, 1st method"
   BC12PAYX38 = "Fa-6 Way Bill Was Paid-EC/prescription, 2nd method"
   BC12PAYX39 = "Fa-6 Way Bill Was Paid-EC/prescription, 3rd method"
   BC12PAYX40 = "Fa-6 Way Bill Was Paid-EC/prescription, 4th method"
   BC12PAYX43 = "Fa-6 Way Bill Was Paid-counseling EC, 1st method"
   BC12PAYX44 = "Fa-6 Way Bill Was Paid-counseling EC, 2nd method"
   BC12PAYX45 = "Fa-6 Way Bill Was Paid-counseling EC, 3rd method"
   BC12PAYX46 = "Fa-6 Way Bill Was Paid-counseling EC, 4th method"
   BC12PAYX49 = "Fa-6 Way Bill Was Paid-pregnancy test, 1st method"
   BC12PAYX50 = "Fa-6 Way Bill Was Paid-pregnancy test, 2nd method"
   BC12PAYX51 = "Fa-6 Way Bill Was Paid-pregnancy test, 3rd method"
   BC12PAYX52 = "Fa-6 Way Bill Was Paid-pregnancy test, 4th method"
   BC12PAYX55 = "Fa-6 Way Bill Was Paid-abortion, 1st method"
   BC12PAYX56 = "Fa-6 Way Bill Was Paid-abortion, 2nd method"
   BC12PAYX57 = "Fa-6 Way Bill Was Paid-abortion, 3rd method"
   BC12PAYX58 = "Fa-6 Way Bill Was Paid-abortion, 4th method"
   BC12PAYX61 = "Fa-6 Way Bill Was Paid-pap smear, 1st method"
   BC12PAYX62 = "Fa-6 Way Bill Was Paid-pap smear, 2nd method"
   BC12PAYX63 = "Fa-6 Way Bill Was Paid-pap smear, 3rd method"
   BC12PAYX64 = "Fa-6 Way Bill Was Paid-pap smear, 4th method"
   BC12PAYX67 = "Fa-6 Way Bill Was Paid-pelvic exam, 1st method"
   BC12PAYX68 = "Fa-6 Way Bill Was Paid-pelvic exam, 2nd method"
   BC12PAYX69 = "Fa-6 Way Bill Was Paid-pelvic exam, 3rd method"
   BC12PAYX70 = "Fa-6 Way Bill Was Paid-pelvic exam, 4th method"
   BC12PAYX73 = "Fa-6 Way Bill Was Paid-prenatal, 1st method"
   BC12PAYX74 = "Fa-6 Way Bill Was Paid-prenatal, 2nd method"
   BC12PAYX75 = "Fa-6 Way Bill Was Paid-prenatal, 3rd method"
   BC12PAYX76 = "Fa-6 Way Bill Was Paid-prenatal, 4th method"
   BC12PAYX79 = "Fa-6 Way Bill Was Paid-post-pregnancy, 1st method"
   BC12PAYX80 = "Fa-6 Way Bill Was Paid-post-pregnancy, 2nd method"
   BC12PAYX81 = "Fa-6 Way Bill Was Paid-post-pregnancy, 3rd method"
   BC12PAYX82 = "Fa-6 Way Bill Was Paid-post-pregnancy, 4th method"
   BC12PAYX85 = "Fa-6 Way Bill Was Paid-testing for std, 1st method"
   BC12PAYX86 = "Fa-6 Way Bill Was Paid-testing for std, 2nd method"
   BC12PAYX87 = "Fa-6 Way Bill Was Paid-testing for std, 3rd method"
   BC12PAYX88 = "Fa-6 Way Bill Was Paid-testing for std, 4th method"
   REGCAR12_F_01 = "FA-9 Clinic Rec'd all services in one visit"
   REGCAR12_F_02 = "FA-9 Clinic Rec'd Method BC or Prescription was R's Reg Place"
   REGCAR12_F_03 = "FA-9 Clinic Rec'd Check-up for Birth Control was R's Reg Place"
   REGCAR12_F_04 = "FA-9 Clinic Rec'd Counseling for BC was R's Reg Place"
   REGCAR12_F_05 = "FA-9 Clinic Rec'd sterilizing operation was R's Regular Place"
   REGCAR12_F_06 = "FA-9 Clinic Rec'd Counseling for Sterilization was R's Reg Place"
   REGCAR12_F_07 = "FA-9 Clinic Rec'd EC /Prescription was R's Reg Place"
   REGCAR12_F_08 = "FA-9 Clinic Rec'd Counseling on EC was R's Regr Place"
   REGCAR12_F_09 = "FA-9 Clinic Rec'd pregnancy test was R's Regr Place"
   REGCAR12_F_10 = "FA-9 Clinic Rec'd an Abortion was R's Regular Place"
   REGCAR12_F_11 = "FA-9 Clinic Rec'd a Pap Smear was R's Regular Place"
   REGCAR12_F_12 = "FA-9 Clinic Rec'd Pelvic exam was R's Regular Place"
   REGCAR12_F_13 = "FA-9 Clinic Rec'd Prenatal Care was R's Regular Place"
   REGCAR12_F_14 = "FA-9 Clinic Rec'd Post-Pregnancy Care  was R's Regular Place"
   REGCAR12_F_15 = "FA-9 Clinic Rec'd testing for STD was R's Reg Place"
   EVERFPC = "FC-1 Has R ever Visited Clinic for Medical/BC Service"
   KNDMDHLP01 = "FC-2 Medical Services R Received at Clinic -1st mention"
   KNDMDHLP02 = "FC-2 Medical Services R Received at Clinic -2nd mention"
   KNDMDHLP03 = "FC-2 Medical Services R Received at Clinic -3rd mention"
   KNDMDHLP04 = "FC-2 Medical Services R Received at Clinic -4th mention"
   KNDMDHLP05 = "FC-2 Medical Services R Received at Clinic -5th mention"
   KNDMDHLP06 = "FC-2 Medical Services R Received at Clinic -6th mention"
   KNDMDHLP07 = "FC-2 Medical Services R Received at Clinic -7th mention"
   KNDMDHLP08 = "FC-2 Medical Services R Received at Clinic -8th mention"
   LASTPAP = "FD-2 When was last Pap test"
   MREASPAP = "FD-3 Main reason for last Pap test"
   AGEFPAP = "FD-4 Age at first Pap test"
   AGEFPAP2 = "FD-4a Was R younger than 18, 18-21, 22-29, or 30 or older at first Pap test"
   ABNPAP3 = "FD-5 Has R had abnormal Pap test in the last 3 years"
   INTPAP = "FD-6 How often R thinks she will need a Pap test"
   PELWPAP = "FE-1 Was pelvic exam done at same time as Pap test"
   LASTPEL = "FE-2 When was last pelvic exam"
   MREASPEL = "FE-3 Main reason for last pelvic exam"
   AGEFPEL = "FE-4 Age at first pelvic exam"
   AGEPEL2 = "FE-4a Was R younger than 18, 18-21, 22-29, or 30 or older at first pelvic exam"
   INTPEL = "FE-5 How often R thinks she will need a pelvic exam"
   EVHPVTST = "FF-2 Ever had HPV test"
   HPVWPAP = "FF-3 Was HPV test done at same time as Pap test"
   LASTHPV = "FF-3c When was last HPV test"
   MREASHPV = "FF-4 Main reason for last HPV test"
   AGEFHPV = "FF-5 Age at first HPV test"
   AGEHPV2 = "FF-5a Was R younger than 18, 18-21, 22-29, or 30 or older at first HPV test"
   INTHPV = "FF-6 How often R thinks she will need an HPV test"
   ASKSMOKE = "FG-2 Provider asked R whether smoke cigarettes or other tobacco"
   ASKPREG = "FG-3 Provider asked R whether wanted to get pregnant"
   ASKFOLIC = "FG-4 Provider advised R to take vitamin with folic acid"
   RWANT = "GA-1 R Wants A(another) Baby Some Time?"
   PROBWANT = "GA-1a R Prob Wants/does not want A(another) Baby Some Time?"
   PWANT = "GA-2 R's H/P Wants A(another) Baby Some Time?"
   JINTEND = "GB-1 R & H/P Intend to have A(another) Baby Some Time?"
   JSUREINT = "GB-2 How sure R & H/P will/will not have A(another) Baby?"
   JINTENDN = "GB-3 How Many (More) Babies R and H/P Intend?"
   JEXPECTL = "GB-4 Largest Number of (additional) Babies R and H/P Intend"
   JEXPECTS = "GB-5 Smallest Number of (additional) Babies R and H/P Intend"
   JINTNEXT = "GB-6 When R & H/P expect 1st/next child to be born"
   INTEND = "GC-1 R Intends to Have A(another) Baby Some Time?"
   SUREINT = "GC-2 R How Sure R will/ will not have A(another) baby?"
   INTENDN = "GC-3 Number of (more) Babies R Intends"
   EXPECTL = "GC-4 Largest Number of (additional) Babies R Intends"
   EXPECTS = "GC-5 Smallest Number of (additional) Babies R Intends"
   INTNEXT = "GC-6 When R expects 1st/next child to be born"
   HLPPRG = "HA-1 Ever Received Medical Help to Get Pregnant"
   HOWMANYR = "HA-2 # of Partners with Whom R Sought Medical Help to Get Pregnant"
   SEEKWHO1 = "HA-3 Sought Medical Help to Get Pregnant with Current H/P"
   SEEKWHO2 = "HA-4 Ever Sought Medical Help to Get Pregnant with Current H/P"
   TYPALLPG1 = "HA-5 Infertility Services Received-1st mention"
   TYPALLPG2 = "HA-5 Infertility Services Received-2nd mention"
   TYPALLPG3 = "HA-5 Infertility Services Received-3rd mention"
   TYPALLPG4 = "HA-5 Infertility Services Received-4th mention"
   TYPALLPG5 = "HA-5 Infertility Services Received-5th mention"
   TYPALLPG6 = "HA-5 Infertility Services Received-6th mention"
   WHOTEST = "HA-5a Who had Infertility Testing - R or Partner or Both"
   WHARTIN = "HA-5b R Inseminated with Partner or Donor Sperm"
   OTMEDHEP1 = "HA-5c Other Infertility Services Received-1st mention"
   OTMEDHEP2 = "HA-5c Other Infertility Services Received-2nd mention"
   OTMEDHEP3 = "HA-5c Other Infertility Services Received-3rd mention"
   OTMEDHEP4 = "HA-5c Other Infertility Services Received-4th mention"
   OTMEDHEP5 = "HA-5c Other Infertility Services Received-5th mention"
   INSCOVPG = "HA-6 Infertility Services Covered by Private Insurance"
   FSTHLPPG_M = "HA-7 Month 1st Went for Medical Help To Get Pregnant"
   FSTHLPPG_Y = "HA-7 Year 1st Went for Medical Help To Get Pregnant"
   CMPGVIS1 = "Date (CM) of First Visit for Medical Help to Get Pregnant"
   TRYLONG2 = "HA-8 How Long R Trying To Get Pregnant"
   UNIT_TRYLONG = "HA-8 Unit (months/years) for How Long Trying to Get Pregnant"
   HLPPGNOW = "HA-9 R Currently Pursuing Medical Help to Get Pregnant"
   RCNTPGH_M = "HA-10 Month of Last/Most Recent Visit for Help to Get Pregnant"
   RCNTPGH_Y = "HA-10 Year of Last/Most Recent Visit for Help to Get Pregnant"
   CMPGVISL = "Date (CM) of Last/Most Recent Visit for Medical Help to Get Pregnant"
   NUMVSTPG = "HA-11 # Visits in Last 12 Mos for Medical Help to Get Pregnant"
   PRGVISIT = "# of Visits in Last 12 Months for Medical Help to Get Pregnant"
   HLPMC = "HB-1 Ever Received Medical Help To Prevent Miscarriage"
   TYPALLMC1 = "HB-2 Miscarriage Services-1st Mentioned"
   TYPALLMC2 = "HB-2 Miscarriage Services-2nd Mentioned"
   TYPALLMC3 = "HB-2 Miscarriage Services-3rd Mentioned"
   TYPALLMC4 = "HB-2 Miscarriage Services-4th Mentioned"
   TYPALLMC5 = "HB-2 Miscarriage Services-5th Mentioned"
   TYPALLMC6 = "HB-2 Miscarriage Services-6th Mentioned"
   MISCNUM = "HB-3 # of Miscarriages at First Visit for Miscarriage Services"
   INFRTPRB1 = "HB-4 Ever Told You Had Any Infertility Problems-1st Mentioned"
   INFRTPRB2 = "HB-4 Ever Told You Had Any Infertility Problems-2nd Mentioned"
   INFRTPRB3 = "HB-4 Ever Told You Had Any Infertility Problems-3rd Mentioned"
   INFRTPRB4 = "HB-4 Ever Told You Had Any Infertility Problems-4th Mentioned"
   INFRTPRB5 = "HB-4 Ever Told You Had Any Infertility Problems-5th Mentioned"
   DUCHFREQ = "HC-1 Last 12 Mos: How Often R Douched"
   PID = "HD-1 Has R Ever Been Treated For PID"
   PIDSYMPT = "HD-2 Was R Having Any Symptoms that Prompted PID Treatment"
   PIDTX = "HD-3 Number of Times R was Treated For PID"
   LSTPIDTX_M = "HD-4 Month R Was Last Treated For PID"
   LSTPIDTX_Y = "HD-4 Year R Was Last Treated For PID"
   CMPIDLST = "Date (CM) of Last/Most Recent PID Treatment"
   DIABETES = "HD-5 Diabetes: Ever Diagnosed"
   GESTDIAB = "HD-6 Nongestational Diabetes: Ever Diagnosed"
   UF = "HD-8 Uterine Fibroids: Ever Diagnosed"
   ENDO = "HD-9 Endometriosis: Ever Diagnosed"
   OVUPROB = "HD-10 Ovulation/Menstrual Problems: Ever Diagnosed"
   DEAF = "HD-11 R has any serious difficulty hearing"
   BLIND = "HD-12 R has any serious difficulty seeing"
   DIFDECIDE = "HD-13 R has any serious difficulty w/memory or decision-making"
   DIFWALK = "HD-14 R has any serious difficulty walking or climbing stairs"
   DIFDRESS = "HD-15 R has any serious difficulty dressing or bathing"
   DIFOUT = "HD-16 R has any difficulty doing errands alone due to phys/mental/emotional conditions"
   EVRCANCER = "HD-17 R has ever had cancer"
   AGECANCER = "HD-17a Age when R was first told she had cancer"
   CANCTYPE = "HD-17b Type of cancer R (first) had"
   PRECANCER = "HD-17c Type of cervical cancer diagnosis R had"
   MAMMOG = "HD-18 R has ever had a mammogram"
   AGEMAMM1 = "HD-18a Age when R first had a mammogram"
   REASMAMM1 = "HD-18b Main reason for R's first mammogram"
   CLINEXAM = "HD-18c Ever had a clinical breast exam"
   FAMHYST = "HD-19 R has family history of breast cancer"
   MOMRISK70 = "HD-20a Breast cancer risk if mother was diagnosed at 70"
   MOMRISK40 = "HD-20b Breast cancer risk if mother was diagnosed at 40"
   ALCORISK = "HD-22 R's assessment of breast cancer risk due to alcohol consumption"
   BFEEDRISK = "HD-22a R's assessment of breast cancer risk due to breastfeeding"
   DONBLOOD = "HE-1 Has R Ever Donated Blood or Blood Products"
   HIVTEST = "HE-2 Any HIV Test Outside of Blood Donation"
   NOHIVTST = "HE-2b R's main reason for never having had an HIV test"
   WHENHIV_M = "HE-3 Month of Most Recent HIV Test"
   WHENHIV_Y = "HE-3 Year of Most Recent HIV Test"
   CMHIVTST = "Date (CM) of Last (or Most Recent) HIV Test"
   HIVTSTYR = "HE-3b Has R had HIV test in last 12 months"
   HIVRESULT = "HE-3d Whether R found out results of last HIV test"
   WHYNOGET = "HE-3e Main reason why R did not get results of last HIV test"
   PLCHIV = "HE-4 Place Where R Had Last HIV Test"
   RHHIVT1 = "HE-4j Used a rapid home HIV test"
   RHHIVT21 = "HE-4k Reasons for rapid home HIV test - 1st mentioned"
   HIVTST = "HE-5 Reason For This Last HIV Test-1st mention"
   WHOSUGG = "HE-5b Who suggested R be tested for HIV"
   TALKDOCT = "HE-6 Has a doctor ever talked with R about HIV/AIDS"
   AIDSTALK01 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-1st mention"
   AIDSTALK02 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-2nd mention"
   AIDSTALK03 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-3rd mention"
   AIDSTALK04 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-4th mention"
   AIDSTALK05 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-5th mention"
   AIDSTALK06 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-6th mention"
   AIDSTALK07 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-7th mention"
   AIDSTALK08 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-8th mention"
   AIDSTALK09 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-9th mention"
   AIDSTALK10 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-10th mention"
   AIDSTALK11 = "HE-7 HIV Topics Covered in Discussion with Doctor/Provider-11th mention"
   RETROVIR = "HE-8 T/F: Treatment to Prevent Perinatal HIV Transmission"
   PREGHIV = "HE-9 R Tested for HIV During Last Completed Pregnancy"
   EVERVACC = "HF-1 Ever received HPV vaccine?"
   HPVSHOT1 = "HF-2 Age when R received first HPV vaccine shot"
   HPVSEX1 = "HF-2b Which came first - 1st intercourse or 1st HPV vaccine shot"
   VACCPROB = "HF-3 How Likely R Will Receive HPV Vaccine in Next 12 Mos"
   BLDPRESS = "HG-1 R had blood pressure checked in past year"
   HIGHBP = "HG-2 R was told she had high blood pressure in the past year"
   BPMEDS = "HG-3 R currently taking medicine for high blood pressure"
   USUALCAR = "IA-0a Is there place R usually goes when sick"
   USLPLACE = "IA-0b Place R usually goes when sick"
   USL12MOS = "IA-0c R has gone to her usual source of health care in last 12 months"
   CURRCOV = "IA-1 Currently covered by health insurance"
   COVERHOW01 = "IA-2 Type of health care coverage last 12 months - 1st mention"
   COVERHOW02 = "IA-2 Type of health care coverage last 12 months - 2nd mention"
   COVERHOW03 = "IA-2 Type of health care coverage last 12 months - 3rd mention"
   PARINSUR = "IA-3 Covered by parents' plan"
   INS_EXCH = "IA-4 Obtained health insurance through Healthcare.gov or Marketplace"
   INS_PREM = "IA-5 Paid a premium for health plan"
   COVER12 = "IA-6 Whether R lacked health care coverage any time in last 12 months"
   NUMNOCOV = "IA-7 How many of the last 12 months was R without coverage"
   SAMEADD = "IB-1 R living at curr address on April 1, 2010"
   CNTRY10 = "IB-2 R living in US on April 1, 2010"
   BRNOUT = "IB-8 Whether R was born outside of US"
   YRSTRUS = "Year R came to the United States to stay"
   RELRAISD = "IC-1/IC-2 Religion in which R was raised"
   ATTND14 = "IC-4 How often R attended religious services at age 14"
   RELCURR = "IC-5/IC-6 Religion R is now"
   RELTRAD = "Current religious affiliation by Protestant categories"
   FUNDAM1 = "IC-8 Fundamental affiliation, if any - 1st mention"
   FUNDAM2 = "IC-8 Fundamental affiliation, if any - 2nd mention"
   FUNDAM3 = "IC-8 Fundamental affiliation, if any - 3rd mention"
   FUNDAM4 = "IC-8 Fundamental affiliation, if any - 4th mention"
   RELDLIFE = "IC-9 How important is religion in R's daily life"
   ATTNDNOW = "IC-10 How often R currently attends religious services"
   MILSVC = "ID-1 Served in military in last 6 Mo."
   WRK12MOS = "ID-4 How many of the last 12 months did R work"
   FPT12MOS = "ID-5 Did R work full-time, part-time or both in last 12 months"
   DOLASTWK1 = "IE-1 What R was doing last week (employment status) - 1st mention"
   DOLASTWK2 = "IE-1 What R was doing last week (employment status) - 2nd mention"
   DOLASTWK3 = "IE-1 What R was doing last week (employment status) - 3rd mention"
   DOLASTWK4 = "IE-1 What R was doing last week (employment status) - 4th mention"
   DOLASTWK5 = "IE-1 What R was doing last week (employment status) - 5th mention"
   RWRKST = "Whether R is currently employed (working or temporarily on leave from a job)"
   WORKP12 = "Whether R worked in the previous 12 months"
   RPAYJOB = "IE-2 Did R ever work at job for pay on regular basis"
   RNUMJOB = "IE-3 Number of jobs R worked last week or last week R worked"
   RFTPTX = "IE-4 R worked full- or part-time at curr/last/primary job"
   REARNTY = "Whether R ever worked at all"
   SPLSTWK1 = "IF-1 H/P doing what last week (employment status) - 1st mention"
   SPLSTWK2 = "IF-1 H/P doing what last week (employment status) - 2nd mention"
   SPLSTWK3 = "IF-1 H/P doing what last week (employment status) - 3rd mention"
   SPLSTWK4 = "IF-1 H/P doing what last week (employment status) - 4th mention"
   SPLSTWK5 = "IF-1 H/P doing what last week (employment status) - 5th mention"
   SPWRKST = "Whether R's husband/partner is currently employed (working or temporarily on leave from a job)"
   SPPAYJOB = "IF-2 Did H/P ever work at a job for pay on regular basis"
   SPNUMJOB = "IF-3 Number of jobs H/P worked last week or last week worked"
   SPFTPTX = "IF-4 H/P worked full- or part-time at curr/last/primary job"
   SPEARNTY = "Whether R's husband/partner ever worked for pay"
   SAMESEX = "IH-1 Sexual relations between two same-sex adults is all right"
   CHSUPPOR = "IH-2 Okay for unmarried woman to have and raise a child"
   REACTSLF = "IH-3 How R would feel if she got pregnant now"
   CHBOTHER = "IH-4 How bothered would R be if she did not have children"
   ACASILANG = "II-6 Language to be used in ACASI"
   GENHEALT = "JA-4 R's General Health"
   INCHES = "Height (converted to inches) (original version)"
   RWEIGHT = "JA-6 R's Weight (pounds)"
   BMI = "Body Mass Index (computed in post-processing)"
   DRWEIGH = "JA-6a Was R weighed in past year by a medical care provider"
   TELLWGHT = "JA-6b Was R told about her weight status"
   WGHTSCRN = "JA-6c Was R provided with diet or exercise counseling by medical care provider"
   ENGSPEAK = "JA-7 How well does R speak English"
   CASIBIRTH = "JB-1 # of pregnancies ending in live birth in 5 yrs bef intvw"
   CASILOSS = "JB-2 # of pregnancies ending in spont loss in 5 yrs bef intvw"
   CASIABOR = "JB-3 # of pregnancies ending in abortion in 5 yrs bef intvw"
   CASIADOP = "JB-4 R ever placed a child she gave birth to for adoption"
   NOBEDYR = "JC-0a R had to stay overnight in a shelter, car or someplace outdoors"
   STAYREL = "JC-0b R had to stay overnight with a friend or relative"
   EVSUSPEN = "JC-0c Ever been suspended or expelled from school?"
   GRADSUSP = "JC-0d Grade when suspended or expelled from school"
   SMK100 = "JC-1 Has R Smoked at Least 100 Cigarettes in Life"
   AGESMK = "JC-2 Age That R First Began Smoking Regularly"
   SMOKE12 = "JC-3 Last 12 months: How Often R Smoked Cigarettes"
   SMKSTOP = "JC-3a Was R provided with counseling to stop smoking"
   DRINK12 = "JC-4 Last 12 months: How Often Drank Alcoholic Beverages"
   UNIT30D = "JC-4a-U Drinking in past 30 days - unit of response"
   DRINK30D = "JC-4a-N Drinking in past 30 days - amount"
   DRINKDAY = "JC-4b Number of drinks R had on average on days R drank"
   BINGE30 = "JC-4c Number of times R binge-drank in past 30 days"
   DRNKMOST = "JC-4d Largest number of drinks R had on any occasion in past 30 days"
   BINGE12 = "JC-5 Last 12 months: How Often Binge Drank (4+ in Couple of Hours)"
   POT12 = "JC-6 Last 12 months: How Often Smoked Marijuana"
   COC12 = "JC-7 Last 12 months: How Often Used Cocaine"
   CRACK12 = "JC-8 Last 12 months: How Often Used Crack"
   CRYSTMTH12 = "JC-8a Last 12 months: How Often Used Crystal/Meth"
   INJECT12 = "JC-9 Last 12 months: How Often Injected Non-Prescription Drugs"
   VAGSEX = "JD-1 Ever Had Vaginal Intercourse with a Male"
   AGEVAGR = "JD-2 R's Age at First Vaginal Intercourse with a Male"
   CONDVAG = "JD-4 R Used Condom at Last Vaginal Intercourse with a Male"
   WHYCONDL = "JD-5 Reason R Used Condom at Last Vaginal Intercourse w/a Male"
   GETORALM = "JD-6 R has ever received oral sex from a male"
   GIVORALM = "JD-7 R has ever performed oral sex on a male"
   CONDFELL = "JD-8 R Used Condom at Last Oral Sex with a Male"
   ANYORAL = "Whether R has ever had oral sex with a male (computed in FC J-8b)"
   TIMING = "JD-8b First oral sex before, after, or during first vag  sex?"
   ANALSEX = "JD-9 R Ever Had Anal Sex with a Male"
   CONDANAL = "JD-10 R Used Condom at Last Anal Sex with a Male"
   OPPSEXANY = "Ever Had Vaginal, Oral, or Anal Sex with a Male (computed in FC J-9)"
   OPPSEXGEN = "Ever Had Male-Genital-Involving Sex with a Male (computed in FC J-9)"
   CONDSEXL = "JD-11 R Used Condom at Last Sex (any type) with a Male"
   WANTSEX1 = "JE-1 How much R wanted her first vaginal intercourse to happen"
   VOLSEX1 = "JE-2 R's First Vaginal Intercourse Voluntary or Not Voluntary"
   HOWOLD = "JE-3 R's Age at This First Vaginal Intercourse"
   GIVNDRUG = "JE-4a How forced: R was given alcohol/drugs"
   HEBIGOLD = "JE-4b How forced: he was bigger than R, or grown up, R young"
   ENDRELAT = "JE-4c How forced: he said relationship would end if no sex"
   WORDPRES = "JE-4d How forced: R was pressured by his words but no threats of harm"
   THRTPHYS = "JE-4e How forced: R was threatened with physical hurt/injury"
   PHYSHURT = "JE-4f How forced: R was physically hurt/injured"
   HELDDOWN = "JE-4g How forced: R was physically held down"
   EVRFORCD = "JE-5 R Ever Been Forced by a Man to Have Vaginal Sex"
   AGEFORC1 = "JE-6 R's Age at First Forced Vaginal Sex by a Man"
   GIVNDRG2 = "JE-7a How forced: R was given alcohol/drugs"
   HEBIGOL2 = "JE-7b How forced: he was bigger than R or grown up, R young"
   ENDRELA2 = "JE-7c How forced: he said relationship would end if no sex"
   WRDPRES2 = "JE-7d How forced: pressured by his words but not threats of harm"
   THRTPHY2 = "JE-7e How forced: R was threatened with physical hurt/injury"
   PHYSHRT2 = "JE-7f How forced: R was physically hurt/injured"
   HELDDWN2 = "JE-7g How forced: R was physically held down"
   PARTSLIF_1 = "JF-1 # of Male Sex Partners in Entire Life (any type of sex)"
   PARTSLFV = "JF_1v Verify # of Sex Partners in Entire Life (any type of sex)"
   PARTSLIF_2 = "JF-1 # of Male Sex Partners in Entire Life (any type of sex)"
   OPPLIFENUM = "Number of opposite-sex partners in lifetime for all types of sex (computed in FC J-14d)"
   PARTS12M_1 = "JF-2 # of Male Sex Partners in Last 12 months (any type of sex)"
   PARTS12V = "JF_2v Verify # of Sex Partners in Last 12 months (any type of sex)"
   PARTS12M_2 = "JF-2 # of Male Sex Partners in Last 12 months (any type of sex)"
   OPPYEARNUM = "Number of opposite-sex partners in last 12 months for all types of sex. (computed in FC J-14f)"
   NEWYEAR = "JF-2YR re-ask # male partners in last 12 months"
   NEWLIFE = "JF-2LF re-ask # male partners in lifetime"
   VAGNUM12 = "JF-2YRa # male partners past 12 months had vaginal intercourse with"
   ORALNUM12 = "JF-2YRb # male partners past 12 months had oral sex with"
   ANALNUM12 = "JF-2YRc # male partners past 12 months had anal sex with"
   BISEXPRT = "JF-3 Last 12 months: R Had Sex w/Male Who Ever Had Sex w/Males"
   NONMONOG = "JF-4 Last 12 months: R Had Sex w/Male Who Had Other Partners"
   NNONMONOG1 = "JF-5a Number of male partners in last year who were having sex with others"
   NNONMONOG2 = "JF-5b Number of other partners R's 1 partner in last year had at same time"
   NNONMONOG3 = "JF-5c Number of other partners R's most recent partner in last year had at same time"
   MALSHT12 = "JF-6 Last 12 months: R had sex w/male intravenous drug user"
   PROSTFRQ = "JF-7 Last 12 months: R took money or drugs from male for sex"
   JOHNFREQ = "JF-8 Last 12 months: R gave money or drugs to male for sex"
   HIVMAL12 = "JF-9 Last 12 months: R had sex with an HIV-positive male"
   GIVORALF = "JG-1a R performed oral sex on another female?"
   GETORALF = "JG-1b Another female ever performed oral sex on R?"
   FEMSEX = "JG-1c R ever had sexual experience with a female"
   SAMESEXANY = "Ever Had Sexual Contact with a Female (computed in FC J-19)"
   FEMPARTS_1 = "JG-2 Number of Female Sex Partners in Entire Life"
   FEMLIFEV = "JG-2v Verify # of Female Sex Partners in Entire Life"
   FEMPARTS_2 = "JG-2 Number of Female Sex Partners in Entire Life"
   SAMLIFENUM = "Number of same-sex partners in lifetime (computed in FC J-19d)"
   FEMPRT12_1 = "JG-3 Number of Female Sex Partners in Last 12 Months"
   FEM12V = "JG-3v Verify # of Female Sex Partners in Last 12 Months"
   FEMPRT12_2 = "JG-3 Number of Female Sex Partners in Last 12 months"
   SAMYEARNUM = "Number of same-sex partners in last 12 months (computed in FC J-19f)"
   SAMESEX1 = "JG-4 R's age at first sexual experience with same-sex (female) partner"
   FSAMEREL = "JG-4a R s relationship with 1st female partner at time of 1st sex with her"
   MFLASTP = "JH-1 Was R's Last Sex Partner Male or Female"
   ATTRACT = "JH-2 R's Sexual Attraction to Males vs Females"
   ORIENT_A = "JH-3 R s Sexual Orientation random 1/2 sample"
   ORIENT_B = "JH-3b R s Sexual Orientation random 1/2 sample"
   CONFCONC = "JH-3a Not go for sexual or reproductive health care because your parents might find out"
   TIMALON = "JH-3b Dr ever spend any time alone with you without a parent"
   RISKCHEK1 = "JH-3c Dr ever asked R about sexual orientation or sex of her partners"
   RISKCHEK2 = "JH-3d Dr ever asked R about her number of sexual partners"
   RISKCHEK3 = "JH-3e Dr ever asked R about her use of condoms"
   RISKCHEK4 = "JH-3f Dr ever asked R about the types of sex she has"
   CHLAMTST = "JH-4 Last 12 months: R tested for chlamydia"
   STDOTHR12 = "JH-4b STD testing (other than chlamydia) in last 12 months"
   STDTRT12 = "JH-5 Last 12 months: R treated for any STD"
   GON = "JH-6 Last 12 months: R told she had gonorrhea"
   CHLAM = "JH-7 Last 12 months: R told she had chlamydia"
   HERPES = "JH-8 R ever (in life) told she had genital herpes"
   GENWARTS = "JH-9 R ever (in life) told she had genital warts"
   SYPHILIS = "JH-10 R ever (in life) told she had syphilis"
   EVRINJECT = "JH-11 Ever injected non-prescription drugs in lifetime"
   EVRSHARE = "JH-12 Ever (In Life) Shared an IV Needle"
   EARNTYPE = "JI-0a Report total earnings before taxes by week/month/year"
   EARN = "JI-0b Total earnings reported by category"
   EARNDK1 = "JI-0c If DK/RF total earnings, was it $20,000 or more"
   EARNDK2 = "JI-0d If more than $20,000, was it $50,000 or more"
   EARNDK3 = "JI-0e If more than $50,000, was it $75,000 or more"
   EARNDK4 = "JI-0f If more than $75,000, was it $100,000 or more"
   TOINCWMY = "JI-2 Prefer to report total income per week/month/year"
   TOTINC = "JI-3 Total combined family income reported by category in prior calendar year"
   FMINCDK1 = "JI-3a If DK/RF combined family income, was it less than $50,000 or $50,000 or more?"
   FMINCDK2 = "JI-3b If income less than $50,000, was it less than $35,000?"
   FMINCDK3 = "JI-3c If income less than $35,000, was it less than poverty threshold?"
   FMINCDK4 = "JI-3d If income more than $50,000, was it $75,000 or more?"
   FMINCDK5 = "JI-3e If income more than $75,000, was it $100,000 or more?"
   PUBASST = "JI-4 Received CASH assistance from state/county welfare program in prior calendar year"
   PUBASTYP1 = "JI-5 Type of CASH assistance program in prior calendar year-1st mention"
   FOODSTMP = "JI-6 In prior calendar year, received food stamps"
   WIC = "JI-7 In prior calendar year, received WIC"
   HLPTRANS = "JI-8a In prior calendar year, received transportation assistance"
   HLPCHLDC = "JI-8b In prior calendar year, received child care services or assistance"
   HLPJOB = "JI-8c In prior calendar year, received job training/search help from social svcs"
   FREEFOOD = "JI-9 In last 12 months, received free or reduced-cost food because couldn't afford to buy food"
   HUNGRY = "JI-10 In last 12 months, a family member was hungry because could not afford more food"
   MED_COST = "JI-11 In last 12 months, a family member didn't see doctor because of cost"
   AGER = "R's age at interview (RECODE)"
   FMARITAL = "Formal (legal) marital status (RECODE)"
   RMARITAL = "Informal marital status (RECODE)"
   EDUCAT = "Education (number of years of schooling) (RECODE)"
   HIEDUC = "Highest completed year of school or highest degree received (RECODE)"
   HISPANIC = "Hispanic origin of respondent (RECODE)"
   RACE = "Race of respondent (RECODE)"
   HISPRACE = "Race & Hispanic origin of respondent - 1977 OMB standards (RECODE)"
   HISPRACE2 = "Race & Hispanic origin of respondent - 1997 OMB standards (RECODE)"
   NUMKDHH = "Number of bio/adopt/related/legal children under age 18 in household (RECODE)"
   NUMFMHH = "Number of family members in household (RECODE)"
   HHFAMTYP = "Type of household/family structure (RECODE)"
   HHPARTYP = "Type of parental situation in household (RECODE)"
   NCHILDHH = "Number of R's bio or non-bio children (18 or younger) living in household (RECODE)"
   HHKIDTYP = "Whether R has children (18 or younger), and whether bio or non-bio, living in the household (RECODE)"
   CSPBBHH = "Number of R's biological children (18 or younger) with current spouse/cohabiting partner who live in household (RECODE)"
   CSPBSHH = "Number of R's biological children (18 or younger) in household who are the not the biological children of her current husband/cohabiting partner (RECODE)"
   CSPOKDHH = "Number of all other children (18 or younger) living in household with R and current spouse/cohabiting partner (RECODE)"
   INTCTFAM = "Intact status of childhood family (RECODE)"
   PARAGE14 = "Parental living situation at age 14 (RECODE)"
   EDUCMOM = "Mother's (or mother-figure's) education (RECODE)"
   AGEMOMB1 = "Age of mother (or mother-figure) at first birth (RECODE)"
   AGER_I = "AGER Imputation Flag"
   FMARITAL_I = "FMARITAL Imputation Flag"
   RMARITAL_I = "RMARITAL Imputation Flag"
   EDUCAT_I = "EDUCAT Imputation Flag"
   HIEDUC_I = "HIEDUC Imputation Flag"
   HISPANIC_I = "HISPANIC Imputation Flag"
   RACE_I = "RACE Imputation Flag"
   HISPRACE_I = "HISPRACE Imputation Flag"
   HISPRACE2_I = "HISPRACE2 Imputation Flag"
   NUMKDHH_I = "NUMKDHH Imputation Flag"
   NUMFMHH_I = "NUMFMHH Imputation Flag"
   HHFAMTYP_I = "HHFAMTYP Imputation Flag"
   HHPARTYP_I = "HHPARTYP Imputation Flag"
   NCHILDHH_I = "NCHILDHH Imputation Flag"
   HHKIDTYP_I = "HHKIDTYP Imputation Flag"
   CSPBBHH_I = "CSPBBHH Imputation Flag"
   CSPBSHH_I = "CSPBSHH Imputation Flag"
   CSPOKDHH_I = "CSPOKHH Imputation Flag"
   INTCTFAM_I = "INTCTFAM Imputation Flag"
   PARAGE14_I = "PARAGE14 Imputation Flag"
   EDUCMOM_I = "EDUCMOM Imputation Flag"
   AGEMOMB1_I = "AGEMOMB1 Imputation Flag"
   RCURPREG = "Whether R is currently pregnant (RECODE)"
   PREGNUM = "CAPI-based total number of pregnancies (RECODE)"
   COMPREG = "CAPI-based total number of completed pregnancies (RECODE)"
   LOSSNUM = "CAPI-based total number of spontaneous pregnancy losses (RECODE)"
   ABORTION = "CAPI-based total number of induced abortions (RECODE)"
   LBPREGS = "CAPI-based total number of pregs ending in live birth (RECODE)"
   PARITY = "CAPI-based total number of live births (accounting for mult birth) (RECODE)"
   BIRTHS5 = "Number of live births in last 5 years (RECODE)"
   BIRTH1 = "Whether R had a live birth in the last 12 months (computed in post-processing)"
   OUTCOM01 = "Outcome of pregnancy  - 1st  (RECODE)"
   OUTCOM02 = "Outcome of pregnancy  - 2nd (RECODE)"
   OUTCOM03 = "Outcome of pregnancy  - 3rd (RECODE)"
   OUTCOM04 = "Outcome of pregnancy  - 4th (RECODE)"
   OUTCOM05 = "Outcome of pregnancy  - 5th (RECODE)"
   OUTCOM06 = "Outcome of pregnancy  - 6th (RECODE)"
   OUTCOM07 = "Outcome of pregnancy  - 7th (RECODE)"
   OUTCOM08 = "Outcome of pregnancy  - 8th (RECODE)"
   OUTCOM09 = "Outcome of pregnancy  - 9th (RECODE)"
   OUTCOM10 = "Outcome of pregnancy  - 10th (RECODE)"
   OUTCOM11 = "Outcome of pregnancy  - 11th (RECODE)"
   OUTCOM12 = "Outcome of pregnancy  - 12th (RECODE)"
   OUTCOM13 = "Outcome of pregnancy  - 13th (RECODE)"
   OUTCOM14 = "Outcome of pregnancy  - 14th (RECODE)"
   OUTCOM15 = "Outcome of pregnancy  - 15th (RECODE)"
   OUTCOM16 = "Outcome of pregnancy  - 16th (RECODE)"
   OUTCOM17 = "Outcome of pregnancy  - 17th (RECODE)"
   OUTCOM18 = "Outcome of pregnancy  - 18th (RECODE)"
   OUTCOM19 = "Outcome of pregnancy  - 19th (RECODE)"
   OUTCOM20 = "Outcome of pregnancy  - 20th (RECODE)"
   DATEND01 = "Year when pregnancy ended - 1st (RECODE)"
   DATEND02 = "Year when pregnancy ended - 2nd (RECODE)"
   DATEND03 = "Year when pregnancy ended - 3rd (RECODE)"
   DATEND04 = "Year when pregnancy ended - 4th (RECODE)"
   DATEND05 = "Year when pregnancy ended - 5th (RECODE)"
   DATEND06 = "Year when pregnancy ended - 6th (RECODE)"
   DATEND07 = "Year when pregnancy ended - 7th (RECODE)"
   DATEND08 = "Year when pregnancy ended - 8th (RECODE)"
   DATEND09 = "Year when pregnancy ended - 9th (RECODE)"
   DATEND10 = "Year when pregnancy ended - 10th (RECODE)"
   DATEND11 = "Year when pregnancy ended - 11th (RECODE)"
   DATEND12 = "Year when pregnancy ended - 12th (RECODE)"
   DATEND13 = "Year when pregnancy ended - 13th (RECODE)"
   DATEND14 = "Year when pregnancy ended - 14th (RECODE)"
   DATEND15 = "Year when pregnancy ended - 15th (RECODE)"
   DATEND16 = "Year when pregnancy ended - 16th (RECODE)"
   DATEND17 = "Year when pregnancy ended - 17th (RECODE)"
   DATEND18 = "Year when pregnancy ended - 18th (RECODE)"
   DATEND19 = "Year when pregnancy ended - 19th (RECODE)"
   DATEND20 = "Year when pregnancy ended - 20th (RECODE)"
   AGEPRG01 = "Age when pregnancy ended - 1st (RECODE)"
   AGEPRG02 = "Age when pregnancy ended - 2nd (RECODE)"
   AGEPRG03 = "Age when pregnancy ended - 3rd (RECODE)"
   AGEPRG04 = "Age when pregnancy ended - 4th (RECODE)"
   AGEPRG05 = "Age when pregnancy ended - 5th (RECODE)"
   AGEPRG06 = "Age when pregnancy ended - 6th (RECODE)"
   AGEPRG07 = "Age when pregnancy ended - 7th (RECODE)"
   AGEPRG08 = "Age when pregnancy ended - 8th (RECODE)"
   AGEPRG09 = "Age when pregnancy ended - 9th (RECODE)"
   AGEPRG10 = "Age when pregnancy ended - 10th (RECODE)"
   AGEPRG11 = "Age when pregnancy ended - 11th (RECODE)"
   AGEPRG12 = "Age when pregnancy ended - 12th (RECODE)"
   AGEPRG13 = "Age when pregnancy ended - 13th (RECODE)"
   AGEPRG14 = "Age when pregnancy ended - 14th (RECODE)"
   AGEPRG15 = "Age when pregnancy ended - 15th (RECODE)"
   AGEPRG16 = "Age when pregnancy ended - 16th (RECODE)"
   AGEPRG17 = "Age when pregnancy ended - 17th (RECODE)"
   AGEPRG18 = "Age when pregnancy ended - 18th (RECODE)"
   AGEPRG19 = "Age when pregnancy ended - 19th (RECODE)"
   AGEPRG20 = "Age when pregnancy ended - 20th (RECODE)"
   DATCON01 = "Year when pregnancy began - 1st (RECODE)"
   DATCON02 = "Year when pregnancy began - 2nd (RECODE)"
   DATCON03 = "Year when pregnancy began - 3rd (RECODE)"
   DATCON04 = "Year when pregnancy began - 4th (RECODE)"
   DATCON05 = "Year when pregnancy began - 5th (RECODE)"
   DATCON06 = "Year when pregnancy began - 6th (RECODE)"
   DATCON07 = "Year when pregnancy began - 7th (RECODE)"
   DATCON08 = "Year when pregnancy began - 8th (RECODE)"
   DATCON09 = "Year when pregnancy began - 9th (RECODE)"
   DATCON10 = "Year when pregnancy began - 10th (RECODE)"
   DATCON11 = "Year when pregnancy began - 11th (RECODE)"
   DATCON12 = "Year when pregnancy began - 12th (RECODE)"
   DATCON13 = "Year when pregnancy began - 13th (RECODE)"
   DATCON14 = "Year when pregnancy began - 14th (RECODE)"
   DATCON15 = "Year when pregnancy began - 15th (RECODE)"
   DATCON16 = "Year when pregnancy began - 16th (RECODE)"
   DATCON17 = "Year when pregnancy began - 17th (RECODE)"
   DATCON18 = "Year when pregnancy began - 18th (RECODE)"
   DATCON19 = "Year when pregnancy began - 19th (RECODE)"
   DATCON20 = "Year when pregnancy began - 20th (RECODE)"
   AGECON01 = "Age when pregnancy began - 1st (RECODE)"
   AGECON02 = "Age when pregnancy began - 2nd (RECODE)"
   AGECON03 = "Age when pregnancy began - 3rd (RECODE)"
   AGECON04 = "Age when pregnancy began - 4th (RECODE)"
   AGECON05 = "Age when pregnancy began - 5th (RECODE)"
   AGECON06 = "Age when pregnancy began - 6th (RECODE)"
   AGECON07 = "Age when pregnancy began - 7th (RECODE)"
   AGECON08 = "Age when pregnancy began - 8th (RECODE)"
   AGECON09 = "Age when pregnancy began - 9th (RECODE)"
   AGECON10 = "Age when pregnancy began - 10th (RECODE)"
   AGECON11 = "Age when pregnancy began - 11th (RECODE)"
   AGECON12 = "Age when pregnancy began - 12th (RECODE)"
   AGECON13 = "Age when pregnancy began - 13th (RECODE)"
   AGECON14 = "Age when pregnancy began - 14th (RECODE)"
   AGECON15 = "Age when pregnancy began - 15th (RECODE)"
   AGECON16 = "Age when pregnancy began - 16th (RECODE)"
   AGECON17 = "Age when pregnancy began - 17th (RECODE)"
   AGECON18 = "Age when pregnancy began - 18th (RECODE)"
   AGECON19 = "Age when pregnancy began - 19th (RECODE)"
   AGECON20 = "Age when pregnancy began - 20th (RECODE)"
   MAROUT01 = "Formal marital status when pregnancy ended - 1st (RECODE)"
   MAROUT02 = "Formal marital status when pregnancy ended - 2nd (RECODE)"
   MAROUT03 = "Formal marital status when pregnancy ended - 3rd (RECODE)"
   MAROUT04 = "Formal marital status when pregnancy ended - 4th (RECODE)"
   MAROUT05 = "Formal marital status when pregnancy ended - 5th (RECODE)"
   MAROUT06 = "Formal marital status when pregnancy ended - 6th (RECODE)"
   MAROUT07 = "Formal marital status when pregnancy ended - 7th (RECODE)"
   MAROUT08 = "Formal marital status when pregnancy ended - 8th (RECODE)"
   MAROUT09 = "Formal marital status when pregnancy ended - 9th (RECODE)"
   MAROUT10 = "Formal marital status when pregnancy ended - 10th (RECODE)"
   MAROUT11 = "Formal marital status when pregnancy ended - 11th (RECODE)"
   MAROUT12 = "Formal marital status when pregnancy ended - 12th (RECODE)"
   MAROUT13 = "Formal marital status when pregnancy ended - 13th (RECODE)"
   MAROUT14 = "Formal marital status when pregnancy ended - 14th (RECODE)"
   MAROUT15 = "Formal marital status when pregnancy ended - 15th (RECODE)"
   MAROUT16 = "Formal marital status when pregnancy ended - 16th (RECODE)"
   MAROUT17 = "Formal marital status when pregnancy ended - 17th (RECODE)"
   MAROUT18 = "Formal marital status when pregnancy ended - 18th (RECODE)"
   MAROUT19 = "Formal marital status when pregnancy ended - 19th (RECODE)"
   MAROUT20 = "Formal marital status when pregnancy ended - 20th (RECODE)"
   RMAROUT01 = "Informal marital status when pregnancy ended - 1st (RECODE)"
   RMAROUT02 = "Informal marital status when pregnancy ended - 2nd (RECODE)"
   RMAROUT03 = "Informal marital status when pregnancy ended - 3rd (RECODE)"
   RMAROUT04 = "Informal marital status when pregnancy ended - 4th (RECODE)"
   RMAROUT05 = "Informal marital status when pregnancy ended - 5th (RECODE)"
   RMAROUT06 = "Informal marital status when pregnancy ended - 6th (RECODE)"
   RMAROUT07 = "Informal marital status when pregnancy ended - 7th (RECODE)"
   RMAROUT08 = "Informal marital status when pregnancy ended - 8th (RECODE)"
   RMAROUT09 = "Informal marital status when pregnancy ended - 9th (RECODE)"
   RMAROUT10 = "Informal marital status when pregnancy ended - 10th (RECODE)"
   RMAROUT11 = "Informal marital status when pregnancy ended - 11th (RECODE)"
   RMAROUT12 = "Informal marital status when pregnancy ended - 12th (RECODE)"
   RMAROUT13 = "Informal marital status when pregnancy ended - 13th (RECODE)"
   RMAROUT14 = "Informal marital status when pregnancy ended - 14th (RECODE)"
   RMAROUT15 = "Informal marital status when pregnancy ended - 15th (RECODE)"
   RMAROUT16 = "Informal marital status when pregnancy ended - 16th (RECODE)"
   RMAROUT17 = "Informal marital status when pregnancy ended - 17th (RECODE)"
   RMAROUT18 = "Informal marital status when pregnancy ended - 18th (RECODE)"
   RMAROUT19 = "Informal marital status when pregnancy ended - 19th (RECODE)"
   RMAROUT20 = "Informal marital status when pregnancy ended - 20th (RECODE)"
   MARCON01 = "Formal marital status when pregnancy began - 1st (RECODE)"
   MARCON02 = "Formal marital status when pregnancy began - 2nd (RECODE)"
   MARCON03 = "Formal marital status when pregnancy began - 3rd (RECODE)"
   MARCON04 = "Formal marital status when pregnancy began - 4th (RECODE)"
   MARCON05 = "Formal marital status when pregnancy began - 5th (RECODE)"
   MARCON06 = "Formal marital status when pregnancy began - 6th (RECODE)"
   MARCON07 = "Formal marital status when pregnancy began - 7th (RECODE)"
   MARCON08 = "Formal marital status when pregnancy began - 8th (RECODE)"
   MARCON09 = "Formal marital status when pregnancy began - 9th (RECODE)"
   MARCON10 = "Formal marital status when pregnancy began - 10th (RECODE)"
   MARCON11 = "Formal marital status when pregnancy began - 11th (RECODE)"
   MARCON12 = "Formal marital status when pregnancy began - 12th (RECODE)"
   MARCON13 = "Formal marital status when pregnancy began - 13th (RECODE)"
   MARCON14 = "Formal marital status when pregnancy began - 14th (RECODE)"
   MARCON15 = "Formal marital status when pregnancy began - 15th (RECODE)"
   MARCON16 = "Formal marital status when pregnancy began - 16th (RECODE)"
   MARCON17 = "Formal marital status when pregnancy began - 17th (RECODE)"
   MARCON18 = "Formal marital status when pregnancy began - 18th (RECODE)"
   MARCON19 = "Formal marital status when pregnancy began - 19th (RECODE)"
   MARCON20 = "Formal marital status when pregnancy began - 20th (RECODE)"
   RMARCON01 = "Informal marital status when pregnancy began - 1st (RECODE)"
   RMARCON02 = "Informal marital status when pregnancy began - 2nd (RECODE)"
   RMARCON03 = "Informal marital status when pregnancy began - 3rd (RECODE)"
   RMARCON04 = "Informal marital status when pregnancy began - 4th (RECODE)"
   RMARCON05 = "Informal marital status when pregnancy began - 5th (RECODE)"
   RMARCON06 = "Informal marital status when pregnancy began - 6th (RECODE)"
   RMARCON07 = "Informal marital status when pregnancy began - 7th (RECODE)"
   RMARCON08 = "Informal marital status when pregnancy began - 8th (RECODE)"
   RMARCON09 = "Informal marital status when pregnancy began - 9th (RECODE)"
   RMARCON10 = "Informal marital status when pregnancy began - 10th (RECODE)"
   RMARCON11 = "Informal marital status when pregnancy began - 11th (RECODE)"
   RMARCON12 = "Informal marital status when pregnancy began - 12th (RECODE)"
   RMARCON13 = "Informal marital status when pregnancy began - 13th (RECODE)"
   RMARCON14 = "Informal marital status when pregnancy began - 14th (RECODE)"
   RMARCON15 = "Informal marital status when pregnancy began - 15th (RECODE)"
   RMARCON16 = "Informal marital status when pregnancy began - 16th (RECODE)"
   RMARCON17 = "Informal marital status when pregnancy began - 17th (RECODE)"
   RMARCON18 = "Informal marital status when pregnancy began - 18th (RECODE)"
   RMARCON19 = "Informal marital status when pregnancy ended - 19th (RECODE)"
   RMARCON20 = "Informal marital status when pregnancy ended - 20th (RECODE)"
   CEBOW = "Number of children born out of wedlock (RECODE)"
   CEBOWC = "Number of children born in cohabiting unions (RECODE)"
   DATBABY1 = "Year of 1st live birth (RECODE)"
   AGEBABY1 = "Age at 1st live birth (RECODE)"
   LASTPREG = "How recent was R's last pregnancy (computed in post-processing)"
   PREG_INT1 = "Inter-pregnancy interval  (in months) between 1st live birth and 2nd pregnancy conception, regardless of outcome (computed in post-processing)"
   PREG_INT2 = "Inter-pregnancy interval  (in months) between 2nd live birth and 3rd pregnancy conception, regardless of outcome (computed in post-processing)"
   PREG_INT3 = "Inter-pregnancy interval  (in months) between most recent pregnancy conception and prior live birth (computed in post-processing)"
   PREG_INT4 = "Inter-pregnancy interval  (in months) between most recent pregnancy conception and prior pregnancy end date, regardless of outcome (computed in post-processing)"
   LIVCHILD01 = "Living arrangements of 1st liveborn child from 1st pregnancy (RECODE)"
   LIVCHILD02 = "Living arrangements of 1st liveborn child from 2nd pregnancy (RECODE)"
   LIVCHILD03 = "Living arrangements of 1st liveborn child from 3rd pregnancy (RECODE)"
   LIVCHILD04 = "Living arrangements of 1st liveborn child from 4th pregnancy (RECODE)"
   LIVCHILD05 = "Living arrangements of 1st liveborn child from 5th pregnancy (RECODE)"
   LIVCHILD06 = "Living arrangements of 1st liveborn child from 6th pregnancy (RECODE)"
   LIVCHILD07 = "Living arrangements of 1st liveborn child from 7th pregnancy (RECODE)"
   LIVCHILD08 = "Living arrangements of 1st liveborn child from 8th pregnancy (RECODE)"
   LIVCHILD09 = "Living arrangements of 1st liveborn child from 9th pregnancy (RECODE)"
   LIVCHILD10 = "Living arrangements of 1st liveborn child from 10th pregnancy (RECODE)"
   LIVCHILD11 = "Living arrangements of 1st liveborn child from 11th pregnancy (RECODE)"
   LIVCHILD12 = "Living arrangements of 1st liveborn child from 12th pregnancy (RECODE)"
   LIVCHILD13 = "Living arrangements of 1st liveborn child from 13th pregnancy (RECODE)"
   LIVCHILD14 = "Living arrangements of 1st liveborn child from 14th pregnancy (RECODE)"
   LIVCHILD15 = "Living arrangements of 1st liveborn child from 15th pregnancy (RECODE)"
   LIVCHILD16 = "Living arrangements of 1st liveborn child from 16th pregnancy (RECODE)"
   LIVCHILD17 = "Living arrangements of 1st liveborn child from 17th pregnancy (RECODE)"
   LIVCHILD18 = "Living arrangements of 1st liveborn child from 18th pregnancy (RECODE)"
   LIVCHILD19 = "Living arrangements of 1st liveborn child from 19th pregnancy (RECODE)"
   LIVCHILD20 = "Living arrangements of 1st liveborn child from 20th pregnancy (RECODE)"
   RCURPREG_I = "RCURPREG Imputation Flag"
   PREGNUM_I = "PREGNUM Imputation Flag"
   COMPREG_I = "COMPREG Imputation Flag"
   LOSSNUM_I = "LOSSNUM Imputation Flag"
   ABORTION_I = "ABORTION Imputation Flag"
   LBPREGS_I = "LBPREGS Imputation Flag"
   PARITY_I = "PARITY Imputation Flag"
   BIRTHS5_I = "BIRTHS5 Imputation Flag"
   OUTCOM01_I = "OUTCOM01 Imputation Flag"
   OUTCOM02_I = "OUTCOM02 Imputation Flag"
   OUTCOM03_I = "OUTCOM03 Imputation Flag"
   OUTCOM04_I = "OUTCOM04 Imputation Flag"
   OUTCOM05_I = "OUTCOM05 Imputation Flag"
   OUTCOM06_I = "OUTCOM06 Imputation Flag"
   OUTCOM07_I = "OUTCOM07 Imputation Flag"
   OUTCOM08_I = "OUTCOM08 Imputation Flag"
   OUTCOM09_I = "OUTCOM09 Imputation Flag"
   OUTCOM10_I = "OUTCOM10 Imputation Flag"
   OUTCOM11_I = "OUTCOM11 Imputation Flag"
   OUTCOM12_I = "OUTCOM12 Imputation Flag"
   OUTCOM13_I = "OUTCOM13 Imputation Flag"
   OUTCOM14_I = "OUTCOM14 Imputation Flag"
   OUTCOM15_I = "OUTCOM15 Imputation Flag"
   OUTCOM16_I = "OUTCOM16 Imputation Flag"
   OUTCOM17_I = "OUTCOM17 Imputation Flag"
   OUTCOM18_I = "OUTCOM18 Imputation Flag"
   OUTCOM19_I = "OUTCOM19 Imputation Flag"
   OUTCOM20_I = "OUTCOM20 Imputation Flag"
   DATEND01_I = "DATEND01 Imputation Flag"
   DATEND02_I = "DATEND02 Imputation Flag"
   DATEND03_I = "DATEND03 Imputation Flag"
   DATEND04_I = "DATEND04 Imputation Flag"
   DATEND05_I = "DATEND05 Imputation Flag"
   DATEND06_I = "DATEND06 Imputation Flag"
   DATEND07_I = "DATEND07 Imputation Flag"
   DATEND08_I = "DATEND08 Imputation Flag"
   DATEND09_I = "DATEND09 Imputation Flag"
   DATEND10_I = "DATEND10 Imputation Flag"
   DATEND11_I = "DATEND11 Imputation Flag"
   DATEND12_I = "DATEND12 Imputation Flag"
   DATEND13_I = "DATEND13 Imputation Flag"
   DATEND14_I = "DATEND14 Imputation Flag"
   DATEND15_I = "DATEND15 Imputation Flag"
   DATEND16_I = "DATEND16 Imputation Flag"
   DATEND17_I = "DATEND17 Imputation Flag"
   DATEND18_I = "DATEND18 Imputation Flag"
   DATEND19_I = "DATEND19 Imputation Flag"
   DATEND20_I = "DATEND20 Imputation Flag"
   AGEPRG01_I = "AGEPRG01 Imputation Flag"
   AGEPRG02_I = "AGEPRG02 Imputation Flag"
   AGEPRG03_I = "AGEPRG03 Imputation Flag"
   AGEPRG04_I = "AGEPRG04 Imputation Flag"
   AGEPRG05_I = "AGEPRG05 Imputation Flag"
   AGEPRG06_I = "AGEPRG06 Imputation Flag"
   AGEPRG07_I = "AGEPRG07 Imputation Flag"
   AGEPRG08_I = "AGEPRG08 Imputation Flag"
   AGEPRG09_I = "AGEPRG09 Imputation Flag"
   AGEPRG10_I = "AGEPRG10 Imputation Flag"
   AGEPRG11_I = "AGEPRG11 Imputation Flag"
   AGEPRG12_I = "AGEPRG12 Imputation Flag"
   AGEPRG13_I = "AGEPRG13 Imputation Flag"
   AGEPRG14_I = "AGEPRG14 Imputation Flag"
   AGEPRG15_I = "AGEPRG15 Imputation Flag"
   AGEPRG16_I = "AGEPRG16 Imputation Flag"
   AGEPRG17_I = "AGEPRG17 Imputation Flag"
   AGEPRG18_I = "AGEPRG18 Imputation Flag"
   AGEPRG19_I = "AGEPRG19 Imputation Flag"
   AGEPRG20_I = "AGEPRG20 Imputation Flag"
   DATCON01_I = "DATCON01 Imputation Flag"
   DATCON02_I = "DATCON02 Imputation Flag"
   DATCON03_I = "DATCON03 Imputation Flag"
   DATCON04_I = "DATCON04 Imputation Flag"
   DATCON05_I = "DATCON05 Imputation Flag"
   DATCON06_I = "DATCON06 Imputation Flag"
   DATCON07_I = "DATCON07 Imputation Flag"
   DATCON08_I = "DATCON08 Imputation Flag"
   DATCON09_I = "DATCON09 Imputation Flag"
   DATCON10_I = "DATCON10 Imputation Flag"
   DATCON11_I = "DATCON11 Imputation Flag"
   DATCON12_I = "DATCON12 Imputation Flag"
   DATCON13_I = "DATCON13 Imputation Flag"
   DATCON14_I = "DATCON14 Imputation Flag"
   DATCON15_I = "DATCON15 Imputation Flag"
   DATCON16_I = "DATCON16 Imputation Flag"
   DATCON17_I = "DATCON17 Imputation Flag"
   DATCON18_I = "DATCON18 Imputation Flag"
   DATCON19_I = "DATCON19 Imputation Flag"
   DATCON20_I = "DATCON20 Imputation Flag"
   AGECON01_I = "AGECON01 Imputation Flag"
   AGECON02_I = "AGECON02 Imputation Flag"
   AGECON03_I = "AGECON03 Imputation Flag"
   AGECON04_I = "AGECON04 Imputation Flag"
   AGECON05_I = "AGECON05 Imputation Flag"
   AGECON06_I = "AGECON06 Imputation Flag"
   AGECON07_I = "AGECON07 Imputation Flag"
   AGECON08_I = "AGECON08 Imputation Flag"
   AGECON09_I = "AGECON09 Imputation Flag"
   AGECON10_I = "AGECON10 Imputation Flag"
   AGECON11_I = "AGECON11 Imputation Flag"
   AGECON12_I = "AGECON12 Imputation Flag"
   AGECON13_I = "AGECON13 Imputation Flag"
   AGECON14_I = "AGECON14 Imputation Flag"
   AGECON15_I = "AGECON15 Imputation Flag"
   AGECON16_I = "AGECON16 Imputation Flag"
   AGECON17_I = "AGECON17 Imputation Flag"
   AGECON18_I = "AGECON18 Imputation Flag"
   AGECON19_I = "AGECON19 Imputation Flag"
   AGECON20_I = "AGECON20 Imputation Flag"
   MAROUT01_I = "MAROUT01 Imputation Flag"
   MAROUT02_I = "MAROUT02 Imputation Flag"
   MAROUT03_I = "MAROUT03 Imputation Flag"
   MAROUT04_I = "MAROUT04 Imputation Flag"
   MAROUT05_I = "MAROUT05 Imputation Flag"
   MAROUT06_I = "MAROUT06 Imputation Flag"
   MAROUT07_I = "MAROUT07 Imputation Flag"
   MAROUT08_I = "MAROUT08 Imputation Flag"
   MAROUT09_I = "MAROUT09 Imputation Flag"
   MAROUT10_I = "MAROUT10 Imputation Flag"
   MAROUT11_I = "MAROUT11 Imputation Flag"
   MAROUT12_I = "MAROUT12 Imputation Flag"
   MAROUT13_I = "MAROUT13 Imputation Flag"
   MAROUT14_I = "MAROUT14 Imputation Flag"
   MAROUT15_I = "MAROUT15 Imputation Flag"
   MAROUT16_I = "MAROUT16 Imputation Flag"
   MAROUT17_I = "MAROUT17 Imputation Flag"
   MAROUT18_I = "MAROUT18 Imputation Flag"
   MAROUT19_I = "MAROUT19 Imputation Flag"
   MAROUT20_I = "MAROUT20 Imputation Flag"
   RMAROUT01_I = "RMAROUT01 Imputation Flag"
   RMAROUT02_I = "RMAROUT02 Imputation Flag"
   RMAROUT03_I = "RMAROUT03 Imputation Flag"
   RMAROUT04_I = "RMAROUT04 Imputation Flag"
   RMAROUT05_I = "RMAROUT05 Imputation Flag"
   RMAROUT06_I = "RMAROUT06 Imputation Flag"
   RMAROUT07_I = "RMAROUT07 Imputation Flag"
   RMAROUT08_I = "RMAROUT08 Imputation Flag"
   RMAROUT09_I = "RMAROUT09 Imputation Flag"
   RMAROUT10_I = "RMAROUT10 Imputation Flag"
   RMAROUT11_I = "RMAROUT11 Imputation Flag"
   RMAROUT12_I = "RMAROUT12 Imputation Flag"
   RMAROUT13_I = "RMAROUT13 Imputation Flag"
   RMAROUT14_I = "RMAROUT14 Imputation Flag"
   RMAROUT15_I = "RMAROUT15 Imputation Flag"
   RMAROUT16_I = "RMAROUT16 Imputation Flag"
   RMAROUT17_I = "RMAROUT17 Imputation Flag"
   RMAROUT18_I = "RMAROUT18 Imputation Flag"
   RMAROUT19_I = "RMAROUT19 Imputation Flag"
   RMAROUT20_I = "RMAROUT20 Imputation Flag"
   MARCON01_I = "MARCON01 Imputation Flag"
   MARCON02_I = "MARCON02 Imputation Flag"
   MARCON03_I = "MARCON03 Imputation Flag"
   MARCON04_I = "MARCON04 Imputation Flag"
   MARCON05_I = "MARCON05 Imputation Flag"
   MARCON06_I = "MARCON06 Imputation Flag"
   MARCON07_I = "MARCON07 Imputation Flag"
   MARCON08_I = "MARCON08 Imputation Flag"
   MARCON09_I = "MARCON09 Imputation Flag"
   MARCON10_I = "MARCON10 Imputation Flag"
   MARCON11_I = "MARCON11 Imputation Flag"
   MARCON12_I = "MARCON12 Imputation Flag"
   MARCON13_I = "MARCON13 Imputation Flag"
   MARCON14_I = "MARCON14 Imputation Flag"
   MARCON15_I = "MARCON15 Imputation Flag"
   MARCON16_I = "MARCON16 Imputation Flag"
   MARCON17_I = "MARCON17 Imputation Flag"
   MARCON18_I = "MARCON18 Imputation Flag"
   MARCON19_I = "MARCON19 Imputation Flag"
   MARCON20_I = "MARCON20 Imputation Flag"
   RMARCON01_I = "RMARCON01 Imputation Flag"
   RMARCON02_I = "RMARCON02 Imputation Flag"
   RMARCON03_I = "RMARCON03 Imputation Flag"
   RMARCON04_I = "RMARCON04 Imputation Flag"
   RMARCON05_I = "RMARCON05 Imputation Flag"
   RMARCON06_I = "RMARCON06 Imputation Flag"
   RMARCON07_I = "RMARCON07 Imputation Flag"
   RMARCON08_I = "RMARCON08 Imputation Flag"
   RMARCON09_I = "RMARCON09 Imputation Flag"
   RMARCON10_I = "RMARCON10 Imputation Flag"
   RMARCON11_I = "RMARCON11 Imputation Flag"
   RMARCON12_I = "RMARCON12 Imputation Flag"
   RMARCON13_I = "RMARCON13 Imputation Flag"
   RMARCON14_I = "RMARCON14 Imputation Flag"
   RMARCON15_I = "RMARCON15 Imputation Flag"
   RMARCON16_I = "RMARCON16 Imputation Flag"
   RMARCON17_I = "RMARCON17 Imputation Flag"
   RMARCON18_I = "RMARCON18 Imputation Flag"
   RMARCON19_I = "RMARCON19 Imputation Flag"
   RMARCON20_I = "RMARCON20 Imputation Flag"
   CEBOW_I = "CEBOW Imputation Flag"
   CEBOWC_I = "CEBOWC Imputation Flag"
   DATBABY1_I = "DATBABY1 Imputation Flag"
   AGEBABY1_I = "AGEBABY1 Imputation Flag"
   LIVCHILD01_I = "LIVCHILD01 Imputation Flag"
   LIVCHILD02_I = "LIVCHILD02 Imputation Flag"
   LIVCHILD03_I = "LIVCHILD03 Imputation Flag"
   LIVCHILD04_I = "LIVCHILD04 Imputation Flag"
   LIVCHILD05_I = "LIVCHILD05 Imputation Flag"
   LIVCHILD06_I = "LIVCHILD06 Imputation Flag"
   LIVCHILD07_I = "LIVCHILD07 Imputation Flag"
   LIVCHILD08_I = "LIVCHILD08 Imputation Flag"
   LIVCHILD09_I = "LIVCHILD09 Imputation Flag"
   LIVCHILD10_I = "LIVCHILD10 Imputation Flag"
   LIVCHILD11_I = "LIVCHILD11 Imputation Flag"
   LIVCHILD12_I = "LIVCHILD12 Imputation Flag"
   LIVCHILD13_I = "LIVCHILD13 Imputation Flag"
   LIVCHILD14_I = "LIVCHILD14 Imputation Flag"
   LIVCHILD15_I = "LIVCHILD15 Imputation Flag"
   LIVCHILD16_I = "LIVCHILD16 Imputation Flag"
   LIVCHILD17_I = "LIVCHILD17 Imputation Flag"
   LIVCHILD18_I = "LIVCHILD18 Imputation Flag"
   LIVCHILD19_I = "LIVCHILD19 Imputation Flag"
   LIVCHILD20_I = "LIVCHILD20 Imputation Flag"
   FMARNO = "Number of times R has been married (RECODE)"
   CSPBIOKD = "Total number of biological children R has had with current spouse or cohabiting partner (RECODE)"
   MARDAT01 = "Year of R's 1st marriage (RECODE)"
   MARDAT02 = "Year of R's 2nd marriage (RECODE)"
   MARDAT03 = "Year of R's 3rd marriage (RECODE)"
   MARDAT04 = "Year of R's 4th marriage (RECODE)"
   MARDAT05 = "Year of R's 5th marriage (RECODE)"
   MARDAT06 = "Year of R's 6th marriage (RECODE)"
   MARDIS01 = "Year when R's 1st marriage ended (RECODE)"
   MARDIS02 = "Year when R's 2nd marriage ended (RECODE)"
   MARDIS03 = "Year when R's 3rd marriage ended (RECODE)"
   MARDIS04 = "Year when R's 4th marriage ended (RECODE)"
   MARDIS05 = "Year when R's 5th marriage ended (RECODE)"
   MARDIS06 = "Year when R's 6th marriage ended (RECODE)"
   MAREND01 = "How R's 1st marriage ended (RECODE)"
   MAREND02 = "How R's 2nd marriage ended (RECODE)"
   MAREND03 = "How R's 3rd marriage ended (RECODE)"
   MAREND04 = "How R's 4th marriage ended (RECODE)"
   MAREND05 = "How R's 5th marriage ended (RECODE)"
   MAREND06 = "How R's 6th marriage ended (RECODE)"
   FMAR1AGE = "Age at first marriage (RECODE)"
   AGEDISS1 = "Age at dissolution of first marriage (RECODE)"
   AGEDD1 = "Age at divorce or death:  1st marriage (RECODE)"
   MAR1DISS = "Months btw/1st marriage & dissolution (or interview) (RECODE)"
   DD1REMAR = "Months btw/divorce or death (1st marriage) and remarriage (or interview) (RECODE)"
   MAR1BIR1 = "Months btw/1st marriage & 1st birth (or interview) (RECODE)"
   MAR1CON1 = "Months btw/1st marriage & 1st conception (or interview) (RECODE)"
   CON1MAR1 = "Months btw/1st conception & 1st marriage (or interview) (RECODE)"
   B1PREMAR = "Whether R's first birth was premarital (RECODE)"
   COHEVER = "Whether R ever cohabited outside of marriage (RECODE)"
   EVMARCOH = "Whether R ever married or cohabited (RECODE)"
   PMARRNO = "Number of premarital cohabitations (RECODE)"
   NONMARR = "Number of nonmarital cohabitations (RECODE)"
   TIMESCOH = "Total number of cohabitations  (RECODE)"
   COHAB1 = "Year of 1st cohabitation (incl. premarital cohabitation) (RECODE)"
   COHSTAT = "Cohabitation experience relative to 1st marriage (RECODE)"
   COHOUT = "Outcome of 1st cohabitation (RECODE)"
   COH1DUR = "Duration (in months) of R's first cohabitation (RECODE)"
   HADSEX = "Whether R has ever had sexual intercourse with a male (RECODE)"
   SEXONCE = "Whether R has had sex only once (RECODE)"
   SEXEVER = "Whether R has ever had sexual intercourse with a male since menarche (RECODE)"
   VRY1STAG = "Age at first intercourse (even if before menarche) (RECODE)"
   SEX1AGE = "Age at first intercourse since menarche (RECODE)"
   VRY1STSX = "CM date of first intercourse (even if before menarche) (RECODE)"
   DATESEX1 = "CM date of first intercourse since menarche (RECODE)"
   SEXMAR = "Mos btw/1st intercourse (even if before menarche) & 1st marriage (or interview) (RECODE)"
   SEX1FOR = "Mos btw/1st intercourse since menarche & 1st marriage (or interview)  (RECODE)"
   SEXUNION = "Months between 1st intercourse and 1st coresidential union (marriage or cohabitation) (RECODE)"
   SEXOUT = "Outcome of 1st sexual intercourse (RECODE)"
   FPDUR = "Months between 1st and last/most recent intercourse with 1st partner ever (RECODE)"
   PARTS1YR = "Number of opposite-sex partners in last 12 mos (RECODE)"
   LSEXDATE = "CM date of last or most recent sexual intercourse (RECODE)"
   LSEXPREG = "Whether R was pregnant in month of last sexual intercourse in the past 12 months (computed in post-processing)"
   SEX3MO = "Whether R had sex in past 3 months (from sexual partner dates) (RECODE)"
   NUMP3MOS = "Number of male partners in last 3 mos (RECODE)"
   LSEXRAGE = "R's age at last or most recent sexual intercourse (RECODE)"
   PARTDUR1 = "Months between 1st and most recent intercourse with last/most recent partner (RECODE)"
   PARTDUR2 = "Months between 1st and most recent intercourse with 2nd-to-last partner within past 12 mos (RECODE)"
   PARTDUR3 = "Months between 1st and most recent intercourse with 3rd-to-last partner within past 12 mos (RECODE)"
   RELATP1 = "Relationship at time of 1st sex with last/most recent partner (RECODE)"
   RELATP2 = "Relationship at time of 1st sex with 2nd-to-last partner within past 12 mos (RECODE)"
   RELATP3 = "Relationship at time of 1st sex with 3rd-to-last partner within past 12 mos (RECODE)"
   LIFPRTNR = "Number of opposite-sex partners in lifetime  (RECODE)"
   FMARNO_I = "FMARNO Imputation Flag"
   CSPBIOKD_I = "CSPBIOKD Imputation Flag"
   MARDAT01_I = "MARDAT01 Imputation Flag"
   MARDAT02_I = "MARDAT02 Imputation Flag"
   MARDAT03_I = "MARDAT03 Imputation Flag"
   MARDAT04_I = "MARDAT04 Imputation Flag"
   MARDAT05_I = "MARDAT05 Imputation Flag"
   MARDAT06_I = "MARDAT06 Imputation Flag"
   MARDIS01_I = "MARDIS01 Imputation Flag"
   MARDIS02_I = "MARDIS02 Imputation Flag"
   MARDIS03_I = "MARDIS03 Imputation Flag"
   MARDIS04_I = "MARDIS04 Imputation Flag"
   MARDIS05_I = "MARDIS05 Imputation Flag"
   MARDIS06_I = "MARDIS06 Imputation Flag"
   MAREND01_I = "MAREND1 Imputation Flag"
   MAREND02_I = "MAREND2 Imputation Flag"
   MAREND03_I = "MAREND3 Imputation Flag"
   MAREND04_I = "MAREND4 Imputation Flag"
   MAREND05_I = "MAREND5 Imputation Flag"
   MAREND06_I = "MAREND6 Imputation Flag"
   FMAR1AGE_I = "FMAR1AGE Imputation Flag"
   AGEDISS1_I = "AGEDISS1 Imputation Flag"
   AGEDD1_I = "AGEDD1 Imputation Flag"
   MAR1DISS_I = "MAR1DISS Imputation Flag"
   DD1REMAR_I = "DD1REMAR Imputation Flag"
   MAR1BIR1_I = "MAR1BIR1 Imputation Flag"
   MAR1CON1_I = "MAR1CON1 Imputation Flag"
   CON1MAR1_I = "CON1MAR1 Imputation Flag"
   B1PREMAR_I = "B1PREMAR Imputation Flag"
   COHEVER_I = "COHEVER Imputation Flag"
   EVMARCOH_I = "EVMARCOH Imputation Flag"
   PMARRNO_I = "PMARRNO Imputation Flag"
   NONMARR_I = "NONMARR Imputation Flag"
   TIMESCOH_I = "TIMESCOH Imputation Flag"
   COHAB1_I = "COHAB1 Imputation Flag"
   COHSTAT_I = "COHSTAT Imputation Flag"
   COHOUT_I = "COHOUT Imputation Flag"
   COH1DUR_I = "COH1DUR Imputation Flag"
   HADSEX_I = "HADSEX Imputation Flag"
   SEXEVER_I = "SEXEVER Imputation Flag"
   VRY1STAG_I = "VRY1STAG Imputation Flag"
   SEX1AGE_I = "SEX1AGE Imputation Flag"
   VRY1STSX_I = "VRY1STSX Imputation Flag"
   DATESEX1_I = "DATESEX1 Imputation Flag"
   SEXONCE_I = "SEXONCE Imputation Flag"
   SEXMAR_I = "SEXMAR Imputation Flag"
   SEX1FOR_I = "SEX1FOR Imputation Flag"
   SEXUNION_I = "SEXUNION Imputation Flag"
   SEXOUT_I = "SEXOUT Imputation Flag"
   FPDUR_I = "FPDUR Imputation Flag"
   PARTS1YR_I = "PARTS1YR Imputation Flag"
   LSEXDATE_I = "LSEXDATE Imputation Flag"
   SEXP3MO_I = "SEXP3MO Imputation Flag"
   NUMP3MOS_I = "NUMP3MOS Imputation Flag"
   LSEXRAGE_I = "LSEXRAGE Imputation Flag"
   PARTDUR1_I = "PARTDUR1 Imputation Flag"
   PARTDUR2_I = "PARTDUR2 Imputation Flag"
   PARTDUR3_I = "PARTDUR3 Imputation Flag"
   RELATP1_I = "RELATP1 Imputation Flag"
   RELATP2_I = "RELATP2 Imputation Flag"
   RELATP3_I = "RELATP3 Imputation Flag"
   LIFPRTNR_I = "LIFPRTNR Imputation Flag"
   STRLOPER = "Type of sterilization operation "in effect" (RECODE)"
   FECUND = "Fecundity status (RECODE)"
   ANYBC36 = "Any method use in 36 months before interview"
   NOSEX36 = "Any months of NONintercourse in 36 months before interview"
   INFERT = "Infertility status (RECODE)"
   ANYBC12 = "Any method use in 12 months before interview"
   ANYMTHD = "Ever used any method for any reason (RECODE)"
   NOSEX12 = "Number of months of nonintercourse in the 12 months prior to interview (RECODE)"
   SEXP3MO = "Whether R had sex in past 3 months (from months of nonintercourse series) (RECODE)"
   CONSTAT1 = "Current contraceptive status (1st priority code) (RECODE)"
   CONSTAT2 = "2nd priority code for current contraceptive status (RECODE)"
   CONSTAT3 = "3rd priority code for current contraceptive status (RECODE)"
   CONSTAT4 = "4th priority code for current contraceptive status (RECODE)"
   PILLR = "Ever used the pill for any reason (RECODE)"
   CONDOMR = "Ever used condom (RECODE)"
   SEX1MTHD1 = "Contraceptive method used at first sex, if any: 1st mentioned (RECODE)"
   SEX1MTHD2 = "Contraceptive method used at first sex, if any: 2nd mentioned (RECODE)"
   SEX1MTHD3 = "Contraceptive method used at first sex, if any: 3rd mentioned (RECODE)"
   SEX1MTHD4 = "Contraceptive method used at first sex, if any: 4th mentioned (RECODE)"
   MTHUSE12 = "Whether used any contraceptive method at last sex in past 12 months (RECODE)"
   METH12M1 = "Contraceptive method used at last sex past 12 mos: 1st mentioned (RECODE)"
   METH12M2 = "Contraceptive method used at last sex past 12 mos: 2nd mentioned (RECODE)"
   METH12M3 = "Contraceptive method used at last sex past 12 mos: 3rd mentioned (RECODE)"
   METH12M4 = "Contraceptive method used at last sex past 12 mos: 4th mentioned (RECODE)"
   MTHUSE3 = "Whether used any contraceptive method at last sex in past 3 mos (RECODE)"
   METH3M1 = "Contraceptive method used last sex past 3 mos: 1st mentioned (RECODE)"
   METH3M2 = "Contraceptive method used last sex past 3 mos: 2nd mentioned (RECODE)"
   METH3M3 = "Contraceptive method used last sex past 3 mos: 3rd mentioned (RECODE)"
   METH3M4 = "Contraceptive method used last sex past 3 mos: 4th mentioned (RECODE)"
   FMETHOD1 = "First method ever used: 1st mentioned (RECODE)"
   FMETHOD2 = "First method ever used: 2nd mentioned (RECODE)"
   FMETHOD3 = "First method ever used: 3rd mentioned (RECODE)"
   FMETHOD4 = "First method ever used: 4th mentioned (RECODE)"
   DATEUSE1 = "Date R used first method for the first time (RECODE)"
   OLDWP01 = "Wantedness of 1st pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP02 = "Wantedness of 2nd pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP03 = "Wantedness of 3rd pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP04 = "Wantedness of 4th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP05 = "Wantedness of 5th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP06 = "Wantedness of 6th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP07 = "Wantedness of 7th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP08 = "Wantedness of 8th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP09 = "Wantedness of 9th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP10 = "Wantedness of 10th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP11 = "Wantedness of 11th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP12 = "Wantedness of 12th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP13 = "Wantedness of 13th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP14 = "Wantedness of 14th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP15 = "Wantedness of 15th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP16 = "Wantedness of 16th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP17 = "Wantedness of 17th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP18 = "Wantedness of 18th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP19 = "Wantedness of 19th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWP20 = "Wantedness of 20th pregnancy--R's partner--cycle 4 version (RECODE)"
   OLDWR01 = "Wantedness of 1st pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR02 = "Wantedness of 2nd pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR03 = "Wantedness of 3rd pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR04 = "Wantedness of 4th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR05 = "Wantedness of 5th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR06 = "Wantedness of 6th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR07 = "Wantedness of 7th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR08 = "Wantedness of 8th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR09 = "Wantedness of 9th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR10 = "Wantedness of 10th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR11 = "Wantedness of 11th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR12 = "Wantedness of 12th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR13 = "Wantedness of 13th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR14 = "Wantedness of 14th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR15 = "Wantedness of 15th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR16 = "Wantedness of 16th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR17 = "Wantedness of 17th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR18 = "Wantedness of 18th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR19 = "Wantedness of 19th pregnancy--Respondent--cycle 4 version (RECODE)"
   OLDWR20 = "Wantedness of 20th pregnancy--Respondent--cycle 4 version (RECODE)"
   WANTRP01 = "Wantedness of 1st pregnancy--Respondent (RECODE)"
   WANTRP02 = "Wantedness of 2nd pregnancy--Respondent (RECODE)"
   WANTRP03 = "Wantedness of 3rd pregnancy--Respondent (RECODE)"
   WANTRP04 = "Wantedness of 4th pregnancy--Respondent (RECODE)"
   WANTRP05 = "Wantedness of 5th pregnancy--Respondent (RECODE)"
   WANTRP06 = "Wantedness of 6th pregnancy--Respondent (RECODE)"
   WANTRP07 = "Wantedness of 7th pregnancy--Respondent (RECODE)"
   WANTRP08 = "Wantedness of 8th pregnancy--Respondent (RECODE)"
   WANTRP09 = "Wantedness of 9th pregnancy--Respondent (RECODE)"
   WANTRP10 = "Wantedness of 10th pregnancy--Respondent (RECODE)"
   WANTRP11 = "Wantedness of 11th pregnancy--Respondent (RECODE)"
   WANTRP12 = "Wantedness of 12th pregnancy--Respondent (RECODE)"
   WANTRP13 = "Wantedness of 13th pregnancy--Respondent (RECODE)"
   WANTRP14 = "Wantedness of 14th pregnancy--Respondent (RECODE)"
   WANTRP15 = "Wantedness of 15th pregnancy--Respondent (RECODE)"
   WANTRP16 = "Wantedness of 16th pregnancy--Respondent (RECODE)"
   WANTRP17 = "Wantedness of 17th pregnancy--Respondent (RECODE)"
   WANTRP18 = "Wantedness of 18th pregnancy--Respondent (RECODE)"
   WANTRP19 = "Wantedness of 19th pregnancy--Respondent (RECODE)"
   WANTRP20 = "Wantedness of 20th pregnancy--Respondent (RECODE)"
   WANTP01 = "Wantedness of 1st pregnancy--R's partner (RECODE)"
   WANTP02 = "Wantedness of 2nd pregnancy--R's partner (RECODE)"
   WANTP03 = "Wantedness of 3rd pregnancy--R's partner (RECODE)"
   WANTP04 = "Wantedness of 4th pregnancy--R's partner (RECODE)"
   WANTP05 = "Wantedness of 5th pregnancy--R's partner (RECODE)"
   WANTP06 = "Wantedness of 6th pregnancy--R's partner (RECODE)"
   WANTP07 = "Wantedness of 7th pregnancy--R's partner (RECODE)"
   WANTP08 = "Wantedness of 8th pregnancy--R's partner (RECODE)"
   WANTP09 = "Wantedness of 9th pregnancy--R's partner (RECODE)"
   WANTP10 = "Wantedness of 10th pregnancy--R's partner (RECODE)"
   WANTP11 = "Wantedness of 11th pregnancy--R's partner (RECODE)"
   WANTP12 = "Wantedness of 12th pregnancy--R's partner (RECODE)"
   WANTP13 = "Wantedness of 13th pregnancy--R's partner (RECODE)"
   WANTP14 = "Wantedness of 14th pregnancy--R's partner (RECODE)"
   WANTP15 = "Wantedness of 15th pregnancy--R's partner (RECODE)"
   WANTP16 = "Wantedness of 16th pregnancy--R's partner (RECODE)"
   WANTP17 = "Wantedness of 17th pregnancy--R's partner (RECODE)"
   WANTP18 = "Wantedness of 18th pregnancy--R's partner (RECODE)"
   WANTP19 = "Wantedness of 19th pregnancy--R's partner (RECODE)"
   WANTP20 = "Wantedness of 20th pregnancy--R's partner (RECODE)"
   NWWANTRP01 = "Detailed wantedness of 1st pregnancy--Respondent (RECODE)"
   NWWANTRP02 = "Detailed wantedness of 2nd pregnancy--Respondent (RECODE)"
   NWWANTRP03 = "Detailed wantedness of 3rd pregnancy--Respondent (RECODE)"
   NWWANTRP04 = "Detailed wantedness of 4th pregnancy--Respondent (RECODE)"
   NWWANTRP05 = "Detailed wantedness of 5th pregnancy--Respondent (RECODE)"
   NWWANTRP06 = "Detailed wantedness of 6th pregnancy--Respondent (RECODE)"
   NWWANTRP07 = "Detailed wantedness of 7th pregnancy--Respondent (RECODE)"
   NWWANTRP08 = "Detailed wantedness of 8th pregnancy--Respondent (RECODE)"
   NWWANTRP09 = "Detailed wantedness of 9th pregnancy--Respondent (RECODE)"
   NWWANTRP10 = "Detailed wantedness of 10th pregnancy--Respondent (RECODE)"
   NWWANTRP11 = "Detailed wantedness of 11th pregnancy--Respondent (RECODE)"
   NWWANTRP12 = "Detailed wantedness of 12th pregnancy--Respondent (RECODE)"
   NWWANTRP13 = "Detailed wantedness of 13th pregnancy--Respondent (RECODE)"
   NWWANTRP14 = "Detailed wantedness of 14th pregnancy--Respondent (RECODE)"
   NWWANTRP15 = "Detailed wantedness of 15th pregnancy--Respondent (RECODE)"
   NWWANTRP16 = "Detailed wantedness of 16th pregnancy--Respondent (RECODE)"
   NWWANTRP17 = "Detailed wantedness of 17th pregnancy--Respondent (RECODE)"
   NWWANTRP18 = "Detailed wantedness of 18th pregnancy--Respondent (RECODE)"
   NWWANTRP19 = "Detailed wantedness of 19th pregnancy--Respondent (RECODE)"
   NWWANTRP20 = "Detailed wantedness of 20th pregnancy--Respondent (RECODE)"
   WANTP5 = "Number of wanted pregnancies in the last 5 years (RECODE)"
   STRLOPER_I = "STRLOPER Imputation Flag"
   FECUND_I = "FECUND Imputation Flag"
   INFERT_I = "INFERT Imputation Flag"
   ANYMTHD_I = "ANYMTHD Imputation Flag"
   NOSEX12_I = "NOSEX12 Imputation Flag"
   SEX3MO_I = "SEX3MO Imputation Flag"
   CONSTAT1_I = "CONSTAT1 Imputation Flag"
   CONSTAT2_I = "CONSTAT2 Imputation Flag"
   CONSTAT3_I = "CONSTAT3 Imputation Flag"
   CONSTAT4_I = "CONSTAT4 Imputation Flag"
   PILLR_I = "PILLR Imputation Flag"
   CONDOMR_I = "CONDOMR Imputation Flag"
   SEX1MTHD1_I = "SEX1MTHD1 Imputation Flag"
   SEX1MTHD2_I = "SEX1MTHD2 Imputation Flag"
   SEX1MTHD3_I = "SEX1MTHD3 Imputation Flag"
   SEX1MTHD4_I = "SEX1MTHD4 Imputation Flag"
   MTHUSE12_I = "MTHUSE12 Imputation Flag"
   METH12M1_I = "METH12M1 Imputation Flag"
   METH12M2_I = "METH12M2 Imputation Flag"
   METH12M3_I = "METH12M3 Imputation Flag"
   METH12M4_I = "METH12M4 Imputation Flag"
   MTHUSE3_I = "MTHUSE3 Imputation Flag"
   METH3M1_I = "METH3M1 Imputation Flag"
   METH3M2_I = "METH3M2 Imputation Flag"
   METH3M3_I = "METH3M3 Imputation Flag"
   METH3M4_I = "METH3M4 Imputation Flag"
   FMETHOD1_I = "FMETHOD1 Imputation Flag"
   FMETHOD2_I = "FMETHOD2 Imputation Flag"
   FMETHOD3_I = "FMETHOD3 Imputation Flag"
   FMETHOD4_I = "FMETHOD4 Imputation Flag"
   DATEUSE1_I = "DATEUSE1 Imputation Flag"
   OLDWP01_I = "OLDWP01 Imputation Flag"
   OLDWP02_I = "OLDWP02 Imputation Flag"
   OLDWP03_I = "OLDWP03 Imputation Flag"
   OLDWP04_I = "OLDWP04 Imputation Flag"
   OLDWP05_I = "OLDWP05 Imputation Flag"
   OLDWP06_I = "OLDWP06 Imputation Flag"
   OLDWP07_I = "OLDWP07 Imputation Flag"
   OLDWP08_I = "OLDWP08 Imputation Flag"
   OLDWP09_I = "OLDWP09 Imputation Flag"
   OLDWP10_I = "OLDWP10 Imputation Flag"
   OLDWP11_I = "OLDWP11 Imputation Flag"
   OLDWP12_I = "OLDWP12 Imputation Flag"
   OLDWP13_I = "OLDWP13 Imputation Flag"
   OLDWP14_I = "OLDWP14 Imputation Flag"
   OLDWP15_I = "OLDWP15 Imputation Flag"
   OLDWP16_I = "OLDWP16 Imputation Flag"
   OLDWP17_I = "OLDWP17 Imputation Flag"
   OLDWP18_I = "OLDWP18 Imputation Flag"
   OLDWP19_I = "OLDWP19 Imputation Flag"
   OLDWP20_I = "OLDWP20 Imputation Flag"
   OLDWR01_I = "OLDWR01 Imputation Flag"
   OLDWR02_I = "OLDWR02 Imputation Flag"
   OLDWR03_I = "OLDWR03 Imputation Flag"
   OLDWR04_I = "OLDWR04 Imputation Flag"
   OLDWR05_I = "OLDWR05 Imputation Flag"
   OLDWR06_I = "OLDWR06 Imputation Flag"
   OLDWR07_I = "OLDWR07 Imputation Flag"
   OLDWR08_I = "OLDWR08 Imputation Flag"
   OLDWR09_I = "OLDWR09 Imputation Flag"
   OLDWR10_I = "OLDWR10 Imputation Flag"
   OLDWR11_I = "OLDWR11 Imputation Flag"
   OLDWR12_I = "OLDWR12 Imputation Flag"
   OLDWR13_I = "OLDWR13 Imputation Flag"
   OLDWR14_I = "OLDWR14 Imputation Flag"
   OLDWR15_I = "OLDWR15 Imputation Flag"
   OLDWR16_I = "OLDWR16 Imputation Flag"
   OLDWR17_I = "OLDWR17 Imputation Flag"
   OLDWR18_I = "OLDWR18 Imputation Flag"
   OLDWR19_I = "OLDWR19 Imputation Flag"
   OLDWR20_I = "OLDWR20 Imputation Flag"
   WANTRP01_I = "WANTRP01 Imputation Flag"
   WANTRP02_I = "WANTRP02 Imputation Flag"
   WANTRP03_I = "WANTRP03 Imputation Flag"
   WANTRP04_I = "WANTRP04 Imputation Flag"
   WANTRP05_I = "WANTRP05 Imputation Flag"
   WANTRP06_I = "WANTRP06 Imputation Flag"
   WANTRP07_I = "WANTRP07 Imputation Flag"
   WANTRP08_I = "WANTRP08 Imputation Flag"
   WANTRP09_I = "WANTRP09Imputation Flag"
   WANTRP10_I = "WANTRP10 Imputation Flag"
   WANTRP11_I = "WANTRP11 Imputation Flag"
   WANTRP12_I = "WANTRP12 Imputation Flag"
   WANTRP13_I = "WANTRP13 Imputation Flag"
   WANTRP14_I = "WANTRP14 Imputation Flag"
   WANTRP15_I = "WANTRP15 Imputation Flag"
   WANTRP16_I = "WANTRP16 Imputation Flag"
   WANTRP17_I = "WANTRP17 Imputation Flag"
   WANTRP18_I = "WANTRP18 Imputation Flag"
   WANTRP19_I = "WANTRP19 Imputation Flag"
   WANTRP20_I = "WANTRP20 Imputation Flag"
   WANTP01_I = "WANTP01 Imputation Flag"
   WANTP02_I = "WANTP02 Imputation Flag"
   WANTP03_I = "WANTP03 Imputation Flag"
   WANTP04_I = "WANTP04 Imputation Flag"
   WANTP05_I = "WANTP05 Imputation Flag"
   WANTP06_I = "WANTP06 Imputation Flag"
   WANTP07_I = "WANTP07 Imputation Flag"
   WANTP08_I = "WANTP08 Imputation Flag"
   WANTP09_I = "WANTP09 Imputation Flag"
   WANTP10_I = "WANTP10 Imputation Flag"
   WANTP11_I = "WANTP11 Imputation Flag"
   WANTP12_I = "WANTP12 Imputation Flag"
   WANTP13_I = "WANTP13 Imputation Flag"
   WANTP14_I = "WANTP14 Imputation Flag"
   WANTP15_I = "WANTP15 Imputation Flag"
   WANTP16_I = "WANTP16 Imputation Flag"
   WANTP17_I = "WANTP17 Imputation Flag"
   WANTP18_I = "WANTP18 Imputation Flag"
   WANTP19_I = "WANTP19 Imputation Flag"
   WANTP20_I = "WANTP20 Imputation Flag"
   NWWANTRP01_I = "NWWANTRP01 Imputation Flag"
   NWWANTRP02_I = "NWWANTRP02 Imputation Flag"
   NWWANTRP03_I = "NWWANTRP03 Imputation Flag"
   NWWANTRP04_I = "NWWANTRP04 Imputation Flag"
   NWWANTRP05_I = "NWWANTRP05 Imputation Flag"
   NWWANTRP06_I = "NWWANTRP06 Imputation Flag"
   NWWANTRP07_I = "NWWANTRP07 Imputation Flag"
   NWWANTRP08_I = "NWWANTRP08 Imputation Flag"
   NWWANTRP09_I = "NWWANTRP09 Imputation Flag"
   NWWANTRP10_I = "NWWANTRP10 Imputation Flag"
   NWWANTRP11_I = "NWWANTRP11 Imputation Flag"
   NWWANTRP12_I = "NWWANTRP12 Imputation Flag"
   NWWANTRP13_I = "NWWANTRP13 Imputation Flag"
   NWWANTRP14_I = "NWWANTRP14 Imputation Flag"
   NWWANTRP15_I = "NWWANTRP15 Imputation Flag"
   NWWANTRP16_I = "NWWANTRP16 Imputation Flag"
   NWWANTRP17_I = "NWWANTRP17 Imputation Flag"
   NWWANTRP18_I = "NWWANTRP18 Imputation Flag"
   NWWANTRP19_I = "NWWANTRP19 Imputation Flag"
   NWWANTRP20_I = "NWWANTRP20 Imputation Flag"
   WANTP5_I = "WANTP5 Imputation Flag"
   FPTIT12 = "Type of clinic used for fp services in last 12 months (RECODE)"
   FPTITMED = "Type of clinic used for medical services in last 12 months (RECODE)"
   FPTITSTE = "Source of services in last 12 months: Sterilization operation (RECODE)"
   FPTITBC = "Source of services last 12 mos: Method of BC or prescription (RECODE)"
   FPTITCHK = "Source of services in last 12 mos: Check-up or test re: BC  (RECODE)"
   FPTITCBC = "Source of services in last 12 mos: Counseling re BC (RECODE)"
   FPTITCST = "Source of services in last 12 mos: Counseling re sterilization (RECODE)"
   FPTITEC = "Source of service in last 12 months: EC or prescription (RECODE)"
   FPTITCEC = "Source of service in last 12 mos: Counseling or info on EC (RECODE)"
   FPTITPRE = "Source of service in last 12 mos: Pregnancy test (RECODE)"
   FPTITABO = "Source of service in last 12 mos: Abortion (RECODE)"
   FPTITPAP = "Source of service in last 12 mos: Pap smear (RECODE)"
   FPTITPEL = "Source of service in last 12 mos: Pelvic exam (RECODE)"
   FPTITPRN = "Source of service in last 12 mos: Prenatal care (RECODE)"
   FPTITPPR = "Source of service in last 12 mos: Post-pregnancy care (RECODE)"
   FPTITSTD = "Source of service in last 12 mos: testing for STD (RECODE)"
   FPREGFP = "Title X clinic used for FP svcs: Regular place for care (RECODE)"
   FPREGMED = "Title X clinic used for med svcs: Regular place for care (RECODE)"
   FPTIT12_I = "FPTIT12 Imputation Flag"
   FPTITMED_I = "FPTITMED Imputation Flag"
   FPTITSTE_I = "FPTITSTE Imputation Flag"
   FPTITBC_I = "FPTITBC Imputation Flag"
   FPTITCHK_I = "FPTITCHK Imputation Flag"
   FPTITCBC_I = "FPTITCBC Imputation Flag"
   FPTITCST_I = "FPTITCST Imputation Flag"
   FPTITEC_I = "FPTITEC Imputation Flag"
   FPTITCEC_I = "FPTITCEC Imputation Flag"
   FPTITPRE_I = "FPTITPRE Imputation Flag"
   FPTITABO_I = "FPTITABO Imputation Flag"
   FPTITPAP_I = "FPTITPAP Imputation Flag"
   FPTITPEL_I = "FPTITPEL Imputation Flag"
   FPTITPRN_I = "FPTITPRN Imputation Flag"
   FPTITPPR_I = "FPTITPPR Imputation Flag"
   FPTITSTD_I = "FPTITSTD Imputation Flag"
   FPREGFP_I = "FPREGFP Imputation Flag"
   FPREGMED_I = "FPREGMED Imputation Flag"
   INTENT = "Intentions for additional births (RECODE)"
   ADDEXP = "Central number of additional births expected (RECODE)"
   INTENT_I = "INTENT Imputation Flag"
   ADDEXP_I = "ADDEXP Imputation Flag"
   ANYPRGHP = "Any medical help to become pregnant (RECODE)"
   ANYMSCHP = "Any medical help to prevent miscarriage (RECODE)"
   INFEVER = "Ever used infertility services of any kind (RECODE)"
   OVULATE = "Infertility services: drugs to improve ovulation (RECODE)"
   TUBES = "Infertility services: surgery to correct blocked tubes (RECODE)"
   INFERTR = "Infertility services: Infertility testing on R (RECODE)"
   INFERTH = "Infertility services: Infertility testing on H/P (RECODE)"
   ADVICE = "Infertility services: Advice (RECODE)"
   INSEM = "Infertility services: Artificial insemination (RECODE)"
   INVITRO = "Infertility services: In vitro fertilization or other assisted reproduction (RECODE)"
   ENDOMET = "Infertility services: Surgery or drug treatment for endometriosis (RECODE)"
   FIBROIDS = "Infertility services: Surgery for uterine fibroids (RECODE)"
   PIDTREAT = "Ever been treated for PID (RECODE)"
   EVHIVTST = "Ever had an HIV test (RECODE)"
   FPTITHIV = "Source of service in the last 12 mos: HIV test (RECODE)"
   ANYPRGHP_I = "ANYPRGHP Imputation Flag"
   ANYMSCHP_I = "ANYMSCHP Imputation Flag"
   INFEVER_I = "INFEVER Imputation Flag"
   OVULATE_I = "OVULATE Imputation Flag"
   TUBES_I = "TUBES Imputation Flag"
   INFERTR_I = "INFERTR Imputation Flag"
   INFERTH_I = "INFERTH Imputation Flag"
   ADVICE_I = "ADVICE Imputation Flag"
   INSEM_I = "INSEM Imputation Flag"
   INVITRO_I = "INVITRO Imputation Flag"
   ENDOMET_I = "ENDOMET Imputation Flag"
   FIBROIDS_I = "FIBROIDS Imputation Flag"
   PIDTREAT_I = "PIDTREAT Imputation Flag"
   EVHIVTST_I = "EVHIVTST Imputation Flag"
   FPTITHIV_I = "FPTITHIV Imputation Flag"
   CURR_INS = "Current health insurance status"
   METRO = "Place of residence (metropolitan-non-metropolitan) (RECODE)"
   RELIGION = "Current religious affiliation (RECODE)"
   LABORFOR = "Labor force status (RECODE)"
   CURR_INS_I = "CURR_INS Imputation Flag"
   METRO_I = "METRO Imputation Flag"
   RELIGION_I = "RELIGION Imputation Flag"
   LABORFOR_I = "LABORFOR Imputation Flag"
   POVERTY = "Poverty level income (RECODE)"
   TOTINCR = "Total income of R's family (RECODE)"
   PUBASSIS = "Whether R received public assistance in last calendar year (RECODE)"
   POVERTY_I = "POVERTY Imputation Flag"
   TOTINCR_I = "TOTINCR Imputation Flag"
   PUBASSIS_I = "PUBASSIS Imputation Flag"
   WGT2015_2017 = "Final weight for the 2015-2017 NSFG"
   SECU = "Randomized version of the sampling error computational unit"
   SEST = "Randomized version of the stratum"
   CMINTVW = "Century month for date of interview (Computed in Flow Check A-1)"
   CMLSTYR = "Century month for month/year of interview minus one year (Computed in Flow Check A-1)"
   CMJAN3YR = "Century month of January Three Years Prior to Year of interview (Computed in Flow Check A-1)"
   CMJAN4YR = "Century month of January Four Years Prior to Year of Interview (Computed in Flow Check A-1)"
   CMJAN5YR = "Century month of January Five Years Prior to Year of Interview (Computed in Flow Check A-1)"
   QUARTER = "Quarter when case was sampled"
   PHASE = "Regular- or double-sample portion of the quarter"
   INTVWYEAR = "Calendar year when interview occurred"
   INTVLNGTH = "Interview Length in Minutes" ;


* SAS FORMAT STATEMENT;

/*
FORMAT
   CASEID         CASEID.
   RSCRNINF       Y1N5NALC.
   RSCRAGE        AGESCRN.
   RSCRHISP       YESNONAF.
   RSCRRACE       RSCRRACE.
   AGE_A          AGEFMT.
   AGE_R          AGEFMT.
   AGESCRN        AGESCRN.
   HISP           Y1N5RDF.
   HISPGRP        HISPGRPF.
   PRIMLANG1      PRIMLANG.
   PRIMLANG2      PRIMLANG.
   PRIMLANG3      PRIMLANG.
   ROSCNT         ROSCNT.
   NUMCHILD       ROST4TOP.
   HHKIDS18       ROST5TOP.
   DAUGHT918      DGHT918F.
   SON918         SON918F.
   NONBIOKIDS     ROST2TOP.
   MARSTAT        MARSTAT.
   FMARSTAT       FMARSTAT.
   FMARIT         FMARIT.
   EVRMARRY       EVRMARRY.
   HPLOCALE       HPLOCALE.
   MANREL         MANRELF.
   GOSCHOL        Y1N5RDF.
   VACA           Y1N5RDF.
   HIGRADE        HIGRADE.
   COMPGRD        Y1N5RDF.
   DIPGED         DIPGED.
   EARNHS_Y       YEARFMT.
   HISCHGRD       HISCHGRD.
   LSTGRADE       LSTGRADE.
   MYSCHOL_Y      YEARFMT.
   HAVEDEG        Y1N5RDF.
   DEGREES        DEGREES.
   EARNBA_Y       YEARFMT.
   EXPSCHL        Y1N5RDF.
   EXPGRADE       EXPGRADE2F.
   WTHPARNW       WTHPARNW.
   ONOWN          Y1N5RDF.
   ONOWN18        Y1N5RDF.
   INTACT         Y1N5RDF.
   PARMARR        Y1N5RDF.
   INTACT18       INTACT18F.
   LVSIT14F       LVSIT14F.
   LVSIT14M       LVSIT14M.
   WOMRASDU       WOMRASDU.
   MOMDEGRE       MDDEGRE.
   MOMWORKD       MOMWORKD.
   MOMFSTCH       MOMFSTCH.
   MOM18          MOM18F.
   MANRASDU       MANRASDU.
   R_FOSTER       R_FOSTER.
   EVRFSTER       Y1N5RDF.
   MNYFSTER       MNYFSTER.
   DURFSTER       DURFSTER.
   MENARCHE       MENARCHE.
   PREGNOWQ       Y1N5RDF.
   MAYBPREG       MAYBPREG.
   NUMPREGS       NUMPREGF.
   EVERPREG       Y1N5C.
   CURRPREG       Y1N5C.
   HOWPREG_N      HOWPRGF.
   HOWPREG_P      HOWPRGWM.
   NOWPRGDK       NOWPRGDK.
   MOSCURRP       MOSPRGF.
   NPREGS_S       NUMPREGF.
   HASBABES       Y1N5RDF.
   NUMBABES       PARITY.
   NBABES_S       PARITY.
   CMLASTLB       YEARFMT.
   CMLSTPRG       YEARFMT.
   CMFSTPRG       YEARFMT.
   CMPG1BEG       YEARFMT.
   NPLACED        KID1PLUS.
   NDIED          KID1PLUS.
   NADOPTV        KID1PLUS.
   TOTPLACD       KID1PLUS.
   OTHERKID       Y1N5RDF.
   NOTHRKID       BIONUMFF.
   SEXOTHKD       MALFEMF.
   RELOTHKD       RELOTHKD.
   ADPTOTKD       ADPTOTKD.
   TRYADOPT       Y1N5RDF.
   TRYEITHR       TRYEITHRF.
   STILHERE       Y1N5RDF.
   DATKDCAM_Y     YEARFMT.
   OTHKDFOS       Y1N5RDF.
   OKDDOB_Y       YEARFMT.
   OKBORNUS       OKBORNUS.
   OKDISABL1      OKDISABLF.
   OKDISABL2      OKDISABLF.
   SEXOTHKD2      MALFEMF.
   RELOTHKD2      RELOTHKD.
   ADPTOTKD2      ADPTOTKD.
   TRYADOPT2      Y1N5RDF.
   TRYEITHR2      TRYEITHRF.
   STILHERE2      Y1N5RDF.
   DATKDCAM_Y2    YEARFMT.
   OTHKDFOS2      Y1N5RDF.
   OKDDOB_Y2      YEARFMT.
   OKBORNUS2      OKBORNUS.
   OKDISABL5      OKDISABLF.
   OKDISABL6      OKDISABLF.
   SEXOTHKD3      MALFEMF.
   RELOTHKD3      RELOTHKD.
   ADPTOTKD3      ADPTOTKD.
   TRYADOPT3      Y1N5RDF.
   TRYEITHR3      TRYEITHRF.
   STILHERE3      Y1N5RDF.
   DATKDCAM_Y3    YEARFMT.
   OTHKDFOS3      Y1N5RDF.
   OKDDOB_Y3      YEARFMT.
   OKBORNUS3      OKBORNUS.
   OKDISABL9      OKDISABLF.
   OKDISABL10     OKDISABLF.
   SEXOTHKD4      MALFEMF.
   RELOTHKD4      RELOTHKD.
   ADPTOTKD4      ADPTOTKD.
   TRYADOPT4      Y1N5RDF.
   TRYEITHR4      TRYEITHRF.
   STILHERE4      Y1N5RDF.
   DATKDCAM_Y4    YEARFMT.
   OTHKDFOS4      Y1N5RDF.
   OKDDOB_Y4      YEARFMT.
   OKBORNUS4      OKBORNUS.
   OKDISABL13     OKDISABLF.
   OKDISABL14     OKDISABLF.
   SEXOTHKD5      MALFEMF.
   RELOTHKD5      RELOTHKD.
   ADPTOTKD5      ADPTOTKD.
   TRYADOPT5      Y1N5RDF.
   TRYEITHR5      TRYEITHRF.
   STILHERE5      Y1N5RDF.
   DATKDCAM_Y5    YEARFMT.
   OTHKDFOS5      Y1N5RDF.
   OKDDOB_Y5      YEARFMT.
   OKBORNUS5      OKBORNUS.
   OKDISABL17     OKDISABLF.
   OKDISABL18     OKDISABLF.
   SEXOTHKD6      MALFEMF.
   RELOTHKD6      RELOTHKD.
   ADPTOTKD6      ADPTOTKD.
   TRYADOPT6      Y1N5RDF.
   TRYEITHR6      TRYEITHRF.
   STILHERE6      Y1N5RDF.
   DATKDCAM_Y6    YEARFMT.
   OTHKDFOS6      Y1N5RDF.
   OKDDOB_Y6      YEARFMT.
   OKBORNUS6      OKBORNUS.
   OKDISABL21     OKDISABLF.
   OKDISABL22     OKDISABLF.
   SEXOTHKD7      MALFEMF.
   RELOTHKD7      RELOTHKD.
   ADPTOTKD7      ADPTOTKD.
   TRYADOPT7      Y1N5RDF.
   TRYEITHR7      TRYEITHRF.
   STILHERE7      Y1N5RDF.
   DATKDCAM_Y7    YEARFMT.
   OTHKDFOS7      Y1N5RDF.
   OKDDOB_Y7      YEARFMT.
   OKBORNUS7      OKBORNUS.
   OKDISABL25     OKDISABLF.
   OKDISABL26     OKDISABLF.
   SEXOTHKD8      MALFEMF.
   RELOTHKD8      RELOTHKD.
   ADPTOTKD8      ADPTOTKD.
   TRYADOPT8      Y1N5RDF.
   TRYEITHR8      TRYEITHRF.
   STILHERE8      Y1N5RDF.
   DATKDCAM_Y8    YEARFMT.
   OTHKDFOS8      Y1N5RDF.
   OKDDOB_Y8      YEARFMT.
   OKBORNUS8      OKBORNUS.
   OKDISABL29     OKDISABLF.
   OKDISABL30     OKDISABLF.
   SEXOTHKD9      MALFEMF.
   RELOTHKD9      RELOTHKD.
   ADPTOTKD9      ADPTOTKD.
   TRYADOPT9      Y1N5RDF.
   TRYEITHR9      TRYEITHRF.
   STILHERE9      Y1N5RDF.
   DATKDCAM_Y9    YEARFMT.
   OTHKDFOS9      Y1N5RDF.
   OKDDOB_Y9      YEARFMT.
   OKBORNUS9      OKBORNUS.
   OKDISABL33     OKDISABLF.
   OKDISABL34     OKDISABLF.
   SEXOTHKD10     MALFEMF.
   RELOTHKD10     RELOTHKD.
   ADPTOTKD10     ADPTOTKD.
   TRYADOPT10     Y1N5RDF.
   TRYEITHR10     TRYEITHRF.
   STILHERE10     Y1N5RDF.
   DATKDCAM_Y10   YEARFMT.
   OTHKDFOS10     Y1N5RDF.
   OKDDOB_Y10     YEARFMT.
   OKBORNUS10     OKBORNUS.
   OKDISABL37     OKDISABLF.
   OKDISABL38     OKDISABLF.
   SEXOTHKD11     MALFEMF.
   RELOTHKD11     RELOTHKD.
   ADPTOTKD11     ADPTOTKD.
   TRYADOPT11     Y1N5RDF.
   TRYEITHR11     TRYEITHRF.
   STILHERE11     Y1N5RDF.
   DATKDCAM_Y11   YEARFMT.
   OTHKDFOS11     Y1N5RDF.
   OKDDOB_Y11     YEARFMT.
   OKBORNUS11     OKBORNUS.
   OKDISABL41     OKDISABLF.
   OKDISABL42     OKDISABLF.
   SEXOTHKD12     MALFEMF.
   RELOTHKD12     RELOTHKD.
   ADPTOTKD12     ADPTOTKD.
   TRYADOPT12     Y1N5RDF.
   TRYEITHR12     TRYEITHRF.
   STILHERE12     Y1N5RDF.
   DATKDCAM_Y12   YEARFMT.
   OTHKDFOS12     Y1N5RDF.
   OKDDOB_Y12     YEARFMT.
   OKBORNUS12     OKBORNUS.
   OKDISABL45     OKDISABLF.
   OKDISABL46     OKDISABLF.
   SEXOTHKD13     MALFEMF.
   RELOTHKD13     RELOTHKD.
   ADPTOTKD13     ADPTOTKD.
   TRYADOPT13     Y1N5RDF.
   TRYEITHR13     TRYEITHRF.
   STILHERE13     Y1N5RDF.
   DATKDCAM_Y13   YEARFMT.
   OTHKDFOS13     Y1N5RDF.
   OKDDOB_Y13     YEARFMT.
   OKBORNUS13     OKBORNUS.
   OKDISABL49     OKDISABLF.
   OKDISABL50     OKDISABLF.
   SEXOTHKD14     MALFEMF.
   RELOTHKD14     RELOTHKD.
   ADPTOTKD14     ADPTOTKD.
   TRYADOPT14     Y1N5RDF.
   TRYEITHR14     TRYEITHRF.
   STILHERE14     Y1N5RDF.
   DATKDCAM_Y14   YEARFMT.
   OTHKDFOS14     Y1N5RDF.
   OKDDOB_Y14     YEARFMT.
   OKBORNUS14     OKBORNUS.
   OKDISABL53     OKDISABLF.
   OKDISABL54     OKDISABLF.
   SEXOTHKD15     MALFEMF.
   RELOTHKD15     RELOTHKD.
   ADPTOTKD15     ADPTOTKD.
   TRYADOPT15     Y1N5RDF.
   TRYEITHR15     TRYEITHRF.
   STILHERE15     Y1N5RDF.
   DATKDCAM_Y15   YEARFMT.
   OTHKDFOS15     Y1N5RDF.
   OKDDOB_Y15     YEARFMT.
   OKBORNUS15     OKBORNUS.
   OKDISABL57     OKDISABLF.
   OKDISABL58     OKDISABLF.
   SEXOTHKD16     MALFEMF.
   RELOTHKD16     RELOTHKD.
   ADPTOTKD16     ADPTOTKD.
   TRYADOPT16     Y1N5RDF.
   TRYEITHR16     TRYEITHRF.
   STILHERE16     Y1N5RDF.
   DATKDCAM_Y16   YEARFMT.
   OTHKDFOS16     Y1N5RDF.
   OKDDOB_Y16     YEARFMT.
   OKBORNUS16     OKBORNUS.
   OKDISABL61     OKDISABLF.
   OKDISABL62     OKDISABLF.
   SEXOTHKD17     MALFEMF.
   RELOTHKD17     RELOTHKD.
   ADPTOTKD17     ADPTOTKD.
   TRYADOPT17     Y1N5RDF.
   TRYEITHR17     TRYEITHRF.
   STILHERE17     Y1N5RDF.
   DATKDCAM_Y17   YEARFMT.
   OTHKDFOS17     Y1N5RDF.
   OKDDOB_Y17     YEARFMT.
   OKBORNUS17     OKBORNUS.
   OKDISABL65     OKDISABLF.
   OKDISABL66     OKDISABLF.
   SEXOTHKD18     MALFEMF.
   RELOTHKD18     RELOTHKD.
   ADPTOTKD18     ADPTOTKD.
   TRYADOPT18     Y1N5RDF.
   TRYEITHR18     TRYEITHRF.
   STILHERE18     Y1N5RDF.
   DATKDCAM_Y18   YEARFMT.
   OTHKDFOS18     Y1N5RDF.
   OKDDOB_Y18     YEARFMT.
   OKBORNUS18     OKBORNUS.
   OKDISABL69     OKDISABLF.
   OKDISABL70     OKDISABLF.
   SEXOTHKD19     MALFEMF.
   RELOTHKD19     RELOTHKD.
   ADPTOTKD19     ADPTOTKD.
   TRYADOPT19     Y1N5RDF.
   TRYEITHR19     TRYEITHRF.
   STILHERE19     Y1N5RDF.
   DATKDCAM_Y19   YEARFMT.
   OTHKDFOS19     Y1N5RDF.
   OKDDOB_Y19     YEARFMT.
   OKBORNUS19     OKBORNUS.
   OKDISABL73     OKDISABLF.
   OKDISABL74     OKDISABLF.
   SEXOTHKD20     MALFEMF.
   RELOTHKD20     RELOTHKD.
   ADPTOTKD20     ADPTOTKD.
   TRYADOPT20     Y1N5RDF.
   TRYEITHR20     TRYEITHRF.
   STILHERE20     Y1N5RDF.
   DATKDCAM_Y20   YEARFMT.
   OTHKDFOS20     Y1N5RDF.
   OKDDOB_Y20     YEARFMT.
   OKBORNUS20     OKBORNUS.
   OKDISABL77     OKDISABLF.
   OKDISABL78     OKDISABLF.
   EVERADPT       EVERADPT.
   SEEKADPT       Y1N5RDF.
   CONTAGEM       Y1N5RDF.
   TRYLONG        TRYLONG.
   KNOWADPT       Y1N5RDF.
   EVWNTANO       Y1N5RDF.
   EVCONTAG       Y1N5RDF.
   TURNDOWN       TURNDOWN.
   YQUITTRY       YQUITTRY.
   APROCESS1      APROCESSF.
   APROCESS2      APROCESSF.
   APROCESS3      APROCESSF.
   HRDEMBRYO      Y1N5RDF.
   TIMESMAR       TIMESMAR.
   HSBVERIF       Y1N5RDF.
   WHMARHX_Y      YEARFMT.
   AGEMARHX       AGERFEMC.
   HXAGEMAR       AGEHP.
   DOBHUSBX_Y     YEARFMT.
   LVTOGHX        Y1N5RDF.
   STRTOGHX_Y     YEARFMT.
   ENGAGHX        ENGAGF.
   HSBRACE1       RACEFMTD.
   HSBNRACE1      NRACED.
   CHEDMARN       EDUCFMT.
   MARBEFHX       Y1N5RDF.
   KIDSHX         Y1N5RDF.
   NUMKDSHX       BIONUMFF.
   KIDLIVHX       Y1N5RDF.
   CHKID18A       Y1N5RDF.
   CHKID18B       KID18BF.
   WHRCHKDS1      WHRKDSF.
   WHRCHKDS2      WHRKDSF.
   SUPPORCH       Y1N5JPC.
   BIOHUSBX       Y1N5RDF.
   BIONUMHX       BIONUMFF.
   MARENDHX       MARENDHX.
   WNDIEHX_Y      YEARFMT.
   DIVDATHX_Y     YEARFMT.
   WNSTPHX_Y      YEARFMT.
   WHMARHX_Y2     YEARFMT.
   AGEMARHX2      AGERFEMC.
   HXAGEMAR2      AGEHP.
   DOBHUSBX_Y2    YEARFMT.
   LVTOGHX2       Y1N5RDF.
   STRTOGHX_Y2    YEARFMT.
   ENGAGHX2       ENGAGF.
   HSBRACE2       RACEFMTD.
   HSBNRACE2      NRACED.
   CHEDMARN2      EDUCFMT.
   MARBEFHX2      Y1N5RDF.
   KIDSHX2        Y1N5RDF.
   NUMKDSHX2      BIONUMFF.
   KIDLIVHX2      Y1N5RDF.
   CHKID18A2      Y1N5RDF.
   CHKID18B2      KID18BF.
   WHRCHKDS5      WHRKDSF.
   WHRCHKDS6      WHRKDSF.
   SUPPORCH2      Y1N5JPC.
   BIOHUSBX2      Y1N5RDF.
   BIONUMHX2      BIONUMFF.
   MARENDHX2      MARENDHX.
   WNDIEHX_Y2     YEARFMT.
   DIVDATHX_Y2    YEARFMT.
   WNSTPHX_Y2     YEARFMT.
   WHMARHX_Y3     YEARFMT.
   AGEMARHX3      AGERFEMC.
   HXAGEMAR3      AGEHP.
   DOBHUSBX_Y3    YEARFMT.
   LVTOGHX3       Y1N5RDF.
   STRTOGHX_Y3    YEARFMT.
   ENGAGHX3       ENGAGF.
   HSBRACE3       RACEFMTD.
   HSBNRACE3      NRACED.
   CHEDMARN3      EDUCFMT.
   MARBEFHX3      Y1N5RDF.
   KIDSHX3        Y1N5RDF.
   NUMKDSHX3      BIONUMFF.
   KIDLIVHX3      Y1N5RDF.
   CHKID18A3      Y1N5RDF.
   CHKID18B3      KID18BF.
   WHRCHKDS9      WHRKDSF.
   WHRCHKDS10     WHRKDSF.
   SUPPORCH3      Y1N5JPC.
   BIOHUSBX3      Y1N5RDF.
   BIONUMHX3      BIONUMFF.
   MARENDHX3      MARENDHX.
   WNDIEHX_Y3     YEARFMT.
   DIVDATHX_Y3    YEARFMT.
   WNSTPHX_Y3     YEARFMT.
   WHMARHX_Y4     YEARFMT.
   AGEMARHX4      AGERFEMC.
   HXAGEMAR4      AGEHP.
   DOBHUSBX_Y4    YEARFMT.
   LVTOGHX4       Y1N5RDF.
   STRTOGHX_Y4    YEARFMT.
   ENGAGHX4       ENGAGF.
   HSBRACE4       RACEFMTD.
   HSBNRACE4      NRACED.
   CHEDMARN4      EDUCFMT.
   MARBEFHX4      Y1N5RDF.
   KIDSHX4        Y1N5RDF.
   NUMKDSHX4      BIONUMFF.
   KIDLIVHX4      Y1N5RDF.
   CHKID18A4      Y1N5RDF.
   CHKID18B4      KID18BF.
   WHRCHKDS13     WHRKDSF.
   WHRCHKDS14     WHRKDSF.
   SUPPORCH4      Y1N5JPC.
   BIOHUSBX4      Y1N5RDF.
   BIONUMHX4      BIONUMFF.
   MARENDHX4      MARENDHX.
   WNDIEHX_Y4     YEARFMT.
   DIVDATHX_Y4    YEARFMT.
   WNSTPHX_Y4     YEARFMT.
   WHMARHX_Y5     YEARFMT.
   AGEMARHX5      AGERFEMC.
   HXAGEMAR5      AGEHP.
   DOBHUSBX_Y5    YEARFMT.
   LVTOGHX5       Y1N5RDF.
   STRTOGHX_Y5    YEARFMT.
   ENGAGHX5       ENGAGF.
   HSBRACE5       RACEFMTD.
   HSBNRACE5      NRACED.
   CHEDMARN5      EDUCFMT.
   MARBEFHX5      Y1N5RDF.
   KIDSHX5        Y1N5RDF.
   NUMKDSHX5      BIONUMFF.
   KIDLIVHX5      Y1N5RDF.
   CHKID18A5      Y1N5RDF.
   CHKID18B5      KID18BF.
   WHRCHKDS17     WHRKDSF.
   WHRCHKDS18     WHRKDSF.
   SUPPORCH5      Y1N5JPC.
   BIOHUSBX5      Y1N5RDF.
   BIONUMHX5      BIONUMFF.
   MARENDHX5      MARENDHX.
   WNDIEHX_Y5     YEARFMT.
   DIVDATHX_Y5    YEARFMT.
   WNSTPHX_Y5     YEARFMT.
   WHMARHX_Y6     YEARFMT.
   AGEMARHX6      AGERFEMC.
   HXAGEMAR6      AGEHP.
   DOBHUSBX_Y6    YEARFMT.
   LVTOGHX6       Y1N5RDF.
   STRTOGHX_Y6    YEARFMT.
   ENGAGHX6       ENGAGF.
   HSBRACE6       RACEFMTD.
   HSBNRACE6      NRACED.
   CHEDMARN6      EDUCFMT.
   MARBEFHX6      Y1N5RDF.
   KIDSHX6        Y1N5RDF.
   NUMKDSHX6      BIONUMFF.
   KIDLIVHX6      Y1N5RDF.
   CHKID18A6      Y1N5RDF.
   CHKID18B6      KID18BF.
   WHRCHKDS21     WHRKDSF.
   WHRCHKDS22     WHRKDSF.
   SUPPORCH6      Y1N5JPC.
   BIOHUSBX6      Y1N5RDF.
   BIONUMHX6      BIONUMFF.
   MARENDHX6      MARENDHX.
   WNDIEHX_Y6     YEARFMT.
   DIVDATHX_Y6    YEARFMT.
   WNSTPHX_Y6     YEARFMT.
   CMMARRCH       YEARFMT.
   PREVHUSB       PREVHUSB.
   WNSTRTCP_Y     YEARFMT.
   CPHERAGE       AGERFEMC.
   CPHISAGE       AGEHP.
   WNCPBRN_Y      YEARFMT.
   CPENGAG1       ENGAGF.
   WILLMARR       DEFPROBF.
   CURCOHRACE     RACEFMTD.
   CURCOHNRACE    NRACED.
   CPEDUC         EDUCFMT.
   CPMARBEF       Y1N5RDF.
   CPKIDS         Y1N5RDF.
   CPNUMKDS       BIONUMFF.
   CPKIDLIV       Y1N5RDF.
   CPKID18A       Y1N5RDF.
   CPKID18B       KID18BF.
   WHRCPKDS1      WHRKDSF.
   WHRCPKDS2      WHRKDSF.
   SUPPORCP       Y1N5JPC.
   BIOCP          Y1N5RDF.
   BIONUMCP       BIONUMFF.
   CMSTRTHP       YEARFMT.
   LIVEOTH        Y1N5RDF.
   EVRCOHAB       Y1N5C.
   HMOTHMEN       HMOTHMEN.
   PREVCOHB       PREVCOHB.
   STRTOTHX_Y     YEARFMT.
   HERAGECX       AGERFEMC.
   HISAGECX       AGEHPNA.
   WNBRNCX_Y      YEARFMT.
   ENGAG1CX       ENGAGF.
   COH1RACE       RACEFMTD.
   COH1NRACE      NRACED.
   MAREVCX        Y1N5RDF.
   CXKIDS         Y1N5RDF.
   BIOFCPX        Y1N5RDF.
   BIONUMCX       BIONUMFF.
   STPTOGCX_Y     YEARFMT.
   STRTOTHX_Y2    YEARFMT.
   HERAGECX2      AGERFEMC.
   HISAGECX2      AGEHP.
   WNBRNCX_Y2     YEARFMT.
   ENGAG1CX2      ENGAGF.
   MAREVCX2       Y1N5RDF.
   CXKIDS2        Y1N5RDF.
   BIOFCPX2       Y1N5RDF.
   BIONUMCX2      BIONUMFF.
   STPTOGCX_Y2    YEARFMT.
   STRTOTHX_Y3    YEARFMT.
   HERAGECX3      AGERFEMC.
   HISAGECX3      AGEHP.
   WNBRNCX_Y3     YEARFMT.
   ENGAG1CX3      ENGAGF.
   MAREVCX3       Y1N5RDF.
   CXKIDS3        Y1N5RDF.
   BIOFCPX3       Y1N5RDF.
   BIONUMCX3      BIONUMFF.
   STPTOGCX_Y3    YEARFMT.
   STRTOTHX_Y4    YEARFMT.
   HERAGECX4      AGERFEMC.
   HISAGECX4      AGEHP.
   WNBRNCX_Y4     YEARFMT.
   ENGAG1CX4      ENGAGF.
   MAREVCX4       Y1N5RDF.
   CXKIDS4        Y1N5RDF.
   BIOFCPX4       Y1N5RDF.
   BIONUMCX4      BIONUMFF.
   STPTOGCX_Y4    YEARFMT.
   COHCHANCE      DEFPROBF.
   MARRCHANCE     DEFPROBF.
   PMARCOH        DEFPROBF.
   EVERSEX        Y1N5RDF.
   RHADSEX        Y1N5C.
   YNOSEX         YNOSEX.
   WNFSTSEX_M     WNFSTSEXF.
   WNFSTSEX_Y     YEARFMT.
   CMFSTSEX       CMFSTSEX.
   AGEFSTSX       AGE44NRDF.
   C_SEX18        FMT18F.
   C_SEX15        FMT15F.
   C_SEX20        FMT20F.
   GRFSTSX        GRFSTSXF.
   SXMTONCE       Y1N5RDF.
   TALKPAR1       TALKPARF.
   TALKPAR2       TALKPARF.
   TALKPAR3       TALKPARF.
   TALKPAR4       TALKPARF.
   TALKPAR5       TALKPARF.
   TALKPAR6       TALKPARF.
   TALKPAR7       TALKPARF.
   SEDNO          Y1N5RDF.
   SEDNOG         SXEDGRF.
   SEDNOSX        BFAFTF.
   SEDBC          Y1N5RDF.
   SEDBCLC1       SXEDWHRINS.
   SEDBCLC2       SXEDWHRINS.
   SEDBCLC3       SXEDWHRINS.
   SEDBCLC4       SXEDWHRINS.
   SEDBCG         SXEDGRF.
   SEDBCSX        BFAFTF.
   SEDWHBC        Y1N5RDF.
   SEDWHBCG       SXEDGRF.
   SEDWBCSX       BFAFTF.
   SEDCOND        Y1N5RDF.
   SEDCONDG       SXEDGRF.
   SEDCONSX       BFAFTF.
   SEDSTD         Y1N5RDF.
   SEDSTDG        SXEDGRF.
   SEDSTDSX       BFAFTF.
   SEDHIV         Y1N5RDF.
   SEDHIVG        SXEDGRF.
   SEDHIVSX       BFAFTF.
   SEDABST        Y1N5RDF.
   SEDABLC1       SXEDWHRINS.
   SEDABLC2       SXEDWHRINS.
   SEDABLC3       SXEDWHRINS.
   SEDABLC4       SXEDWHRINS.
   SEDABSTG       SXEDGRF.
   SEDABSSX       BFAFTF.
   SAMEMAN        Y1N5RDF.
   WHOFSTPR       MTCHMANF.
   KNOWFP         FSEXREL.
   STILFPSX       Y1N5RDF.
   LSTSEXFP_M     LSTSEXFPF.
   LSTSEXFP_Y     YEARFMT.
   CMLSEXFP       CMLSEXFP.
   CMFPLAST       CMFMT.
   FPOTHREL       FSEXREL.
   FPEDUC         EDUCFMT.
   FSEXRACE       RACEFMTD.
   FSEXNRACE      NRACED.
   FPRN           CURRREL.
   WHICH1ST       WHICH1ST.
   SEXAFMEN       Y1N5RDF.
   WNSEXAFM_M     WNSEXAFMF.
   WNSEXAFM_Y     YEARFMT.
   CMSEXAFM       CMFSTSEX.
   AGESXAFM       AGE44NRDF.
   AFMEN18        FMT18F.
   AFMEN15        FMT15F.
   AFMEN20        FMT20F.
   LIFEPRT        LIFEPRT.
   LIFEPRT_LO     LIFEPRT.
   LIFEPRT_HI     LIFEPRT.
   PTSB4MAR       PTSB4MAR.
   PTSB4MAR_LO    PTSB4MAR.
   PTSB4MAR_HI    PTSB4MAR.
   MON12PRT       MON12PRT.
   MON12PRT_LO    MON12PRT.
   MON12PRT_HI    MON12PRT.
   PARTS12        PARTS12F.
   LIFEPRTS       LIFEPRTS.
   WHOSNC1Y       Y1N5RDF.
   MATCHFP        Y1N5RDF.
   MATCHHP        MTCHMANF.
   P1YRELP        P1YRELP.
   CMLSEX         CMFMT.
   P1YLSEX_M      MNTHFMT.
   P1YLSEX_Y      YEARFMT.
   P1YCURRP       Y1N5RDF.
   PCURRNT        Y1N5C.
   MATCHFP2       Y1N5RDF.
   MATCHHP2       MTCHMANF.
   P1YRELP2       P1YRELP.
   CMLSEX2        CMFMT.
   P1YLSEX_M2     MNTHFMT.
   P1YLSEX_Y2     YEARFMT.
   P1YCURRP2      Y1N5RDF.
   PCURRNT2       Y1N5C.
   MATCHFP3       Y1N5RDF.
   MATCHHP3       MTCHMANF.
   P1YRELP3       P1YRELP.
   CMLSEX3        CMFMT.
   P1YLSEX_M3     MNTHFMT.
   P1YLSEX_Y3     YEARFMT.
   P1YCURRP3      Y1N5RDF.
   PCURRNT3       Y1N5C.
   P1YOTHREL      FSEXREL.
   P1YRAGE        P1YRAGE.
   P1YHSAGE       P1YHSAGE.
   P1YRF          FSEXREL.
   P1YFSEX_M      P1YFSEXF.
   P1YFSEX_Y      YEARFMT.
   CMFSEX         CMFSEX.
   CMFSEXTOT      CMFMT.
   P1YEDUC        EDUCFMT.
   P1YRACE1       RACEFMTD.
   P1YNRACE1      NRACED.
   P1YRN          CURRREL.
   P1YOTHREL2     FSEXREL.
   P1YRAGE2       P1YRAGE.
   P1YHSAGE2      P1YHSAGE.
   P1YRF2         FSEXREL.
   P1YFSEX_M2     P1YFSEXF.
   P1YFSEX_Y2     YEARFMT.
   CMFSEX2        CMFSEX.
   CMFSEXTOT2     CMFMT.
   P1YEDUC2       EDUCFMT.
   P1YRACE2       RACEFMTD.
   P1YNRACE2      NRACED.
   P1YRN2         CURRREL.
   P1YOTHREL3     FSEXREL.
   P1YRAGE3       P1YRAGE.
   P1YHSAGE3      P1YHSAGE.
   P1YRF3         FSEXREL.
   P1YFSEX_M3     P1YFSEXF.
   P1YFSEX_Y3     YEARFMT.
   CMFSEX3        CMFSEX.
   CMFSEXTOT3     CMFMT.
   P1YEDUC3       EDUCFMT.
   P1YRACE3       RACEFMTD.
   P1YNRACE3      NRACED.
   P1YRN3         CURRREL.
   CURRPRTT       CURRPRTS.
   CURRPRTS       CURRPRTS.
   CMCURRP1       CMFMT.
   CMCURRP2       CMFMT.
   CMCURRP3       CMFMT.
   EVERTUBS       EVERTUBS.
   ESSURE         Y1N5RDF.
   EVERHYST       Y1N5RDF.
   EVEROVRS       Y1N5RDF.
   EVEROTHR       Y1N5RDF.
   WHTOOPRC       WHTOOPRC.
   ONOTFUNC       Y1N5RDF.
   DFNLSTRL       Y1N5RDF.
   ANYTUBAL       Y1N5C.
   HYST           Y1N5C.
   OVAREM         Y1N5C.
   OTHR           Y1N5C.
   ANYFSTER       Y1N5C.
   ANYOPSMN       Y1N5RDF.
   WHATOPSM       WHATOPSM.
   DFNLSTRM       Y1N5RDF.
   ANYMSTER       Y1N5C.
   ANYVAS         Y1N5C.
   OTHRM          Y1N2RECF.
   DATFEMOP_Y     YEARFMT.
   PLCFEMOP       PLCOPF.
   PAYRSTER1      PAYFMT2F.
   PAYRSTER2      PAYFMT2F.
   PAYRSTER3      PAYFMT2F.
   RHADALL        Y1N5RDF.
   HHADALL        HHADALL.
   FMEDREAS1      FMEDREASF.
   FMEDREAS2      FMEDREASF.
   FMEDREAS3      FMEDREASF.
   FMEDREAS4      FMEDREASF.
   FMEDREAS5      FMEDREASF.
   BCREAS         BCREAS.
   BCWHYF         BCWHYFF.
   MINCDNNR       MINCDNF.
   DATFEMOP_Y2    YEARFMT.
   PLCFEMOP2      PLCOPF.
   PAYRSTER6      PAYFMT2F.
   PAYRSTER7      PAYFMT2F.
   PAYRSTER8      PAYFMT2F.
   RHADALL2       Y1N5RDF.
   HHADALL2       HHADALL.
   FMEDREAS7      FMEDREASF.
   FMEDREAS8      FMEDREASF.
   FMEDREAS9      FMEDREASF.
   FMEDREAS10     FMEDREASF.
   FMEDREAS11     FMEDREASF.
   BCREAS2        BCREAS.
   BCWHYF2        BCWHYFF.
   MINCDNNR2      MINCDNF.
   DATFEMOP_Y3    YEARFMT.
   PLCFEMOP3      PLCOPF.
   PAYRSTER11     PAYFMT2F.
   PAYRSTER12     PAYFMT2F.
   PAYRSTER13     PAYFMT2F.
   RHADALL3       Y1N5RDF.
   HHADALL3       HHADALL.
   FMEDREAS13     FMEDREASF.
   FMEDREAS14     FMEDREASF.
   FMEDREAS15     FMEDREASF.
   FMEDREAS16     FMEDREASF.
   FMEDREAS17     FMEDREASF.
   BCREAS3        BCREAS.
   BCWHYF3        BCWHYFF.
   MINCDNNR3      MINCDNF.
   DATFEMOP_Y4    YEARFMT.
   PLCFEMOP4      PLCOPF.
   PAYRSTER16     PAYFMT2F.
   PAYRSTER17     PAYFMT2F.
   PAYRSTER18     PAYFMT2F.
   RHADALL4       Y1N5RDF.
   HHADALL4       HHADALL.
   FMEDREAS19     FMEDREASF.
   FMEDREAS20     FMEDREASF.
   FMEDREAS21     FMEDREASF.
   FMEDREAS22     FMEDREASF.
   FMEDREAS23     FMEDREASF.
   BCREAS4        BCREAS.
   BCWHYF4        BCWHYFF.
   MINCDNNR4      MINCDNF.
   OPERSAME1      Y1N5RDF.
   OPERSAME2      Y1N5RDF.
   OPERSAME3      Y1N5RDF.
   OPERSAME4      Y1N5RDF.
   OPERSAME5      Y1N5RDF.
   OPERSAME6      Y1N5RDF.
   DATEOPMN_Y     YEARFMT.
   WITHIMOP       Y1N5RDF.
   VASJAN4YR      Y1N5RDF.
   PLACOPMN       PLCOPF.
   PAYMSTER1      PAYFMT2F.
   PAYMSTER2      PAYFMT2F.
   RHADALLM       Y1N5RDF.
   HHADALLM       Y1N5RDF.
   MEDREAS1       MEDREASF.
   MEDREAS2       MEDREASF.
   BCREASM        BCREAS.
   BCWHYM         BCWHYFF.
   MINCDNMN       MINCDNF.
   REVSTUBL       Y1N5RDF.
   DATRVSTB_Y     YEARFMT.
   REVSVASX       Y1N5RDF.
   DATRVVEX_Y     YEARFMT.
   TUBS           Y1N5C.
   VASECT         Y1N5C.
   RSURGSTR       Y1N5C.
   PSURGSTR       Y1N5C.
   ONLYTBVS       Y1N5C.
   RWANTRVT       DFPRBNAF.
   MANWANTT       DEFPROBF.
   RWANTREV       DEFPROBF.
   MANWANTR       DEFPROBF.
   POSIBLPG       Y1N5RDF.
   REASIMPR       REASR.
   POSIBLMN       Y1N5RDF.
   REASIMPP       REASP.
   CANHAVER       Y1N5RDF.
   REASDIFF1      REASDIFFF.
   REASDIFF2      REASDIFFF.
   REASDIFF3      REASDIFFF.
   CANHAVEM       Y1N5RDF.
   PREGNONO       Y1N5RDF.
   REASNONO1      REASNONOF.
   REASNONO2      REASNONOF.
   REASNONO3      REASNONOF.
   RSTRSTAT       RSTRSTAT.
   PSTRSTAT       RSTRSTAT.
   PILL           Y1N5RDF.
   CONDOM         Y1N5RDF.
   VASECTMY       Y1N5RDF.
   DEPOPROV       Y1N5RDF.
   WIDRAWAL       Y1N5RDF.
   RHYTHM         Y1N5RDF.
   SDAYCBDS       Y1N5RDF.
   TEMPSAFE       Y1N5RDF.
   PATCH          Y1N5RDF.
   RING           Y1N5RDF.
   MORNPILL       Y1N5RDF.
   ECTIMESX       ONETWO2F.
   ECREASON1      ECREASONF.
   ECREASON2      ECREASONF.
   ECREASON3      ECREASONF.
   ECRX           ECRX.
   ECWHERE        PLACE1FMT.
   ECWHEN         ECWHEN.
   OTHRMETH01     OTHRMETHF.
   OTHRMETH02     OTHRMETHF.
   OTHRMETH03     OTHRMETHF.
   OTHRMETH04     OTHRMETHF.
   OTHRMETH05     OTHRMETHF.
   OTHRMETH06     OTHRMETHF.
   OTHRMETH07     OTHRMETHF.
   EVIUDTYP1      IUDTYPE.
   EVIUDTYP2      IUDTYPE.
   NEWMETH        NEWMETHF.
   EVERUSED       YESNONAF.
   METHDISS       Y1N5RDF.
   METHSTOP01     METHSTOPF.
   METHSTOP02     METHSTOPF.
   METHSTOP03     METHSTOPF.
   METHSTOP04     METHSTOPF.
   METHSTOP05     METHSTOPF.
   METHSTOP06     METHSTOPF.
   METHSTOP07     METHSTOPF.
   METHSTOP08     METHSTOPF.
   METHSTOP09     METHSTOPF.
   METHSTOP10     METHSTOPF.
   WHENPILL       WHENMTHF.
   REASPILL01     REASMFMT.
   REASPILL02     REASMFMT.
   REASPILL03     REASMFMT.
   REASPILL04     REASMFMT.
   REASPILL05     REASMFMT.
   REASPILL06     REASMFMT.
   REASPILL07     REASMFMT.
   STOPPILL1      STOPPILLFMT.
   STOPPILL2      STOPPILLFMT.
   STOPPILL3      STOPPILLFMT.
   STOPPILL4      STOPPILLFMT.
   STOPPILL5      STOPPILLFMT.
   STOPPILL6      STOPPILLFMT.
   WHENCOND       WHENMTHF.
   REASCOND01     REASMFMT.
   REASCOND02     REASMFMT.
   REASCOND03     REASMFMT.
   REASCOND04     REASMFMT.
   REASCOND05     REASMFMT.
   REASCOND06     REASMFMT.
   REASCOND07     REASMFMT.
   STOPCOND1      STOPCONDFMT.
   STOPCOND2      STOPCONDFMT.
   WHENIUD        WHENMTHF.
   TYPEIUD_1      IUDTYPE.
   TYPEIUD_2      IUDTYPE.
   REASIUD01      REASMFMT.
   REASIUD02      REASMFMT.
   REASIUD03      REASMFMT.
   REASIUD04      REASMFMT.
   REASIUD05      REASMFMT.
   REASIUD06      REASMFMT.
   REASIUD07      REASMFMT.
   REASIUD08      REASMFMT.
   STOPIUD1       STOPIUDFMT.
   STOPIUD2       STOPIUDFMT.
   STOPIUD3       STOPIUDFMT.
   STOPIUD4       STOPIUDFMT.
   STOPIUD5       STOPIUDFMT.
   FIRSMETH1      FIRSMETHF.
   FIRSMETH2      FIRSMETHF.
   FIRSMETH3      FIRSMETHF.
   FIRSMETH4      FIRSMETHF.
   NUMFIRSM       ONETWOF.
   DRUGDEV        Y1N52D.
   DRUGDEV2       Y1N52D.
   DRUGDEV3       Y1N52D.
   DRUGDEV4       Y1N52D.
   FIRSTIME1      FIRSTIME1F.
   FIRSTIME2      FIRSTIME2F.
   USEFSTSX       USEFSTSX.
   CMFIRSM        CMFMT.
   MTHFSTSX1      FIRSMETHF.
   MTHFSTSX2      FIRSMETHF.
   MTHFSTSX3      FIRSMETHF.
   MTHFSTSX4      FIRSMETHF.
   WNFSTUSE_M     MNTHFMT.
   WNFSTUSE_Y     YEARFMT.
   CMFSTUSE       CMFMT.
   FMETHPRS       METHPRSF.
   FMETHPRS2      METHPRSF.
   FMETHPRS3      METHPRSF.
   FMETHPRS4      METHPRSF.
   AGEFSTUS       AGE44NRDF.
   PLACGOTF       PLACE1FMT.
   PLACGOTF2      PLACE1FMT.
   PLACGOTF3      PLACE1FMT.
   PLACGOTF4      PLACE1FMT.
   USEFRSTS       Y1N5RDF.
   MTHFRSTS1      FIRSMETHF.
   MTHFRSTS2      FIRSMETHF.
   MTHFRSTS3      FIRSMETHF.
   MTHFRSTS4      FIRSMETHF.
   INTR_EC3       Y1N5RDF.
   MONSX          Y1N5RDF.
   MONSX2         Y1N5RDF.
   MONSX3         Y1N5RDF.
   MONSX4         Y1N5RDF.
   MONSX5         Y1N5RDF.
   MONSX6         Y1N5RDF.
   MONSX7         Y1N5RDF.
   MONSX8         Y1N5RDF.
   MONSX9         Y1N5RDF.
   MONSX10        Y1N5RDF.
   MONSX11        Y1N5RDF.
   MONSX12        Y1N5RDF.
   MONSX13        Y1N5RDF.
   MONSX14        Y1N5RDF.
   MONSX15        Y1N5RDF.
   MONSX16        Y1N5RDF.
   MONSX17        Y1N5RDF.
   MONSX18        Y1N5RDF.
   MONSX19        Y1N5RDF.
   MONSX20        Y1N5RDF.
   MONSX21        Y1N5RDF.
   MONSX22        Y1N5RDF.
   MONSX23        Y1N5RDF.
   MONSX24        Y1N5RDF.
   MONSX25        Y1N5RDF.
   MONSX26        Y1N5RDF.
   MONSX27        Y1N5RDF.
   MONSX28        Y1N5RDF.
   MONSX29        Y1N5RDF.
   MONSX30        Y1N5RDF.
   MONSX31        Y1N5RDF.
   MONSX32        Y1N5RDF.
   MONSX33        Y1N5RDF.
   MONSX34        Y1N5RDF.
   MONSX35        Y1N5RDF.
   MONSX36        Y1N5RDF.
   MONSX37        Y1N5RDF.
   MONSX38        Y1N5RDF.
   MONSX39        Y1N5RDF.
   MONSX40        Y1N5RDF.
   MONSX41        Y1N5RDF.
   MONSX42        Y1N5RDF.
   MONSX43        Y1N5RDF.
   MONSX44        Y1N5RDF.
   MONSX45        Y1N5RDF.
   MONSX46        Y1N5RDF.
   MONSX47        Y1N5RDF.
   MONSX48        Y1N5RDF.
   CMSTRTMC       CMFMT.
   CMENDMC        CMFMT.
   INTR_ED4A      Y1N5RDF.
   NUMMCMON       NUMMCMOF.
   MC1MONS1       MCMONS.
   MC1SIMSQ       MC1SIMSQ.
   MC1MONS2       MCMONS.
   MC1MONS3       MCMONS.
   DATBEGIN_M     MNTHFMT.
   DATBEGIN_Y     YEARFMT.
   CMDATBEGIN     CMFMT.
   CURRMETH1      METHHXF.
   CURRMETH2      METHHXF.
   CURRMETH3      METHHXF.
   CURRMETH4      METHHXF.
   LSTMONMETH1    METHHXF.
   LSTMONMETH2    METHHXF.
   LSTMONMETH3    METHHXF.
   LSTMONMETH4    METHHXF.
   PILL_12        METHYNF.
   DIAPH_12       METHYNF.
   IUD_12         METHYNF.
   IMPLANT_12     METHYNF.
   DEPO_12        METHYNF.
   CERVC_12       METHYNF.
   MPILL_12       METHYNF.
   PATCH_12       METHYNF.
   RING_12        METHYNF.
   METHX1         METHHXF.
   METHX2         METHHXF.
   METHX3         METHHXF.
   METHX4         METHHXF.
   METHX5         METHHXF.
   METHX6         METHHXF.
   METHX7         METHHXF.
   METHX8         METHHXF.
   METHX9         METHHXF.
   METHX10        METHHXF.
   METHX11        METHHXF.
   METHX12        METHHXF.
   METHX13        METHHXF.
   METHX14        METHHXF.
   METHX15        METHHXF.
   METHX16        METHHXF.
   METHX17        METHHXF.
   METHX18        METHHXF.
   METHX19        METHHXF.
   METHX20        METHHXF.
   METHX21        METHHXF.
   METHX22        METHHXF.
   METHX23        METHHXF.
   METHX24        METHHXF.
   METHX25        METHHXF.
   METHX26        METHHXF.
   METHX27        METHHXF.
   METHX28        METHHXF.
   METHX29        METHHXF.
   METHX30        METHHXF.
   METHX31        METHHXF.
   METHX32        METHHXF.
   METHX33        METHHXF.
   METHX34        METHHXF.
   METHX35        METHHXF.
   METHX36        METHHXF.
   METHX37        METHHXF.
   METHX38        METHHXF.
   METHX39        METHHXF.
   METHX40        METHHXF.
   METHX41        METHHXF.
   METHX42        METHHXF.
   METHX43        METHHXF.
   METHX44        METHHXF.
   METHX45        METHHXF.
   METHX46        METHHXF.
   METHX47        METHHXF.
   METHX48        METHHXF.
   METHX49        METHHXF.
   METHX50        METHHXF.
   METHX51        METHHXF.
   METHX52        METHHXF.
   METHX53        METHHXF.
   METHX54        METHHXF.
   METHX55        METHHXF.
   METHX56        METHHXF.
   METHX57        METHHXF.
   METHX58        METHHXF.
   METHX59        METHHXF.
   METHX60        METHHXF.
   METHX61        METHHXF.
   METHX62        METHHXF.
   METHX63        METHHXF.
   METHX64        METHHXF.
   METHX65        METHHXF.
   METHX66        METHHXF.
   METHX67        METHHXF.
   METHX68        METHHXF.
   METHX69        METHHXF.
   METHX70        METHHXF.
   METHX71        METHHXF.
   METHX72        METHHXF.
   METHX73        METHHXF.
   METHX74        METHHXF.
   METHX75        METHHXF.
   METHX76        METHHXF.
   METHX77        METHHXF.
   METHX78        METHHXF.
   METHX79        METHHXF.
   METHX80        METHHXF.
   METHX81        METHHXF.
   METHX82        METHHXF.
   METHX83        METHHXF.
   METHX84        METHHXF.
   METHX85        METHHXF.
   METHX86        METHHXF.
   METHX87        METHHXF.
   METHX88        METHHXF.
   METHX89        METHHXF.
   METHX90        METHHXF.
   METHX91        METHHXF.
   METHX92        METHHXF.
   METHX93        METHHXF.
   METHX94        METHHXF.
   METHX95        METHHXF.
   METHX96        METHHXF.
   METHX97        METHHXF.
   METHX98        METHHXF.
   METHX99        METHHXF.
   METHX100       METHHXF.
   METHX101       METHHXF.
   METHX102       METHHXF.
   METHX103       METHHXF.
   METHX104       METHHXF.
   METHX105       METHHXF.
   METHX106       METHHXF.
   METHX107       METHHXF.
   METHX108       METHHXF.
   METHX109       METHHXF.
   METHX110       METHHXF.
   METHX111       METHHXF.
   METHX112       METHHXF.
   METHX113       METHHXF.
   METHX114       METHHXF.
   METHX115       METHHXF.
   METHX116       METHHXF.
   METHX117       METHHXF.
   METHX118       METHHXF.
   METHX119       METHHXF.
   METHX120       METHHXF.
   METHX121       METHHXF.
   METHX122       METHHXF.
   METHX123       METHHXF.
   METHX124       METHHXF.
   METHX125       METHHXF.
   METHX126       METHHXF.
   METHX127       METHHXF.
   METHX128       METHHXF.
   METHX129       METHHXF.
   METHX130       METHHXF.
   METHX131       METHHXF.
   METHX132       METHHXF.
   METHX133       METHHXF.
   METHX134       METHHXF.
   METHX135       METHHXF.
   METHX136       METHHXF.
   METHX137       METHHXF.
   METHX138       METHHXF.
   METHX139       METHHXF.
   METHX140       METHHXF.
   METHX141       METHHXF.
   METHX142       METHHXF.
   METHX143       METHHXF.
   METHX144       METHHXF.
   METHX145       METHHXF.
   METHX146       METHHXF.
   METHX147       METHHXF.
   METHX148       METHHXF.
   METHX149       METHHXF.
   METHX150       METHHXF.
   METHX151       METHHXF.
   METHX152       METHHXF.
   METHX153       METHHXF.
   METHX154       METHHXF.
   METHX155       METHHXF.
   METHX156       METHHXF.
   METHX157       METHHXF.
   METHX158       METHHXF.
   METHX159       METHHXF.
   METHX160       METHHXF.
   METHX161       METHHXF.
   METHX162       METHHXF.
   METHX163       METHHXF.
   METHX164       METHHXF.
   METHX165       METHHXF.
   METHX166       METHHXF.
   METHX167       METHHXF.
   METHX168       METHHXF.
   METHX169       METHHXF.
   METHX170       METHHXF.
   METHX171       METHHXF.
   METHX172       METHHXF.
   METHX173       METHHXF.
   METHX174       METHHXF.
   METHX175       METHHXF.
   METHX176       METHHXF.
   METHX177       METHHXF.
   METHX178       METHHXF.
   METHX179       METHHXF.
   METHX180       METHHXF.
   METHX181       METHHXF.
   METHX182       METHHXF.
   METHX183       METHHXF.
   METHX184       METHHXF.
   METHX185       METHHXF.
   METHX186       METHHXF.
   METHX187       METHHXF.
   METHX188       METHHXF.
   METHX189       METHHXF.
   METHX190       METHHXF.
   METHX191       METHHXF.
   METHX192       METHHXF.
   CMMHCALX1      CMMHCALF.
   CMMHCALX2      CMMHCALF.
   CMMHCALX3      CMMHCALF.
   CMMHCALX4      CMMHCALF.
   CMMHCALX5      CMMHCALF.
   CMMHCALX6      CMMHCALF.
   CMMHCALX7      CMMHCALF.
   CMMHCALX8      CMMHCALF.
   CMMHCALX9      CMMHCALF.
   CMMHCALX10     CMMHCALF.
   CMMHCALX11     CMMHCALF.
   CMMHCALX12     CMMHCALF.
   CMMHCALX13     CMMHCALF.
   CMMHCALX14     CMMHCALF.
   CMMHCALX15     CMMHCALF.
   CMMHCALX16     CMMHCALF.
   CMMHCALX17     CMMHCALF.
   CMMHCALX18     CMMHCALF.
   CMMHCALX19     CMMHCALF.
   CMMHCALX20     CMMHCALF.
   CMMHCALX21     CMMHCALF.
   CMMHCALX22     CMMHCALF.
   CMMHCALX23     CMMHCALF.
   CMMHCALX24     CMMHCALF.
   CMMHCALX25     CMMHCALF.
   CMMHCALX26     CMMHCALF.
   CMMHCALX27     CMMHCALF.
   CMMHCALX28     CMMHCALF.
   CMMHCALX29     CMMHCALF.
   CMMHCALX30     CMMHCALF.
   CMMHCALX31     CMMHCALF.
   CMMHCALX32     CMMHCALF.
   CMMHCALX33     CMMHCALF.
   CMMHCALX34     CMMHCALF.
   CMMHCALX35     CMMHCALF.
   CMMHCALX36     CMMHCALF.
   CMMHCALX37     CMMHCALF.
   CMMHCALX38     CMMHCALF.
   CMMHCALX39     CMMHCALF.
   CMMHCALX40     CMMHCALF.
   CMMHCALX41     CMMHCALF.
   CMMHCALX42     CMMHCALF.
   CMMHCALX43     CMMHCALF.
   CMMHCALX44     CMMHCALF.
   CMMHCALX45     CMMHCALF.
   CMMHCALX46     CMMHCALF.
   CMMHCALX47     CMMHCALF.
   CMMHCALX48     CMMHCALF.
   NUMMULTX1      ONETWOF.
   NUMMULTX2      ONETWOF.
   NUMMULTX3      ONETWOF.
   NUMMULTX4      ONETWOF.
   NUMMULTX5      ONETWOF.
   NUMMULTX6      ONETWOF.
   NUMMULTX7      ONETWOF.
   NUMMULTX8      ONETWOF.
   NUMMULTX9      ONETWOF.
   NUMMULTX10     ONETWOF.
   NUMMULTX11     ONETWOF.
   NUMMULTX12     ONETWOF.
   NUMMULTX13     ONETWOF.
   NUMMULTX14     ONETWOF.
   NUMMULTX15     ONETWOF.
   NUMMULTX16     ONETWOF.
   NUMMULTX17     ONETWOF.
   NUMMULTX18     ONETWOF.
   NUMMULTX19     ONETWOF.
   NUMMULTX20     ONETWOF.
   NUMMULTX21     ONETWOF.
   NUMMULTX22     ONETWOF.
   NUMMULTX23     ONETWOF.
   NUMMULTX24     ONETWOF.
   NUMMULTX25     ONETWOF.
   NUMMULTX26     ONETWOF.
   NUMMULTX27     ONETWOF.
   NUMMULTX28     ONETWOF.
   NUMMULTX29     ONETWOF.
   NUMMULTX30     ONETWOF.
   NUMMULTX31     ONETWOF.
   NUMMULTX32     ONETWOF.
   NUMMULTX33     ONETWOF.
   NUMMULTX34     ONETWOF.
   NUMMULTX35     ONETWOF.
   NUMMULTX36     ONETWOF.
   NUMMULTX37     ONETWOF.
   NUMMULTX38     ONETWOF.
   NUMMULTX39     ONETWOF.
   NUMMULTX40     ONETWOF.
   NUMMULTX41     ONETWOF.
   NUMMULTX42     ONETWOF.
   NUMMULTX43     ONETWOF.
   NUMMULTX44     ONETWOF.
   NUMMULTX45     ONETWOF.
   NUMMULTX46     ONETWOF.
   NUMMULTX47     ONETWOF.
   NUMMULTX48     ONETWOF.
   SALMX1         N0Y1F.
   SALMX2         N0Y1F.
   SALMX3         N0Y1F.
   SALMX4         N0Y1F.
   SALMX5         N0Y1F.
   SALMX6         N0Y1F.
   SALMX7         N0Y1F.
   SALMX8         N0Y1F.
   SALMX9         N0Y1F.
   SALMX10        N0Y1F.
   SALMX11        N0Y1F.
   SALMX12        N0Y1F.
   SALMX13        N0Y1F.
   SALMX14        N0Y1F.
   SALMX15        N0Y1F.
   SALMX16        N0Y1F.
   SALMX17        N0Y1F.
   SALMX18        N0Y1F.
   SALMX19        N0Y1F.
   SALMX20        N0Y1F.
   SALMX21        N0Y1F.
   SALMX22        N0Y1F.
   SALMX23        N0Y1F.
   SALMX24        N0Y1F.
   SALMX25        N0Y1F.
   SALMX26        N0Y1F.
   SALMX27        N0Y1F.
   SALMX28        N0Y1F.
   SALMX29        N0Y1F.
   SALMX30        N0Y1F.
   SALMX31        N0Y1F.
   SALMX32        N0Y1F.
   SALMX33        N0Y1F.
   SALMX34        N0Y1F.
   SALMX35        N0Y1F.
   SALMX36        N0Y1F.
   SALMX37        N0Y1F.
   SALMX38        N0Y1F.
   SALMX39        N0Y1F.
   SALMX40        N0Y1F.
   SALMX41        N0Y1F.
   SALMX42        N0Y1F.
   SALMX43        N0Y1F.
   SALMX44        N0Y1F.
   SALMX45        N0Y1F.
   SALMX46        N0Y1F.
   SALMX47        N0Y1F.
   SALMX48        N0Y1F.
   SAYX1          N0Y1F.
   SAYX2          N0Y1F.
   SAYX3          N0Y1F.
   SAYX4          N0Y1F.
   SAYX5          N0Y1F.
   SAYX6          N0Y1F.
   SAYX7          N0Y1F.
   SAYX8          N0Y1F.
   SAYX9          N0Y1F.
   SAYX10         N0Y1F.
   SAYX11         N0Y1F.
   SAYX12         N0Y1F.
   SAYX13         N0Y1F.
   SAYX14         N0Y1F.
   SAYX15         N0Y1F.
   SAYX16         N0Y1F.
   SAYX17         N0Y1F.
   SAYX18         N0Y1F.
   SAYX19         N0Y1F.
   SAYX20         N0Y1F.
   SAYX21         N0Y1F.
   SAYX22         N0Y1F.
   SAYX23         N0Y1F.
   SAYX24         N0Y1F.
   SAYX25         N0Y1F.
   SAYX26         N0Y1F.
   SAYX27         N0Y1F.
   SAYX28         N0Y1F.
   SAYX29         N0Y1F.
   SAYX30         N0Y1F.
   SAYX31         N0Y1F.
   SAYX32         N0Y1F.
   SAYX33         N0Y1F.
   SAYX34         N0Y1F.
   SAYX35         N0Y1F.
   SAYX36         N0Y1F.
   SAYX37         N0Y1F.
   SAYX38         N0Y1F.
   SAYX39         N0Y1F.
   SAYX40         N0Y1F.
   SAYX41         N0Y1F.
   SAYX42         N0Y1F.
   SAYX43         N0Y1F.
   SAYX44         N0Y1F.
   SAYX45         N0Y1F.
   SAYX46         N0Y1F.
   SAYX47         N0Y1F.
   SAYX48         N0Y1F.
   SIMSEQX1       MC1SIMSQ.
   SIMSEQX2       MC1SIMSQ.
   SIMSEQX3       MC1SIMSQ.
   SIMSEQX4       MC1SIMSQ.
   SIMSEQX5       MC1SIMSQ.
   SIMSEQX6       MC1SIMSQ.
   SIMSEQX7       MC1SIMSQ.
   SIMSEQX8       MC1SIMSQ.
   SIMSEQX9       MC1SIMSQ.
   SIMSEQX10      MC1SIMSQ.
   SIMSEQX11      MC1SIMSQ.
   SIMSEQX12      MC1SIMSQ.
   SIMSEQX13      MC1SIMSQ.
   SIMSEQX14      MC1SIMSQ.
   SIMSEQX15      MC1SIMSQ.
   SIMSEQX16      MC1SIMSQ.
   SIMSEQX17      MC1SIMSQ.
   SIMSEQX18      MC1SIMSQ.
   SIMSEQX19      MC1SIMSQ.
   SIMSEQX20      MC1SIMSQ.
   SIMSEQX21      MC1SIMSQ.
   SIMSEQX22      MC1SIMSQ.
   SIMSEQX23      MC1SIMSQ.
   SIMSEQX24      MC1SIMSQ.
   SIMSEQX25      MC1SIMSQ.
   SIMSEQX26      MC1SIMSQ.
   SIMSEQX27      MC1SIMSQ.
   SIMSEQX28      MC1SIMSQ.
   SIMSEQX29      MC1SIMSQ.
   SIMSEQX30      MC1SIMSQ.
   SIMSEQX31      MC1SIMSQ.
   SIMSEQX32      MC1SIMSQ.
   SIMSEQX33      MC1SIMSQ.
   SIMSEQX34      MC1SIMSQ.
   SIMSEQX35      MC1SIMSQ.
   SIMSEQX36      MC1SIMSQ.
   SIMSEQX37      MC1SIMSQ.
   SIMSEQX38      MC1SIMSQ.
   SIMSEQX39      MC1SIMSQ.
   SIMSEQX40      MC1SIMSQ.
   SIMSEQX41      MC1SIMSQ.
   SIMSEQX42      MC1SIMSQ.
   SIMSEQX43      MC1SIMSQ.
   SIMSEQX44      MC1SIMSQ.
   SIMSEQX45      MC1SIMSQ.
   SIMSEQX46      MC1SIMSQ.
   SIMSEQX47      MC1SIMSQ.
   SIMSEQX48      MC1SIMSQ.
   USELSTP        Y1N5RDF.
   WYNOLSTP       Y1N5RDF.
   HPLSTP         Y1N5RDF.
   LSTMTHP1       FIRSMETHF.
   LSTMTHP2       FIRSMETHF.
   LSTMTHP3       FIRSMETHF.
   LSTMTHP4       FIRSMETHF.
   LPIUDTYP       IUDTYPE.
   USEFSTP        Y1N5RDF.
   FSTMTHP1       FIRSMETHF.
   FSTMTHP2       FIRSMETHF.
   FSTMTHP3       FIRSMETHF.
   FSTMTHP4       FIRSMETHF.
   USELSTP2       Y1N5RDF.
   WYNOLSTP2      Y1N5RDF.
   HPLSTP2        Y1N5RDF.
   LSTMTHP5       FIRSMETHF.
   LSTMTHP6       FIRSMETHF.
   LSTMTHP7       FIRSMETHF.
   LSTMTHP8       FIRSMETHF.
   LPIUDTYP2      IUDTYPE.
   USEFSTP2       Y1N5RDF.
   FSTMTHP5       FIRSMETHF.
   FSTMTHP6       FIRSMETHF.
   FSTMTHP7       FIRSMETHF.
   FSTMTHP8       FIRSMETHF.
   USELSTP3       Y1N5RDF.
   WYNOLSTP3      Y1N5RDF.
   HPLSTP3        Y1N5RDF.
   LSTMTHP9       FIRSMETHF.
   LSTMTHP10      FIRSMETHF.
   LSTMTHP11      FIRSMETHF.
   LSTMTHP12      FIRSMETHF.
   LPIUDTYP3      IUDTYPE.
   USEFSTP3       Y1N5RDF.
   FSTMTHP9       FIRSMETHF.
   FSTMTHP10      FIRSMETHF.
   FSTMTHP11      FIRSMETHF.
   FSTMTHP12      FIRSMETHF.
   WYNOTUSE       Y1N5RDF.
   HPPREGQ        HPPREGQ.
   DURTRY_N       DURTRY_N.
   DURTRY_P       DURTRY_P.
   WHYNOUSING1    WHYNOUSNG.
   WHYNOUSING2    WHYNOUSNG.
   WHYNOUSING3    WHYNOUSNG.
   WHYNOUSING4    WHYNOUSNG.
   WHYNOUSING5    WHYNOUSNG.
   WHYNOTPG1      WHYNOTPGF.
   WHYNOTPG2      WHYNOTPGF.
   MAINNOUSE      MAINNOUSE.
   YUSEPILL1      YUSEMTHF.
   YUSEPILL2      YUSEMTHF.
   YUSEPILL3      YUSEMTHF.
   YUSEPILL4      YUSEMTHF.
   YUSEPILL5      YUSEMTHF.
   YUSEPILL6      YUSEMTHF.
   YUSEPILL7      YUSEMTHF.
   IUDTYPE        IUDTYPE.
   YUSEIUD1       YUSEMTHF.
   YUSEIUD2       YUSEMTHF.
   YUSEIUD3       YUSEMTHF.
   YUSEIUD4       YUSEMTHF.
   YUSEIUD5       YUSEMTHF.
   EKMETHOD       METHHXF.
   CURBCPLC       BCPLCF.
   NUMPILLS       NUMPILLS.
   CURBCPAY1      PAYFMT.
   CURBCPAY2      PAYFMT.
   CURBCPAY3      PAYFMT.
   CURBCINS       Y1N5RDF.
   NOUSEINS1      NOUSEINSF.
   NOUSEINS2      NOUSEINSF.
   NOUSEINS3      NOUSEINSF.
   CURBCAMT       CURBCAMT.
   NOCOST1        Y1N5RDF.
   NOCOST2        Y1N5RDF.
   PST4WKSX       PSTWKSF.
   PSWKCOND1      Y1N5RDF.
   PSWKCOND2      PSTWKSF.
   COND1BRK       Y1N5RDF.
   COND1OFF       Y1N5RDF.
   CONDBRFL       CONDTMS.
   CONDOFF        CONDTMS.
   MISSPILL       MISSPILL.
   P12MOCON       P12MOCON.
   PXNOFREQ       P12METHF.
   BTHCON12       Y1N5RDF.
   MEDTST12       Y1N5RDF.
   BCCNS12        Y1N5RDF.
   STEROP12       Y1N5RDF.
   STCNS12        Y1N5RDF.
   EMCON12        Y1N5RDF.
   ECCNS12        Y1N5RDF.
   NUMMTH12       NUMMTH12A.
   PRGTST12       Y1N5RDF.
   ABORT12        Y1N5RDF.
   PAP12          Y1N5RDF.
   PELVIC12       Y1N5RDF.
   PRENAT12       Y1N5RDF.
   PARTUM12       Y1N5RDF.
   STDSVC12       Y1N5RDF.
   BARRIER1       BARRIERF.
   BARRIER2       BARRIERF.
   BARRIER3       BARRIERF.
   BARRIER4       BARRIERF.
   BARRIER5       BARRIERF.
   BARRIER6       BARRIERF.
   NUMSVC12       NUMSVC12A.
   NUMBCVIS       NUMBCVIS.
   BC12PLCX       BCPLCF.
   BC12PLCX2      BCPLCF.
   BC12PLCX3      BCPLCF.
   BC12PLCX4      BCPLCF.
   BC12PLCX5      BCPLCF.
   BC12PLCX6      BCPLCF.
   BC12PLCX7      BCPLCF.
   BC12PLCX8      BCPLCF.
   BC12PLCX9      BCPLCF.
   BC12PLCX10     BCPLCF.
   BC12PLCX11     BCPLCF.
   BC12PLCX12     BCPLCF.
   BC12PLCX13     BCPLCF.
   BC12PLCX14     BCPLCF.
   BC12PLCX15     BCPLCF.
   IDCLINIC       IDCLINIC.
   PGTSTBC2       Y1N5RDF.
   PAPPLBC2       Y1N5RDF.
   PAPPELEC       Y1N5RDF.
   STDTSCON       Y1N5RDF.
   WHYPSTD        WHYPSTDF.
   BCCLARC        Y1N5RDF.
   BC12PAYX1      PAYFMT.
   BC12PAYX2      PAYFMT.
   BC12PAYX3      PAYFMT.
   BC12PAYX4      PAYFMT.
   BC12PAYX7      PAYFMT.
   BC12PAYX8      PAYFMT.
   BC12PAYX9      PAYFMT.
   BC12PAYX10     PAYFMT.
   BC12PAYX13     PAYFMT.
   BC12PAYX14     PAYFMT.
   BC12PAYX15     PAYFMT.
   BC12PAYX16     PAYFMT.
   BC12PAYX19     PAYFMT.
   BC12PAYX20     PAYFMT.
   BC12PAYX21     PAYFMT.
   BC12PAYX22     PAYFMT.
   BC12PAYX25     PAYFMT.
   BC12PAYX26     PAYFMT.
   BC12PAYX27     PAYFMT.
   BC12PAYX28     PAYFMT.
   BC12PAYX31     PAYFMT.
   BC12PAYX32     PAYFMT.
   BC12PAYX33     PAYFMT.
   BC12PAYX34     PAYFMT.
   BC12PAYX37     PAYFMT.
   BC12PAYX38     PAYFMT.
   BC12PAYX39     PAYFMT.
   BC12PAYX40     PAYFMT.
   BC12PAYX43     PAYFMT.
   BC12PAYX44     PAYFMT.
   BC12PAYX45     PAYFMT.
   BC12PAYX46     PAYFMT.
   BC12PAYX49     PAYFMT.
   BC12PAYX50     PAYFMT.
   BC12PAYX51     PAYFMT.
   BC12PAYX52     PAYFMT.
   BC12PAYX55     PAYFMT.
   BC12PAYX56     PAYFMT.
   BC12PAYX57     PAYFMT.
   BC12PAYX58     PAYFMT.
   BC12PAYX61     PAYFMT.
   BC12PAYX62     PAYFMT.
   BC12PAYX63     PAYFMT.
   BC12PAYX64     PAYFMT.
   BC12PAYX67     PAYFMT.
   BC12PAYX68     PAYFMT.
   BC12PAYX69     PAYFMT.
   BC12PAYX70     PAYFMT.
   BC12PAYX73     PAYFMT.
   BC12PAYX74     PAYFMT.
   BC12PAYX75     PAYFMT.
   BC12PAYX76     PAYFMT.
   BC12PAYX79     PAYFMT.
   BC12PAYX80     PAYFMT.
   BC12PAYX81     PAYFMT.
   BC12PAYX82     PAYFMT.
   BC12PAYX85     PAYFMT.
   BC12PAYX86     PAYFMT.
   BC12PAYX87     PAYFMT.
   BC12PAYX88     PAYFMT.
   REGCAR12_F_01  REGCAR12F.
   REGCAR12_F_02  REGCAR12F.
   REGCAR12_F_03  REGCAR12F.
   REGCAR12_F_04  REGCAR12F.
   REGCAR12_F_05  REGCAR12F.
   REGCAR12_F_06  REGCAR12F.
   REGCAR12_F_07  REGCAR12F.
   REGCAR12_F_08  REGCAR12F.
   REGCAR12_F_09  REGCAR12F.
   REGCAR12_F_10  REGCAR12F.
   REGCAR12_F_11  REGCAR12F.
   REGCAR12_F_12  REGCAR12F.
   REGCAR12_F_13  REGCAR12F.
   REGCAR12_F_14  REGCAR12F.
   REGCAR12_F_15  REGCAR12F.
   EVERFPC        Y1N5RDF.
   KNDMDHLP01     KNDMDHLPF.
   KNDMDHLP02     KNDMDHLPF.
   KNDMDHLP03     KNDMDHLPF.
   KNDMDHLP04     KNDMDHLPF.
   KNDMDHLP05     KNDMDHLPF.
   KNDMDHLP06     KNDMDHLPF.
   KNDMDHLP07     KNDMDHLPF.
   KNDMDHLP08     KNDMDHLPF.
   LASTPAP        LASTPAP.
   MREASPAP       MREASFMT.
   AGEFPAP        AGEFPAP.
   AGEFPAP2       AGEF2F.
   ABNPAP3        ABNPAP3F.
   INTPAP         INTOFTF.
   PELWPAP        Y1N5RDF.
   LASTPEL        LASTPEL.
   MREASPEL       MREASFMT.
   AGEFPEL        AGEFPEL.
   AGEPEL2        AGEF2F.
   INTPEL         INTOFTF.
   EVHPVTST       Y1N5RDF.
   HPVWPAP        Y1N5RDF.
   LASTHPV        LASTHPV.
   MREASHPV       MREASFMT.
   AGEFHPV        AGEFHPV.
   AGEHPV2        AGEF2F.
   INTHPV         INTOFTF.
   ASKSMOKE       Y1N5RDF.
   ASKPREG        Y1N5RDF.
   ASKFOLIC       Y1N5RDF.
   RWANT          Y1N5RDF.
   PROBWANT       PROBWANT.
   PWANT          DEFPROBF.
   JINTEND        Y1N5RDF.
   JSUREINT       SUREINTCHP.
   JINTENDN       INTEXPF.
   JEXPECTL       INTEXPF.
   JEXPECTS       JEXPECTS.
   JINTNEXT       INTNEXT.
   INTEND         Y1N5RDF.
   SUREINT        SUREINTCHP.
   INTENDN        INTEXPF.
   EXPECTL        INTEXPF.
   EXPECTS        JEXPECTS.
   INTNEXT        INTNEXT.
   HLPPRG         Y1N5RDF.
   HOWMANYR       HOWMANYR.
   SEEKWHO1       SEEKWHO1F.
   SEEKWHO2       Y1N5RDF.
   TYPALLPG1      TYPALLPGF.
   TYPALLPG2      TYPALLPGF.
   TYPALLPG3      TYPALLPGF.
   TYPALLPG4      TYPALLPGF.
   TYPALLPG5      TYPALLPGF.
   TYPALLPG6      TYPALLPGF.
   WHOTEST        WHOTEST.
   WHARTIN        WHARTIN.
   OTMEDHEP1      OTMEDHEPF.
   OTMEDHEP2      OTMEDHEPF.
   OTMEDHEP3      OTMEDHEPF.
   OTMEDHEP4      OTMEDHEPF.
   OTMEDHEP5      OTMEDHEPF.
   INSCOVPG       Y1N5RDF.
   FSTHLPPG_M     MNTHFMT.
   FSTHLPPG_Y     YEARFMT.
   CMPGVIS1       CMFMT.
   TRYLONG2       TRYLONG2F.
   UNIT_TRYLONG   UNIT_TRYLONG.
   HLPPGNOW       Y1N5RDF.
   RCNTPGH_M      RCNTPGHF.
   RCNTPGH_Y      YEARFMT.
   CMPGVISL       CMPGVISL.
   NUMVSTPG       NUMVSTPG.
   PRGVISIT       PRGVISIT.
   HLPMC          Y1N5RDF.
   TYPALLMC1      TYPALLMCF.
   TYPALLMC2      TYPALLMCF.
   TYPALLMC3      TYPALLMCF.
   TYPALLMC4      TYPALLMCF.
   TYPALLMC5      TYPALLMCF.
   TYPALLMC6      TYPALLMCF.
   MISCNUM        TPRGMISS.
   INFRTPRB1      INFRTPRBF.
   INFRTPRB2      INFRTPRBF.
   INFRTPRB3      INFRTPRBF.
   INFRTPRB4      INFRTPRBF.
   INFRTPRB5      INFRTPRBF.
   DUCHFREQ       DUCHFREQ.
   PID            Y1N5RDF.
   PIDSYMPT       Y1N5RDF.
   PIDTX          PIDTX.
   LSTPIDTX_M     MNTHFMT.
   LSTPIDTX_Y     YEARFMT.
   CMPIDLST       CMFMT.
   DIABETES       DIABETES.
   GESTDIAB       Y1N5RDF.
   UF             Y1N5RDF.
   ENDO           Y1N5RDF.
   OVUPROB        Y1N5RDF.
   DEAF           Y1N5RDF.
   BLIND          Y1N5RDF.
   DIFDECIDE      Y1N5RDF.
   DIFWALK        Y1N5RDF.
   DIFDRESS       Y1N5RDF.
   DIFOUT         Y1N5RDF.
   EVRCANCER      Y1N5RDF.
   AGECANCER      AGECANCER.
   CANCTYPE       CANCTYPEF.
   PRECANCER      PRECANCER.
   MAMMOG         Y1N5RDF.
   AGEMAMM1       AGEMAM1F.
   REASMAMM1      REASMAMF.
   CLINEXAM       Y1N5RDF.
   FAMHYST        Y1N5RDF.
   MOMRISK70      RISKF.
   MOMRISK40      RISKF.
   ALCORISK       RISKF.
   BFEEDRISK      RISKF.
   DONBLOOD       Y1N5RDF.
   HIVTEST        Y1N5RDF.
   NOHIVTST       NOHIVTST.
   WHENHIV_M      MNTHFMT.
   WHENHIV_Y      YEARFMT.
   CMHIVTST       CMFMT.
   HIVTSTYR       Y1N5RDF.
   HIVRESULT      Y1N5RDF.
   WHYNOGET       WHYNOGET.
   PLCHIV         PLCHIV.
   RHHIVT1        YESNONAF.
   RHHIVT21       RHHIVT2F.
   HIVTST         HIVTST.
   WHOSUGG        WHOSUGG.
   TALKDOCT       Y1N5RDF.
   AIDSTALK01     AIDSTALKF.
   AIDSTALK02     AIDSTALKF.
   AIDSTALK03     AIDSTALKF.
   AIDSTALK04     AIDSTALKF.
   AIDSTALK05     AIDSTALKF.
   AIDSTALK06     AIDSTALKF.
   AIDSTALK07     AIDSTALKF.
   AIDSTALK08     AIDSTALKF.
   AIDSTALK09     AIDSTALKF.
   AIDSTALK10     AIDSTALKF.
   AIDSTALK11     AIDSTALKF.
   RETROVIR       RETROVIR.
   PREGHIV        PREGHIV.
   EVERVACC       Y1N5RDF.
   HPVSHOT1       AGE25NRDF.
   HPVSEX1        HPVSEX1F.
   VACCPROB       LKNLK2FMT.
   BLDPRESS       Y1N5RDF.
   HIGHBP         HIGHBP.
   BPMEDS         Y1N5RDF.
   USUALCAR       Y1N5RDF.
   USLPLACE       USLPLACE.
   USL12MOS       Y1N5RDF.
   CURRCOV        Y1N5RDF.
   COVERHOW01     COVERHOWF.
   COVERHOW02     COVERHOWF.
   COVERHOW03     COVERHOWF.
   PARINSUR       Y1N5RDF.
   INS_EXCH       Y1N5RDF.
   INS_PREM       Y1N5RDF.
   COVER12        Y1N5RDF.
   NUMNOCOV       NUMNOCOV.
   SAMEADD        Y1N5RDF.
   CNTRY10        Y1N5RDF.
   BRNOUT         Y1N5RDF.
   YRSTRUS        YEARFMT.
   RELRAISD       RELCURR.
   ATTND14        ATTNDF.
   RELCURR        RELCURR.
   RELTRAD        RELTRAD.
   FUNDAM1        FUNDAMF.
   FUNDAM2        FUNDAMF.
   FUNDAM3        FUNDAMF.
   FUNDAM4        FUNDAMF.
   RELDLIFE       RELDLIFE.
   ATTNDNOW       ATTNDF.
   MILSVC         Y1N5RDF.
   WRK12MOS       WRK12MOS.
   FPT12MOS       FPT12MOS.
   DOLASTWK1      DOLASTWK.
   DOLASTWK2      DOLASTWK.
   DOLASTWK3      DOLASTWK.
   DOLASTWK4      DOLASTWK.
   DOLASTWK5      DOLASTWK.
   RWRKST         Y1N5C.
   WORKP12        Y1N5C.
   RPAYJOB        Y1N5RDF.
   RNUMJOB        NUMJOBF.
   RFTPTX         TMWK12MO.
   REARNTY        Y1N5C.
   SPLSTWK1       SPLSTWKF.
   SPLSTWK2       SPLSTWKF.
   SPLSTWK3       SPLSTWKF.
   SPLSTWK4       SPLSTWKF.
   SPLSTWK5       SPLSTWKF.
   SPWRKST        Y1N5C.
   SPPAYJOB       Y1N5RDF.
   SPNUMJOB       NUMJOBF.
   SPFTPTX        TMWK12MO.
   SPEARNTY       Y1N5C.
   SAMESEX        AGDGFMT.
   CHSUPPOR       AGDGFMT.
   REACTSLF       REACTSLF.
   CHBOTHER       CHBOTHER.
   ACASILANG      ACASILANG.
   GENHEALT       GENHEALT.
   INCHES         INCHES.
   RWEIGHT        RWEIGHT.
   BMI            BMI.
   DRWEIGH        YESNONAF.
   TELLWGHT       TELLWGHT.
   WGHTSCRN       YESNONAF.
   ENGSPEAK       ENGSPEAK.
   CASIBIRTH      CASINUM.
   CASILOSS       CASINUM.
   CASIABOR       CASINUM.
   CASIADOP       YESNONAF.
   NOBEDYR        YESNONAF.
   STAYREL        YESNONAF.
   EVSUSPEN       YESNONAF.
   GRADSUSP       CASIGRAD.
   SMK100         YESNONAF.
   AGESMK         CASISMK.
   SMOKE12        SMOKE12F.
   SMKSTOP        YESNONAF.
   DRINK12        DRINKF.
   UNIT30D        UNIT30D.
   DRINK30D       DRNK30D.
   DRINKDAY       DRNKNUM.
   BINGE30        BNGE30T.
   DRNKMOST       DRNKNUM.
   BINGE12        DRINKF.
   POT12          POTFRF.
   COC12          DRUGFRF.
   CRACK12        DRUGFRF.
   CRYSTMTH12     DRUGFRF.
   INJECT12       DRUGFRF.
   VAGSEX         YESNONAF.
   AGEVAGR        AG95NRDF.
   CONDVAG        YESNONAF.
   WHYCONDL       WHYCONDL.
   GETORALM       YESNONAF.
   GIVORALM       YESNONAF.
   CONDFELL       YESNONAF.
   ANYORAL        Y1N5NAC.
   TIMING         TIMING.
   ANALSEX        YESNONAF.
   CONDANAL       YESNONAF.
   OPPSEXANY      Y1N5NAC.
   OPPSEXGEN      Y1N5NAC.
   CONDSEXL       YESNONAF.
   WANTSEX1       WANTSEXF.
   VOLSEX1        VOLSEX1F.
   HOWOLD         AG95NRDF.
   GIVNDRUG       YESNONAF.
   HEBIGOLD       YESNONAF.
   ENDRELAT       YESNONAF.
   WORDPRES       YESNONAF.
   THRTPHYS       YESNONAF.
   PHYSHURT       YESNONAF.
   HELDDOWN       YESNONAF.
   EVRFORCD       YESNONAF.
   AGEFORC1       AG95NRDF.
   GIVNDRG2       YESNONAF.
   HEBIGOL2       YESNONAF.
   ENDRELA2       YESNONAF.
   WRDPRES2       YESNONAF.
   THRTPHY2       YESNONAF.
   PHYSHRT2       YESNONAF.
   HELDDWN2       YESNONAF.
   PARTSLIF_1     PARTLIF.
   PARTSLFV       YESNONAF.
   PARTSLIF_2     PARTLIF.
   OPPLIFENUM     PARTLIF.
   PARTS12M_1     PRTS12MB.
   PARTS12V       YESNONAF.
   PARTS12M_2     PRTS12MB.
   OPPYEARNUM     PRTS12MB.
   NEWYEAR        PRT12F.
   NEWLIFE        PRT12F.
   VAGNUM12       PRT12F.
   ORALNUM12      PRT12F.
   ANALNUM12      PRT12F.
   BISEXPRT       YESNONAF.
   NONMONOG       YESNONAF.
   NNONMONOG1     NNONMONOG1F.
   NNONMONOG2     NNONMONOG2F.
   NNONMONOG3     NNONMONOG2F.
   MALSHT12       YESNONAF.
   PROSTFRQ       YESNONAF.
   JOHNFREQ       YESNONAF.
   HIVMAL12       YESNONAF.
   GIVORALF       YESNONAF.
   GETORALF       YESNONAF.
   FEMSEX         YESNONAF.
   SAMESEXANY     Y1N5NAC.
   FEMPARTS_1     PRT12F.
   FEMLIFEV       YESNONAF.
   FEMPARTS_2     PRT12F.
   SAMLIFENUM     PRT12F.
   FEMPRT12_1     PRT12F.
   FEM12V         YESNONAF.
   FEMPRT12_2     PRT12F.
   SAMYEARNUM     PRT12F.
   SAMESEX1       SAMESEX1F.
   FSAMEREL       FSAMEREL.
   MFLASTP        MALFEMNAF.
   ATTRACT        ATTRACT.
   ORIENT_A       ORIENT_A.
   ORIENT_B       ORIENT_B.
   CONFCONC       YESNONAF.
   TIMALON        TIMALON.
   RISKCHEK1      YESNONAF.
   RISKCHEK2      YESNONAF.
   RISKCHEK3      YESNONAF.
   RISKCHEK4      YESNONAF.
   CHLAMTST       YESNONAF.
   STDOTHR12      YESNONAF.
   STDTRT12       YESNONAF.
   GON            YESNONAF.
   CHLAM          YESNONAF.
   HERPES         YESNONAF.
   GENWARTS       YESNONAF.
   SYPHILIS       YESNONAF.
   EVRINJECT      YESNONAF.
   EVRSHARE       YESNONAF.
   EARNTYPE       INCWMYF.
   EARN           EARN.
   EARNDK1        YESNONAF.
   EARNDK2        YESNONAF.
   EARNDK3        YESNONAF.
   EARNDK4        YESNONAF.
   TOINCWMY       INCWMYF.
   TOTINC         EARN.
   FMINCDK1       FMINCDK1F.
   FMINCDK2       YESNONAF.
   FMINCDK3       YESNONAF.
   FMINCDK4       YESNONAF.
   FMINCDK5       YESNONAF.
   PUBASST        YESNONAF.
   PUBASTYP1      P_ASTYP.
   FOODSTMP       YESNONAF.
   WIC            YESNONAF.
   HLPTRANS       YESNONAF.
   HLPCHLDC       YESNONAF.
   HLPJOB         YESNONAF.
   FREEFOOD       YESNONAF.
   HUNGRY         YESNONAF.
   MED_COST       YESNONAF.
   AGER           AGERFF.
   FMARITAL       FMARITAL.
   RMARITAL       RMARITAL.
   EDUCAT         EDUCAT.
   HIEDUC         HIEDUC.
   HISPANIC       HISPANIC.
   RACE           RACE.
   HISPRACE       HISPRACE.
   HISPRACE2      HISPRACE2F.
   NUMKDHH        NUMKDHH.
   NUMFMHH        NUMFMHH.
   HHFAMTYP       HHFAMTYP.
   HHPARTYP       HHPARTYP.
   NCHILDHH       NCHILDHH.
   HHKIDTYP       HHKIDTYP.
   CSPBBHH        CSPBIO.
   CSPBSHH        CSPNOT.
   CSPOKDHH       CSPNOT.
   INTCTFAM       INTCTFAM.
   PARAGE14       PARAGEF.
   EDUCMOM        EDUCMOM.
   AGEMOMB1       AGEMOMBF.
   AGER_I         IMPFLG.
   FMARITAL_I     IMPFLG.
   RMARITAL_I     IMPFLG.
   EDUCAT_I       IMPFLG.
   HIEDUC_I       IMPFLG.
   HISPANIC_I     IMPFLG.
   RACE_I         IMPFLG.
   HISPRACE_I     IMPFLG.
   HISPRACE2_I    IMPFLG.
   NUMKDHH_I      IMPFLG.
   NUMFMHH_I      IMPFLG.
   HHFAMTYP_I     IMPFLG.
   HHPARTYP_I     IMPFLG.
   NCHILDHH_I     IMPFLG.
   HHKIDTYP_I     IMPFLG.
   CSPBBHH_I      IMPFLG.
   CSPBSHH_I      IMPFLG.
   CSPOKDHH_I     IMPFLG.
   INTCTFAM_I     IMPFLG.
   PARAGE14_I     IMPFLG.
   EDUCMOM_I      IMPFLG.
   AGEMOMB1_I     IMPFLG.
   RCURPREG       RCURPREG.
   PREGNUM        PREGNUMF.
   COMPREG        PREGNUMF.
   LOSSNUM        TPRGOUTF.
   ABORTION       TPRGOUTF.
   LBPREGS        LBPREGS.
   PARITY         PARITY.
   BIRTHS5        BIRTHS5F.
   BIRTH1         Y1N2RECF.
   OUTCOM01       OUTCOMRF.
   OUTCOM02       OUTCOMRF.
   OUTCOM03       OUTCOMRF.
   OUTCOM04       OUTCOMRF.
   OUTCOM05       OUTCOMRF.
   OUTCOM06       OUTCOMRF.
   OUTCOM07       OUTCOMRF.
   OUTCOM08       OUTCOMRF.
   OUTCOM09       OUTCOMRF.
   OUTCOM10       OUTCOMRF.
   OUTCOM11       OUTCOMRF.
   OUTCOM12       OUTCOMRF.
   OUTCOM13       OUTCOMRF.
   OUTCOM14       OUTCOMRF.
   OUTCOM15       OUTCOMRF.
   OUTCOM16       OUTCOMRF.
   OUTCOM17       OUTCOMRF.
   OUTCOM18       OUTCOMRF.
   OUTCOM19       OUTCOMRF.
   OUTCOM20       OUTCOMRF.
   DATEND01       YEARFMT.
   DATEND02       YEARFMT.
   DATEND03       YEARFMT.
   DATEND04       YEARFMT.
   DATEND05       YEARFMT.
   DATEND06       YEARFMT.
   DATEND07       YEARFMT.
   DATEND08       YEARFMT.
   DATEND09       YEARFMT.
   DATEND10       YEARFMT.
   DATEND11       YEARFMT.
   DATEND12       YEARFMT.
   DATEND13       YEARFMT.
   DATEND14       YEARFMT.
   DATEND15       YEARFMT.
   DATEND16       YEARFMT.
   DATEND17       YEARFMT.
   DATEND18       YEARFMT.
   DATEND19       YEARFMT.
   DATEND20       YEARFMT.
   AGEPRG01       PREGAGE.
   AGEPRG02       PREGAGE.
   AGEPRG03       PREGAGE.
   AGEPRG04       PREGAGE.
   AGEPRG05       PREGAGE.
   AGEPRG06       PREGAGE.
   AGEPRG07       PREGAGE.
   AGEPRG08       PREGAGE.
   AGEPRG09       PREGAGE.
   AGEPRG10       PREGAGE.
   AGEPRG11       PREGAGE.
   AGEPRG12       PREGAGE.
   AGEPRG13       PREGAGE.
   AGEPRG14       PREGAGE.
   AGEPRG15       PREGAGE.
   AGEPRG16       PREGAGE.
   AGEPRG17       PREGAGE.
   AGEPRG18       PREGAGE.
   AGEPRG19       PREGAGE.
   AGEPRG20       PREGAGE.
   DATCON01       YEARFMT.
   DATCON02       YEARFMT.
   DATCON03       YEARFMT.
   DATCON04       YEARFMT.
   DATCON05       YEARFMT.
   DATCON06       YEARFMT.
   DATCON07       YEARFMT.
   DATCON08       YEARFMT.
   DATCON09       YEARFMT.
   DATCON10       YEARFMT.
   DATCON11       YEARFMT.
   DATCON12       YEARFMT.
   DATCON13       YEARFMT.
   DATCON14       YEARFMT.
   DATCON15       YEARFMT.
   DATCON16       YEARFMT.
   DATCON17       YEARFMT.
   DATCON18       YEARFMT.
   DATCON19       YEARFMT.
   DATCON20       YEARFMT.
   AGECON01       PREGAGE.
   AGECON02       PREGAGE.
   AGECON03       PREGAGE.
   AGECON04       PREGAGE.
   AGECON05       PREGAGE.
   AGECON06       PREGAGE.
   AGECON07       PREGAGE.
   AGECON08       PREGAGE.
   AGECON09       PREGAGE.
   AGECON10       PREGAGE.
   AGECON11       PREGAGE.
   AGECON12       PREGAGE.
   AGECON13       PREGAGE.
   AGECON14       PREGAGE.
   AGECON15       PREGAGE.
   AGECON16       PREGAGE.
   AGECON17       PREGAGE.
   AGECON18       PREGAGE.
   AGECON19       PREGAGE.
   AGECON20       PREGAGE.
   MAROUT01       MARPRGF.
   MAROUT02       MARPRGF.
   MAROUT03       MARPRGF.
   MAROUT04       MARPRGF.
   MAROUT05       MARPRGF.
   MAROUT06       MARPRGF.
   MAROUT07       MARPRGF.
   MAROUT08       MARPRGF.
   MAROUT09       MARPRGF.
   MAROUT10       MARPRGF.
   MAROUT11       MARPRGF.
   MAROUT12       MARPRGF.
   MAROUT13       MARPRGF.
   MAROUT14       MARPRGF.
   MAROUT15       MARPRGF.
   MAROUT16       MARPRGF.
   MAROUT17       MARPRGF.
   MAROUT18       MARPRGF.
   MAROUT19       MARPRGF.
   MAROUT20       MARPRGF.
   RMAROUT01      RMARFMT.
   RMAROUT02      RMARFMT.
   RMAROUT03      RMARFMT.
   RMAROUT04      RMARFMT.
   RMAROUT05      RMARFMT.
   RMAROUT06      RMARFMT.
   RMAROUT07      RMARFMT.
   RMAROUT08      RMARFMT.
   RMAROUT09      RMARFMT.
   RMAROUT10      RMARFMT.
   RMAROUT11      RMARFMT.
   RMAROUT12      RMARFMT.
   RMAROUT13      RMARFMT.
   RMAROUT14      RMARFMT.
   RMAROUT15      RMARFMT.
   RMAROUT16      RMARFMT.
   RMAROUT17      RMARFMT.
   RMAROUT18      RMARFMT.
   RMAROUT19      RMARFMT.
   RMAROUT20      RMARFMT.
   MARCON01       MARPRGF.
   MARCON02       MARPRGF.
   MARCON03       MARPRGF.
   MARCON04       MARPRGF.
   MARCON05       MARPRGF.
   MARCON06       MARPRGF.
   MARCON07       MARPRGF.
   MARCON08       MARPRGF.
   MARCON09       MARPRGF.
   MARCON10       MARPRGF.
   MARCON11       MARPRGF.
   MARCON12       MARPRGF.
   MARCON13       MARPRGF.
   MARCON14       MARPRGF.
   MARCON15       MARPRGF.
   MARCON16       MARPRGF.
   MARCON17       MARPRGF.
   MARCON18       MARPRGF.
   MARCON19       MARPRGF.
   MARCON20       MARPRGF.
   RMARCON01      RMARFMT.
   RMARCON02      RMARFMT.
   RMARCON03      RMARFMT.
   RMARCON04      RMARFMT.
   RMARCON05      RMARFMT.
   RMARCON06      RMARFMT.
   RMARCON07      RMARFMT.
   RMARCON08      RMARFMT.
   RMARCON09      RMARFMT.
   RMARCON10      RMARFMT.
   RMARCON11      RMARFMT.
   RMARCON12      RMARFMT.
   RMARCON13      RMARFMT.
   RMARCON14      RMARFMT.
   RMARCON15      RMARFMT.
   RMARCON16      RMARFMT.
   RMARCON17      RMARFMT.
   RMARCON18      RMARFMT.
   RMARCON19      RMARFMT.
   RMARCON20      RMARFMT.
   CEBOW          CEBOW.
   CEBOWC         CEBOW.
   DATBABY1       YEARFMT.
   AGEBABY1       PREGAGE.
   LASTPREG       LASTPREG.
   PREG_INT1      PREGINT.
   PREG_INT2      PREGINT.
   PREG_INT3      PREGINT.
   PREG_INT4      PREGINT.
   LIVCHILD01     LIVCHLDR.
   LIVCHILD02     LIVCHLDR.
   LIVCHILD03     LIVCHLDR.
   LIVCHILD04     LIVCHLDR.
   LIVCHILD05     LIVCHLDR.
   LIVCHILD06     LIVCHLDR.
   LIVCHILD07     LIVCHLDR.
   LIVCHILD08     LIVCHLDR.
   LIVCHILD09     LIVCHLDR.
   LIVCHILD10     LIVCHLDR.
   LIVCHILD11     LIVCHLDR.
   LIVCHILD12     LIVCHLDR.
   LIVCHILD13     LIVCHLDR.
   LIVCHILD14     LIVCHLDR.
   LIVCHILD15     LIVCHLDR.
   LIVCHILD16     LIVCHLDR.
   LIVCHILD17     LIVCHLDR.
   LIVCHILD18     LIVCHLDR.
   LIVCHILD19     LIVCHLDR.
   LIVCHILD20     LIVCHLDR.
   RCURPREG_I     IMPFLG.
   PREGNUM_I      IMPFLG.
   COMPREG_I      IMPFLG.
   LOSSNUM_I      IMPFLG.
   ABORTION_I     IMPFLG.
   LBPREGS_I      IMPFLG.
   PARITY_I       IMPFLG.
   BIRTHS5_I      IMPFLG.
   OUTCOM01_I     IMPFLG.
   OUTCOM02_I     IMPFLG.
   OUTCOM03_I     IMPFLG.
   OUTCOM04_I     IMPFLG.
   OUTCOM05_I     IMPFLG.
   OUTCOM06_I     IMPFLG.
   OUTCOM07_I     IMPFLG.
   OUTCOM08_I     IMPFLG.
   OUTCOM09_I     IMPFLG.
   OUTCOM10_I     IMPFLG.
   OUTCOM11_I     IMPFLG.
   OUTCOM12_I     IMPFLG.
   OUTCOM13_I     IMPFLG.
   OUTCOM14_I     IMPFLG.
   OUTCOM15_I     IMPFLG.
   OUTCOM16_I     IMPFLG.
   OUTCOM17_I     IMPFLG.
   OUTCOM18_I     IMPFLG.
   OUTCOM19_I     IMPFLG.
   OUTCOM20_I     IMPFLG.
   DATEND01_I     IMPFLG.
   DATEND02_I     IMPFLG.
   DATEND03_I     IMPFLG.
   DATEND04_I     IMPFLG.
   DATEND05_I     IMPFLG.
   DATEND06_I     IMPFLG.
   DATEND07_I     IMPFLG.
   DATEND08_I     IMPFLG.
   DATEND09_I     IMPFLG.
   DATEND10_I     IMPFLG.
   DATEND11_I     IMPFLG.
   DATEND12_I     IMPFLG.
   DATEND13_I     IMPFLG.
   DATEND14_I     IMPFLG.
   DATEND15_I     IMPFLG.
   DATEND16_I     IMPFLG.
   DATEND17_I     IMPFLG.
   DATEND18_I     IMPFLG.
   DATEND19_I     IMPFLG.
   DATEND20_I     IMPFLG.
   AGEPRG01_I     IMPFLG.
   AGEPRG02_I     IMPFLG.
   AGEPRG03_I     IMPFLG.
   AGEPRG04_I     IMPFLG.
   AGEPRG05_I     IMPFLG.
   AGEPRG06_I     IMPFLG.
   AGEPRG07_I     IMPFLG.
   AGEPRG08_I     IMPFLG.
   AGEPRG09_I     IMPFLG.
   AGEPRG10_I     IMPFLG.
   AGEPRG11_I     IMPFLG.
   AGEPRG12_I     IMPFLG.
   AGEPRG13_I     IMPFLG.
   AGEPRG14_I     IMPFLG.
   AGEPRG15_I     IMPFLG.
   AGEPRG16_I     IMPFLG.
   AGEPRG17_I     IMPFLG.
   AGEPRG18_I     IMPFLG.
   AGEPRG19_I     IMPFLG.
   AGEPRG20_I     IMPFLG.
   DATCON01_I     IMPFLG.
   DATCON02_I     IMPFLG.
   DATCON03_I     IMPFLG.
   DATCON04_I     IMPFLG.
   DATCON05_I     IMPFLG.
   DATCON06_I     IMPFLG.
   DATCON07_I     IMPFLG.
   DATCON08_I     IMPFLG.
   DATCON09_I     IMPFLG.
   DATCON10_I     IMPFLG.
   DATCON11_I     IMPFLG.
   DATCON12_I     IMPFLG.
   DATCON13_I     IMPFLG.
   DATCON14_I     IMPFLG.
   DATCON15_I     IMPFLG.
   DATCON16_I     IMPFLG.
   DATCON17_I     IMPFLG.
   DATCON18_I     IMPFLG.
   DATCON19_I     IMPFLG.
   DATCON20_I     IMPFLG.
   AGECON01_I     IMPFLG.
   AGECON02_I     IMPFLG.
   AGECON03_I     IMPFLG.
   AGECON04_I     IMPFLG.
   AGECON05_I     IMPFLG.
   AGECON06_I     IMPFLG.
   AGECON07_I     IMPFLG.
   AGECON08_I     IMPFLG.
   AGECON09_I     IMPFLG.
   AGECON10_I     IMPFLG.
   AGECON11_I     IMPFLG.
   AGECON12_I     IMPFLG.
   AGECON13_I     IMPFLG.
   AGECON14_I     IMPFLG.
   AGECON15_I     IMPFLG.
   AGECON16_I     IMPFLG.
   AGECON17_I     IMPFLG.
   AGECON18_I     IMPFLG.
   AGECON19_I     IMPFLG.
   AGECON20_I     IMPFLG.
   MAROUT01_I     IMPFLG.
   MAROUT02_I     IMPFLG.
   MAROUT03_I     IMPFLG.
   MAROUT04_I     IMPFLG.
   MAROUT05_I     IMPFLG.
   MAROUT06_I     IMPFLG.
   MAROUT07_I     IMPFLG.
   MAROUT08_I     IMPFLG.
   MAROUT09_I     IMPFLG.
   MAROUT10_I     IMPFLG.
   MAROUT11_I     IMPFLG.
   MAROUT12_I     IMPFLG.
   MAROUT13_I     IMPFLG.
   MAROUT14_I     IMPFLG.
   MAROUT15_I     IMPFLG.
   MAROUT16_I     IMPFLG.
   MAROUT17_I     IMPFLG.
   MAROUT18_I     IMPFLG.
   MAROUT19_I     IMPFLG.
   MAROUT20_I     IMPFLG.
   RMAROUT01_I    IMPFLG.
   RMAROUT02_I    IMPFLG.
   RMAROUT03_I    IMPFLG.
   RMAROUT04_I    IMPFLG.
   RMAROUT05_I    IMPFLG.
   RMAROUT06_I    IMPFLG.
   RMAROUT07_I    IMPFLG.
   RMAROUT08_I    IMPFLG.
   RMAROUT09_I    IMPFLG.
   RMAROUT10_I    IMPFLG.
   RMAROUT11_I    IMPFLG.
   RMAROUT12_I    IMPFLG.
   RMAROUT13_I    IMPFLG.
   RMAROUT14_I    IMPFLG.
   RMAROUT15_I    IMPFLG.
   RMAROUT16_I    IMPFLG.
   RMAROUT17_I    IMPFLG.
   RMAROUT18_I    IMPFLG.
   RMAROUT19_I    IMPFLG.
   RMAROUT20_I    IMPFLG.
   MARCON01_I     IMPFLG.
   MARCON02_I     IMPFLG.
   MARCON03_I     IMPFLG.
   MARCON04_I     IMPFLG.
   MARCON05_I     IMPFLG.
   MARCON06_I     IMPFLG.
   MARCON07_I     IMPFLG.
   MARCON08_I     IMPFLG.
   MARCON09_I     IMPFLG.
   MARCON10_I     IMPFLG.
   MARCON11_I     IMPFLG.
   MARCON12_I     IMPFLG.
   MARCON13_I     IMPFLG.
   MARCON14_I     IMPFLG.
   MARCON15_I     IMPFLG.
   MARCON16_I     IMPFLG.
   MARCON17_I     IMPFLG.
   MARCON18_I     IMPFLG.
   MARCON19_I     IMPFLG.
   MARCON20_I     IMPFLG.
   RMARCON01_I    IMPFLG.
   RMARCON02_I    IMPFLG.
   RMARCON03_I    IMPFLG.
   RMARCON04_I    IMPFLG.
   RMARCON05_I    IMPFLG.
   RMARCON06_I    IMPFLG.
   RMARCON07_I    IMPFLG.
   RMARCON08_I    IMPFLG.
   RMARCON09_I    IMPFLG.
   RMARCON10_I    IMPFLG.
   RMARCON11_I    IMPFLG.
   RMARCON12_I    IMPFLG.
   RMARCON13_I    IMPFLG.
   RMARCON14_I    IMPFLG.
   RMARCON15_I    IMPFLG.
   RMARCON16_I    IMPFLG.
   RMARCON17_I    IMPFLG.
   RMARCON18_I    IMPFLG.
   RMARCON19_I    IMPFLG.
   RMARCON20_I    IMPFLG.
   CEBOW_I        IMPFLG.
   CEBOWC_I       IMPFLG.
   DATBABY1_I     IMPFLG.
   AGEBABY1_I     IMPFLG.
   LIVCHILD01_I   IMPFLG.
   LIVCHILD02_I   IMPFLG.
   LIVCHILD03_I   IMPFLG.
   LIVCHILD04_I   IMPFLG.
   LIVCHILD05_I   IMPFLG.
   LIVCHILD06_I   IMPFLG.
   LIVCHILD07_I   IMPFLG.
   LIVCHILD08_I   IMPFLG.
   LIVCHILD09_I   IMPFLG.
   LIVCHILD10_I   IMPFLG.
   LIVCHILD11_I   IMPFLG.
   LIVCHILD12_I   IMPFLG.
   LIVCHILD13_I   IMPFLG.
   LIVCHILD14_I   IMPFLG.
   LIVCHILD15_I   IMPFLG.
   LIVCHILD16_I   IMPFLG.
   LIVCHILD17_I   IMPFLG.
   LIVCHILD18_I   IMPFLG.
   LIVCHILD19_I   IMPFLG.
   LIVCHILD20_I   IMPFLG.
   FMARNO         FMARNO.
   CSPBIOKD       CSPBIOKD.
   MARDAT01       YEARFMT.
   MARDAT02       YEARFMT.
   MARDAT03       YEARFMT.
   MARDAT04       YEARFMT.
   MARDAT05       YEARFMT.
   MARDAT06       YEARFMT.
   MARDIS01       YEARFMT.
   MARDIS02       YEARFMT.
   MARDIS03       YEARFMT.
   MARDIS04       YEARFMT.
   MARDIS05       YEARFMT.
   MARDIS06       YEARFMT.
   MAREND01       MARENDF.
   MAREND02       MARENDF.
   MAREND03       MARENDF.
   MAREND04       MARENDF.
   MAREND05       MARENDF.
   MAREND06       MARENDF.
   FMAR1AGE       AGE1944F.
   AGEDISS1       AGE1944F.
   AGEDD1         AGE1944F.
   MAR1DISS       MARCATA.
   DD1REMAR       MARCATA.
   MAR1BIR1       MARCATB.
   MAR1CON1       MARCATC.
   CON1MAR1       MARCATD.
   B1PREMAR       Y1N2RECF.
   COHEVER        COHEVER.
   EVMARCOH       EVMARCOH.
   PMARRNO        COHNUM.
   NONMARR        COHNUM.
   TIMESCOH       COHNUM.
   COHAB1         YEARFMT.
   COHSTAT        COHSTAT.
   COHOUT         COHOUT.
   COH1DUR        MARCATA.
   HADSEX         HADSEX.
   SEXONCE        SEXONCE.
   SEXEVER        SEXEVER.
   VRY1STAG       SEX1RECF.
   SEX1AGE        SEX1RECF.
   VRY1STSX       VRY1STSX.
   DATESEX1       DATESEX1F.
   SEXMAR         MARCATE.
   SEX1FOR        MARCATE.
   SEXUNION       MARCATG.
   SEXOUT         SEXOUT.
   FPDUR          FPDUR.
   PARTS1YR       PARTS1YR.
   LSEXDATE       CMFMT.
   LSEXPREG       Y1N2RECF.
   SEX3MO         Y1N2RECF.
   NUMP3MOS       NUMP3MOS.
   LSEXRAGE       LSEXRAGE.
   PARTDUR1       PARTDURF.
   PARTDUR2       PARTDURF.
   PARTDUR3       PARTDURF.
   RELATP1        RELATPF.
   RELATP2        RELATPF.
   RELATP3        RELATPF.
   LIFPRTNR       LIFPRTNR.
   FMARNO_I       IMPFLG.
   CSPBIOKD_I     IMPFLG.
   MARDAT01_I     IMPFLG.
   MARDAT02_I     IMPFLG.
   MARDAT03_I     IMPFLG.
   MARDAT04_I     IMPFLG.
   MARDAT05_I     IMPFLG.
   MARDAT06_I     IMPFLG.
   MARDIS01_I     IMPFLG.
   MARDIS02_I     IMPFLG.
   MARDIS03_I     IMPFLG.
   MARDIS04_I     IMPFLG.
   MARDIS05_I     IMPFLG.
   MARDIS06_I     IMPFLG.
   MAREND01_I     IMPFLG.
   MAREND02_I     IMPFLG.
   MAREND03_I     IMPFLG.
   MAREND04_I     IMPFLG.
   MAREND05_I     IMPFLG.
   MAREND06_I     IMPFLG.
   FMAR1AGE_I     IMPFLG.
   AGEDISS1_I     IMPFLG.
   AGEDD1_I       IMPFLG.
   MAR1DISS_I     IMPFLG.
   DD1REMAR_I     IMPFLG.
   MAR1BIR1_I     IMPFLG.
   MAR1CON1_I     IMPFLG.
   CON1MAR1_I     IMPFLG.
   B1PREMAR_I     IMPFLG.
   COHEVER_I      IMPFLG.
   EVMARCOH_I     IMPFLG.
   PMARRNO_I      IMPFLG.
   NONMARR_I      IMPFLG.
   TIMESCOH_I     IMPFLG.
   COHAB1_I       IMPFLG.
   COHSTAT_I      IMPFLG.
   COHOUT_I       IMPFLG.
   COH1DUR_I      IMPFLG.
   HADSEX_I       IMPFLG.
   SEXEVER_I      IMPFLG.
   VRY1STAG_I     IMPFLG.
   SEX1AGE_I      IMPFLG.
   VRY1STSX_I     IMPFLG.
   DATESEX1_I     IMPFLG.
   SEXONCE_I      IMPFLG.
   SEXMAR_I       IMPFLG.
   SEX1FOR_I      IMPFLG.
   SEXUNION_I     IMPFLG.
   SEXOUT_I       IMPFLG.
   FPDUR_I        IMPFLG.
   PARTS1YR_I     IMPFLG.
   LSEXDATE_I     IMPFLG.
   SEXP3MO_I      IMPFLG.
   NUMP3MOS_I     IMPFLG.
   LSEXRAGE_I     IMPFLG.
   PARTDUR1_I     IMPFLG.
   PARTDUR2_I     IMPFLG.
   PARTDUR3_I     IMPFLG.
   RELATP1_I      IMPFLG.
   RELATP2_I      IMPFLG.
   RELATP3_I      IMPFLG.
   LIFPRTNR_I     IMPFLG.
   STRLOPER       STRLOPER.
   FECUND         FECUND.
   ANYBC36        ANYBCF.
   NOSEX36        NOSEX36F.
   INFERT         INFERT.
   ANYBC12        ANYBCF.
   ANYMTHD        Y1N2RECF.
   NOSEX12        NOSEX12F.
   SEXP3MO        Y1N2RECF.
   CONSTAT1       CONSTATF.
   CONSTAT2       CONSTATF.
   CONSTAT3       CONSTATF.
   CONSTAT4       CONSTATF.
   PILLR          Y1N2RECF.
   CONDOMR        Y1N2RECF.
   SEX1MTHD1      SEX1MTHDF.
   SEX1MTHD2      SEX1MTHDF.
   SEX1MTHD3      SEX1MTHDF.
   SEX1MTHD4      SEX1MTHDF.
   MTHUSE12       MTHUSE12F.
   METH12M1       METH12MF.
   METH12M2       METH12MF.
   METH12M3       METH12MF.
   METH12M4       METH12MF.
   MTHUSE3        MTHUSE3F.
   METH3M1        METH3MF.
   METH3M2        METH3MF.
   METH3M3        METH3MF.
   METH3M4        METH3MF.
   FMETHOD1       FMETHODF.
   FMETHOD2       FMETHODF.
   FMETHOD3       FMETHODF.
   FMETHOD4       FMETHODF.
   DATEUSE1       CMDATEUSE.
   OLDWP01        OWWNTF.
   OLDWP02        OWWNTF.
   OLDWP03        OWWNTF.
   OLDWP04        OWWNTF.
   OLDWP05        OWWNTF.
   OLDWP06        OWWNTF.
   OLDWP07        OWWNTF.
   OLDWP08        OWWNTF.
   OLDWP09        OWWNTF.
   OLDWP10        OWWNTF.
   OLDWP11        OWWNTF.
   OLDWP12        OWWNTF.
   OLDWP13        OWWNTF.
   OLDWP14        OWWNTF.
   OLDWP15        OWWNTF.
   OLDWP16        OWWNTF.
   OLDWP17        OWWNTF.
   OLDWP18        OWWNTF.
   OLDWP19        OWWNTF.
   OLDWP20        OWWNTF.
   OLDWR01        OWWNTF.
   OLDWR02        OWWNTF.
   OLDWR03        OWWNTF.
   OLDWR04        OWWNTF.
   OLDWR05        OWWNTF.
   OLDWR06        OWWNTF.
   OLDWR07        OWWNTF.
   OLDWR08        OWWNTF.
   OLDWR09        OWWNTF.
   OLDWR10        OWWNTF.
   OLDWR11        OWWNTF.
   OLDWR12        OWWNTF.
   OLDWR13        OWWNTF.
   OLDWR14        OWWNTF.
   OLDWR15        OWWNTF.
   OLDWR16        OWWNTF.
   OLDWR17        OWWNTF.
   OLDWR18        OWWNTF.
   OLDWR19        OWWNTF.
   OLDWR20        OWWNTF.
   WANTRP01       OWWNTF.
   WANTRP02       OWWNTF.
   WANTRP03       OWWNTF.
   WANTRP04       OWWNTF.
   WANTRP05       OWWNTF.
   WANTRP06       OWWNTF.
   WANTRP07       OWWNTF.
   WANTRP08       OWWNTF.
   WANTRP09       OWWNTF.
   WANTRP10       OWWNTF.
   WANTRP11       OWWNTF.
   WANTRP12       OWWNTF.
   WANTRP13       OWWNTF.
   WANTRP14       OWWNTF.
   WANTRP15       OWWNTF.
   WANTRP16       OWWNTF.
   WANTRP17       OWWNTF.
   WANTRP18       OWWNTF.
   WANTRP19       OWWNTF.
   WANTRP20       OWWNTF.
   WANTP01        OWWNTF.
   WANTP02        OWWNTF.
   WANTP03        OWWNTF.
   WANTP04        OWWNTF.
   WANTP05        OWWNTF.
   WANTP06        OWWNTF.
   WANTP07        OWWNTF.
   WANTP08        OWWNTF.
   WANTP09        OWWNTF.
   WANTP10        OWWNTF.
   WANTP11        OWWNTF.
   WANTP12        OWWNTF.
   WANTP13        OWWNTF.
   WANTP14        OWWNTF.
   WANTP15        OWWNTF.
   WANTP16        OWWNTF.
   WANTP17        OWWNTF.
   WANTP18        OWWNTF.
   WANTP19        OWWNTF.
   WANTP20        OWWNTF.
   NWWANTRP01     NWWANTRPF.
   NWWANTRP02     NWWANTRPF.
   NWWANTRP03     NWWANTRPF.
   NWWANTRP04     NWWANTRPF.
   NWWANTRP05     NWWANTRPF.
   NWWANTRP06     NWWANTRPF.
   NWWANTRP07     NWWANTRPF.
   NWWANTRP08     NWWANTRPF.
   NWWANTRP09     NWWANTRPF.
   NWWANTRP10     NWWANTRPF.
   NWWANTRP11     NWWANTRPF.
   NWWANTRP12     NWWANTRPF.
   NWWANTRP13     NWWANTRPF.
   NWWANTRP14     NWWANTRPF.
   NWWANTRP15     NWWANTRPF.
   NWWANTRP16     NWWANTRPF.
   NWWANTRP17     NWWANTRPF.
   NWWANTRP18     NWWANTRPF.
   NWWANTRP19     NWWANTRPF.
   NWWANTRP20     NWWANTRPF.
   WANTP5         WANTP5F.
   STRLOPER_I     IMPFLG.
   FECUND_I       IMPFLG.
   INFERT_I       IMPFLG.
   ANYMTHD_I      IMPFLG.
   NOSEX12_I      IMPFLG.
   SEX3MO_I       IMPFLG.
   CONSTAT1_I     IMPFLG.
   CONSTAT2_I     IMPFLG.
   CONSTAT3_I     IMPFLG.
   CONSTAT4_I     IMPFLG.
   PILLR_I        IMPFLG.
   CONDOMR_I      IMPFLG.
   SEX1MTHD1_I    IMPFLG.
   SEX1MTHD2_I    IMPFLG.
   SEX1MTHD3_I    IMPFLG.
   SEX1MTHD4_I    IMPFLG.
   MTHUSE12_I     IMPFLG.
   METH12M1_I     IMPFLG.
   METH12M2_I     IMPFLG.
   METH12M3_I     IMPFLG.
   METH12M4_I     IMPFLG.
   MTHUSE3_I      IMPFLG.
   METH3M1_I      IMPFLG.
   METH3M2_I      IMPFLG.
   METH3M3_I      IMPFLG.
   METH3M4_I      IMPFLG.
   FMETHOD1_I     IMPFLG.
   FMETHOD2_I     IMPFLG.
   FMETHOD3_I     IMPFLG.
   FMETHOD4_I     IMPFLG.
   DATEUSE1_I     IMPFLG.
   OLDWP01_I      IMPFLG.
   OLDWP02_I      IMPFLG.
   OLDWP03_I      IMPFLG.
   OLDWP04_I      IMPFLG.
   OLDWP05_I      IMPFLG.
   OLDWP06_I      IMPFLG.
   OLDWP07_I      IMPFLG.
   OLDWP08_I      IMPFLG.
   OLDWP09_I      IMPFLG.
   OLDWP10_I      IMPFLG.
   OLDWP11_I      IMPFLG.
   OLDWP12_I      IMPFLG.
   OLDWP13_I      IMPFLG.
   OLDWP14_I      IMPFLG.
   OLDWP15_I      IMPFLG.
   OLDWP16_I      IMPFLG.
   OLDWP17_I      IMPFLG.
   OLDWP18_I      IMPFLG.
   OLDWP19_I      IMPFLG.
   OLDWP20_I      IMPFLG.
   OLDWR01_I      IMPFLG.
   OLDWR02_I      IMPFLG.
   OLDWR03_I      IMPFLG.
   OLDWR04_I      IMPFLG.
   OLDWR05_I      IMPFLG.
   OLDWR06_I      IMPFLG.
   OLDWR07_I      IMPFLG.
   OLDWR08_I      IMPFLG.
   OLDWR09_I      IMPFLG.
   OLDWR10_I      IMPFLG.
   OLDWR11_I      IMPFLG.
   OLDWR12_I      IMPFLG.
   OLDWR13_I      IMPFLG.
   OLDWR14_I      IMPFLG.
   OLDWR15_I      IMPFLG.
   OLDWR16_I      IMPFLG.
   OLDWR17_I      IMPFLG.
   OLDWR18_I      IMPFLG.
   OLDWR19_I      IMPFLG.
   OLDWR20_I      IMPFLG.
   WANTRP01_I     IMPFLG.
   WANTRP02_I     IMPFLG.
   WANTRP03_I     IMPFLG.
   WANTRP04_I     IMPFLG.
   WANTRP05_I     IMPFLG.
   WANTRP06_I     IMPFLG.
   WANTRP07_I     IMPFLG.
   WANTRP08_I     IMPFLG.
   WANTRP09_I     IMPFLG.
   WANTRP10_I     IMPFLG.
   WANTRP11_I     IMPFLG.
   WANTRP12_I     IMPFLG.
   WANTRP13_I     IMPFLG.
   WANTRP14_I     IMPFLG.
   WANTRP15_I     IMPFLG.
   WANTRP16_I     IMPFLG.
   WANTRP17_I     IMPFLG.
   WANTRP18_I     IMPFLG.
   WANTRP19_I     IMPFLG.
   WANTRP20_I     IMPFLG.
   WANTP01_I      IMPFLG.
   WANTP02_I      IMPFLG.
   WANTP03_I      IMPFLG.
   WANTP04_I      IMPFLG.
   WANTP05_I      IMPFLG.
   WANTP06_I      IMPFLG.
   WANTP07_I      IMPFLG.
   WANTP08_I      IMPFLG.
   WANTP09_I      IMPFLG.
   WANTP10_I      IMPFLG.
   WANTP11_I      IMPFLG.
   WANTP12_I      IMPFLG.
   WANTP13_I      IMPFLG.
   WANTP14_I      IMPFLG.
   WANTP15_I      IMPFLG.
   WANTP16_I      IMPFLG.
   WANTP17_I      IMPFLG.
   WANTP18_I      IMPFLG.
   WANTP19_I      IMPFLG.
   WANTP20_I      IMPFLG.
   NWWANTRP01_I   IMPFLG.
   NWWANTRP02_I   IMPFLG.
   NWWANTRP03_I   IMPFLG.
   NWWANTRP04_I   IMPFLG.
   NWWANTRP05_I   IMPFLG.
   NWWANTRP06_I   IMPFLG.
   NWWANTRP07_I   IMPFLG.
   NWWANTRP08_I   IMPFLG.
   NWWANTRP09_I   IMPFLG.
   NWWANTRP10_I   IMPFLG.
   NWWANTRP11_I   IMPFLG.
   NWWANTRP12_I   IMPFLG.
   NWWANTRP13_I   IMPFLG.
   NWWANTRP14_I   IMPFLG.
   NWWANTRP15_I   IMPFLG.
   NWWANTRP16_I   IMPFLG.
   NWWANTRP17_I   IMPFLG.
   NWWANTRP18_I   IMPFLG.
   NWWANTRP19_I   IMPFLG.
   NWWANTRP20_I   IMPFLG.
   WANTP5_I       IMPFLG.
   FPTIT12        FPTIT.
   FPTITMED       FPTIT.
   FPTITSTE       SRCSRV.
   FPTITBC        SRCSRV.
   FPTITCHK       SRCSRV.
   FPTITCBC       SRCSRV.
   FPTITCST       SRCSRV.
   FPTITEC        SRCSRV.
   FPTITCEC       SRCSRV.
   FPTITPRE       SRCSRV.
   FPTITABO       SRCSRV.
   FPTITPAP       SRCSRV.
   FPTITPEL       SRCSRV.
   FPTITPRN       SRCSRV.
   FPTITPPR       SRCSRV.
   FPTITSTD       SRCSRV.
   FPREGFP        Y1N2RECF.
   FPREGMED       Y1N2RECF.
   FPTIT12_I      IMPFLG.
   FPTITMED_I     IMPFLG.
   FPTITSTE_I     IMPFLG.
   FPTITBC_I      IMPFLG.
   FPTITCHK_I     IMPFLG.
   FPTITCBC_I     IMPFLG.
   FPTITCST_I     IMPFLG.
   FPTITEC_I      IMPFLG.
   FPTITCEC_I     IMPFLG.
   FPTITPRE_I     IMPFLG.
   FPTITABO_I     IMPFLG.
   FPTITPAP_I     IMPFLG.
   FPTITPEL_I     IMPFLG.
   FPTITPRN_I     IMPFLG.
   FPTITPPR_I     IMPFLG.
   FPTITSTD_I     IMPFLG.
   FPREGFP_I      IMPFLG.
   FPREGMED_I     IMPFLG.
   INTENT         INTENT.
   ADDEXP         ADDEXP.
   INTENT_I       IMPFLG.
   ADDEXP_I       IMPFLG.
   ANYPRGHP       Y1N2RECF.
   ANYMSCHP       Y1N2RECF.
   INFEVER        Y1N2RECF.
   OVULATE        REPORTF.
   TUBES          REPORTF.
   INFERTR        REPORTF.
   INFERTH        REPORTF.
   ADVICE         REPORTF.
   INSEM          REPORTF.
   INVITRO        REPORTF.
   ENDOMET        REPORTF.
   FIBROIDS       REPORTF.
   PIDTREAT       Y1N2RECF.
   EVHIVTST       EVHIVTST.
   FPTITHIV       FPTITHIV.
   ANYPRGHP_I     IMPFLG.
   ANYMSCHP_I     IMPFLG.
   INFEVER_I      IMPFLG.
   OVULATE_I      IMPFLG.
   TUBES_I        IMPFLG.
   INFERTR_I      IMPFLG.
   INFERTH_I      IMPFLG.
   ADVICE_I       IMPFLG.
   INSEM_I        IMPFLG.
   INVITRO_I      IMPFLG.
   ENDOMET_I      IMPFLG.
   FIBROIDS_I     IMPFLG.
   PIDTREAT_I     IMPFLG.
   EVHIVTST_I     IMPFLG.
   FPTITHIV_I     IMPFLG.
   CURR_INS       CURR_INS.
   METRO          METRO.
   RELIGION       RELIGION.
   LABORFOR       LABORFOR.
   CURR_INS_I     IMPFLG.
   METRO_I        IMPFLG.
   RELIGION_I     IMPFLG.
   LABORFOR_I     IMPFLG.
   POVERTY        POVERTY.
   TOTINCR        TOTINCR.
   PUBASSIS       PUBASSIS.
   POVERTY_I      IMPFLG.
   TOTINCR_I      IMPFLG.
   PUBASSIS_I     IMPFLG.
   WGT2015_2017   WGTFMT.
   CMINTVW        CMFMT.
   CMLSTYR        CMFMT.
   CMJAN3YR       CMJAN3YRF.
   CMJAN4YR       CMJAN4YRF.
   CMJAN5YR       CMJAN5YRF.
   QUARTER        $QUARTER.
   PHASE          $PHASE.
   INTVWYEAR      $YEARF.
   INTVLNGTH      INTVLNGTH. ;
*/


* SAS LENGTH STATEMENT;

LENGTH
   CASEID 6                 RSCRNINF 3               RSCRAGE 3             
   RSCRHISP 3               RSCRRACE 3               AGE_A 3               
   AGE_R 3                  AGESCRN 3                HISP 3                
   HISPGRP 3                PRIMLANG1 3              PRIMLANG2 3           
   PRIMLANG3 3              ROSCNT 3                 NUMCHILD 3            
   HHKIDS18 3               DAUGHT918 3              SON918 3              
   NONBIOKIDS 3             MARSTAT 3                FMARSTAT 3            
   FMARIT 3                 EVRMARRY 3               HPLOCALE 3            
   MANREL 3                 GOSCHOL 3                VACA 3                
   HIGRADE 3                COMPGRD 3                DIPGED 3              
   EARNHS_Y 4               HISCHGRD 3               LSTGRADE 3            
   MYSCHOL_Y 4              HAVEDEG 3                DEGREES 3             
   EARNBA_Y 4               EXPSCHL 3                EXPGRADE 3            
   WTHPARNW 3               ONOWN 3                  ONOWN18 3             
   INTACT 3                 PARMARR 3                INTACT18 3            
   LVSIT14F 3               LVSIT14M 3               WOMRASDU 3            
   MOMDEGRE 3               MOMWORKD 3               MOMFSTCH 3            
   MOM18 3                  MANRASDU 3               R_FOSTER 3            
   EVRFSTER 3               MNYFSTER 3               DURFSTER 3            
   MENARCHE 3               PREGNOWQ 3               MAYBPREG 3            
   NUMPREGS 3               EVERPREG 3               CURRPREG 3            
   HOWPREG_N 3              HOWPREG_P 3              NOWPRGDK 3            
   MOSCURRP 3               NPREGS_S 3               HASBABES 3            
   NUMBABES 3               NBABES_S 3               CMLASTLB 4            
   CMLSTPRG 4               CMFSTPRG 4               CMPG1BEG 4            
   NPLACED 3                NDIED 3                  NADOPTV 3             
   TOTPLACD 3               OTHERKID 3               NOTHRKID 3            
   SEXOTHKD 3               RELOTHKD 3               ADPTOTKD 3            
   TRYADOPT 3               TRYEITHR 3               STILHERE 3            
   DATKDCAM_Y 4             OTHKDFOS 3               OKDDOB_Y 4            
   OKBORNUS 3               OKDISABL1 3              OKDISABL2 3           
   SEXOTHKD2 3              RELOTHKD2 3              ADPTOTKD2 3           
   TRYADOPT2 3              TRYEITHR2 3              STILHERE2 3           
   DATKDCAM_Y2 4            OTHKDFOS2 3              OKDDOB_Y2 4           
   OKBORNUS2 3              OKDISABL5 3              OKDISABL6 3           
   SEXOTHKD3 3              RELOTHKD3 3              ADPTOTKD3 3           
   TRYADOPT3 3              TRYEITHR3 3              STILHERE3 3           
   DATKDCAM_Y3 4            OTHKDFOS3 3              OKDDOB_Y3 4           
   OKBORNUS3 3              OKDISABL9 3              OKDISABL10 3          
   SEXOTHKD4 3              RELOTHKD4 3              ADPTOTKD4 3           
   TRYADOPT4 3              TRYEITHR4 3              STILHERE4 3           
   DATKDCAM_Y4 4            OTHKDFOS4 3              OKDDOB_Y4 4           
   OKBORNUS4 3              OKDISABL13 3             OKDISABL14 3          
   SEXOTHKD5 3              RELOTHKD5 3              ADPTOTKD5 3           
   TRYADOPT5 3              TRYEITHR5 3              STILHERE5 3           
   DATKDCAM_Y5 4            OTHKDFOS5 3              OKDDOB_Y5 4           
   OKBORNUS5 3              OKDISABL17 3             OKDISABL18 3          
   SEXOTHKD6 3              RELOTHKD6 3              ADPTOTKD6 3           
   TRYADOPT6 3              TRYEITHR6 3              STILHERE6 3           
   DATKDCAM_Y6 4            OTHKDFOS6 3              OKDDOB_Y6 4           
   OKBORNUS6 3              OKDISABL21 3             OKDISABL22 3          
   SEXOTHKD7 3              RELOTHKD7 3              ADPTOTKD7 3           
   TRYADOPT7 3              TRYEITHR7 3              STILHERE7 3           
   DATKDCAM_Y7 3            OTHKDFOS7 3              OKDDOB_Y7 3           
   OKBORNUS7 3              OKDISABL25 3             OKDISABL26 3          
   SEXOTHKD8 3              RELOTHKD8 3              ADPTOTKD8 3           
   TRYADOPT8 3              TRYEITHR8 3              STILHERE8 3           
   DATKDCAM_Y8 3            OTHKDFOS8 3              OKDDOB_Y8 3           
   OKBORNUS8 3              OKDISABL29 3             OKDISABL30 3          
   SEXOTHKD9 3              RELOTHKD9 3              ADPTOTKD9 3           
   TRYADOPT9 3              TRYEITHR9 3              STILHERE9 3           
   DATKDCAM_Y9 3            OTHKDFOS9 3              OKDDOB_Y9 3           
   OKBORNUS9 3              OKDISABL33 3             OKDISABL34 3          
   SEXOTHKD10 3             RELOTHKD10 3             ADPTOTKD10 3          
   TRYADOPT10 3             TRYEITHR10 3             STILHERE10 3          
   DATKDCAM_Y10 3           OTHKDFOS10 3             OKDDOB_Y10 3          
   OKBORNUS10 3             OKDISABL37 3             OKDISABL38 3          
   SEXOTHKD11 3             RELOTHKD11 3             ADPTOTKD11 3          
   TRYADOPT11 3             TRYEITHR11 3             STILHERE11 3          
   DATKDCAM_Y11 3           OTHKDFOS11 3             OKDDOB_Y11 3          
   OKBORNUS11 3             OKDISABL41 3             OKDISABL42 3          
   SEXOTHKD12 3             RELOTHKD12 3             ADPTOTKD12 3          
   TRYADOPT12 3             TRYEITHR12 3             STILHERE12 3          
   DATKDCAM_Y12 3           OTHKDFOS12 3             OKDDOB_Y12 3          
   OKBORNUS12 3             OKDISABL45 3             OKDISABL46 3          
   SEXOTHKD13 3             RELOTHKD13 3             ADPTOTKD13 3          
   TRYADOPT13 3             TRYEITHR13 3             STILHERE13 3          
   DATKDCAM_Y13 3           OTHKDFOS13 3             OKDDOB_Y13 3          
   OKBORNUS13 3             OKDISABL49 3             OKDISABL50 3          
   SEXOTHKD14 3             RELOTHKD14 3             ADPTOTKD14 3          
   TRYADOPT14 3             TRYEITHR14 3             STILHERE14 3          
   DATKDCAM_Y14 3           OTHKDFOS14 3             OKDDOB_Y14 3          
   OKBORNUS14 3             OKDISABL53 3             OKDISABL54 3          
   SEXOTHKD15 3             RELOTHKD15 3             ADPTOTKD15 3          
   TRYADOPT15 3             TRYEITHR15 3             STILHERE15 3          
   DATKDCAM_Y15 3           OTHKDFOS15 3             OKDDOB_Y15 3          
   OKBORNUS15 3             OKDISABL57 3             OKDISABL58 3          
   SEXOTHKD16 3             RELOTHKD16 3             ADPTOTKD16 3          
   TRYADOPT16 3             TRYEITHR16 3             STILHERE16 3          
   DATKDCAM_Y16 3           OTHKDFOS16 3             OKDDOB_Y16 3          
   OKBORNUS16 3             OKDISABL61 3             OKDISABL62 3          
   SEXOTHKD17 3             RELOTHKD17 3             ADPTOTKD17 3          
   TRYADOPT17 3             TRYEITHR17 3             STILHERE17 3          
   DATKDCAM_Y17 3           OTHKDFOS17 3             OKDDOB_Y17 3          
   OKBORNUS17 3             OKDISABL65 3             OKDISABL66 3          
   SEXOTHKD18 3             RELOTHKD18 3             ADPTOTKD18 3          
   TRYADOPT18 3             TRYEITHR18 3             STILHERE18 3          
   DATKDCAM_Y18 3           OTHKDFOS18 3             OKDDOB_Y18 3          
   OKBORNUS18 3             OKDISABL69 3             OKDISABL70 3          
   SEXOTHKD19 3             RELOTHKD19 3             ADPTOTKD19 3          
   TRYADOPT19 3             TRYEITHR19 3             STILHERE19 3          
   DATKDCAM_Y19 3           OTHKDFOS19 3             OKDDOB_Y19 3          
   OKBORNUS19 3             OKDISABL73 3             OKDISABL74 3          
   SEXOTHKD20 3             RELOTHKD20 3             ADPTOTKD20 3          
   TRYADOPT20 3             TRYEITHR20 3             STILHERE20 3          
   DATKDCAM_Y20 3           OTHKDFOS20 3             OKDDOB_Y20 3          
   OKBORNUS20 3             OKDISABL77 3             OKDISABL78 3          
   EVERADPT 3               SEEKADPT 3               CONTAGEM 3            
   TRYLONG 3                KNOWADPT 3               EVWNTANO 3            
   EVCONTAG 3               TURNDOWN 3               YQUITTRY 3            
   APROCESS1 3              APROCESS2 3              APROCESS3 3           
   HRDEMBRYO 3              TIMESMAR 3               HSBVERIF 3            
   WHMARHX_Y 4              AGEMARHX 3               HXAGEMAR 3            
   DOBHUSBX_Y 4             LVTOGHX 3                STRTOGHX_Y 4          
   ENGAGHX 3                HSBRACE1 3               HSBNRACE1 3           
   CHEDMARN 3               MARBEFHX 3               KIDSHX 3              
   NUMKDSHX 3               KIDLIVHX 3               CHKID18A 3            
   CHKID18B 3               WHRCHKDS1 3              WHRCHKDS2 3           
   SUPPORCH 3               BIOHUSBX 3               BIONUMHX 3            
   MARENDHX 3               WNDIEHX_Y 4              DIVDATHX_Y 4          
   WNSTPHX_Y 4              WHMARHX_Y2 4             AGEMARHX2 3           
   HXAGEMAR2 3              DOBHUSBX_Y2 4            LVTOGHX2 3            
   STRTOGHX_Y2 4            ENGAGHX2 3               HSBRACE2 3            
   HSBNRACE2 3              CHEDMARN2 3              MARBEFHX2 3           
   KIDSHX2 3                NUMKDSHX2 3              KIDLIVHX2 3           
   CHKID18A2 3              CHKID18B2 3              WHRCHKDS5 3           
   WHRCHKDS6 3              SUPPORCH2 3              BIOHUSBX2 3           
   BIONUMHX2 3              MARENDHX2 3              WNDIEHX_Y2 4          
   DIVDATHX_Y2 4            WNSTPHX_Y2 4             WHMARHX_Y3 4          
   AGEMARHX3 3              HXAGEMAR3 3              DOBHUSBX_Y3 4         
   LVTOGHX3 3               STRTOGHX_Y3 4            ENGAGHX3 3            
   HSBRACE3 3               HSBNRACE3 3              CHEDMARN3 3           
   MARBEFHX3 3              KIDSHX3 3                NUMKDSHX3 3           
   KIDLIVHX3 3              CHKID18A3 3              CHKID18B3 3           
   WHRCHKDS9 3              WHRCHKDS10 3             SUPPORCH3 3           
   BIOHUSBX3 3              BIONUMHX3 3              MARENDHX3 3           
   WNDIEHX_Y3 4             DIVDATHX_Y3 4            WNSTPHX_Y3 4          
   WHMARHX_Y4 4             AGEMARHX4 3              HXAGEMAR4 3           
   DOBHUSBX_Y4 4            LVTOGHX4 3               STRTOGHX_Y4 4         
   ENGAGHX4 3               HSBRACE4 3               HSBNRACE4 3           
   CHEDMARN4 3              MARBEFHX4 3              KIDSHX4 3             
   NUMKDSHX4 3              KIDLIVHX4 3              CHKID18A4 3           
   CHKID18B4 3              WHRCHKDS13 3             WHRCHKDS14 3          
   SUPPORCH4 3              BIOHUSBX4 3              BIONUMHX4 3           
   MARENDHX4 3              WNDIEHX_Y4 3             DIVDATHX_Y4 4         
   WNSTPHX_Y4 4             WHMARHX_Y5 4             AGEMARHX5 3           
   HXAGEMAR5 3              DOBHUSBX_Y5 4            LVTOGHX5 3            
   STRTOGHX_Y5 4            ENGAGHX5 3               HSBRACE5 3            
   HSBNRACE5 3              CHEDMARN5 3              MARBEFHX5 3           
   KIDSHX5 3                NUMKDSHX5 3              KIDLIVHX5 3           
   CHKID18A5 3              CHKID18B5 3              WHRCHKDS17 3          
   WHRCHKDS18 3             SUPPORCH5 3              BIOHUSBX5 3           
   BIONUMHX5 3              MARENDHX5 3              WNDIEHX_Y5 3          
   DIVDATHX_Y5 4            WNSTPHX_Y5 4             WHMARHX_Y6 4          
   AGEMARHX6 3              HXAGEMAR6 3              DOBHUSBX_Y6 4         
   LVTOGHX6 3               STRTOGHX_Y6 4            ENGAGHX6 3            
   HSBRACE6 3               HSBNRACE6 3              CHEDMARN6 3           
   MARBEFHX6 3              KIDSHX6 3                NUMKDSHX6 3           
   KIDLIVHX6 3              CHKID18A6 3              CHKID18B6 3           
   WHRCHKDS21 3             WHRCHKDS22 3             SUPPORCH6 3           
   BIOHUSBX6 3              BIONUMHX6 3              MARENDHX6 3           
   WNDIEHX_Y6 3             DIVDATHX_Y6 3            WNSTPHX_Y6 4          
   CMMARRCH 4               PREVHUSB 3               WNSTRTCP_Y 4          
   CPHERAGE 3               CPHISAGE 3               WNCPBRN_Y 4           
   CPENGAG1 3               WILLMARR 3               CURCOHRACE 3          
   CURCOHNRACE 3            CPEDUC 3                 CPMARBEF 3            
   CPKIDS 3                 CPNUMKDS 3               CPKIDLIV 3            
   CPKID18A 3               CPKID18B 3               WHRCPKDS1 3           
   WHRCPKDS2 3              SUPPORCP 3               BIOCP 3               
   BIONUMCP 3               CMSTRTHP 4               LIVEOTH 3             
   EVRCOHAB 3               HMOTHMEN 3               PREVCOHB 3            
   STRTOTHX_Y 4             HERAGECX 3               HISAGECX 3            
   WNBRNCX_Y 4              ENGAG1CX 3               COH1RACE 3            
   COH1NRACE 3              MAREVCX 3                CXKIDS 3              
   BIOFCPX 3                BIONUMCX 3               STPTOGCX_Y 4          
   STRTOTHX_Y2 4            HERAGECX2 3              HISAGECX2 3           
   WNBRNCX_Y2 4             ENGAG1CX2 3              MAREVCX2 3            
   CXKIDS2 3                BIOFCPX2 3               BIONUMCX2 3           
   STPTOGCX_Y2 4            STRTOTHX_Y3 4            HERAGECX3 3           
   HISAGECX3 3              WNBRNCX_Y3 4             ENGAG1CX3 3           
   MAREVCX3 3               CXKIDS3 3                BIOFCPX3 3            
   BIONUMCX3 3              STPTOGCX_Y3 4            STRTOTHX_Y4 4         
   HERAGECX4 3              HISAGECX4 3              WNBRNCX_Y4 4          
   ENGAG1CX4 3              MAREVCX4 3               CXKIDS4 3             
   BIOFCPX4 3               BIONUMCX4 3              STPTOGCX_Y4 4         
   COHCHANCE 3              MARRCHANCE 3             PMARCOH 3             
   EVERSEX 3                RHADSEX 3                YNOSEX 3              
   WNFSTSEX_M 3             WNFSTSEX_Y 4             CMFSTSEX 4            
   AGEFSTSX 3               C_SEX18 3                C_SEX15 3             
   C_SEX20 3                GRFSTSX 3                SXMTONCE 3            
   TALKPAR1 3               TALKPAR2 3               TALKPAR3 3            
   TALKPAR4 3               TALKPAR5 3               TALKPAR6 3            
   TALKPAR7 3               SEDNO 3                  SEDNOG 3              
   SEDNOSX 3                SEDBC 3                  SEDBCLC1 3            
   SEDBCLC2 3               SEDBCLC3 3               SEDBCLC4 3            
   SEDBCG 3                 SEDBCSX 3                SEDWHBC 3             
   SEDWHBCG 3               SEDWBCSX 3               SEDCOND 3             
   SEDCONDG 3               SEDCONSX 3               SEDSTD 3              
   SEDSTDG 3                SEDSTDSX 3               SEDHIV 3              
   SEDHIVG 3                SEDHIVSX 3               SEDABST 3             
   SEDABLC1 3               SEDABLC2 3               SEDABLC3 3            
   SEDABLC4 3               SEDABSTG 3               SEDABSSX 3            
   SAMEMAN 3                WHOFSTPR 3               KNOWFP 3              
   STILFPSX 3               LSTSEXFP_M 3             LSTSEXFP_Y 4          
   CMLSEXFP 4               CMFPLAST 4               FPOTHREL 3            
   FPEDUC 3                 FSEXRACE 3               FSEXNRACE 3           
   FPRN 3                   WHICH1ST 3               SEXAFMEN 3            
   WNSEXAFM_M 3             WNSEXAFM_Y 4             CMSEXAFM 4            
   AGESXAFM 3               AFMEN18 3                AFMEN15 3             
   AFMEN20 3                LIFEPRT 4                LIFEPRT_LO 4          
   LIFEPRT_HI 4             PTSB4MAR 4               PTSB4MAR_LO 4         
   PTSB4MAR_HI 4            MON12PRT 4               MON12PRT_LO 4         
   MON12PRT_HI 4            PARTS12 4                LIFEPRTS 3            
   WHOSNC1Y 3               MATCHFP 3                MATCHHP 3             
   P1YRELP 3                CMLSEX 4                 P1YLSEX_M 3           
   P1YLSEX_Y 4              P1YCURRP 3               PCURRNT 3             
   MATCHFP2 3               MATCHHP2 3               P1YRELP2 3            
   CMLSEX2 4                P1YLSEX_M2 3             P1YLSEX_Y2 4          
   P1YCURRP2 3              PCURRNT2 3               MATCHFP3 3            
   MATCHHP3 3               P1YRELP3 3               CMLSEX3 4             
   P1YLSEX_M3 3             P1YLSEX_Y3 4             P1YCURRP3 3           
   PCURRNT3 3               P1YOTHREL 3              P1YRAGE 3             
   P1YHSAGE 3               P1YRF 3                  P1YFSEX_M 3           
   P1YFSEX_Y 4              CMFSEX 4                 CMFSEXTOT 4           
   P1YEDUC 3                P1YRACE1 3               P1YNRACE1 3           
   P1YRN 3                  P1YOTHREL2 3             P1YRAGE2 3            
   P1YHSAGE2 3              P1YRF2 3                 P1YFSEX_M2 3          
   P1YFSEX_Y2 4             CMFSEX2 4                CMFSEXTOT2 4          
   P1YEDUC2 3               P1YRACE2 3               P1YNRACE2 3           
   P1YRN2 3                 P1YOTHREL3 3             P1YRAGE3 3            
   P1YHSAGE3 3              P1YRF3 3                 P1YFSEX_M3 3          
   P1YFSEX_Y3 4             CMFSEX3 4                CMFSEXTOT3 4          
   P1YEDUC3 3               P1YRACE3 3               P1YNRACE3 3           
   P1YRN3 3                 CURRPRTT 3               CURRPRTS 3            
   CMCURRP1 4               CMCURRP2 4               CMCURRP3 3            
   EVERTUBS 3               ESSURE 3                 EVERHYST 3            
   EVEROVRS 3               EVEROTHR 3               WHTOOPRC 3            
   ONOTFUNC 3               DFNLSTRL 3               ANYTUBAL 3            
   HYST 3                   OVAREM 3                 OTHR 3                
   ANYFSTER 3               ANYOPSMN 3               WHATOPSM 3            
   DFNLSTRM 3               ANYMSTER 3               ANYVAS 3              
   OTHRM 3                  DATFEMOP_Y 4             PLCFEMOP 3            
   PAYRSTER1 3              PAYRSTER2 3              PAYRSTER3 3           
   RHADALL 3                HHADALL 3                FMEDREAS1 3           
   FMEDREAS2 3              FMEDREAS3 3              FMEDREAS4 3           
   FMEDREAS5 3              BCREAS 3                 BCWHYF 3              
   MINCDNNR 3               DATFEMOP_Y2 4            PLCFEMOP2 3           
   PAYRSTER6 3              PAYRSTER7 3              PAYRSTER8 3           
   RHADALL2 3               HHADALL2 3               FMEDREAS7 3           
   FMEDREAS8 3              FMEDREAS9 3              FMEDREAS10 3          
   FMEDREAS11 3             BCREAS2 3                BCWHYF2 3             
   MINCDNNR2 3              DATFEMOP_Y3 4            PLCFEMOP3 3           
   PAYRSTER11 3             PAYRSTER12 3             PAYRSTER13 3          
   RHADALL3 3               HHADALL3 3               FMEDREAS13 3          
   FMEDREAS14 3             FMEDREAS15 3             FMEDREAS16 3          
   FMEDREAS17 3             BCREAS3 3                BCWHYF3 3             
   MINCDNNR3 3              DATFEMOP_Y4 4            PLCFEMOP4 3           
   PAYRSTER16 3             PAYRSTER17 3             PAYRSTER18 3          
   RHADALL4 3               HHADALL4 3               FMEDREAS19 3          
   FMEDREAS20 3             FMEDREAS21 3             FMEDREAS22 3          
   FMEDREAS23 3             BCREAS4 3                BCWHYF4 3             
   MINCDNNR4 3              OPERSAME1 3              OPERSAME2 3           
   OPERSAME3 3              OPERSAME4 3              OPERSAME5 3           
   OPERSAME6 3              DATEOPMN_Y 4             WITHIMOP 3            
   VASJAN4YR 3              PLACOPMN 3               PAYMSTER1 3           
   PAYMSTER2 3              RHADALLM 3               HHADALLM 3            
   MEDREAS1 3               MEDREAS2 3               BCREASM 3             
   BCWHYM 3                 MINCDNMN 3               REVSTUBL 3            
   DATRVSTB_Y 4             REVSVASX 3               DATRVVEX_Y 4          
   TUBS 3                   VASECT 3                 RSURGSTR 3            
   PSURGSTR 3               ONLYTBVS 3               RWANTRVT 3            
   MANWANTT 3               RWANTREV 3               MANWANTR 3            
   POSIBLPG 3               REASIMPR 3               POSIBLMN 3            
   REASIMPP 3               CANHAVER 3               REASDIFF1 3           
   REASDIFF2 3              REASDIFF3 3              CANHAVEM 3            
   PREGNONO 3               REASNONO1 3              REASNONO2 3           
   REASNONO3 3              RSTRSTAT 3               PSTRSTAT 3            
   PILL 3                   CONDOM 3                 VASECTMY 3            
   DEPOPROV 3               WIDRAWAL 3               RHYTHM 3              
   SDAYCBDS 3               TEMPSAFE 3               PATCH 3               
   RING 3                   MORNPILL 3               ECTIMESX 3            
   ECREASON1 3              ECREASON2 3              ECREASON3 3           
   ECRX 3                   ECWHERE 3                ECWHEN 3              
   OTHRMETH01 3             OTHRMETH02 3             OTHRMETH03 3          
   OTHRMETH04 3             OTHRMETH05 3             OTHRMETH06 3          
   OTHRMETH07 3             EVIUDTYP1 3              EVIUDTYP2 3           
   NEWMETH 3                EVERUSED 3               METHDISS 3            
   METHSTOP01 3             METHSTOP02 3             METHSTOP03 3          
   METHSTOP04 3             METHSTOP05 3             METHSTOP06 3          
   METHSTOP07 3             METHSTOP08 3             METHSTOP09 3          
   METHSTOP10 3             WHENPILL 3               REASPILL01 3          
   REASPILL02 3             REASPILL03 3             REASPILL04 3          
   REASPILL05 3             REASPILL06 3             REASPILL07 3          
   STOPPILL1 3              STOPPILL2 3              STOPPILL3 3           
   STOPPILL4 3              STOPPILL5 3              STOPPILL6 3           
   WHENCOND 3               REASCOND01 3             REASCOND02 3          
   REASCOND03 3             REASCOND04 3             REASCOND05 3          
   REASCOND06 3             REASCOND07 3             STOPCOND1 3           
   STOPCOND2 3              WHENIUD 3                TYPEIUD_1 3           
   TYPEIUD_2 3              REASIUD01 3              REASIUD02 3           
   REASIUD03 3              REASIUD04 3              REASIUD05 3           
   REASIUD06 3              REASIUD07 3              REASIUD08 3           
   STOPIUD1 3               STOPIUD2 3               STOPIUD3 3            
   STOPIUD4 3               STOPIUD5 3               FIRSMETH1 3           
   FIRSMETH2 3              FIRSMETH3 3              FIRSMETH4 3           
   NUMFIRSM 3               DRUGDEV 3                DRUGDEV2 3            
   DRUGDEV3 3               DRUGDEV4 3               FIRSTIME1 3           
   FIRSTIME2 3              USEFSTSX 3               CMFIRSM 4             
   MTHFSTSX1 3              MTHFSTSX2 3              MTHFSTSX3 3           
   MTHFSTSX4 3              WNFSTUSE_M 3             WNFSTUSE_Y 4          
   CMFSTUSE 4               FMETHPRS 3               FMETHPRS2 3           
   FMETHPRS3 3              FMETHPRS4 3              AGEFSTUS 3            
   PLACGOTF 3               PLACGOTF2 3              PLACGOTF3 3           
   PLACGOTF4 3              USEFRSTS 3               MTHFRSTS1 3           
   MTHFRSTS2 3              MTHFRSTS3 3              MTHFRSTS4 3           
   INTR_EC3 3               CMMONSX 4                MONSX 3               
   CMMONSX2 4               MONSX2 3                 CMMONSX3 4            
   MONSX3 3                 CMMONSX4 4               MONSX4 3              
   CMMONSX5 4               MONSX5 3                 CMMONSX6 4            
   MONSX6 3                 CMMONSX7 4               MONSX7 3              
   CMMONSX8 4               MONSX8 3                 CMMONSX9 4            
   MONSX9 3                 CMMONSX10 4              MONSX10 3             
   CMMONSX11 4              MONSX11 3                CMMONSX12 4           
   MONSX12 3                CMMONSX13 4              MONSX13 3             
   CMMONSX14 4              MONSX14 3                CMMONSX15 4           
   MONSX15 3                CMMONSX16 4              MONSX16 3             
   CMMONSX17 4              MONSX17 3                CMMONSX18 4           
   MONSX18 3                CMMONSX19 4              MONSX19 3             
   CMMONSX20 4              MONSX20 3                CMMONSX21 4           
   MONSX21 3                CMMONSX22 4              MONSX22 3             
   CMMONSX23 4              MONSX23 3                CMMONSX24 4           
   MONSX24 3                CMMONSX25 4              MONSX25 3             
   CMMONSX26 4              MONSX26 3                CMMONSX27 4           
   MONSX27 3                CMMONSX28 4              MONSX28 3             
   CMMONSX29 4              MONSX29 3                CMMONSX30 4           
   MONSX30 3                CMMONSX31 4              MONSX31 3             
   CMMONSX32 4              MONSX32 3                CMMONSX33 4           
   MONSX33 3                CMMONSX34 4              MONSX34 3             
   CMMONSX35 4              MONSX35 3                CMMONSX36 4           
   MONSX36 3                CMMONSX37 4              MONSX37 3             
   CMMONSX38 4              MONSX38 3                CMMONSX39 4           
   MONSX39 3                CMMONSX40 4              MONSX40 3             
   CMMONSX41 4              MONSX41 3                CMMONSX42 4           
   MONSX42 3                CMMONSX43 4              MONSX43 3             
   CMMONSX44 4              MONSX44 3                CMMONSX45 4           
   MONSX45 3                CMMONSX46 4              MONSX46 3             
   CMMONSX47 4              MONSX47 3                CMMONSX48 4           
   MONSX48 3                CMSTRTMC 4               CMENDMC 4             
   INTR_ED4a 3              NUMMCMON 3               MC1MONS1 4            
   MC1SIMSQ 3               MC1MONS2 4               MC1MONS3 4            
   DATBEGIN_M 3             DATBEGIN_Y 4             CMDATBEGIN 4          
   CURRMETH1 3              CURRMETH2 3              CURRMETH3 3           
   CURRMETH4 3              LSTMONMETH1 3            LSTMONMETH2 3         
   LSTMONMETH3 3            LSTMONMETH4 3            PILL_12 3             
   DIAPH_12 3               IUD_12 3                 IMPLANT_12 3          
   DEPO_12 3                CERVC_12 3               MPILL_12 3            
   PATCH_12 3               RING_12 3                METHX1 3              
   METHX2 3                 METHX3 3                 METHX4 3              
   METHX5 3                 METHX6 3                 METHX7 3              
   METHX8 3                 METHX9 3                 METHX10 3             
   METHX11 3                METHX12 3                METHX13 3             
   METHX14 3                METHX15 3                METHX16 3             
   METHX17 3                METHX18 3                METHX19 3             
   METHX20 3                METHX21 3                METHX22 3             
   METHX23 3                METHX24 3                METHX25 3             
   METHX26 3                METHX27 3                METHX28 3             
   METHX29 3                METHX30 3                METHX31 3             
   METHX32 3                METHX33 3                METHX34 3             
   METHX35 3                METHX36 3                METHX37 3             
   METHX38 3                METHX39 3                METHX40 3             
   METHX41 3                METHX42 3                METHX43 3             
   METHX44 3                METHX45 3                METHX46 3             
   METHX47 3                METHX48 3                METHX49 3             
   METHX50 3                METHX51 3                METHX52 3             
   METHX53 3                METHX54 3                METHX55 3             
   METHX56 3                METHX57 3                METHX58 3             
   METHX59 3                METHX60 3                METHX61 3             
   METHX62 3                METHX63 3                METHX64 3             
   METHX65 3                METHX66 3                METHX67 3             
   METHX68 3                METHX69 3                METHX70 3             
   METHX71 3                METHX72 3                METHX73 3             
   METHX74 3                METHX75 3                METHX76 3             
   METHX77 3                METHX78 3                METHX79 3             
   METHX80 3                METHX81 3                METHX82 3             
   METHX83 3                METHX84 3                METHX85 3             
   METHX86 3                METHX87 3                METHX88 3             
   METHX89 3                METHX90 3                METHX91 3             
   METHX92 3                METHX93 3                METHX94 3             
   METHX95 3                METHX96 3                METHX97 3             
   METHX98 3                METHX99 3                METHX100 3            
   METHX101 3               METHX102 3               METHX103 3            
   METHX104 3               METHX105 3               METHX106 3            
   METHX107 3               METHX108 3               METHX109 3            
   METHX110 3               METHX111 3               METHX112 3            
   METHX113 3               METHX114 3               METHX115 3            
   METHX116 3               METHX117 3               METHX118 3            
   METHX119 3               METHX120 3               METHX121 3            
   METHX122 3               METHX123 3               METHX124 3            
   METHX125 3               METHX126 3               METHX127 3            
   METHX128 3               METHX129 3               METHX130 3            
   METHX131 3               METHX132 3               METHX133 3            
   METHX134 3               METHX135 3               METHX136 3            
   METHX137 3               METHX138 3               METHX139 3            
   METHX140 3               METHX141 3               METHX142 3            
   METHX143 3               METHX144 3               METHX145 3            
   METHX146 3               METHX147 3               METHX148 3            
   METHX149 3               METHX150 3               METHX151 3            
   METHX152 3               METHX153 3               METHX154 3            
   METHX155 3               METHX156 3               METHX157 3            
   METHX158 3               METHX159 3               METHX160 3            
   METHX161 3               METHX162 3               METHX163 3            
   METHX164 3               METHX165 3               METHX166 3            
   METHX167 3               METHX168 3               METHX169 3            
   METHX170 3               METHX171 3               METHX172 3            
   METHX173 3               METHX174 3               METHX175 3            
   METHX176 3               METHX177 3               METHX178 3            
   METHX179 3               METHX180 3               METHX181 3            
   METHX182 3               METHX183 3               METHX184 3            
   METHX185 3               METHX186 3               METHX187 3            
   METHX188 3               METHX189 3               METHX190 3            
   METHX191 3               METHX192 3               CMMHCALX1 4           
   CMMHCALX2 4              CMMHCALX3 4              CMMHCALX4 4           
   CMMHCALX5 4              CMMHCALX6 4              CMMHCALX7 4           
   CMMHCALX8 4              CMMHCALX9 4              CMMHCALX10 4          
   CMMHCALX11 4             CMMHCALX12 4             CMMHCALX13 4          
   CMMHCALX14 4             CMMHCALX15 4             CMMHCALX16 4          
   CMMHCALX17 4             CMMHCALX18 4             CMMHCALX19 4          
   CMMHCALX20 4             CMMHCALX21 4             CMMHCALX22 4          
   CMMHCALX23 4             CMMHCALX24 4             CMMHCALX25 4          
   CMMHCALX26 4             CMMHCALX27 4             CMMHCALX28 4          
   CMMHCALX29 4             CMMHCALX30 4             CMMHCALX31 4          
   CMMHCALX32 4             CMMHCALX33 4             CMMHCALX34 4          
   CMMHCALX35 4             CMMHCALX36 4             CMMHCALX37 4          
   CMMHCALX38 4             CMMHCALX39 4             CMMHCALX40 4          
   CMMHCALX41 4             CMMHCALX42 4             CMMHCALX43 4          
   CMMHCALX44 4             CMMHCALX45 4             CMMHCALX46 4          
   CMMHCALX47 4             CMMHCALX48 4             NUMMULTX1 3           
   NUMMULTX2 3              NUMMULTX3 3              NUMMULTX4 3           
   NUMMULTX5 3              NUMMULTX6 3              NUMMULTX7 3           
   NUMMULTX8 3              NUMMULTX9 3              NUMMULTX10 3          
   NUMMULTX11 3             NUMMULTX12 3             NUMMULTX13 3          
   NUMMULTX14 3             NUMMULTX15 3             NUMMULTX16 3          
   NUMMULTX17 3             NUMMULTX18 3             NUMMULTX19 3          
   NUMMULTX20 3             NUMMULTX21 3             NUMMULTX22 3          
   NUMMULTX23 3             NUMMULTX24 3             NUMMULTX25 3          
   NUMMULTX26 3             NUMMULTX27 3             NUMMULTX28 3          
   NUMMULTX29 3             NUMMULTX30 3             NUMMULTX31 3          
   NUMMULTX32 3             NUMMULTX33 3             NUMMULTX34 3          
   NUMMULTX35 3             NUMMULTX36 3             NUMMULTX37 3          
   NUMMULTX38 3             NUMMULTX39 3             NUMMULTX40 3          
   NUMMULTX41 3             NUMMULTX42 3             NUMMULTX43 3          
   NUMMULTX44 3             NUMMULTX45 3             NUMMULTX46 3          
   NUMMULTX47 3             NUMMULTX48 3             SALMX1 3              
   SALMX2 3                 SALMX3 3                 SALMX4 3              
   SALMX5 3                 SALMX6 3                 SALMX7 3              
   SALMX8 3                 SALMX9 3                 SALMX10 3             
   SALMX11 3                SALMX12 3                SALMX13 3             
   SALMX14 3                SALMX15 3                SALMX16 3             
   SALMX17 3                SALMX18 3                SALMX19 3             
   SALMX20 3                SALMX21 3                SALMX22 3             
   SALMX23 3                SALMX24 3                SALMX25 3             
   SALMX26 3                SALMX27 3                SALMX28 3             
   SALMX29 3                SALMX30 3                SALMX31 3             
   SALMX32 3                SALMX33 3                SALMX34 3             
   SALMX35 3                SALMX36 3                SALMX37 3             
   SALMX38 3                SALMX39 3                SALMX40 3             
   SALMX41 3                SALMX42 3                SALMX43 3             
   SALMX44 3                SALMX45 3                SALMX46 3             
   SALMX47 3                SALMX48 3                SAYX1 3               
   SAYX2 3                  SAYX3 3                  SAYX4 3               
   SAYX5 3                  SAYX6 3                  SAYX7 3               
   SAYX8 3                  SAYX9 3                  SAYX10 3              
   SAYX11 3                 SAYX12 3                 SAYX13 3              
   SAYX14 3                 SAYX15 3                 SAYX16 3              
   SAYX17 3                 SAYX18 3                 SAYX19 3              
   SAYX20 3                 SAYX21 3                 SAYX22 3              
   SAYX23 3                 SAYX24 3                 SAYX25 3              
   SAYX26 3                 SAYX27 3                 SAYX28 3              
   SAYX29 3                 SAYX30 3                 SAYX31 3              
   SAYX32 3                 SAYX33 3                 SAYX34 3              
   SAYX35 3                 SAYX36 3                 SAYX37 3              
   SAYX38 3                 SAYX39 3                 SAYX40 3              
   SAYX41 3                 SAYX42 3                 SAYX43 3              
   SAYX44 3                 SAYX45 3                 SAYX46 3              
   SAYX47 3                 SAYX48 3                 SIMSEQX1 3            
   SIMSEQX2 3               SIMSEQX3 3               SIMSEQX4 3            
   SIMSEQX5 3               SIMSEQX6 3               SIMSEQX7 3            
   SIMSEQX8 3               SIMSEQX9 3               SIMSEQX10 3           
   SIMSEQX11 3              SIMSEQX12 3              SIMSEQX13 3           
   SIMSEQX14 3              SIMSEQX15 3              SIMSEQX16 3           
   SIMSEQX17 3              SIMSEQX18 3              SIMSEQX19 3           
   SIMSEQX20 3              SIMSEQX21 3              SIMSEQX22 3           
   SIMSEQX23 3              SIMSEQX24 3              SIMSEQX25 3           
   SIMSEQX26 3              SIMSEQX27 3              SIMSEQX28 3           
   SIMSEQX29 3              SIMSEQX30 3              SIMSEQX31 3           
   SIMSEQX32 3              SIMSEQX33 3              SIMSEQX34 3           
   SIMSEQX35 3              SIMSEQX36 3              SIMSEQX37 3           
   SIMSEQX38 3              SIMSEQX39 3              SIMSEQX40 3           
   SIMSEQX41 3              SIMSEQX42 3              SIMSEQX43 3           
   SIMSEQX44 3              SIMSEQX45 3              SIMSEQX46 3           
   SIMSEQX47 3              SIMSEQX48 3              USELSTP 3             
   WYNOLSTP 3               HPLSTP 3                 LSTMTHP1 3            
   LSTMTHP2 3               LSTMTHP3 3               LSTMTHP4 3            
   LPIUDTYP 3               USEFSTP 3                FSTMTHP1 3            
   FSTMTHP2 3               FSTMTHP3 3               FSTMTHP4 3            
   USELSTP2 3               WYNOLSTP2 3              HPLSTP2 3             
   LSTMTHP5 3               LSTMTHP6 3               LSTMTHP7 3            
   LSTMTHP8 3               LPIUDTYP2 3              USEFSTP2 3            
   FSTMTHP5 3               FSTMTHP6 3               FSTMTHP7 3            
   FSTMTHP8 3               USELSTP3 3               WYNOLSTP3 3           
   HPLSTP3 3                LSTMTHP9 3               LSTMTHP10 3           
   LSTMTHP11 3              LSTMTHP12 3              LPIUDTYP3 3           
   USEFSTP3 3               FSTMTHP9 3               FSTMTHP10 3           
   FSTMTHP11 3              FSTMTHP12 3              WYNOTUSE 3            
   HPPREGQ 3                DURTRY_N 3               DURTRY_P 3            
   WHYNOUSING1 3            WHYNOUSING2 3            WHYNOUSING3 3         
   WHYNOUSING4 3            WHYNOUSING5 3            WHYNOTPG1 3           
   WHYNOTPG2 3              MAINNOUSE 3              YUSEPILL1 3           
   YUSEPILL2 3              YUSEPILL3 3              YUSEPILL4 3           
   YUSEPILL5 3              YUSEPILL6 3              YUSEPILL7 3           
   IUDTYPE 3                YUSEIUD1 3               YUSEIUD2 3            
   YUSEIUD3 3               YUSEIUD4 3               YUSEIUD5 3            
   EKMETHOD 3               CURBCPLC 3               NUMPILLS 3            
   CURBCPAY1 3              CURBCPAY2 3              CURBCPAY3 3           
   CURBCINS 3               NOUSEINS1 3              NOUSEINS2 3           
   NOUSEINS3 3              CURBCAMT 3               NOCOST1 3             
   NOCOST2 3                PST4WKSX 4               PSWKCOND1 3           
   PSWKCOND2 3              COND1BRK 3               COND1OFF 3            
   CONDBRFL 3               CONDOFF 4                MISSPILL 3            
   P12MOCON 3               PXNOFREQ 3               BTHCON12 3            
   MEDTST12 3               BCCNS12 3                STEROP12 3            
   STCNS12 3                EMCON12 3                ECCNS12 3             
   NUMMTH12 3               PRGTST12 3               ABORT12 3             
   PAP12 3                  PELVIC12 3               PRENAT12 3            
   PARTUM12 3               STDSVC12 3               BARRIER1 3            
   BARRIER2 3               BARRIER3 3               BARRIER4 3            
   BARRIER5 3               BARRIER6 3               NUMSVC12 3            
   NUMBCVIS 3               BC12PLCX 3               BC12PLCX2 3           
   BC12PLCX3 3              BC12PLCX4 3              BC12PLCX5 3           
   BC12PLCX6 3              BC12PLCX7 3              BC12PLCX8 3           
   BC12PLCX9 3              BC12PLCX10 3             BC12PLCX11 3          
   BC12PLCX12 3             BC12PLCX13 3             BC12PLCX14 3          
   BC12PLCX15 3             IDCLINIC 3               PGTSTBC2 3            
   PAPPLBC2 3               PAPPELEC 3               STDTSCON 3            
   WHYPSTD 3                BCCLARC 3                BC12PAYX1 3           
   BC12PAYX2 3              BC12PAYX3 3              BC12PAYX4 3           
   BC12PAYX7 3              BC12PAYX8 3              BC12PAYX9 3           
   BC12PAYX10 3             BC12PAYX13 3             BC12PAYX14 3          
   BC12PAYX15 3             BC12PAYX16 3             BC12PAYX19 3          
   BC12PAYX20 3             BC12PAYX21 3             BC12PAYX22 3          
   BC12PAYX25 3             BC12PAYX26 3             BC12PAYX27 3          
   BC12PAYX28 3             BC12PAYX31 3             BC12PAYX32 3          
   BC12PAYX33 3             BC12PAYX34 3             BC12PAYX37 3          
   BC12PAYX38 3             BC12PAYX39 3             BC12PAYX40 3          
   BC12PAYX43 3             BC12PAYX44 3             BC12PAYX45 3          
   BC12PAYX46 3             BC12PAYX49 3             BC12PAYX50 3          
   BC12PAYX51 3             BC12PAYX52 3             BC12PAYX55 3          
   BC12PAYX56 3             BC12PAYX57 3             BC12PAYX58 3          
   BC12PAYX61 3             BC12PAYX62 3             BC12PAYX63 3          
   BC12PAYX64 3             BC12PAYX67 3             BC12PAYX68 3          
   BC12PAYX69 3             BC12PAYX70 3             BC12PAYX73 3          
   BC12PAYX74 3             BC12PAYX75 3             BC12PAYX76 3          
   BC12PAYX79 3             BC12PAYX80 3             BC12PAYX81 3          
   BC12PAYX82 3             BC12PAYX85 3             BC12PAYX86 3          
   BC12PAYX87 3             BC12PAYX88 3             REGCAR12_F_01 3       
   REGCAR12_F_02 3          REGCAR12_F_03 3          REGCAR12_F_04 3       
   REGCAR12_F_05 3          REGCAR12_F_06 3          REGCAR12_F_07 3       
   REGCAR12_F_08 3          REGCAR12_F_09 3          REGCAR12_F_10 3       
   REGCAR12_F_11 3          REGCAR12_F_12 3          REGCAR12_F_13 3       
   REGCAR12_F_14 3          REGCAR12_F_15 3          EVERFPC 3             
   KNDMDHLP01 3             KNDMDHLP02 3             KNDMDHLP03 3          
   KNDMDHLP04 3             KNDMDHLP05 3             KNDMDHLP06 3          
   KNDMDHLP07 3             KNDMDHLP08 3             LASTPAP 3             
   MREASPAP 3               AGEFPAP 3                AGEFPAP2 3            
   ABNPAP3 3                INTPAP 3                 PELWPAP 3             
   LASTPEL 3                MREASPEL 3               AGEFPEL 3             
   AGEPEL2 3                INTPEL 3                 EVHPVTST 3            
   HPVWPAP 3                LASTHPV 3                MREASHPV 3            
   AGEFHPV 3                AGEHPV2 3                INTHPV 3              
   ASKSMOKE 3               ASKPREG 3                ASKFOLIC 3            
   RWANT 3                  PROBWANT 3               PWANT 3               
   JINTEND 3                JSUREINT 3               JINTENDN 3            
   JEXPECTL 3               JEXPECTS 3               JINTNEXT 3            
   INTEND 3                 SUREINT 3                INTENDN 3             
   EXPECTL 3                EXPECTS 3                INTNEXT 3             
   HLPPRG 3                 HOWMANYR 3               SEEKWHO1 3            
   SEEKWHO2 3               TYPALLPG1 3              TYPALLPG2 3           
   TYPALLPG3 3              TYPALLPG4 3              TYPALLPG5 3           
   TYPALLPG6 3              WHOTEST 3                WHARTIN 3             
   OTMEDHEP1 3              OTMEDHEP2 3              OTMEDHEP3 3           
   OTMEDHEP4 3              OTMEDHEP5 3              INSCOVPG 3            
   FSTHLPPG_M 3             FSTHLPPG_Y 4             CMPGVIS1 4            
   TRYLONG2 3               UNIT_TRYLONG 3           HLPPGNOW 3            
   RCNTPGH_M 3              RCNTPGH_Y 4              CMPGVISL 4            
   NUMVSTPG 3               PRGVISIT 3               HLPMC 3               
   TYPALLMC1 3              TYPALLMC2 3              TYPALLMC3 3           
   TYPALLMC4 3              TYPALLMC5 3              TYPALLMC6 3           
   MISCNUM 3                INFRTPRB1 3              INFRTPRB2 3           
   INFRTPRB3 3              INFRTPRB4 3              INFRTPRB5 3           
   DUCHFREQ 3               PID 3                    PIDSYMPT 3            
   PIDTX 3                  LSTPIDTX_M 3             LSTPIDTX_Y 4          
   CMPIDLST 4               DIABETES 3               GESTDIAB 3            
   UF 3                     ENDO 3                   OVUPROB 3             
   DEAF 3                   BLIND 3                  DIFDECIDE 3           
   DIFWALK 3                DIFDRESS 3               DIFOUT 3              
   EVRCANCER 3              AGECANCER 3              CANCTYPE 3            
   PRECANCER 3              MAMMOG 3                 AGEMAMM1 3            
   REASMAMM1 3              CLINEXAM 3               FAMHYST 3             
   MOMRISK70 3              MOMRISK40 3              ALCORISK 3            
   BFEEDRISK 3              DONBLOOD 3               HIVTEST 3             
   NOHIVTST 3               WHENHIV_M 3              WHENHIV_Y 4           
   CMHIVTST 4               HIVTSTYR 3               HIVRESULT 3           
   WHYNOGET 3               PLCHIV 3                 RHHIVT1 3             
   RHHIVT21 3               HIVTST 3                 WHOSUGG 3             
   TALKDOCT 3               AIDSTALK01 3             AIDSTALK02 3          
   AIDSTALK03 3             AIDSTALK04 3             AIDSTALK05 3          
   AIDSTALK06 3             AIDSTALK07 3             AIDSTALK08 3          
   AIDSTALK09 3             AIDSTALK10 3             AIDSTALK11 3          
   RETROVIR 3               PREGHIV 3                EVERVACC 3            
   HPVSHOT1 3               HPVSEX1 3                VACCPROB 3            
   BLDPRESS 3               HIGHBP 3                 BPMEDS 3              
   USUALCAR 3               USLPLACE 3               USL12MOS 3            
   CURRCOV 3                COVERHOW01 3             COVERHOW02 3          
   COVERHOW03 3             PARINSUR 3               INS_EXCH 3            
   INS_PREM 3               COVER12 3                NUMNOCOV 3            
   SAMEADD 3                CNTRY10 3                BRNOUT 3              
   YRSTRUS 4                RELRAISD 3               ATTND14 3             
   RELCURR 3                RELTRAD 3                FUNDAM1 3             
   FUNDAM2 3                FUNDAM3 3                FUNDAM4 3             
   RELDLIFE 3               ATTNDNOW 3               MILSVC 3              
   WRK12MOS 3               FPT12MOS 3               DOLASTWK1 3           
   DOLASTWK2 3              DOLASTWK3 3              DOLASTWK4 3           
   DOLASTWK5 3              RWRKST 3                 WORKP12 3             
   RPAYJOB 3                RNUMJOB 3                RFTPTX 3              
   REARNTY 3                SPLSTWK1 3               SPLSTWK2 3            
   SPLSTWK3 3               SPLSTWK4 3               SPLSTWK5 3            
   SPWRKST 3                SPPAYJOB 3               SPNUMJOB 3            
   SPFTPTX 3                SPEARNTY 3               SAMESEX 3             
   CHSUPPOR 3               REACTSLF 3               CHBOTHER 3            
   ACASILANG 3              GENHEALT 3               INCHES 3              
   RWEIGHT 4                BMI 3                    DRWEIGH 3             
   TELLWGHT 3               WGHTSCRN 3               ENGSPEAK 3            
   CASIBIRTH 3              CASILOSS 3               CASIABOR 3            
   CASIADOP 3               NOBEDYR 3                STAYREL 3             
   EVSUSPEN 3               GRADSUSP 3               SMK100 3              
   AGESMK 3                 SMOKE12 3                SMKSTOP 3             
   DRINK12 3                UNIT30D 3                DRINK30D 3            
   DRINKDAY 3               BINGE30 3                DRNKMOST 3            
   BINGE12 3                POT12 3                  COC12 3               
   CRACK12 3                CRYSTMTH12 3             INJECT12 3            
   VAGSEX 3                 AGEVAGR 3                CONDVAG 3             
   WHYCONDL 3               GETORALM 3               GIVORALM 3            
   CONDFELL 3               ANYORAL 3                TIMING 3              
   ANALSEX 3                CONDANAL 3               OPPSEXANY 3           
   OPPSEXGEN 3              CONDSEXL 3               WANTSEX1 3            
   VOLSEX1 3                HOWOLD 3                 GIVNDRUG 3            
   HEBIGOLD 3               ENDRELAT 3               WORDPRES 3            
   THRTPHYS 3               PHYSHURT 3               HELDDOWN 3            
   EVRFORCD 3               AGEFORC1 3               GIVNDRG2 3            
   HEBIGOL2 3               ENDRELA2 3               WRDPRES2 3            
   THRTPHY2 3               PHYSHRT2 3               HELDDWN2 3            
   PARTSLIF_1 4             PARTSLFV 3               PARTSLIF_2 4          
   OPPLIFENUM 4             PARTS12M_1 4             PARTS12V 3            
   PARTS12M_2 4             OPPYEARNUM 4             NEWYEAR 4             
   NEWLIFE 4                VAGNUM12 4               ORALNUM12 4           
   ANALNUM12 4              BISEXPRT 3               NONMONOG 3            
   NNONMONOG1 3             NNONMONOG2 3             NNONMONOG3 3          
   MALSHT12 3               PROSTFRQ 3               JOHNFREQ 3            
   HIVMAL12 3               GIVORALF 3               GETORALF 3            
   FEMSEX 3                 SAMESEXANY 3             FEMPARTS_1 4          
   FEMLIFEV 3               FEMPARTS_2 4             SAMLIFENUM 4          
   FEMPRT12_1 4             FEM12V 3                 FEMPRT12_2 4          
   SAMYEARNUM 4             SAMESEX1 3               FSAMEREL 3            
   MFLASTP 3                ATTRACT 3                ORIENT_A 3            
   ORIENT_B 3               CONFCONC 3               TIMALON 3             
   RISKCHEK1 3              RISKCHEK2 3              RISKCHEK3 3           
   RISKCHEK4 3              CHLAMTST 3               STDOTHR12 3           
   STDTRT12 3               GON 3                    CHLAM 3               
   HERPES 3                 GENWARTS 3               SYPHILIS 3            
   EVRINJECT 3              EVRSHARE 3               EARNTYPE 3            
   EARN 3                   EARNDK1 3                EARNDK2 3             
   EARNDK3 3                EARNDK4 3                TOINCWMY 3            
   TOTINC 3                 FMINCDK1 3               FMINCDK2 3            
   FMINCDK3 3               FMINCDK4 3               FMINCDK5 3            
   PUBASST 3                PUBASTYP1 3              FOODSTMP 3            
   WIC 3                    HLPTRANS 3               HLPCHLDC 3            
   HLPJOB 3                 FREEFOOD 3               HUNGRY 3              
   MED_COST 3               AGER 3                   FMARITAL 3            
   RMARITAL 3               EDUCAT 3                 HIEDUC 3              
   HISPANIC 3               RACE 3                   HISPRACE 3            
   HISPRACE2 3              NUMKDHH 3                NUMFMHH 3             
   HHFAMTYP 3               HHPARTYP 3               NCHILDHH 3            
   HHKIDTYP 3               CSPBBHH 3                CSPBSHH 3             
   CSPOKDHH 3               INTCTFAM 3               PARAGE14 3            
   EDUCMOM 3                AGEMOMB1 3               AGER_I 3              
   FMARITAL_I 3             RMARITAL_I 3             EDUCAT_I 3            
   HIEDUC_I 3               HISPANIC_I 3             RACE_I 3              
   HISPRACE_I 3             HISPRACE2_I 3            NUMKDHH_I 3           
   NUMFMHH_I 3              HHFAMTYP_I 3             HHPARTYP_I 3          
   NCHILDHH_I 3             HHKIDTYP_I 3             CSPBBHH_I 3           
   CSPBSHH_I 3              CSPOKDHH_I 3             INTCTFAM_I 3          
   PARAGE14_I 3             EDUCMOM_I 3              AGEMOMB1_I 3          
   RCURPREG 3               PREGNUM 3                COMPREG 3             
   LOSSNUM 3                ABORTION 3               LBPREGS 3             
   PARITY 3                 BIRTHS5 3                BIRTH1 3              
   OUTCOM01 3               OUTCOM02 3               OUTCOM03 3            
   OUTCOM04 3               OUTCOM05 3               OUTCOM06 3            
   OUTCOM07 3               OUTCOM08 3               OUTCOM09 3            
   OUTCOM10 3               OUTCOM11 3               OUTCOM12 3            
   OUTCOM13 3               OUTCOM14 3               OUTCOM15 3            
   OUTCOM16 3               OUTCOM17 3               OUTCOM18 3            
   OUTCOM19 3               OUTCOM20 3               DATEND01 4            
   DATEND02 4               DATEND03 4               DATEND04 4            
   DATEND05 4               DATEND06 4               DATEND07 4            
   DATEND08 4               DATEND09 4               DATEND10 4            
   DATEND11 4               DATEND12 4               DATEND13 4            
   DATEND14 4               DATEND15 4               DATEND16 4            
   DATEND17 4               DATEND18 4               DATEND19 4            
   DATEND20 4               AGEPRG01 3               AGEPRG02 3            
   AGEPRG03 3               AGEPRG04 3               AGEPRG05 3            
   AGEPRG06 3               AGEPRG07 3               AGEPRG08 3            
   AGEPRG09 3               AGEPRG10 3               AGEPRG11 3            
   AGEPRG12 3               AGEPRG13 3               AGEPRG14 3            
   AGEPRG15 3               AGEPRG16 3               AGEPRG17 3            
   AGEPRG18 3               AGEPRG19 3               AGEPRG20 3            
   DATCON01 4               DATCON02 4               DATCON03 4            
   DATCON04 4               DATCON05 4               DATCON06 4            
   DATCON07 4               DATCON08 4               DATCON09 4            
   DATCON10 4               DATCON11 4               DATCON12 4            
   DATCON13 4               DATCON14 4               DATCON15 4            
   DATCON16 4               DATCON17 4               DATCON18 4            
   DATCON19 4               DATCON20 4               AGECON01 3            
   AGECON02 3               AGECON03 3               AGECON04 3            
   AGECON05 3               AGECON06 3               AGECON07 3            
   AGECON08 3               AGECON09 3               AGECON10 3            
   AGECON11 3               AGECON12 3               AGECON13 3            
   AGECON14 3               AGECON15 3               AGECON16 3            
   AGECON17 3               AGECON18 3               AGECON19 3            
   AGECON20 3               MAROUT01 3               MAROUT02 3            
   MAROUT03 3               MAROUT04 3               MAROUT05 3            
   MAROUT06 3               MAROUT07 3               MAROUT08 3            
   MAROUT09 3               MAROUT10 3               MAROUT11 3            
   MAROUT12 3               MAROUT13 3               MAROUT14 3            
   MAROUT15 3               MAROUT16 3               MAROUT17 3            
   MAROUT18 3               MAROUT19 3               MAROUT20 3            
   RMAROUT01 3              RMAROUT02 3              RMAROUT03 3           
   RMAROUT04 3              RMAROUT05 3              RMAROUT06 3           
   RMAROUT07 3              RMAROUT08 3              RMAROUT09 3           
   RMAROUT10 3              RMAROUT11 3              RMAROUT12 3           
   RMAROUT13 3              RMAROUT14 3              RMAROUT15 3           
   RMAROUT16 3              RMAROUT17 3              RMAROUT18 3           
   RMAROUT19 3              RMAROUT20 3              MARCON01 3            
   MARCON02 3               MARCON03 3               MARCON04 3            
   MARCON05 3               MARCON06 3               MARCON07 3            
   MARCON08 3               MARCON09 3               MARCON10 3            
   MARCON11 3               MARCON12 3               MARCON13 3            
   MARCON14 3               MARCON15 3               MARCON16 3            
   MARCON17 3               MARCON18 3               MARCON19 3            
   MARCON20 3               RMARCON01 3              RMARCON02 3           
   RMARCON03 3              RMARCON04 3              RMARCON05 3           
   RMARCON06 3              RMARCON07 3              RMARCON08 3           
   RMARCON09 3              RMARCON10 3              RMARCON11 3           
   RMARCON12 3              RMARCON13 3              RMARCON14 3           
   RMARCON15 3              RMARCON16 3              RMARCON17 3           
   RMARCON18 3              RMARCON19 3              RMARCON20 3           
   CEBOW 3                  CEBOWC 3                 DATBABY1 4            
   AGEBABY1 3               LASTPREG 3               PREG_INT1 3           
   PREG_INT2 3              PREG_INT3 3              PREG_INT4 3           
   LIVCHILD01 3             LIVCHILD02 3             LIVCHILD03 3          
   LIVCHILD04 3             LIVCHILD05 3             LIVCHILD06 3          
   LIVCHILD07 3             LIVCHILD08 3             LIVCHILD09 3          
   LIVCHILD10 3             LIVCHILD11 3             LIVCHILD12 3          
   LIVCHILD13 3             LIVCHILD14 3             LIVCHILD15 3          
   LIVCHILD16 3             LIVCHILD17 3             LIVCHILD18 3          
   LIVCHILD19 3             LIVCHILD20 3             RCURPREG_I 3          
   PREGNUM_I 3              COMPREG_I 3              LOSSNUM_I 3           
   ABORTION_I 3             LBPREGS_I 3              PARITY_I 3            
   BIRTHS5_I 3              OUTCOM01_I 3             OUTCOM02_I 3          
   OUTCOM03_I 3             OUTCOM04_I 3             OUTCOM05_I 3          
   OUTCOM06_I 3             OUTCOM07_I 3             OUTCOM08_I 3          
   OUTCOM09_I 3             OUTCOM10_I 3             OUTCOM11_I 3          
   OUTCOM12_I 3             OUTCOM13_I 3             OUTCOM14_I 3          
   OUTCOM15_I 3             OUTCOM16_I 3             OUTCOM17_I 3          
   OUTCOM18_I 3             OUTCOM19_I 3             OUTCOM20_I 3          
   DATEND01_I 3             DATEND02_I 3             DATEND03_I 3          
   DATEND04_I 3             DATEND05_I 3             DATEND06_I 3          
   DATEND07_I 3             DATEND08_I 3             DATEND09_I 3          
   DATEND10_I 3             DATEND11_I 3             DATEND12_I 3          
   DATEND13_I 3             DATEND14_I 3             DATEND15_I 3          
   DATEND16_I 3             DATEND17_I 3             DATEND18_I 3          
   DATEND19_I 3             DATEND20_I 3             AGEPRG01_I 3          
   AGEPRG02_I 3             AGEPRG03_I 3             AGEPRG04_I 3          
   AGEPRG05_I 3             AGEPRG06_I 3             AGEPRG07_I 3          
   AGEPRG08_I 3             AGEPRG09_I 3             AGEPRG10_I 3          
   AGEPRG11_I 3             AGEPRG12_I 3             AGEPRG13_I 3          
   AGEPRG14_I 3             AGEPRG15_I 3             AGEPRG16_I 3          
   AGEPRG17_I 3             AGEPRG18_I 3             AGEPRG19_I 3          
   AGEPRG20_I 3             DATCON01_I 3             DATCON02_I 3          
   DATCON03_I 3             DATCON04_I 3             DATCON05_I 3          
   DATCON06_I 3             DATCON07_I 3             DATCON08_I 3          
   DATCON09_I 3             DATCON10_I 3             DATCON11_I 3          
   DATCON12_I 3             DATCON13_I 3             DATCON14_I 3          
   DATCON15_I 3             DATCON16_I 3             DATCON17_I 3          
   DATCON18_I 3             DATCON19_I 3             DATCON20_I 3          
   AGECON01_I 3             AGECON02_I 3             AGECON03_I 3          
   AGECON04_I 3             AGECON05_I 3             AGECON06_I 3          
   AGECON07_I 3             AGECON08_I 3             AGECON09_I 3          
   AGECON10_I 3             AGECON11_I 3             AGECON12_I 3          
   AGECON13_I 3             AGECON14_I 3             AGECON15_I 3          
   AGECON16_I 3             AGECON17_I 3             AGECON18_I 3          
   AGECON19_I 3             AGECON20_I 3             MAROUT01_I 3          
   MAROUT02_I 3             MAROUT03_I 3             MAROUT04_I 3          
   MAROUT05_I 3             MAROUT06_I 3             MAROUT07_I 3          
   MAROUT08_I 3             MAROUT09_I 3             MAROUT10_I 3          
   MAROUT11_I 3             MAROUT12_I 3             MAROUT13_I 3          
   MAROUT14_I 3             MAROUT15_I 3             MAROUT16_I 3          
   MAROUT17_I 3             MAROUT18_I 3             MAROUT19_I 3          
   MAROUT20_I 3             RMAROUT01_I 3            RMAROUT02_I 3         
   RMAROUT03_I 3            RMAROUT04_I 3            RMAROUT05_I 3         
   RMAROUT06_I 3            RMAROUT07_I 3            RMAROUT08_I 3         
   RMAROUT09_I 3            RMAROUT10_I 3            RMAROUT11_I 3         
   RMAROUT12_I 3            RMAROUT13_I 3            RMAROUT14_I 3         
   RMAROUT15_I 3            RMAROUT16_I 3            RMAROUT17_I 3         
   RMAROUT18_I 3            RMAROUT19_I 3            RMAROUT20_I 3         
   MARCON01_I 3             MARCON02_I 3             MARCON03_I 3          
   MARCON04_I 3             MARCON05_I 3             MARCON06_I 3          
   MARCON07_I 3             MARCON08_I 3             MARCON09_I 3          
   MARCON10_I 3             MARCON11_I 3             MARCON12_I 3          
   MARCON13_I 3             MARCON14_I 3             MARCON15_I 3          
   MARCON16_I 3             MARCON17_I 3             MARCON18_I 3          
   MARCON19_I 3             MARCON20_I 3             RMARCON01_I 3         
   RMARCON02_I 3            RMARCON03_I 3            RMARCON04_I 3         
   RMARCON05_I 3            RMARCON06_I 3            RMARCON07_I 3         
   RMARCON08_I 3            RMARCON09_I 3            RMARCON10_I 3         
   RMARCON11_I 3            RMARCON12_I 3            RMARCON13_I 3         
   RMARCON14_I 3            RMARCON15_I 3            RMARCON16_I 3         
   RMARCON17_I 3            RMARCON18_I 3            RMARCON19_I 3         
   RMARCON20_I 3            CEBOW_I 3                CEBOWC_I 3            
   DATBABY1_I 3             AGEBABY1_I 3             LIVCHILD01_I 3        
   LIVCHILD02_I 3           LIVCHILD03_I 3           LIVCHILD04_I 3        
   LIVCHILD05_I 3           LIVCHILD06_I 3           LIVCHILD07_I 3        
   LIVCHILD08_I 3           LIVCHILD09_I 3           LIVCHILD10_I 3        
   LIVCHILD11_I 3           LIVCHILD12_I 3           LIVCHILD13_I 3        
   LIVCHILD14_I 3           LIVCHILD15_I 3           LIVCHILD16_I 3        
   LIVCHILD17_I 3           LIVCHILD18_I 3           LIVCHILD19_I 3        
   LIVCHILD20_I 3           FMARNO 3                 CSPBIOKD 3            
   MARDAT01 4               MARDAT02 4               MARDAT03 4            
   MARDAT04 4               MARDAT05 4               MARDAT06 4            
   MARDIS01 4               MARDIS02 4               MARDIS03 4            
   MARDIS04 4               MARDIS05 4               MARDIS06 4            
   MAREND01 3               MAREND02 3               MAREND03 3            
   MAREND04 3               MAREND05 3               MAREND06 3            
   FMAR1AGE 3               AGEDISS1 3               AGEDD1 3              
   MAR1DISS 3               DD1REMAR 3               MAR1BIR1 4            
   MAR1CON1 4               CON1MAR1 4               B1PREMAR 3            
   COHEVER 3                EVMARCOH 3               PMARRNO 3             
   NONMARR 3                TIMESCOH 3               COHAB1 4              
   COHSTAT 3                COHOUT 3                 COH1DUR 3             
   HADSEX 3                 SEXONCE 3                SEXEVER 3             
   VRY1STAG 3               SEX1AGE 3                VRY1STSX 4            
   DATESEX1 4               SEXMAR 3                 SEX1FOR 3             
   SEXUNION 3               SEXOUT 3                 FPDUR 4               
   PARTS1YR 3               LSEXDATE 4               LSEXPREG 3            
   SEX3MO 3                 NUMP3MOS 3               LSEXRAGE 3            
   PARTDUR1 4               PARTDUR2 4               PARTDUR3 4            
   RELATP1 3                RELATP2 3                RELATP3 3             
   LIFPRTNR 3               FMARNO_I 3               CSPBIOKD_I 3          
   MARDAT01_I 3             MARDAT02_I 3             MARDAT03_I 3          
   MARDAT04_I 3             MARDAT05_I 3             MARDAT06_I 3          
   MARDIS01_I 3             MARDIS02_I 3             MARDIS03_I 3          
   MARDIS04_I 3             MARDIS05_I 3             MARDIS06_I 3          
   MAREND01_I 3             MAREND02_I 3             MAREND03_I 3          
   MAREND04_I 3             MAREND05_I 3             MAREND06_I 3          
   FMAR1AGE_I 3             AGEDISS1_I 3             AGEDD1_I 3            
   MAR1DISS_I 3             DD1REMAR_I 3             MAR1BIR1_I 3          
   MAR1CON1_I 3             CON1MAR1_I 3             B1PREMAR_I 3          
   COHEVER_I 3              EVMARCOH_I 3             PMARRNO_I 3           
   NONMARR_I 3              TIMESCOH_I 3             COHAB1_I 3            
   COHSTAT_I 3              COHOUT_I 3               COH1DUR_I 3           
   HADSEX_I 3               SEXEVER_I 3              VRY1STAG_I 3          
   SEX1AGE_I 3              VRY1STSX_I 3             DATESEX1_I 3          
   SEXONCE_I 3              SEXMAR_I 3               SEX1FOR_I 3           
   SEXUNION_I 3             SEXOUT_I 3               FPDUR_I 3             
   PARTS1YR_I 3             LSEXDATE_I 3             SEXP3MO_I 3           
   NUMP3MOS_I 3             LSEXRAGE_I 3             PARTDUR1_I 3          
   PARTDUR2_I 3             PARTDUR3_I 3             RELATP1_I 3           
   RELATP2_I 3              RELATP3_I 3              LIFPRTNR_I 3          
   STRLOPER 3               FECUND 3                 ANYBC36 3             
   NOSEX36 3                INFERT 3                 ANYBC12 3             
   ANYMTHD 3                NOSEX12 3                SEXP3MO 3             
   CONSTAT1 3               CONSTAT2 3               CONSTAT3 3            
   CONSTAT4 3               PILLR 3                  CONDOMR 3             
   SEX1MTHD1 3              SEX1MTHD2 3              SEX1MTHD3 3           
   SEX1MTHD4 3              MTHUSE12 3               METH12M1 3            
   METH12M2 3               METH12M3 3               METH12M4 3            
   MTHUSE3 3                METH3M1 3                METH3M2 3             
   METH3M3 3                METH3M4 3                FMETHOD1 3            
   FMETHOD2 3               FMETHOD3 3               FMETHOD4 3            
   DATEUSE1 6               OLDWP01 3                OLDWP02 3             
   OLDWP03 3                OLDWP04 3                OLDWP05 3             
   OLDWP06 3                OLDWP07 3                OLDWP08 3             
   OLDWP09 3                OLDWP10 3                OLDWP11 3             
   OLDWP12 3                OLDWP13 3                OLDWP14 3             
   OLDWP15 3                OLDWP16 3                OLDWP17 3             
   OLDWP18 3                OLDWP19 3                OLDWP20 3             
   OLDWR01 3                OLDWR02 3                OLDWR03 3             
   OLDWR04 3                OLDWR05 3                OLDWR06 3             
   OLDWR07 3                OLDWR08 3                OLDWR09 3             
   OLDWR10 3                OLDWR11 3                OLDWR12 3             
   OLDWR13 3                OLDWR14 3                OLDWR15 3             
   OLDWR16 3                OLDWR17 3                OLDWR18 3             
   OLDWR19 3                OLDWR20 3                WANTRP01 3            
   WANTRP02 3               WANTRP03 3               WANTRP04 3            
   WANTRP05 3               WANTRP06 3               WANTRP07 3            
   WANTRP08 3               WANTRP09 3               WANTRP10 3            
   WANTRP11 3               WANTRP12 3               WANTRP13 3            
   WANTRP14 3               WANTRP15 3               WANTRP16 3            
   WANTRP17 3               WANTRP18 3               WANTRP19 3            
   WANTRP20 3               WANTP01 3                WANTP02 3             
   WANTP03 3                WANTP04 3                WANTP05 3             
   WANTP06 3                WANTP07 3                WANTP08 3             
   WANTP09 3                WANTP10 3                WANTP11 3             
   WANTP12 3                WANTP13 3                WANTP14 3             
   WANTP15 3                WANTP16 3                WANTP17 3             
   WANTP18 3                WANTP19 3                WANTP20 3             
   NWWANTRP01 3             NWWANTRP02 3             NWWANTRP03 3          
   NWWANTRP04 3             NWWANTRP05 3             NWWANTRP06 3          
   NWWANTRP07 3             NWWANTRP08 3             NWWANTRP09 3          
   NWWANTRP10 3             NWWANTRP11 3             NWWANTRP12 3          
   NWWANTRP13 3             NWWANTRP14 3             NWWANTRP15 3          
   NWWANTRP16 3             NWWANTRP17 3             NWWANTRP18 3          
   NWWANTRP19 3             NWWANTRP20 3             WANTP5 3              
   STRLOPER_I 3             FECUND_I 3               INFERT_I 3            
   ANYMTHD_I 3              NOSEX12_I 3              SEX3MO_I 3            
   CONSTAT1_I 3             CONSTAT2_I 3             CONSTAT3_I 3          
   CONSTAT4_I 3             PILLR_I 3                CONDOMR_I 3           
   SEX1MTHD1_I 3            SEX1MTHD2_I 3            SEX1MTHD3_I 3         
   SEX1MTHD4_I 3            MTHUSE12_I 3             METH12M1_I 3          
   METH12M2_I 3             METH12M3_I 3             METH12M4_I 3          
   MTHUSE3_I 3              METH3M1_I 3              METH3M2_I 3           
   METH3M3_I 3              METH3M4_I 3              FMETHOD1_I 3          
   FMETHOD2_I 3             FMETHOD3_I 3             FMETHOD4_I 3          
   DATEUSE1_I 3             OLDWP01_I 3              OLDWP02_I 3           
   OLDWP03_I 3              OLDWP04_I 3              OLDWP05_I 3           
   OLDWP06_I 3              OLDWP07_I 3              OLDWP08_I 3           
   OLDWP09_I 3              OLDWP10_I 3              OLDWP11_I 3           
   OLDWP12_I 3              OLDWP13_I 3              OLDWP14_I 3           
   OLDWP15_I 3              OLDWP16_I 3              OLDWP17_I 3           
   OLDWP18_I 3              OLDWP19_I 3              OLDWP20_I 3           
   OLDWR01_I 3              OLDWR02_I 3              OLDWR03_I 3           
   OLDWR04_I 3              OLDWR05_I 3              OLDWR06_I 3           
   OLDWR07_I 3              OLDWR08_I 3              OLDWR09_I 3           
   OLDWR10_I 3              OLDWR11_I 3              OLDWR12_I 3           
   OLDWR13_I 3              OLDWR14_I 3              OLDWR15_I 3           
   OLDWR16_I 3              OLDWR17_I 3              OLDWR18_I 3           
   OLDWR19_I 3              OLDWR20_I 3              WANTRP01_I 3          
   WANTRP02_I 3             WANTRP03_I 3             WANTRP04_I 3          
   WANTRP05_I 3             WANTRP06_I 3             WANTRP07_I 3          
   WANTRP08_I 3             WANTRP09_I 3             WANTRP10_I 3          
   WANTRP11_I 3             WANTRP12_I 3             WANTRP13_I 3          
   WANTRP14_I 3             WANTRP15_I 3             WANTRP16_I 3          
   WANTRP17_I 3             WANTRP18_I 3             WANTRP19_I 3          
   WANTRP20_I 3             WANTP01_I 3              WANTP02_I 3           
   WANTP03_I 3              WANTP04_I 3              WANTP05_I 3           
   WANTP06_I 3              WANTP07_I 3              WANTP08_I 3           
   WANTP09_I 3              WANTP10_I 3              WANTP11_I 3           
   WANTP12_I 3              WANTP13_I 3              WANTP14_I 3           
   WANTP15_I 3              WANTP16_I 3              WANTP17_I 3           
   WANTP18_I 3              WANTP19_I 3              WANTP20_I 3           
   NWWANTRP01_I 3           NWWANTRP02_I 3           NWWANTRP03_I 3        
   NWWANTRP04_I 3           NWWANTRP05_I 3           NWWANTRP06_I 3        
   NWWANTRP07_I 3           NWWANTRP08_I 3           NWWANTRP09_I 3        
   NWWANTRP10_I 3           NWWANTRP11_I 3           NWWANTRP12_I 3        
   NWWANTRP13_I 3           NWWANTRP14_I 3           NWWANTRP15_I 3        
   NWWANTRP16_I 3           NWWANTRP17_I 3           NWWANTRP18_I 3        
   NWWANTRP19_I 3           NWWANTRP20_I 3           WANTP5_I 3            
   FPTIT12 3                FPTITMED 3               FPTITSTE 3            
   FPTITBC 3                FPTITCHK 3               FPTITCBC 3            
   FPTITCST 3               FPTITEC 3                FPTITCEC 3            
   FPTITPRE 3               FPTITABO 3               FPTITPAP 3            
   FPTITPEL 3               FPTITPRN 3               FPTITPPR 3            
   FPTITSTD 3               FPREGFP 3                FPREGMED 3            
   FPTIT12_I 3              FPTITMED_I 3             FPTITSTE_I 3          
   FPTITBC_I 3              FPTITCHK_I 3             FPTITCBC_I 3          
   FPTITCST_I 3             FPTITEC_I 3              FPTITCEC_I 3          
   FPTITPRE_I 3             FPTITABO_I 3             FPTITPAP_I 3          
   FPTITPEL_I 3             FPTITPRN_I 3             FPTITPPR_I 3          
   FPTITSTD_I 3             FPREGFP_I 3              FPREGMED_I 3          
   INTENT 3                 ADDEXP 4                 INTENT_I 3            
   ADDEXP_I 3               ANYPRGHP 3               ANYMSCHP 3            
   INFEVER 3                OVULATE 3                TUBES 3               
   INFERTR 3                INFERTH 3                ADVICE 3              
   INSEM 3                  INVITRO 3                ENDOMET 3             
   FIBROIDS 3               PIDTREAT 3               EVHIVTST 3            
   FPTITHIV 3               ANYPRGHP_I 3             ANYMSCHP_I 3          
   INFEVER_I 3              OVULATE_I 3              TUBES_I 3             
   INFERTR_I 3              INFERTH_I 3              ADVICE_I 3            
   INSEM_I 3                INVITRO_I 3              ENDOMET_I 3           
   FIBROIDS_I 3             PIDTREAT_I 3             EVHIVTST_I 3          
   FPTITHIV_I 3             CURR_INS 3               METRO 3               
   RELIGION 3               LABORFOR 3               CURR_INS_I 3          
   METRO_I 3                RELIGION_I 3             LABORFOR_I 3          
   POVERTY 4                TOTINCR 3                PUBASSIS 3            
   POVERTY_I 3              TOTINCR_I 3              PUBASSIS_I 3          
   SECU 3                   SEST 4                   CMINTVW 4             
   CMLSTYR 4                CMJAN3YR 4               CMJAN4YR 4            
   CMJAN5YR 4 ;

RUN ;

libname ditto 'C:\Users\Christine McWilliams\Documents\Box\ML_Practice';
data ditto.nsfg2015_2017; set work.data1; run;
