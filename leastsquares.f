C This program calculates the least squares fit to a line
C given data from a file.
C
C First we should define the identifiers and dimension
C arrays.
C
      parameter(max=100000)
      real*8 x(max),y(max),sigy(max),weight
      real*8 a,b,sig_a,sig_b,delta,sum,sum_x,sum_y,sum_xy,sum_x2,sum_y2
      integer*4 i,n
      character*40 fname
C
C Read in the data with open
C
      write(6,*)'Enter the filename of the data:'
      read(5,10) fname
   10 format(a40)
      open(10,file=fname,status='old')
      do i=1,max
         read(10,*,end=60)x(i),y(i),sigy(i)
      end do
   60 close(10)
C
C When we run out of data we know how many data points
C we have; assign to n.
C
      n=i-1
C
C Intialize the sum by assigning 0 to each.
C
      sum=0
      sum_x=0
      sum_y=0
      sum_x2=0
      sum_y2=0
      sum_xy=0
C
C Accumulate the sums.
C
      do i=1,n
         weight=1.0/sigy(i)**2
         sum   = sum + weight
         sum_x = sum_x + weight * x(i)
         sum_y = sum_y + weight * y(i)
         sum_x2= sum_x2 + weight*(x(i)**2.)
         sum_y2= sum_y2 + weight*(y(i)**2.)
         sum_xy= sum_xy + weight* x(i)* y(i)
      end do
C
C Calculate the coefficients and error.
C
      delta=sum*sum_x2-sum_x**2
      a    =(sum_x2*sum_y-sum_x*sum_xy)/delta
      b    =(sum*sum_xy-sum_x*sum_y)/delta
      sig_a=sqrt(sum_x2/delta)
      sig_b=sqrt(sum/delta)
C
C Write out the results.
C
      write(6,70)a,sig_a,b,sig_b
   70 format(3X,'a = ',f10.3,' +/- ',f10.3,5X,
     2          'b = ',f10.3,' +/- ',f10.3)
      stop
      end

