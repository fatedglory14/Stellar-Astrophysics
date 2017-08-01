C The purpose of this program is to calculate the evolution of 200 stars
C First we will need to read in the data and apply the intial conditions.
C234567890123456789012345678901234567890123456789012345678901234567890
C
C Declare variables and arrays for the intial conditions and such.
C G is a constant, D is 1 parsec in meters, MSOL is 1 solar mass. 
C
       REAL*8 G,D,MSOL,MAIN(200,7)
       REAL*8 M(200),X(200),Y(200),Z(200),VX(200),VY(200),VZ(200)
       REAL*8 XCH(200),YCH(200),ZCH(200),VXC(200),VYC(200),VZC(200)
       REAL*8 XC,YC,ZC,XSUM,YSUM,ZSUM,MSUM
       REAL*8 AX(200),AY(200),AZ(200)
       REAL*8 LTOT,KETOT,PETOT,ETOT,LTOT1,LTOT2,T
       REAL*8 J,K,L,N,O,P
C
C Now we will use MKS units to define our constants.
C
       G     = 6.674E-11
       MSOL  = 1.99E30
       D     = 3.086E16
C
C Now we can read in the data from the input to create intial conditions.
C
       OPEN(9,FILE='input.txt',STATUS="old")
       READ(9,*)((MAIN(K,L),L=1,7),K=1,200)
C
C Now that the input has been read into a new array we can create the
C intial arrays for each object.
C
C
C First we will make an array of the masses.
C
         DO K=1,200
           M(K)=MAIN(K,1)
         END DO
C
C Now we will make an array of the intial positions.
C
         DO L=1,200
           X(L)=MAIN(L,2)
           Y(L)=MAIN(L,3)
           Z(L)=MAIN(L,4)
         END DO
C
C Now we will make an array of the intial velocities.
C
         DO J=1,200
          VX(J)=MAIN(J,5)
          VY(J)=MAIN(J,6)
          VZ(J)=MAIN(J,7)
         END DO
C
C Now that all of the intial arrays have been created we will transform
C to the center of mass frame to do the calculations.
C
       CLOSE (9)
C     
C First we need to convert the values to MKS to calculate.
C
       DO K=1,200
         M(K)=MSOL*M(K)
         X(K)=D*X(K)
         Y(K)=D*Y(K)
         Z(K)=D*Z(K)
        VX(K)=1000*VX(K)
        VY(K)=1000*VY(K)
        VZ(K)=1000*VZ(K)
       END DO
C
C Set the intial values.
C
       MSUM=0
       XSUM=0
       YSUM=0
       ZSUM=0
C
C Now we can calculate these sums.
C
       DO N=1,200
         MSUM = MSUM + M(N)
         XSUM = XSUM + (M(N)*X(N))
         YSUM = YSUM + (M(N)*Y(N))
         ZSUM = ZSUM + (M(N)*Z(N))
       END DO
C
C Now we can calculate the center of mass.
C
       XC = XSUM/MSUM
       YC = YSUM/MSUM
       ZC = ZSUM/MSUM
C
C Now we can translate the original coordinates to CM.
C
       DO O=1,200
        X(O) = X(O) - XC
        Y(O) = Y(O) - YC
        Z(O) = Z(O) - ZC
       END DO
C
C For this program we will assume the Vcm = 0 intially.
C
C Next we will calculate the total angular momentum and
C energy for the system at the intial time step.
C
       LTOT = 0
       KETOT = 0
       PETOT = 0
       ETOT = 0
