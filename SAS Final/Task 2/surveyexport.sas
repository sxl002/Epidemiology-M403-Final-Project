PROC EXPORT DATA= TASK2.SURVEYDATA 
            OUTFILE= "C:\Users\legof\Desktop\M403\SAS Final\Task 2\surve
ydata.xlsx" 
            DBMS=EXCEL REPLACE;
     SHEET="surveydata"; 
RUN;
