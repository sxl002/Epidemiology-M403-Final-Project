/***********************************************
NAME: C:\Users\legof\Desktop\M403\SAS Final\Task 1\surveyimport123.sas
DATE: 12.2.2019
CREATED BY: Stephen Li
PURPOSE: Code for the SAS Final Task 1
***********************************************/

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
