syms theta1 theta2 theta3 theta4 theta5 theta6 theta7;
syms theta1dot theta2dot theta3dot theta4dot theta5dot theta6dot theta7dot;
syms pi;

h1=540;
h3=875;
h5=610;
h8=350;
l2=145;

alpha = [ 0 pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0];

a = [0 l2 0 0 0 0 0 0];

d=[h1 0 h3 0 h5 0 0 h8];

var=[theta1 theta2+pi/2 theta3 theta4 theta5 theta6 theta7 0];
vardot=[theta1dot theta2dot theta3dot theta4dot theta5dot theta6dot theta7dot 0];
%Ti=zeros(4,4,8);

for i=1:8

    Ti(:,:,i) =[cos(var(i))               -sin(var(i))               0              a(i)
          sin(var(i))*cos(alpha(i))  cos(var(i))*cos(alpha(i)) -sin(alpha(i)) -sin(alpha(i))*d(i);
          sin(var(i))*sin(alpha(i))  cos(var(i))*sin(alpha(i))  cos(alpha(i))  cos(alpha(i))*d(i);
          0                          0                          0              1 ];
end

    Tn(:,:,1) = Ti(:,:,1);

for i=2:8

    Tn(:,:,i) = Tn(:,:,i-1)*Ti(:,:,i);
    
end


for i=1:8

    P(1,1,i) = Ti(1,4,i);
    P(2,1,i) = Ti(2,4,i);
    P(3,1,i) = Ti(3,4,i);
    
end



     Z=[0;0;1];
     wi(:,:,1) = [0; 0; theta1dot];
     vi(:,:,1)=[0*theta1dot;0*theta1dot;0*theta1dot];
     
     
     for i=2:8
         
      wi(:,:,i) = wkeep(Ti(:,:,i),[3 3])*wi(:,i-1) + vardot(i)*Z;
      vi(:,:,i) = wkeep(Ti(:,:,i),[3 3])*(vi(:,i-1)+cross(wi(:,:,i-1),P(:,:,i)));
     end


%wkeep(Tn(:,:,1),[3 3])%


w0n = wkeep(Tn(:,:,8),[3 3])*wi(:,8);
v0n = wkeep(Tn(:,:,8),[3 3])*vi(:,8);


Jv = [ diff(Tn(1,4,8),theta1dot) diff(Tn(1,4,8),theta2dot) diff(Tn(1,4,8),theta3dot) diff(Tn(1,4,8),theta4dot) diff(Tn(1,4,8),theta5dot) diff(Tn(1,4,8),theta6dot) diff(Tn(1,4,8),theta7dot);
       diff(Tn(2,4,8),theta1dot) diff(Tn(2,4,8),theta2dot) diff(Tn(2,4,8),theta3dot) diff(Tn(2,4,8),theta4dot) diff(Tn(2,4,8),theta5dot) diff(Tn(2,4,8),theta6dot) diff(Tn(2,4,8),theta7dot);
       diff(Tn(3,4,8),theta1dot) diff(Tn(3,4,8),theta2dot) diff(Tn(3,4,8),theta3dot) diff(Tn(3,4,8),theta4dot) diff(Tn(3,4,8),theta5dot) diff(Tn(3,4,8),theta6dot) diff(Tn(3,4,8),theta7dot)];
   
% Jv=[diff(v0n(1,1),theta1dot) diff(v0n(1,1),theta2dot) diff(v0n(1,1),theta3dot) diff(v0n(1,1),theta4dot)...
%     diff(v0n(1,1),theta5dot) diff(v0n(1,1),theta6dot) diff(v0n(1,1),theta7dot);
% 
%     diff(v0n(2,1),theta1dot) diff(v0n(2,1),theta2dot) diff(v0n(2,1),theta3dot) diff(v0n(2,1),theta4dot)...
%     diff(v0n(2,1),theta5dot) diff(v0n(2,1),theta6dot) diff(v0n(2,1),theta7dot);
% 
%     diff(v0n(3,1),theta1dot) diff(v0n(3,1),theta2dot) diff(v0n(3,1),theta3dot) diff(v0n(3,1),theta4dot)...
%     diff(v0n(3,1),theta5dot) diff(v0n(3,1),theta6dot) diff(v0n(3,1),theta7dot)];
Jw=[diff(w0n(1,1),theta1dot) diff(w0n(1,1),theta2dot) diff(w0n(1,1),theta3dot) diff(w0n(1,1),theta4dot)...
    diff(w0n(1,1),theta5dot) diff(w0n(1,1),theta6dot) diff(w0n(1,1),theta7dot);

    diff(w0n(2,1),theta1dot) diff(w0n(2,1),theta2dot) diff(w0n(2,1),theta3dot) diff(w0n(2,1),theta4dot)...
    diff(w0n(2,1),theta5dot) diff(w0n(2,1),theta6dot) diff(w0n(2,1),theta7dot);

    diff(w0n(3,1),theta1dot) diff(w0n(3,1),theta2dot) diff(w0n(3,1),theta3dot) diff(w0n(3,1),theta4dot)...
    diff(w0n(3,1),theta5dot) diff(w0n(3,1),theta6dot) diff(w0n(3,1),theta7dot)];

Jakobiyen = ([Jv; Jw])
