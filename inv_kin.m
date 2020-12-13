function inv_kin(px,py,pz)
syms teta1 teta2 teta3 teta4 teta5 teta6 teta7;

var=[teta1 teta2 0 teta4 teta5 teta6 teta7];

T = simplify(transformation_matrix(var(1),var(2),var(3),var(4),var(5),var(6),var(7)));

%%
%roll pitch ve yaw deðerlerinin rotasyon matrisine dönüþümü:
% r11 = cosd(alfa)*cosd(beta); 
% r12 = cosd(alfa)*sind(beta)*sind(gamma)-sind(alfa)*sind(gamma); 
% r13 = cosd(alfa)*sind(beta)*cosd(gamma)+sind(alfa)*sind(gamma);
% r21 = sind(alfa)*cosd(beta);
% r22 = sind(alfa)*sind(beta)*sind(gamma)+cosd(alfa)*cosd(gamma); 
% r23 = sind(alfa)*sind(beta)*cosd(gamma)-cosd(alfa)*sind(gamma);
% r31 = -sind(beta); 
% r32 = cosd(beta)*sind(gamma); 
% r33 = cosd(beta)*cosd(gamma);
%syms r11 r12 r13 r21 r22 r23 r31 r32 r33 ;

T07input = [ 0  0 1 px;
             0 -1 0 py;
             1  0 0 pz;
             0  0 0 1  ];
         
Tinv1 = simplify(inv(T(:,:,1)));
left1 = simplify(Tinv1*T07input);

T17 = simplify(T(:,:,2)*T(:,:,3)*T(:,:,4)*T(:,:,5)*T(:,:,6)*T(:,:,7));

denk1  =simplify(left1(1:3,4)-T17(1:3,4));
cozum1 =double(solve(denk1(2),teta1));
theta1  =cozum1(2);
T = simplify(transformation_matrix(theta1,var(2),var(3),var(4),var(5),var(6),var(7)));

T27 = simplify(T(:,:,3)*T(:,:,4)*T(:,:,5)*T(:,:,6)*T(:,:,7));
Tinv2 = simplify(inv(T(:,:,1)*T(:,:,2)));
left2 = simplify(Tinv2*T07input);
denk2 = simplify(left2(1:3,4)-T27(1:3,4));

cozum2 = solve(denk2(1),denk2(2),teta2,teta4);
theta2 = double(cozum2.teta2(1));
theta3 = 0;
theta4 = double(cozum2.teta4(1));

T = simplify(transformation_matrix(theta1,theta2,theta3,theta4,var(5),var(6),var(7)));

T57   = simplify(T(:,:,5)*T(:,:,6)*T(:,:,7));
Tinv3 = simplify(inv(T(:,:,1)*T(:,:,2)*T(:,:,3)*T(:,:,4)));
left3 = simplify(Tinv3*T07input);
denk3 = simplify(left3-T57);
cozum3 = double(solve(denk3(2,3),teta6));
theta6 = cozum3(2);

T = simplify(transformation_matrix(theta1,theta2,theta3,theta4,var(5),theta6,var(7)));

T57   = simplify(T(:,:,5)*T(:,:,6)*T(:,:,7));
Tinv3 = simplify(inv(T(:,:,1)*T(:,:,2)*T(:,:,3)*T(:,:,4)));
left3 = simplify(Tinv3*T07input);
denk3 = simplify(left3-T57);

cozum4 = solve(denk3(1,1),denk3(3,1),teta5,teta7);
theta5 = cozum4.teta5(2);
theta7 = cozum4.teta7(2);
q1 = theta1*180/pi
q2 = theta2*180/pi
q3 = theta3*180/pi
q4 = theta4*180/pi
q5 = theta5*180/pi
q6 = theta6*180/pi
q7 = theta7*180/pi



kinematics_plot(theta1,theta2,theta3,theta4,theta5,theta6,theta7)