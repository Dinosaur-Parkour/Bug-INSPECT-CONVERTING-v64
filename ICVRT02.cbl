       CBL OPT(2)
       IDENTIFICATION DIVISION.
    3  PROGRAM-ID.   ICVRT02.
      *  Inspect Converting  EBCDIC to ASCII    BUG!!!!

    6  ENVIRONMENT DIVISION.
    7  INPUT-OUTPUT SECTION.

    9  DATA DIVISION.
   10   FILE SECTION.

   12  WORKING-STORAGE SECTION.

   14  01  EBCDIC-Set-01  PIC  X(89)  Value
   15         X'F0F1F2F3F4F5F6F7F8F9818283848586878889919293949596979899
   16 -        'A2A3A4A5A6A7A8A9C1C2C3C4C5C6C7C8C9D1D2D3D4D5D6D7D8D9E2E3
   17 -        'E4E5E6E7E8E9404B4C4D4E4F505A5B5C5D5E60616D6E6F7A7B7C7D7E
   18 -        '7FE0C0D06B'.

   20  01  ASCII-Set-01   PIC  X(89)  Value
   21         X'303132333435363738396162636465666768696A6B6C6D6E6F707172
   22 -        '737475767778797A4142434445464748494A4B4C4D4E4F5051525354
   23 -        '55565758595A202E3C282B21265D242A293B2D1A5F3E3F3A2340273D
   24 -        '225C7B7D2C'.


   27  01  INSPECT-05-LEVELS.
   28      05 EBCDIC-Set-05 PIC  X(89)  Value
   29         X'F0F1F2F3F4F5F6F7F8F9818283848586878889919293949596979899
   30 -        'A2A3A4A5A6A7A8A9C1C2C3C4C5C6C7C8C9D1D2D3D4D5D6D7D8D9E2E3
   31 -        'E4E5E6E7E8E9404B4C4D4E4F505A5B5C5D5E60616D6E6F7A7B7C7D7E
   32 -        '7FE0C0D06B'.

   34      05 ASCII-Set-05  PIC  X(89)  Value
   35         X'303132333435363738396162636465666768696A6B6C6D6E6F707172
   36 -        '737475767778797A4142434445464748494A4B4C4D4E4F5051525354
   37 -        '55565758595A202E3C282B21265D242A293B2D1A5F3E3F3A2340273D
   38 -        '225C7B7D2C'.


   41  01  DOC-01.
   42      05 PIC X(50)
   43      Value '123456789*123456789*123456789*123456789*123456789*'.
   44      05 PIC X(50)
   45      Value 'The quick Fox jumped over the lazy dog!           '.
   46      05 PIC X(50)
   47      Value 'Humpty Dumpty sat on a wall,                      '.
   48      05 PIC X(50)
   49      Value 'Humpty Dumpty had a great fall;                   '.
   50      05 PIC X(50)
   51      Value "All the King's horses                             ".
   52      05 PIC X(50)
   53      Value "And All the King's men,                           ".
   54      05 PIC X(50)
   55      Value "Couldn't put Humpty together again.               ".
   56      05 PIC X(50)
   57      Value '- - - - - - - - - - - - - - - - - - - - - - - - - '.
   58      05 PIC X(50)
   59      Value 'Star Light. Star Bright.  First Star I see in the '.
   60      05 PIC X(50)
   61      Value 'sky tonight!                                      '.
   62      05 PIC X(50)
   63      Value 'This is the last line in the Some-data.           '.

   65  01  DOC-05   PIC X(550).


   68  LINKAGE SECTION.

   70  PROCEDURE DIVISION.
   71      Perform Show-OPTIMIZE-Level
   72      Move Doc-01 to Doc-05
   73      Call 'A31BR14A' Using Doc-01, Doc-05

      *    The following Inspect uses  01 levels for EBCDIC and ASCII
   76      Inspect Doc-01   Converting EBCDIC-SET-01 to ASCII-SET-01

      *    The following Inspect uses  05 levels for EBCDIC and ASCII
   79      Inspect Doc-05   Converting EBCDIC-SET-05 to ASCII-SET-05

   81      If Doc-01 = Doc-05
   82         Display 'Doc-01 equal to Doc-05'
   83      Else
   84         Display 'There is a problem....'
   85         Display '   Doc 01 and 05 are NOT equal'
   86      End-If

   88      Display ' '
   89      Display 'Doc 01 ========================================='
   90      Display doc-01 (1 : 300)
   91      Display ' '
   92      Display ' '
   93      Display 'Doc 05 ========================================='
   94      Display doc-05 (1 : 300)
   95      GOBACK.



   99  Show-OPTIMIZE-Level.
  100  >>Evaluate  IGY-OPTIMIZE
  101    >>When 0
  102      Display 'Optimization level is: 0 - Non-Optimized'
  103    >>When 1
  104      Display 'Optimization level is: 1 - Some Optimization'
  105    >>When 2
  106      Display 'Optimization level is: 2 - Full Optimization'
  107    >>When Other
  108      Display 'Optimization level is: Unknown'
  109  >> End-Evaluate
  110      exit.
