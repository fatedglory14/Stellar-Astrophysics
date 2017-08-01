C This program computes the are of 100 rectangles.  The sides of the rectangles
C are self-generated, and are equal to the integers from 1 to 100, and twice 1 to 100.
C (Identifiers I and 2*I hold this infor; Identifier IARE is assigned to the area.)
C The results are written to the screen (device 6).
C
C First, write a header for the output Table.
C
C2345678901234567890123456789012345789012345678901234567890123456789012
C
      WRITE(6,9)
    9 FORMAT(5X,'SIDE1 SIDE2 AREA')
      DO 10 I=1,100
C
C Compute the area of the rectangle.
C
         IARE=I*(2*I)
C
C Write out the result to the screen.
C
         WRITE(6,11)I,2*I,IARE
   11    FORMAT(6X,2(I3,3X),I5)
   10 CONTINUE
      STOP
      END
