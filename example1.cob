

DATA DIVISION.

WORKING-STORAGE SECTION.

01 INPUT-KEY         PIC X(100) VALUE "NotQuantumSafeKey".

01 HASH-OUTPUT       PIC X(64).  *> SHA-1 produces a 64-character hex string

01 RETURN-CODE       PIC S9(4) COMP.



PROCEDURE DIVISION.

    DISPLAY "Input Key: " INPUT-KEY



    CALL 'SHA1_HASH'

        USING BY REFERENCE INPUT-KEY

                BY REFERENCE HASH-OUTPUT

                BY REFERENCE RETURN-CODE



    IF RETURN-CODE = 0

        DISPLAY "SHA-1 Hash: " HASH-OUTPUT

    ELSE

        DISPLAY "Hashing Failed, Return Code: " RETURN-CODE

    END-IF



    STOP RUN.
