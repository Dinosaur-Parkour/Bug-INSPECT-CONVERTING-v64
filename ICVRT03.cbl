       CBL OPT(2)
       IDENTIFICATION DIVISION.
    3  PROGRAM-ID.   ICVRT03.
      *  Inspect Converting  EBCDIC to ASCII    BUG!!!!

    6  ENVIRONMENT DIVISION.
    7  INPUT-OUTPUT SECTION.

    9  DATA DIVISION.
   10   FILE SECTION.

   12  WORKING-STORAGE SECTION.


   15  01  Spaces-To-Underscore.
   16      05 SPACES-10       PIC X(10) Value X'40000102030405060708'.
   17      05 Under-Scores-10 PIC X(10) Value X'6D6D6D6D6D6D6D6D6D6D'.
      *
   19      05 SPACES-17       PIC X(17) Value X'40000102030405060708090A
   20 -        '0B0C0D0E0F'.
   21      05 Under-Scores-17 PIC X(17) Value X'6D6D6D6D6D6D6D6D6D6D6D6D
   22 -        '6D6D6D6D6D'.

   24  01  DOC-01.
   25      05 PIC X(50)
   26      Value '123456789*123456789*123456789*123456789*123456789*'.
   27      05 PIC X(50)
   28      Value 'The quick Fox jumped over the lazy dog!           '.
   29      05 PIC X(50)
   30      Value 'Humpty Dumpty sat on a wall,                      '.
   31      05 PIC X(50)
   32      Value 'Humpty Dumpty had a great fall;                   '.
   33      05 PIC X(50)
   34      Value "All the King's horses                             ".
   35      05 PIC X(50)
   36      Value "And All the King's men,                           ".
   37      05 PIC X(50)
   38      Value "Couldn't put Humpty together again.               ".
   39      05 PIC X(50)
   40      Value '-                                                 '.
   41      05 PIC X(50)
   42      Value 'Star Light. Star Bright.  First Star I see in the '.
   43      05 PIC X(50)
   44      Value 'sky tonight!                                      '.
   45      05 PIC X(50)
   46      Value 'This is the last line in the Some-data.           '.

   48  01  DOC-05   PIC X(550).


   51  LINKAGE SECTION.

   53  PROCEDURE DIVISION.
   54      Call 'A31BR14A' Using Doc-01
   55      Move Doc-01 to Doc-05
   56      Inspect Doc-05   Converting SPACES-10 to Under-Scores-10
   57      Display '10: ' doc-05 (1 : 200)

   59      Display ' '
   60      Call 'A31BR14A' Using Doc-01
   61      Move Doc-01 to Doc-05
   62      Inspect Doc-05   Converting SPACES-17 to Under-Scores-17
   63      Display '17: ' doc-05 (1 : 200)

   65      GOBACK.



