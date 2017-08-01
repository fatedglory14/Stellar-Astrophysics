C Name: Andrew Turner
C For this program I worked with Thomas.
C
C First we'll define the values.
      integer*4 n(301)
      real*8 sum,G,msol,x,f
C Define Constants.
      G = 6.674E-11
      msol=1.99E30
      x=1.E6 * 1000    
C we first create a do loop for an array of 301 masses
      do 10 i=1,301
      if (i.le.151) then 
         n(i)=i
      else
         n(i)=302-i
      endif
   10 continue
C      
C as for part(b) the net gravitational force that #151 feels is 0, since its left and right side provided gravitational forces of the same magnitude but in opposite directions. 
C now we create a program to read a typed-in mass number to get its net gravitational force calculated
      write(6,20)'please provide a mass number'
   20 format(a25)
      read(5,21)num
   21 format(i10)
      sum=0
      write(6,31)'position','mass at position','gravitational force'
   31 format(a8,3x,a15,3x,a20)

C we then create a do loop to calculate the gravitational force due to each other mass
      j1=0
      do 30 j=2,301
   29 j1=j1+1
C the mass of the i-th 
c      m=n(j)
c      m=m*1.98855E30
c the mass of the selected 
c      num=n(num)
c      num=num*1.99E30
c the position of the ith 
c      mj=j
c      disj=j*1.496E11
C the position of the selected 
c      mnum=num
c      disn=num*1.496E11
      dist=(j1-num)*x
c gravitational force caused by the ith mass
      m1=n(num)
      m2=n(j1)
      p1=num*x
      p2=j1*x
      xm1=m1
      xm2=m2
c      write(6,34)m1,m2,p1,p2,(p2-p1)**2
c   34 format(5e13.5)   
c      ndist=(p2-p1)**2
c      xdis=ndist
      if (j1.eq.num) then
         go to 29
      else
         go to 28
      endif
   28 f=msol**2*(G*m1*m2/(((j1-num)*x)**2))
c      mg2=mg*6.67E-11
      write(6,35)j1,m2,f
   35 format(i10,3x,i10,3x,e12.5)   
c      mg=((6.67408E-11)*(n(j)*1.99E30)*(n(num)*1.99E30))/(ndist**2)
      sum=sum+f
c      write(6,33)j,x,xnum,xj,pnum
c   33 format(i10,3x,e12.5,3x,e13.5,3x,e13.5,3x,e13.5)
c      write(6,32)j,n(j),mg
c   32 format(i10,3x,e12.5,3x,e13.5)
   30 continue      
      write(6,36)'the total gravitational force is',sum
   36 format(a30,e12.5)   
C now we need to calculate the speed and position of each and every mass after one day
C it's good to hear that the acceleration doesn't change during the day, otherwise it would be too complex
      a=sum/(xm1*msol)
      v=a*24*60*60
      p=((0.5*a*(24*60*60)**2)/x)
      write(6,38)a,v,num,p
   38 format(2e12.5,2f10.4)   
c      write(6,37)'after one day the object is located at',p,'with speed', v
c   37 format(a38,f10.4,a10,e12.5) 
      stop
      end
C the mass that gives the biggest gravitational force must be the closest one, because as distance increase, the denominator will decrease by a factor of square, while the number only increases by 1 for each of the next mass. 