C
C Now we can calculate the total energy and momentum, which
C turns out is not necessary until a few timesteps have pass.
C This was good for making sure the data was read correctly.
C
C23456789012345678901234567890123456789012345678901234567890123
C       DO L=1,200
C        KETOT = KETOT + .5*(M(L)*(VX(L)**2.+VY(L)**2.+VZ(L)**2
C     g.))
C       END DO
C       DO J=1,200
C        DO N=J+1,200
C        PETOT = PETOT + (-G)*((M(J)*M(N)/((X(J)-X(N))**2.+(Y(J
C     g)-Y(N))**2.+(Z(J)-Z(N))**2.)**.5))
C        END DO
C       END DO
C        ETOT = KETOT + PETOT
C       DO O=1,200
C        LTOT = LTOT + ((M(O)*(Y(O)*VZ(O)-Z(O)*VY(O)))**2.+(M(O
C     g)*(Z(O)*VX(O)-X(O)*VZ(O)))**2.+(M(O)*(X(O)*VY(O)-Y(O)*VX
C     g(O)))**2.)**.5
C       END DO 
C
C Debugging Line:
C
C       WRITE(6,*) ETOT,LTOT
C
C Now that the total energy and angular momentum has been
C calculated, we can calculate the acceleration for each star.
C
       DO L=1,200
         DO 10 J=1,200
         IF (J.EQ.L) GO TO 10
         AX(L) = AX(L)+G*M(J)*(X(J)-X(L))/((X(J)-X(L))**2.+(Y(
     gJ)-Y(L))**2.+(Z(J)-Z(L))**2.)**1.5
         AY(L) = AY(L)+G*M(J)*(Y(J)-Y(L))/((X(J)-X(L))**2.+(Y(
     gJ)-Y(L))**2.+(Z(J)-Z(L))**2.)**1.5
         AZ(L) = AZ(L)+G*M(J)*(Z(J)-Z(L))/((X(J)-X(L))**2.+(Y(
     gJ)-Y(L))**2.+(Z(J)-Z(L))**2.)**1.5
   10    CONTINUE
       END DO
C
C Now that the acceleration for each star has been calculated
C we can run some time steps to settle the system.
C
C First, we will open 5 files to write the data for each step.
C
        OPEN(10, FILE='star1.txt',STATUS='new')
        OPEN(11, FILE='star2.txt',STATUS='new')
        OPEN(12, FILE='star3.txt',STATUS='new')
        OPEN(13, FILE='star4.txt',STATUS='new')
        OPEN(14, FILE='star5.txt',STATUS='new')
