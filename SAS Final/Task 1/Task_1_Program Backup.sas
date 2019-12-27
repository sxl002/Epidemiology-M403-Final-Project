/***********************************************
NAME: C:\Users\legof\Desktop\M403\SAS Final\Task 1\Task_1_Program
DATE: 12.2.2019
CREATED BY: Stephen Li
PURPOSE: Code for the SAS Final Task 1
***********************************************/

Title1 "Stephen Li (Final)";

libname task1 "C:\Users\legof\Desktop\M403\SAS Final\Task 1";

/* Proc Import Code */
/* Survey Sheet 1 */
PROC IMPORT OUT= TASK1.survey1 
            DATAFILE= "C:\Users\legof\Desktop\M403\SAS Final\STD scores.
xls" 
            DBMS=EXCEL REPLACE;
     RANGE="STDquiz1$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

/* Survey Sheet 2 */
PROC IMPORT OUT= TASK1.SURVEY2 
            DATAFILE= "C:\Users\legof\Desktop\M403\SAS Final\STD scores.
xls" 
            DBMS=EXCEL REPLACE;
     RANGE="STDquiz2$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

/* Survey Sheet 3 */
PROC IMPORT OUT= TASK1.SURVEY3 
            DATAFILE= "C:\Users\legof\Desktop\M403\SAS Final\STD scores.
xls" 
            DBMS=EXCEL REPLACE;
     RANGE="STDquiz3$"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

/* Options */
Option pageno=1;
Option formdlim='-';

/*** Proc Format ***/
Proc Format;
	value answer	0 = 'No'
					1 = 'Yes';
	
	/* Use for step 6 */
	value answer1	1 = 'Yes';
					2 = 'No';

	value quizft	low - 79 = 'Fail'
					80 - high = 'Pass';
Run;

Data task1.survey1permanent;
	set task1.survey1;
	label	id 			= 'ID Number'
			city 		= 'City of Residence'
			age 		= 'Age Group'
			gender 		= 'Gender'
			zipcode 	= 'Zipcode'
			reuse 		= 'Reuses Needles'
			crack 		= 'Smokes crack during sex'
			sex4drugs 	= 'Commercial sex workers'
			anonymous 	= 'Had at least one anonymous sex partner in the past year'
			marijuana 	= 'Has used marijuana during sex in the past year'
			knows 		= 'Knows when someone has STD/HIV'
			syp 		= 'Had syphilis in the past year'
			gc 			= 'Had gonorrhea in the past year'
			chl 		= 'Had chlamydia in the past year'
			hiv 		= 'Has tested positive for HIV'
			quizscore 	= 'Score on STD prevention quiz'
			survdate 	= 'Date student was surveyed'
	;
Run;

Proc Sort data=task1.survey1permanent nodupkey;
	By id;
Run;

Proc Contents data=task1.survey1permanent varnum;
	Title2 "Proc Contents of STDquiz1";
Run;

Data task1.survey2permanent;
	set task1.survey2;
	label	id 			= 'ID Number'
			city 		= 'City of Residence'
			age 		= 'Age Group'
			gender 		= 'Gender'
			zipcode 	= 'Zipcode'
			reuse 		= 'Reuses Needles'
			crack 		= 'Smokes crack during sex'
			sex4drugs 	= 'Commercial sex workers'
			anonymous 	= 'Had at least one anonymous sex partner in the past year'
			marijuana 	= 'Has used marijuana during sex in the past year'
			knows 		= 'Knows when someone has STD/HIV'
			syp 		= 'Had syphilis in the past year'
			gc 			= 'Had gonorrhea in the past year'
			chl 		= 'Had chlamydia in the past year'
			hiv 		= 'Has tested positive for HIV'
			quizscore 	= 'Score on STD prevention quiz'
			survdate 	= 'Date student was surveyed'
	;
Run;

Proc Sort data=task1.survey2permanent nodupkey;
	By id;
Run;

Proc Contents data=task1.survey2permanent varnum;
	Title2 "Proc Contents of STDquiz2";
Run;

Data task1.survey3permanent;
	set task1.survey3;
	label	id 			= 'ID Number'
			city 		= 'City of Residence'
			age 		= 'Age Group'
			gender 		= 'Gender'
			zipcode 	= 'Zipcode'
			reuse 		= 'Reuses Needles'
			crack 		= 'Smokes crack during sex'
			sex4drugs 	= 'Commercial sex workers'
			anonymous 	= 'Had at least one anonymous sex partner in the past year'
			marijuana 	= 'Has used marijuana during sex in the past year'
			knows 		= 'Knows when someone has STD/HIV'
			syp 		= 'Had syphilis in the past year'
			gc 			= 'Had gonorrhea in the past year'
			chl 		= 'Had chlamydia in the past year'
			hiv 		= 'Has tested positive for HIV'
			quizscore 	= 'Score on STD prevention quiz'
			survdate 	= 'Date student was surveyed'
	;
Run;

Proc Sort data=task1.survey3permanent nodupkey;
	By id;
Run;

Proc Contents data=task1.survey3permanent varnum;
	Title2 "Proc Contents of STDquiz3";
Run;


/*** Concatenate Datasets ***/

