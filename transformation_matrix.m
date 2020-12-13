function T08 = transformation_matrix(theta1,theta2,theta3,theta4,theta5,theta6,theta7)
%Bu fonksiyon girilen theta deðerleri için MOTOMAN SIA50d robotunun
%uç iþlevcisinin T08(Uç iþlevcisinin Base'e göre transformasyon matrisi)'ni
%çýkýþ olarak verir. Açýlarý derece cinsinden giriniz.
%
%Örnek Kullaným:
%    T = transformasyon_matrix(0,0,0,0,0,0,0);




%derece açý deðerlerinin radyana dönüþümü
teta1 = theta1*pi/180; 
teta2 = theta2*pi/180;
teta3 = theta3*pi/180;
teta4 = theta4*pi/180;
teta5 = theta5*pi/180;
teta6 = theta6*pi/180;
teta7 = theta7*pi/180;


%link uzunluklarý
h1=540;
h3=875;
h5=610;
h8=350;
l2=145;


%DH tablosu deðerleri
%alpha(i-1)
alpha = [ 0 pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0];

%a(i-1)
a = [0 l2 0 0 0 0 0 0];

%d(i)
d=[h1 0 h3 0 h5 0 0 h8];

%theta(i)
var=[teta1 teta2+pi/2 teta3 teta4 teta5 teta6 teta7 0];

Ti=zeros(4,4,8);



%Transformasyon Matrislerinin Hesaplanmasý:
for i=1:8

    Ti(:,:,i) =[cos(var(i))               -sin(var(i))               0              a(i)
          sin(var(i))*cos(alpha(i))  cos(var(i))*cos(alpha(i)) -sin(alpha(i)) -sin(alpha(i))*d(i);
          sin(var(i))*sin(alpha(i))  cos(var(i))*sin(alpha(i))  cos(alpha(i))  cos(alpha(i))*d(i);
          0                          0                          0              1 ];

end


%Uç iþlevcinin Transformasyon Matrisinin hesaplanmasý:
  T(:,:,1)=zeros(4,4);     
  T(:,:,2)=Ti(:,:,1);
  T(:,:,3)=T(:,:,2)*Ti(:,:,2);
  T(:,:,4)=T(:,:,3)*Ti(:,:,3);
  T(:,:,5)=T(:,:,4)*Ti(:,:,4);
  T(:,:,6)=T(:,:,5)*Ti(:,:,5);
  T(:,:,7)=T(:,:,6)*Ti(:,:,6);
  T(:,:,8)=T(:,:,7)*Ti(:,:,7);
  T08     =T(:,:,8)*Ti(:,:,8);
  
  
  
%10^-10'dan küçük deðerlerin 0 olarak kabul edilmesi:
  for i=1:4
  for j=1:4
  if -1.0e-10<T08(i,j) & T08(i,j)<1.0e-10
  T08(i,j)=0;
  end
  end
  
  end