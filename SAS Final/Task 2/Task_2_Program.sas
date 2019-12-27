/***********************************************
NAME: C:\Users\legof\Desktop\M403\SAS Final\Task 2\Task_2_Program.sas
DATE: 12.3.2019
CREATED BY: Stephen Li
PURPOSE: Code for the SAS Final Task 2
***********************************************/

Title1 "Stephen Li (Final)";

libname task2 "C:\Users\legof\Desktop\M403\SAS Final\Task 2";

PROC IMPORT OUT= TASK2.SURVEYDATA 
            DATAFILE="C:\Users\legof\Desktop\M403\SAS Final\Task 2\SAS Survey Data Fall 2019.xlsx"
            DBMS=EXCEL REPLACE;
     RANGE="'Revised Data$'"; 
     GETNAMES=YES;
     MIXED=NO;
     SCANTEXT=YES;
     USEDATE=YES;
     SCANTIME=YES;
RUN;

Option pageno=1;
Option formdlim='-';

/* Proc Format */
Proc Format;
	value	answerft	0 = "No"
						1 = "Yes";

	value	q5ft		1 = "No experience whatsoever"
						2 = "A little experience"
						3 = "Some experience"
						4 = "A good bit of experience"
						5 = "A lot of experience";
Run;

Data task2.data;
	set task2.surveydata;

	/* Labels */
	Label	id		= 'ID Number'
			q3a		= '[Biostatistics 403A] Have you taken any other 
 courses that used SAS as part of the curriculum:'
			q3b		= '[Biostatistics 406] Have you taken any other 
 courses that used SAS as part of the curriculum:'
			q3c		= '[Epidemiology 410] Have you taken any other courses that used SAS as part
 of the curriculum:'
			q3d		= '[Other (specify)] Have you taken any other courses that used SAS as part 
 of the curriculum:'
			q3d1	= 'Written answer for q3d'
			q4a		= '[Statistics/Biostatistics courses] Have you taken any of the following 
 courses?'
			q4b		= '[Epidemiology courses] Have you taken any of the following courses?'
			q4c		= '[Environmental Health courses] Have you taken any of the following 
 courses?'
			q4d		= '[Community Health Science courses] Have you taken any of the following 
 courses?'
			q4e		= '[Health Services courses] Have you taken any of the following courses?'
			q5		= 'How much SAS experience do you have?'
			q6a		= '[8] If you have had experience with SAS, what version(s) have you used?'
			q6b		= '[9.1] If you have had experience with SAS, what version(s) have you used?'
			q6c		= '[9.2] If you have had experience with SAS, what version(s) have you used?'
			q6d		= '[9.3] If you have had experience with SAS, what version(s) have you used?'
			q6e		= '[9.4] If you have had experience with SAS, what version(s) have you used?'
			q6f		= '[9.5] If you have had experience with SAS, what version(s) have you used?'
			q6g		= '[University Edition] If you have had experience with SAS, what version(s)
 have you used?'
			q6h		= '[Enterprise Guide] If you have had experience with SAS, what version(s) 
 have you used?'
			q6i		= '[I have never used SAS before] If you have had experience with SAS, what 
 version(s) have you used?'
			q11a	= '[Friend(s)] Where did you hear about EPID M403?'
			q11b	= '[Graduate advisor(s)] Where did you hear about EPID M403?'
			q11c	= '[Employer(s)] Where did you hear about EPID M403?'
			q11d	= '[Parent(s)] Where did you hear about EPID M403?'
			q11e	= '[Flyer(s)] Where did you hear about EPID M403?'
			q11f	= '[Course requirement] Where did you hear about EPID M403?'
			q11g	= '[Other (Please specify:)] Where did you hear about EPID M403?'
			q11g1	= 'Written answer for q11g'
			q14a	= '[A local health department?] Are you planning to seek employment at...'
			q14b	= '[The Centers for Disease Control and Prevention?] Are you planning to 
 seek employment at...'
			q14c	= '[A pharmaceutical company?] Are you planning to seek employment at...'
			q14d	= '[Community-based organization?] Are you planning to seek employment at...'
			q14e	= '[College/University?] Are you planning to seek employment at...'
			q14f	= '[Other (Please specify:)] Are you planning to seek employment at...'
			q14f1	= 'Written response for q14f'
			q20b	= 'Are you seeking any internships that require you to know SAS?'
			q22a	= '[a] List other courses in data analysis you would like UCLA SPH to offer:'
			q22b	= '[b] List other courses in data analysis you would like UCLA SPH to offer:'
			q22c	= '[c] List other courses in data analysis you would like UCLA SPH to offer:'
			q22d	= '[d] List other courses in data analysis you would like UCLA SPH to offer:'
	;
	Format q3a -- q3d q4a -- q4e q6a -- q11g q14a -- q14f q20b answerft. q5 q5ft.;
Run;

/* Proc Contents */

Proc Contents data=task2.data varnum;
	Title2 "Proc Contents of task2.data";
Run;

/* ODS Frequency Distribution */

ods excel file= "C:\Users\legof\Desktop\M403\SAS Final\Task 2\task2freq.xlsx";

Proc Freq data=task2.data;
	Title2 "Frequency distribution dataset: task2.data";
Run;

ods excel close;
