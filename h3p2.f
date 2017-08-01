C
C This program prints all possible three letter
C sequences involving the five letters: ACETW
C
C First define character string.
      CHARACTER LIST(5)
      INTEGER*4 J,K,L
C 
C
C Define a character array.
C      
      DATA LIST(1),LIST(2),LIST(3),LIST(4),LIST(5)/'A','C','E','T','W'/
C
C Do loops for calculation
C
      DO 10 J=1,5
        DO 20 K=1,5
          DO 30 L=1,5
C
C Write out the result each time.
C
             WRITE(6,*) LIST(J),LIST(K),LIST(L)
   30      CONTINUE 
   20     CONTINUE
   10   CONTINUE
C
C End the program when the loop completes.
C
      STOP
      END

