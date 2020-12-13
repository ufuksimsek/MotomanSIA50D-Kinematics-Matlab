clear all; close all; clc;
%% RRP ROBOT ÝLERÝ KÝNEMATÝK


%D-H PARAMETRELERÝ

% teta1 = 10*pi/180; 
% teta2 = 90*pi/180;
% teta3 = 20*pi/180;
% teta4 = -90*pi/180;
% teta5 = 10*pi/180;
% teta6 = 10*pi/180;
% teta7 = 10*pi/180;

h1=0.540;
h3=0.875;
h5=0.610;
h8=0.350;
l2=0.145;

syms teta1 teta2 teta3 teta4 teta5 teta6 teta7 h1 h3 h5 h8 l2 pi;


alpha = [ 0 pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0];

a = [0 l2 0 0 0 0 0 0];

d=[h1 0 h3 0 h5 0 0 h8];

var=[teta1 teta2+pi/2 teta3 teta4 teta5 teta6 teta7 0];
% 
% Ti=zeros(4,4,8);
for i=1:8

    Ti(:,:,i) =[cos(var(i))               -sin(var(i))               0              a(i)
          sin(var(i))*cos(alpha(i))  cos(var(i))*cos(alpha(i)) -sin(alpha(i)) -sin(alpha(i))*d(i);
          sin(var(i))*sin(alpha(i))  cos(var(i))*sin(alpha(i))  cos(alpha(i))  cos(alpha(i))*d(i);
          0                          0                          0              1 ];

end
 
  T(:,:,1)=Ti(:,:,1);
  T(:,:,2)=T(:,:,1)*Ti(:,:,2);
  T(:,:,3)=T(:,:,2)*Ti(:,:,3);
  T(:,:,4)=T(:,:,3)*Ti(:,:,4);
  T(:,:,5)=T(:,:,4)*Ti(:,:,5);
  T(:,:,6)=T(:,:,5)*Ti(:,:,6);
  T(:,:,7)=T(:,:,6)*Ti(:,:,7);
  T(:,:,8)=T(:,:,7)*Ti(:,:,8)


T_vec = [T(1,4,8); T(2,4,8); T(3,4,8) ]


