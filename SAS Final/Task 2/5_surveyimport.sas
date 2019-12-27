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
