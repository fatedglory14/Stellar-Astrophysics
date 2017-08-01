C This program calculates the value of e up to 7 significant
C digits and displays each of the subsequent calculations.
C Including: index, kth term, kth-(k-1)th, e.
C
C
C
C23456789012345678901234567890123456789012345678901234567890123456789012
C
C Create a file to write the values into.
C
      OPEN(10, FILE='e.turner',STATUS="new")
C
C Create a header for the file.
C
      WRITE(10,*)'| Index  | Tolerance | Value of e'
C
C Assignment of first terms
C
      E1 = 1.0
      E0 = 1.0
C 
C Assignment of Index
C 
      DO 10 I=1,100
C
C Assignent of first value of e.
C 
      E0 = E0*I
      E  = E1+(1.0/E0)
      ED = E-E1
      IF(ED.LT..000005) GO TO 30
C
C After the loop is completed and the condition is not met, the values
C are written into the file.
C
    5 WRITE(10,20)I,ED,E
   20 FORMAT(I6,4X,F10.7,4X,F10.7)
      E1=E
   10 CONTINUE
C
C Once the condition has been met the last value is written to the file
C
   30 WRITE(10,20)I,ED,E
C
C Since writing to the file has stopped the file is then closed.
C
      CLOSE(10)
      STOP
      END

