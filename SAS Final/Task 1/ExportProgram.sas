PROC EXPORT DATA= TASK1.SURVEYCOMBINED 
            OUTFILE= "C:\Users\legof\Desktop\M403\SAS Final\Task 1\surve
ycombined.xlsx" 
            DBMS=EXCEL REPLACE;
     SHEET="surveycombined"; 
RUN;
