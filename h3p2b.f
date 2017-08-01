C This program is the same as program a except it
C will only include combinations with vowels, A,E
C
      CHARACTER LIST(5)
      INTEGER*4 J,K,L
C
C Define a character array
C
      DATA LIST(1),LIST(2),LIST(3),LIST(4),LIST(5)/'A','C','E','T','W'/
C
C Do loops for calculation
C
      DO 10 J=1,5
          DO 20 K=1,5
             DO 30 L=1,5
C
C Set conditions for writing.
C

             IF(K.EQ.1.OR.K.EQ.3) GO TO 5
             IF(J.EQ.1.OR.J.EQ.3) GO TO 5
             IF(L.EQ.1.OR.L.EQ.3) GO TO 5
             GO TO 30
C
C Write out when the condition is met.
C
   5        WRITE(6,*) LIST(J),LIST(K),LIST(L)
   30     CONTINUE
   20   CONTINUE
   10 CONTINUE
C
C End the program when the loop completes.
C
      STOP
      END
