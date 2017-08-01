C The purpose of this program is to determine the force exterted
C on mass 1 of a set of 301 masses with corresponding distances.
C
C First we need to declare the variables used.
C
      integer*4 N,MASS(301)
      real*4 D,R,M,G,FORCE(301),SUM
C
C Now we need to define the constants used for the calculation.
C R is the scale factor for the distance and G is the Gravitational
C constant.
C
      R=1E9
      G=6.67428E-11
C
C Now we will open a file to write the output into.
C
      OPEN(9,FILE='h7p3output.txt',STATUS='new')
C
C Now we will format the file for data input with a header.
C
      WRITE(9,10)'POSITION','MASS','FORCE'
   10 FORMAT(A8,2X,A4,2X,A5)
C
C Next we will assign the mass value to each of the masses
C in units of solar masses.
C
      DO N=1,150
         MASS(N)=N
      ENDDO
         MASS(151)=151
      DO N=301,152,-1
         MASS(N)=302-n
      ENDDO
C
C Next we will calculate the force exerted on the first mass.
C
      SUM=0
      WRITE(9,11)'1','1','-'
   11 FORMAT(2X,A1,9X,A1,4X,A1)
      DO N=2,301
         M=N
         D=(M-1.0)*R
         FORCE(N)=G*((MASS(1)*1.99E30)*(MASS(N)*1.99E30))/(D**2)
         SUM=SUM+FORCE(N)
         WRITE(9,12)N,MASS(N),FORCE(N)
   12    FORMAT(I3,7X,I3,3X,E14.5)
      ENDDO
C
C Now we need to write out the sum of the forces exerted on Mass 1.
C
      WRITE(9,13)
   13 FORMAT('The sum of forces exerted on Mass 1 is:',3X,E14.5)
C
C Close the file and end the program.
C
      CLOSE(9)
      STOP
      END

