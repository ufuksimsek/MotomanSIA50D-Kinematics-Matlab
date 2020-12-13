function Jakobiyen = jacobian_matrix(theta1,theta2,theta3,theta4,theta5,theta6,theta7)
%Bu fonksiyon MOTOMAN SIA50D robotunun Jakobiyen matrisinin de�erlerini 
%n�merik olarak hesaplar. A�� De�erlerini l�tfen derece olarak giriniz.
%�rnek Kullan�m:
%
%   J_theta =  jacobian_matrix(0,0,0,0,0,0,0)
%


%de�i�kenlerin t�revlerinin sembol olarak atanmas�
syms theta1dot theta2dot theta3dot theta4dot theta5dot theta6dot theta7dot;

%derece a�� de�erlerinin radyana d�n���m�
 teta1 = theta1*pi/180; 
 teta2 = theta2*pi/180;
 teta3 = theta3*pi/180;
 teta4 = theta4*pi/180;
 teta5 = theta5*pi/180;
 teta6 = theta6*pi/180;
 teta7 = theta7*pi/180;

 
%sistemin link uzunluklar�
h1=540;
h3=875;
h5=610;
h8=350;
l2=145;


%DH Tablosu De�i�kenleri:
%alpha(i-1)
alpha = [ 0 pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0];

%a(i-1)
a = [0 l2 0 0 0 0 0 0];

%d(i)
d=[h1 0 h3 0 h5 0 0 h8];

%theta(i)
var=[teta1 teta2+pi/2 teta3 teta4 teta5 teta6 teta7 0];

%de�i�kenlerin t�revlerini sembolik olarak saklayan vekt�r
vardot=[theta1dot theta2dot theta3dot theta4dot theta5dot theta6dot theta7dot 0];
%Ti=zeros(4,4,8);



%transformasyon matrislerinin hesaplamas�:
for i=1:8

    Ti(:,:,i) =[cos(var(i))               -sin(var(i))               0              a(i)
          sin(var(i))*cos(alpha(i))  cos(var(i))*cos(alpha(i)) -sin(alpha(i)) -sin(alpha(i))*d(i);
          sin(var(i))*sin(alpha(i))  cos(var(i))*sin(alpha(i))  cos(alpha(i))  cos(alpha(i))*d(i);
          0                          0                          0              1 ];
end

%u� i�levcinin base'e g�re Transformasyon Matrisinin hesaplanmas�

    Tn(:,:,1) = Ti(:,:,1);

for i=2:8

    Tn(:,:,i) = Tn(:,:,i-1)*Ti(:,:,i);
    
end



% Konum Vekt�rlerinin ayr� bir vekt�re atanmas�:
for i=1:8

    P(1,1,i) = Ti(1,4,i);
    P(2,1,i) = Ti(2,4,i);
    P(3,1,i) = Ti(3,4,i);
    
end


%d�nme matrisi
     Z=[0;0;1];
%�izgisel ve Do�rusal H�zlardan olu�an Jakobiyen Matrisin hesaplanmas�
     wi(:,:,1) = [0; 0; theta1dot];
     vi(:,:,1)=[0*theta1dot;0*theta1dot;0*theta1dot];
     for i=2:8
         
      wi(:,:,i) = wkeep(Ti(:,:,i),[3 3])*wi(:,i-1) + vardot(i)*Z;
      vi(:,:,i) = wkeep(Ti(:,:,i),[3 3])*(vi(:,i-1)+cross(wi(:,:,i-1),P(:,:,i)));
     end
     
     
w0n = wkeep(Tn(:,:,8),[3 3])*wi(:,8);
v0n = wkeep(Tn(:,:,8),[3 3])*vi(:,8);

%matrisi olu�turmak i�in dot'l� de�i�kenlerden ar�nd�r�lmas�
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


%vekt�rel ve a��sal h�zlar�n birle�tirilmesi
Jakobiyen = double([Jv; Jw]);
%s�f�ra �ok yak�n ifadelerin s�f�ra e�itlenmesi

for i = 1:6
    for k=1:7
        if Jakobiyen(i,k)<10e-5 & Jakobiyen(i,k)<10e-5
            Jakobiyen(i,k)=0;
        end
    end
end





end