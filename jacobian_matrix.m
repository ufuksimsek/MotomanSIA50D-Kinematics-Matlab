function Jakobiyen = jacobian_matrix(theta1,theta2,theta3,theta4,theta5,theta6,theta7)
%Bu fonksiyon MOTOMAN SIA50D robotunun Jakobiyen matrisinin deðerlerini 
%nümerik olarak hesaplar. Açý Deðerlerini lütfen derece olarak giriniz.
%Örnek Kullaným:
%
%   J_theta =  jacobian_matrix(0,0,0,0,0,0,0)
%


%deðiþkenlerin türevlerinin sembol olarak atanmasý
syms theta1dot theta2dot theta3dot theta4dot theta5dot theta6dot theta7dot;

%derece açý deðerlerinin radyana dönüþümü
 teta1 = theta1*pi/180; 
 teta2 = theta2*pi/180;
 teta3 = theta3*pi/180;
 teta4 = theta4*pi/180;
 teta5 = theta5*pi/180;
 teta6 = theta6*pi/180;
 teta7 = theta7*pi/180;

 
%sistemin link uzunluklarý
h1=540;
h3=875;
h5=610;
h8=350;
l2=145;


%DH Tablosu Deðiþkenleri:
%alpha(i-1)
alpha = [ 0 pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0];

%a(i-1)
a = [0 l2 0 0 0 0 0 0];

%d(i)
d=[h1 0 h3 0 h5 0 0 h8];

%theta(i)
var=[teta1 teta2+pi/2 teta3 teta4 teta5 teta6 teta7 0];

%deðiþkenlerin türevlerini sembolik olarak saklayan vektör
vardot=[theta1dot theta2dot theta3dot theta4dot theta5dot theta6dot theta7dot 0];
%Ti=zeros(4,4,8);



%transformasyon matrislerinin hesaplamasý:
for i=1:8

    Ti(:,:,i) =[cos(var(i))               -sin(var(i))               0              a(i)
          sin(var(i))*cos(alpha(i))  cos(var(i))*cos(alpha(i)) -sin(alpha(i)) -sin(alpha(i))*d(i);
          sin(var(i))*sin(alpha(i))  cos(var(i))*sin(alpha(i))  cos(alpha(i))  cos(alpha(i))*d(i);
          0                          0                          0              1 ];
end

%uç iþlevcinin base'e göre Transformasyon Matrisinin hesaplanmasý

    Tn(:,:,1) = Ti(:,:,1);

for i=2:8

    Tn(:,:,i) = Tn(:,:,i-1)*Ti(:,:,i);
    
end



% Konum Vektörlerinin ayrý bir vektöre atanmasý:
for i=1:8

    P(1,1,i) = Ti(1,4,i);
    P(2,1,i) = Ti(2,4,i);
    P(3,1,i) = Ti(3,4,i);
    
end


%dönme matrisi
     Z=[0;0;1];
%Çizgisel ve Doðrusal Hýzlardan oluþan Jakobiyen Matrisin hesaplanmasý
     wi(:,:,1) = [0; 0; theta1dot];
     vi(:,:,1)=[0*theta1dot;0*theta1dot;0*theta1dot];
     for i=2:8
         
      wi(:,:,i) = wkeep(Ti(:,:,i),[3 3])*wi(:,i-1) + vardot(i)*Z;
      vi(:,:,i) = wkeep(Ti(:,:,i),[3 3])*(vi(:,i-1)+cross(wi(:,:,i-1),P(:,:,i)));
     end
     
     
w0n = wkeep(Tn(:,:,8),[3 3])*wi(:,8);
v0n = wkeep(Tn(:,:,8),[3 3])*vi(:,8);

%matrisi oluþturmak için dot'lý deðiþkenlerden arýndýrýlmasý
Jv=[diff(v0n(1,1),theta1dot) diff(v0n(1,1),theta2dot) diff(v0n(1,1),theta3dot) diff(v0n(1,1),theta4dot)...
    diff(v0n(1,1),theta5dot) diff(v0n(1,1),theta6dot) diff(v0n(1,1),theta7dot);

    diff(v0n(2,1),theta1dot) diff(v0n(2,1),theta2dot) diff(v0n(2,1),theta3dot) diff(v0n(2,1),theta4dot)...
    diff(v0n(2,1),theta5dot) diff(v0n(2,1),theta6dot) diff(v0n(2,1),theta7dot);

    diff(v0n(3,1),theta1dot) diff(v0n(3,1),theta2dot) diff(v0n(3,1),theta3dot) diff(v0n(3,1),theta4dot)...
    diff(v0n(3,1),theta5dot) diff(v0n(3,1),theta6dot) diff(v0n(3,1),theta7dot)];
Jw=[diff(w0n(1,1),theta1dot) diff(w0n(1,1),theta2dot) diff(w0n(1,1),theta3dot) diff(w0n(1,1),theta4dot)...
    diff(w0n(1,1),theta5dot) diff(w0n(1,1),theta6dot) diff(w0n(1,1),theta7dot);

    diff(w0n(2,1),theta1dot) diff(w0n(2,1),theta2dot) diff(w0n(2,1),theta3dot) diff(w0n(2,1),theta4dot)...
    diff(w0n(2,1),theta5dot) diff(w0n(2,1),theta6dot) diff(w0n(2,1),theta7dot);

    diff(w0n(3,1),theta1dot) diff(w0n(3,1),theta2dot) diff(w0n(3,1),theta3dot) diff(w0n(3,1),theta4dot)...
    diff(w0n(3,1),theta5dot) diff(w0n(3,1),theta6dot) diff(w0n(3,1),theta7dot)];


%vektörel ve açýsal hýzlarýn birleþtirilmesi
Jakobiyen = double([Jv; Jw]);
%sýfýra çok yakýn ifadelerin sýfýra eþitlenmesi

for i = 1:6
    for k=1:7
        if Jakobiyen(i,k)<10e-5 & Jakobiyen(i,k)<10e-5
            Jakobiyen(i,k)=0;
        end
    end
end





end