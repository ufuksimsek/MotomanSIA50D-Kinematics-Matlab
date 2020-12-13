function kinematics_plot(theta1,theta2,theta3,theta4,theta5,theta6,theta7,yon1)

teta1 = theta1*pi/180; 
teta2 = theta2*pi/180;
teta3 = theta3*pi/180;
teta4 = theta4*pi/180;
teta5 = theta5*pi/180;
teta6 = theta6*pi/180;
teta7 = theta7*pi/180;

h1=540;
h3=875;
h5=610;
h8=350;
l2=145;

% syms teta1 teta2 d2 l2 d3 h1;


alpha = [ 0 pi/2 pi/2 -pi/2 pi/2 -pi/2 pi/2 0];

a = [0 l2 0 0 0 0 0 0];

d=[h1 0 h3 0 h5 0 0 h8];

var=[teta1 teta2+pi/2 teta3 teta4 teta5 teta6 teta7 0];

Ti=zeros(4,4,8);
for i=1:8

    Ti(:,:,i) =[cos(var(i))               -sin(var(i))               0              a(i)
          sin(var(i))*cos(alpha(i))  cos(var(i))*cos(alpha(i)) -sin(alpha(i)) -sin(alpha(i))*d(i);
          sin(var(i))*sin(alpha(i))  cos(var(i))*sin(alpha(i))  cos(alpha(i))  cos(alpha(i))*d(i);
          0                          0                          0              1 ];

end

  T(:,:,1)=zeros(4,4);     
  T(:,:,2)=Ti(:,:,1);
  T(:,:,3)=T(:,:,2)*Ti(:,:,2);
  T(:,:,4)=T(:,:,3)*Ti(:,:,3);
  T(:,:,5)=T(:,:,4)*Ti(:,:,4);
  T(:,:,6)=T(:,:,5)*Ti(:,:,5);
  T(:,:,7)=T(:,:,6)*Ti(:,:,6);
  T(:,:,8)=T(:,:,7)*Ti(:,:,7);
  T(:,:,9)=T(:,:,8)*Ti(:,:,8);

for i=1:8

  v1=[T(1,4,i),T(2,4,i),T(3,4,i)];
  v2=[T(1,4,i+1),T(2,4,i+1),T(3,4,i+1)];
  v=[v2;v1];
  
  if i==1
  plot3(v(:,1),v(:,2),v(:,3),'color','r','linewidth',3); hold on;
  plot3(T(1,4,i+1),T(2,4,i+1),T(3,4,i+1),'*')
  end
  if i==2
  plot3(v(:,1),v(:,2),v(:,3),'color','b','linewidth',3); hold on;
  plot3(T(1,4,i+1),T(2,4,i+1),T(3,4,i+1),'*')
  end
  if i==3
  plot3(v(:,1),v(:,2),v(:,3),'color','g','linewidth',3); hold on;
  plot3(T(1,4,i+1),T(2,4,i+1),T(3,4,i+1),'*')
  end
   if i==4
  plot3(v(:,1),v(:,2),v(:,3),'color','r','linewidth',3); hold on;
  plot3(T(1,4,i+1),T(2,4,i+1),T(3,4,i+1),'*')
   end
   if i==5
  plot3(v(:,1),v(:,2),v(:,3),'color','r','linewidth',3); hold on;
  plot3(T(1,4,i+1),T(2,4,i+1),T(3,4,i+1),'*')
   end
   if i==6
  plot3(v(:,1),v(:,2),v(:,3),'color','g','linewidth',3); hold on;
  plot3(T(1,4,i+1),T(2,4,i+1),T(3,4,i+1),'*')
   end
   if i==7
  plot3(v(:,1),v(:,2),v(:,3),'color','r','linewidth',3); hold on;
  plot3(T(1,4,i+1),T(2,4,i+1),T(3,4,i+1),'*')
   end
   if i==8
  plot3(v(:,1),v(:,2),v(:,3),'color','g','linewidth',3); hold on;
  plot3(T(1,4,i+1),T(2,4,i+1),T(3,4,i+1),'*')
  end
  
  
end


hold off;
grid minor;
set(gca,'color',[0.9 0.9 0.9]);

view(yon1,20);

 xlim([-1000 3000])
 ylim([-3000 3000])
 zlim([0 2500])
 xlabel('X','color','r','linewidth',3);
 ylabel('Y','color','r','linewidth',3);
 zlabel('Z','color','r','linewidth',3);


% T_vec = [T(1,4,9), T(2,4,9), T(3,4,9) ];

end