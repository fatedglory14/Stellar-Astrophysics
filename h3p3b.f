C This program converts any three-digit number provided 
C interactively by the user into words. Taking advantage
C of integer arithmetic.
C 
C Assign declarations for the variables.
C
      INTEGER*8 J,D(12),I(12),NUM12     
      CHARACTER*7 A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12
C
C Ask for a twelve digit number.
C
      WRITE(6,10)
   10 FORMAT(2X,'Enter a twelve-digit number:')
      READ(5,*)NUM12
C
C First it will separate out each digit into an integer
C identifier within each array.  Then, it will assign the 
C corresponding word to a character identifier.
C
      I(12)=NUM12     
      D(12)=NUM12/(10**11)
          DO J=12,2,-1
          I(J-1)=I(J)-D(J)*10**(J-1)
          D(J-1)=I(J-1)/10**(J-2)
         ENDDO
C
C Use the subroutine to call the words for the values.
C
      CALL WORD(D(12),A12)
      CALL WORD(D(11),A11)
      CALL WORD(D(10),A10)
      CALL WORD(D(9),A9)
      CALL WORD(D(8),A8)
      CALL WORD(D(7),A7)
      CALL WORD(D(6),A6)
      CALL WORD(D(5),A5)
      CALL WORD(D(4),A4)
      CALL WORD(D(3),A3)
      CALL WORD(D(2),A2)
      CALL WORD(D(1),A1)
C
C Write out the resulting words in sequential order.
C
      WRITE(6,60) A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1
   60 FORMAT(12A7) 
      STOP
      END
C
C Create a subroutine to call for the words.
C
      SUBROUTINE WORD(DIGI,A)
      INTEGER*8 DIGI
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