C
C Make a header for each file.
C
       WRITE(10,*) 'Mass 1 =',M(1)
       WRITE(10,*) ('X-Position Y-Position  Z-Position  X-Velocity  Y-Ve
     glocity  Z-Velocity')
       WRITE(11,*) 'Mass 50 =',M(50)
       WRITE(11,*) ('X-Position Y-Position  Z-Position  X-Velocity  Y-Ve
     glocity  Z-Velocity')
       WRITE(12,*) 'Mass 100 =',M(100)
       WRITE(12,*) ('X-Position Y-Position  Z-Position  X-Velocity  Y-Ve
     glocity  Z-Velocity')
       WRITE(13,*) 'Mass 150 =',M(150)
       WRITE(13,*) ('X-Position Y-Position  Z-Position  X-Velocity  Y-Ve
     glocity  Z-Velocity')
       WRITE(14,*) 'Mass 200 =',M(200)
       WRITE(14,*) ('X-Position Y-Position  Z-Position  X-Velocity  Y-Ve
     glocity  Z-Velocity')
C
C Now that we have a file to write into, we can begin the loop.
C This will cause 50,000 years to happen each loop.  We will
C run the first 5 to let the system settle.
C
       DO L=0,5
          T=L*1.6E12
C
C Now we will calculate the new positions and velocities.
C
        DO N=1,200
          X(N)=X(N)+VX(N)*T+.5*AX(N)*T**2.
          Y(N)=Y(N)+VY(N)*T+.5*AY(N)*T**2.
          Z(N)=Z(N)+VZ(N)*T+.5*AZ(N)*T**2.
          VX(N)=VX(N)+AX(N)*T
          VY(N)=VY(N)+AY(N)*T
          VZ(N)=VZ(N)+AZ(N)*T
        END DO
C
C Now we need to calculate the new accelerations before
C starting the next time step.
C
        DO K=1,200
          DO 11 J=1,200
          IF (K.EQ.J) GO TO 11
         AX(K) = AX(K)+G*M(J)*(X(J)-X(K))/((X(J)-X(K))**2.+(Y(
     gJ)-Y(K))**2.+(Z(J)-Z(K))**2.)**1.5
         AY(K) = AY(K)+G*M(J)*(Y(J)-Y(K))/((X(J)-X(K))**2.+(Y(
     gJ)-Y(K))**2.+(Z(J)-Z(K))**2.)**1.5
         AZ(K) = AZ(K)+G*M(J)*(Z(J)-Z(K))/((X(J)-X(K))**2.+(Y(
     gJ)-Y(K))**2.+(Z(J)-Z(K))**2.)**1.5
   11    CONTINUE
        END DO
C
C End of time step.
C
       END DO
C
C Now we will calculate the total angular momentum of the
C system in the settled coordinates.
C
        DO O=1,200
        LTOT = LTOT + ((M(O)*(Y(O)*VZ(O)-Z(O)*VY(O)))**2.+(M(O
     g)*(Z(O)*VX(O)-X(O)*VZ(O)))**2.+(M(O)*(X(O)*VY(O)-Y(O)*VX
     g(O)))**2.)**.5
        END DO
C
C After 5 time steps we can begin the convergence now that the
C values have settled a little bit.
C   
       DO L=6,200
          T=L*1.6E12
C
C Now we need to run the loop to see what the angular momentum 
C will be after the next step for scaling purposes.
C
C
C Now we will calculate the new positions and velocities for 
C scaling purposes.
C
        DO N=1,200
          XCH(N)=X(N)+VX(N)*T+.5*AX(N)*T**2.
          YCH(N)=Y(N)+VY(N)*T+.5*AY(N)*T**2.
          ZCH(N)=Z(N)+VZ(N)*T+.5*AZ(N)*T**2.
          VXC(N)=VX(N)+AX(N)*T
          VYC(N)=VY(N)+AY(N)*T
          VZC(N)=VZ(N)+AZ(N)*T
        END DO
C
C Then calculate the new angular momentum at this timestep.
C
        DO O=1,200
        LTOT1 = LTOT1 + ((M(O)*(YCH(O)*VZC(O)-ZCH(O)*VYC(O)))
     g**2.+(M(O)*(ZCH(O)*VXC(O)-XCH(O)*VZC(O)))**2.+(M(O)*(XC
     gH(O)*VYC(O)-YCH(O)*VXC(O)))**2.)**.5
        END DO
C
C Now we can calculate the fractional change in LTOT.
C
             LTOT2 = (LTOT1 - LTOT) / LTOT
C
C Debugging Line:
C
C             WRITE(6,*) LTOT2
C
C Use this value to recalculate intial positions and velocities
C within a tolerance.
C
C-----------------EQUATION NEEDS REVISING?---------------------C
C
        DO P=1,200
         X(P)=X(P)+VX(P)*(1+1E-6*L)*T+.5*AX(P)*(1+1E-6*L)*T**2.
         Y(P)=Y(P)+VY(P)*(1+1E-6*L)*T+.5*AY(P)*(1+1E-6*L)*T**2.         
         Z(P)=Z(P)+VZ(P)*(1+1E-6*L)*T+.5*AZ(P)*(1+1E-6*L)*T**2.
         VX(P)=VX(P)+AX(P)*(1+1E-6*L)*T
         VY(P)=VY(P)+AY(P)*(1+1E-6*L)*T
         VZ(P)=VZ(P)+AZ(P)*(1+1E-6*L)*T
C
C Write these results into a file to use for orbital paths.
C
         WRITE(10,5) X(1),Y(1),Z(1),VX(1),VY(1),VZ(1)
         WRITE(11,5) X(50),Y(50),Z(50),VX(50),VY(50),VZ(50)
         WRITE(12,5) X(100),Y(100),Z(100),VX(100),VY(100),VZ(100)
         WRITE(13,5) X(150),Y(150),Z(150),VX(150),VY(150),VZ(150)
         WRITE(14,5) X(200),Y(200),Z(200),VX(200),VY(200),VZ(200)
    5    FORMAT(E10.4,2X,E10.4,2X,E10.4,2X,E10.4,2X,E10.4,2X,E10.4)
        END DO
C
C Now we can reset the angular momentum for the next timestep.
C
       LTOT = LTOT2
C
C Now we need to calculate the new accelerations before
C starting the next time step.
C
        DO K=1,200
          DO 12 J=1,200
          IF (K.EQ.J) GO TO 12
         AX(K) = AX(K)+G*M(J)*(X(J)-X(K))/((X(J)-X(K))**2.+(Y(
     gJ)-Y(K))**2.+(Z(J)-Z(K))**2.)**1.5
         AY(K) = AY(K)+G*M(J)*(Y(J)-Y(K))/((X(J)-X(K))**2.+(Y(
     gJ)-Y(K))**2.+(Z(J)-Z(K))**2.)**1.5
         AZ(K) = AZ(K)+G*M(J)*(Z(J)-Z(K))/((X(J)-X(K))**2.+(Y(
     gJ)-Y(K))**2.+(Z(J)-Z(K))**2.)**1.5
   12    CONTINUE
        END DO
C
C End of time step.
C
        END DO
        CLOSE(10)
        CLOSE(11)
        CLOSE(12)
        CLOSE(13)
        CLOSE(14)
      STOP
      END