Data task1.surveyCombined;
	set task1.survey1permanent task1.survey2permanent task1.survey3permanent;
	
	new_date = round(yrdif(survdate,'13DEC2019'D,'actual'),.1);
	

	/* convert city to lower case */
	city = lowcase(city);

	/* Use if then statements for city */
	if city = ' ' then city = 'Missing';
	else if city = 'outside los angeles county' then city = 'Outside Los Angeles County';
	else if city = 'out los angeles county' then city = 'Outside Los Angeles County';
	else if city = 'otside los angeles county' then city = 'Outside Los Angeles County';
	else if city = 'otside la county' then city = 'Outside Los Angeles County';
	else if city = 'otherside la county' then city = 'Outside Los Angeles County';
	else if city ^= 'Outside Los Angeles County' and city ^= 'Missing' then city = 'Los Angeles County';


	/* Get rid of extra characters in age */
	age = compress(age, 'xz');
	if age = '40-49r' then age = '40-49';
	if age = '60-69r' then age = '60-69';

	/* Gender use if then statements */
	/* Note that Women is counted as Female */
	gender = substr(gender, 1, 1);
	if gender = 'M' then gender = 'Male';
	if gender = 'F' then gender = 'Female';
	if gender = 'W' then gender = 'Female';
	if gender = 'K' then gender = '';

	/* Zipcode - first 5 characters */
	zipcode = substr(zipcode,1,5);

	/* Get rid of extra characters in quizscore */
	quizscore = compress(quizscore, 'abcdefghijklmnopqrstuvwxyz#*$-');
	
	/* Get rid of extra characters in reuse--hiv (no numbers for now)*/
	reuse 		= compress(reuse, 'mp');
	crack 		= compress(crack, '*p');
	sex4drugs 	= compress(sex4drugs, 'pq');
	anonymous 	= compress(anonymous, 'lop');
	marijuana 	= compress(marijuana, 'sr');
	knows 		= compress(knows, 'p');
	syp 		= compress(syp, 'p');
	gc 			= compress(gc, 'p');
	chl 		= compress(chl, 'p');
	hiv 		= compress(hiv, 'p');

	/* Convert variables to numeric 
	https://support.sas.com/resources/papers/proceedings/proceedings/sugi30/242-30.pdf
	*/

	/*
	id1 = input(id, 4.);
	zipcode1 = input(zipcode, 5.);
	reuse1 = input(reuse, 2.);
	crack1 = input(crack, 2.);
	sex4drugs1 = input(sex4drugs, 2.);
	anonymous1 = input(anonymous, 2.);
	marijuana1 = input(marijuana, 2.);
	knows1 = input(knows, 2.);
	syp1 = input(syp, 2.);
	gc1 = input(gc, 2.);
	chl1 = input(chl, 2.);
	hiv1 = input(hiv, 2.);
	quizscore1 = input(quizscore, 3.);
	*/

	temp1 = input(id, 4.);
	temp2 = input(zipcode, 5.);
	temp3 = input(reuse, 2.);
	temp4 = input(crack, 2.);
	temp5 = input(sex4drugs, 2.);
	temp6 = input(anonymous, 2.);
	temp7 = input(marijuana, 2.);
	temp8 = input(knows, 2.);
	temp9 = input(syp, 2.);
	temp10 = input(gc, 2.);
	temp11 = input(chl, 2.);
	temp12 = input(hiv, 2.);
	temp13 = input(quizscore, 3.);

	/* Use arrays to recode 7, 8, 9 to missing*/

	Array temp[13] temp1-temp13;
	Do I = 1 to 13;
		If temp[I] = 7 then temp[I] = .;
		If temp[I] = 8 then temp[I] = .;
		If temp[I] = 9 then temp[I] = .;
	End;

	/* Recode 0=no to 2=no */
	If temp3 = 0 then temp3 = 2;
	If temp12 = 0 then temp12 = 2;
	
	/* Rename variables */
	
	id1 = temp1;
	zipcode1 = temp2;
	reuse1 = temp3;
	crack1 = temp4;
	sex4drugs1 = temp5;
	anonymous1 = temp6;
	marijuana1 = temp7;
	knows1 = temp8;
	syp1 = temp9;
	gc1 = temp10;
	chl1 = temp11;
	hiv1 = temp12;
	quizscore1 = temp13;

	Drop I;
	Format  crack1 -- chl1 answer. /*reuse1 hiv1 answer1.*/ survdate WEEKDATE. quizscore1 quizft.;
Run;

Proc Contents data=task1.surveyCombined varnum;
	Title2 "Proc Contents of task1.surveyCombined";
Run;

Proc Freq data=task1.surveyCombined;
	tables ;
Run;

/*
TODO for step 5:

Convert every variable except age, gender, city and surv date to numeric variables
id
zipcode
reuse
crack
sex4drugs
   9 anonymous  Char   2 $2.    $2.      Had at least one anonymous sex partner in the past year
  10 marijuana  Char   2 $2.    $2.      Has used marijuana during sex in the past year
  11 knows      Char   2 $2.    $2.      Knows when someone has STD/HIV
  12 syp        Char   2 $2.    $2.      Had syphilis in the past year
  13 gc         Char   2 $2.    $2.      Had gonorrhea in the past year
  14 chl        Char   2 $2.    $2.      Had chlamydia in the past year
  15 hiv        Char   2 $2.    $2.      Has tested positive for HIV


7. reuse--hiv convert to numeric variables (should be step 6) (avoid removing numbers for now)
*/
