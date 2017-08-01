C This program takes in three numbers and prints the number and the 
C individual words for each number with slashes.
C
C
C
C23456789012345678901234567890123456789012345678901234567890123456789012
C
C First write a header for the output.
C  
C Enter a three digit number.
      WRITE(6,10)
   10 FORMAT('Enter a three digit number:')      
      READ(5,20) I1
   20 FORMAT(I3)
C Calculation of the value of hundreds, tens, and ones places.
      IH=I1/100
      IT=(I1-(IH*100))/10
      IO=I1-(IH*100)-(IT*10)
C Now that the values of each place have been identified use IF
C statements to assign words to each number.
C Format statements for write out.
   11 FORMAT('zero')
    1 FORMAT('one')
    2 FORMAT('two')
    3 FORMAT('three')
    4 FORMAT('four')
    5 FORMAT('five')
    6 FORMAT('six')
    7 FORMAT('seven')
    8 FORMAT('eight')
    9 FORMAT('nine')

C Statements for the hundreds place
      IF(IH.EQ.0) WRITE(6,11)
      IF(IH.EQ.1) WRITE(6,1)
      IF(IH.EQ.2) WRITE(6,2)
      IF(IH.EQ.3) WRITE(6,3)
      IF(IH.EQ.4) WRITE(6,4)
      IF(IH.EQ.5) WRITE(6,5)
      IF(IH.EQ.6) WRITE(6,6)
      IF(IH.EQ.7) WRITE(6,7)
      IF(IH.EQ.8) WRITE(6,8)
      IF(IH.EQ.9) WRITE(6,9)
C Statements for the ten's place
      IF(IT.EQ.0) WRITE(6,11)
      IF(IT.EQ.1) WRITE(6,1)
      IF(IT.EQ.2) WRITE(6,2)
      IF(IT.EQ.3) WRITE(6,3)
      IF(IT.EQ.4) WRITE(6,4)
      IF(IT.EQ.5) WRITE(6,5)
      IF(IT.EQ.6) WRITE(6,6)
      IF(IT.EQ.7) WRITE(6,7)
      IF(IT.EQ.8) WRITE(6,8)
      IF(IT.EQ.9) WRITE(6,9)
C Statements for the one's place
      IF(IO.EQ.0) WRITE(6,11)
      IF(IO.EQ.1) WRITE(6,1)
      IF(IO.EQ.2) WRITE(6,2)
      IF(IO.EQ.3) WRITE(6,3)
      IF(IO.EQ.4) WRITE(6,4)
      IF(IO.EQ.5) WRITE(6,5)
      IF(IO.EQ.6) WRITE(6,6)
      IF(IO.EQ.7) WRITE(6,7)
      IF(IO.EQ.8) WRITE(6,8)
      IF(IO.EQ.9) WRITE(6,9)
      STOP
      END
