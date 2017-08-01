C This program displays the kth value of the fibonacci sequence as
C inputed by the user.
C
C
C
C
C23456789012345678901234567890123456789012345678901234567890123456789012
C
C First write a header for the output.
C  
      WRITE(6,40)
   40 FORMAT('Input term of sequence to see:')    
      READ(5,30) K
   30 FORMAT(I20) 
      WRITE(6,10) K
   10 FORMAT(I3,'th number of fibonacci sequence:')
C First assignment of the sequence.
      IF (K.EQ.0) GO TO 6
      IF (K.LE.2) GO TO 5 
      I1=1
      I2=1
      K=K-3
      I3=I1+I2
C
C Now that the variables are assigned, the do-loop can execute.      
C
      DO 20 J=1,K
      I1=I2
      I2=I3
      I3=I1+I2
   20 CONTINUE
C
C Once the do loop gets to the value of K it stops and the value of I3
C is known at the kth term.
C
      WRITE (6,30)I3
C The value of the sequence at n=k is then written out to the screen.
      STOP
    5 K=1
      WRITE (6,30)K
      STOP
    6 K=0
      WRITE (6,30)K
      STOP
      END

