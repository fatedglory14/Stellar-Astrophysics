C This program converts any three-digit number provided 
C interactively by the user into words. Taking advantage
C of integer arithmetic.
C 
C Make declaration of variables.
C
      INTEGER*4 NUM3,IHUN,ITEN,IONE
      CHARACTER*5 AHUN,ATEN,AONE
C
C Promt user to input three-digit number.
C
      WRITE(6,10)
   10 FORMAT(2X,'Enter a three-digit number:')
      READ(5,12)NUM3
   12 FORMAT(I3)
C
C First it will separate out each digit into an integer
C identifier.  Then, it will assign the corresponding
C word to a character identifier.
C
      IHUN=NUM3/100
      ITEN=((NUM3-(100*IHUN))/10)
      IONE=(NUM3-(100*IHUN)-(10*ITEN))
C
C Call values from the subroutine to assign words.
C
      CALL WORD(IHUN,AHUN)
      CALL WORD(ITEN,ATEN)
      CALL WORD(IONE,AONE)
C
C Write out the resulting words corresponding to the numbers.
C
      WRITE(6,30) AHUN,ATEN,AONE
   30 FORMAT(3A5)
      STOP
      END
C
C Create a subroutine to call for the words.
C
      SUBROUTINE WORD(DIGI,A)
      INTEGER*4 DIGI
      CHARACTER*5 A,ARRAY(10)
      DATA (ARRAY(I),I=1,10)/'zero','one','two','three','four','five',
     g'six','seven','eight','nine'/
      IF(DIGI.EQ.0) A=ARRAY(1)
      IF(DIGI.EQ.1) A=ARRAY(2)
      IF(DIGI.EQ.2) A=ARRAY(3)
      IF(DIGI.EQ.3) A=ARRAY(4)
      IF(DIGI.EQ.4) A=ARRAY(5)
      IF(DIGI.EQ.5) A=ARRAY(6)
      IF(DIGI.EQ.6) A=ARRAY(7)
      IF(DIGI.EQ.7) A=ARRAY(8)
      IF(DIGI.EQ.8) A=ARRAY(9)
      IF(DIGI.EQ.9) A=ARRAY(10)
      END 

