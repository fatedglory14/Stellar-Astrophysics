C This program will read in a file and sort the numbers from 
C smallest to largest and consequently write the sorted
C list to a new file in a set of 5 columns.
C
C Define variables for assignment.
C
      REAL*4 NUM(1000000,5),A1,A2,A3,A4,A5,NLOW
      REAL*4 KCH,LCH,KCH2,LCH2,LINE,K,L,J
      REAL*4 NUMS(1000000,5)

C Open the file first to read the amount of lines.
C

      OPEN(9,FILE='1_data.txt',STATUS='old')
      OPEN(10,FILE='array.txt',STATUS='new')
C
C Read the file and determine the number of elements.
C Then the number of elements is specified for the array.
C
      LINE=0
      DO WHILE (1.EQ.1)
         READ(9,*,END=20) A1,A2,A3,A4,A5
         LINE=LINE+1
      END DO    
   20 CLOSE(9)
C
C
C Now that the number of lines is known.  Create an array for the
C file to be writen into.
C          
      OPEN(9,FILE='1_data.txt',STATUS='old')
      READ(9,*)((NUM(K,L),L=1,5),K=1,LINE)
C
C Now that original array has been created.  The numbers will
C be sorted into a new array.
C
        DO 50 L=1,5
              DO 51 K=1,LINE
C
C Assign the first value as the lowest.
C
           NLOW=NUM(K,L)
C
C Find the lowest number in the array.
C
                  DO 52 KCH=1,LINE
                      DO 53 LCH=1,5
                          IF(NLOW.GE.NUM(KCH,LCH)) GO TO 10
                          GO TO 53
   10                     NLOW=NUM(KCH,LCH)
                          KCH2=KCH
                          LCH2=LCH
   53                 CONTINUE
   52             CONTINUE
C
C Reassign the number such that it doesn't get found again.
C
            NUM(KCH2,LCH2)=1000000
C
C Assign the lowest number to position K,L.
C
            NUMS(K,L)=NLOW         
C
C Find the next lowest number.
C
   51         CONTINUE
   50   CONTINUE
C
C Write the columns of the assorted array to the new file.
C
   16 DO J=1,LINE
       WRITE(10,30) NUMS(J,1),NUMS(J,2),NUMS(J,3),NUMS(J,4),NUMS(J,5)
   30 FORMAT(5F12.3)
      END DO
C      
C Close files and end program.
C
      CLOSE(9)
      CLOSE(10)
      STOP
      END
C
C
C

