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
