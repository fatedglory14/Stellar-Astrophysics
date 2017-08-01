C
C2345678901234567890123456789012345678901234567890123456789012
C
C The purpose of this program is to calculate the value of pi
C using 4 different series expansions.  Also, it will show
C the number of iterations needed to get the change between
C subsequent values to < .000005%
C
C
C First we need to declare the variables.
C
      REAL*8 PIA1,PIA2,PIA,PIAC,S,PIE1,PIE2,PIE3,PIE4 
C
C The program will first open a new file for the output table.
C
      OPEN(9,FILE='pi.turner',STATUS='new')
C
C Next, a header will be added.
C
      WRITE(9,1)
    1 FORMAT('          Index |   N-(N-1)   | Value of pi')
C
C BEGIN FIRST SERIES
C
C
C Assign first term in expansion.
C
      PIA1=1.0
C
C First calculation of pi.
C
      DO 10 I=1,500000
        S=I
        PIA2=(2.0*S)+1.0
        PIA=PIA1+(((-1.0)**S)*(1.0/PIA2))
        PIE1=PIA*4
        PIAC=PIA-PIA1
      IF(ABS(PIAC).LT..00000994) GO TO 11
      PIA1=PIA
   10 CONTINUE
C
C Once the condition has been met, the last value is written
C to the file.
C

   11 WRITE(9,2)I,PIAC,PIE1
    2 FORMAT('Series 1:',I6,2X,F10.7,4X,F10.7)
C
C BEGIN SECOND SERIES
C
C
C Assign first term in expansion.
C
      PIA1=1.0
C
C Second calculation of pi.
C
      DO 20 J=1,500000
        S=J
        PIA=PIA1+(1.0/((S+1.0)**2.0))
        PIE2=SQRT(PIA*6.0)
        PIAC=PIA-PIA1
      IF(PIAC.LT..0000000000252) GO TO 21
      PIA1=PIA
   20 CONTINUE
C
C Once the condition has been met, the last value is written
C to the file.
C
   21 WRITE(9,22)J,PIAC,PIE2
   22 FORMAT('Series 2:',I6,2X,F10.7,4X,F10.7)
C
C BEGIN THIRD SERIES
C
C
C Assign first term in expansion.
C
      PIA1=1.0
C
C Third calculation of pi.
C
      DO 30 K=1,500000
        S=K
        PIA2=(2.0*S)+1.0
        PIA=PIA1+(1.0/(PIA2**2.0))
        PIE3=SQRT(PIA*8)
        PIAC=PIA-PIA1
      IF(PIAC.LT..0000000000756) GO TO 31
      PIA1=PIA
   30 CONTINUE
C
C Once the condition has been met, the last value is written
C to the file.
C
   31 WRITE(9,32)K,PIAC,PIE3
   32 FORMAT('Series 3:',I6,2X,F10.7,4X,F10.7)
C
C BEGIN FOURTH SERIES
C
C
C Assign the first term in the expansion.
C
      PIA1=1.0
C
C Fourth calculation of pi.
C
      DO 40 L=1,500000
        S=L
        PIA2=(2.0*S)+1.0
        PIA=PIA1+(1.0/(PIA2**4.0))
        PIE4=(PIA*96.0)**(1.0/4.0)
        PIAC=PIA-PIA1
      IF(PIAC.LT..0000014) GO TO 41
      PIA1=PIA
   40 CONTINUE
C
C Once the condition has been met, the last value is written
C to the file.
C
   41 WRITE(9,42)L,PIAC,PIE4
   42 FORMAT('Series 4:',I6,2X,F10.7,4X,F10.7)
C
C After all the series are complete and the values have been
C written to the file, close the file.
C
      CLOSE(9)
      STOP
      END
C
