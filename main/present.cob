       IDENTIFICATION DIVISION.
       PROGRAM-ID. SALUT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 NOM-UTILISATEUR     PIC A(30).
       01 MESSAGE             PIC X(80).

       PROCEDURE DIVISION.
           DISPLAY "Quel est ton prénom ? "
           ACCEPT NOM-UTILISATEUR

           STRING "Enchanté, " DELIMITED BY SIZE
                  NOM-UTILISATEUR DELIMITED BY SPACE
                  " !" DELIMITED BY SIZE
                  INTO MESSAGE

           DISPLAY MESSAGE

           STOP RUN.