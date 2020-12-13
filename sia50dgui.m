function varargout = sia50dgui(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sia50dgui_OpeningFcn, ...
                   'gui_OutputFcn',  @sia50dgui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

%Gui açýlýþýnda yapýlan iþlemler:
function sia50dgui_OpeningFcn(hObject, ~, handles, varargin)
set(handles.theta1_text,'Value',str2double(get(handles.theta1_text,'String')));
set(handles.slider1,'Value',str2double(get(handles.theta1_text,'String')));

%sýfýr konumu için 3 boyutlu çizdirme iþlemi:
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
%%sýfýr konumu için uç iþlevcinin transformasyon matrisinin yazdýrýlmasý:           
T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
            

%Static Text'lere transfer matrisi deðerlerinin gönderilmesi
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));
%Static Text'lere Jakobiyeb Matrisi deðerlerinin gönderilmesi
jak = jacobian_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.j11,'String',num2str(jak(1,1)));
set(handles.j12,'String',num2str(jak(1,2)));
set(handles.j13,'String',num2str(jak(1,3)));
set(handles.j14,'String',num2str(jak(1,4)));
set(handles.j15,'String',num2str(jak(1,5)));
set(handles.j16,'String',num2str(jak(1,6)));
set(handles.j17,'String',num2str(jak(1,7)));

set(handles.j21,'String',num2str(jak(2,1)));
set(handles.j22,'String',num2str(jak(2,2)));
set(handles.j23,'String',num2str(jak(2,3)));
set(handles.j24,'String',num2str(jak(2,4)));
set(handles.j25,'String',num2str(jak(2,5)));
set(handles.j26,'String',num2str(jak(2,6)));
set(handles.j27,'String',num2str(jak(2,7)));

set(handles.j31,'String',num2str(jak(3,1)));
set(handles.j32,'String',num2str(jak(3,2)));
set(handles.j33,'String',num2str(jak(3,3)));
set(handles.j34,'String',num2str(jak(3,4)));
set(handles.j35,'String',num2str(jak(3,5)));
set(handles.j36,'String',num2str(jak(3,6)));
set(handles.j37,'String',num2str(jak(3,7)));

set(handles.j41,'String',num2str(jak(4,1)));
set(handles.j42,'String',num2str(jak(4,2)));
set(handles.j43,'String',num2str(jak(4,3)));
set(handles.j44,'String',num2str(jak(4,4)));
set(handles.j45,'String',num2str(jak(4,5)));
set(handles.j46,'String',num2str(jak(4,6)));
set(handles.j47,'String',num2str(jak(4,7)));

set(handles.j51,'String',num2str(jak(5,1)));
set(handles.j52,'String',num2str(jak(5,2)));
set(handles.j53,'String',num2str(jak(5,3)));
set(handles.j54,'String',num2str(jak(5,4)));
set(handles.j55,'String',num2str(jak(5,5)));
set(handles.j56,'String',num2str(jak(5,6)));
set(handles.j57,'String',num2str(jak(5,7)));

set(handles.j61,'String',num2str(jak(6,1)));
set(handles.j62,'String',num2str(jak(6,2)));
set(handles.j63,'String',num2str(jak(6,3)));
set(handles.j64,'String',num2str(jak(6,4)));
set(handles.j65,'String',num2str(jak(6,5)));
set(handles.j66,'String',num2str(jak(6,6)));
set(handles.j67,'String',num2str(jak(6,7)));


handles.output = hObject;

guidata(hObject, handles);


function varargout = sia50dgui_OutputFcn(~, ~, handles) 

varargout{1} = handles.output;



function theta1_text_Callback(~, ~, handles)
   
set(handles.theta1_text,'Value',str2double(get(handles.theta1_text,'String')));
set(handles.slider1,'Value',str2double(get(handles.theta1_text,'String')));
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
            T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));

   


function theta1_text_CreateFcn(hObject, ~, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta2_text_Callback(~, eventdata, handles)
set(handles.theta2_text,'Value',str2double(get(handles.theta2_text,'String')));
set(handles.slider2,'Value',str2double(get(handles.theta2_text,'String')));
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));
 


function theta2_text_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta3_text_Callback(hObject, eventdata, handles)
set(handles.theta3_text,'Value',str2double(get(handles.theta3_text,'String')));
set(handles.slider3,'Value',str2double(get(handles.theta3_text,'String')));
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));


function theta3_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta4_text_Callback(hObject, eventdata, handles)
set(handles.theta4_text,'Value',str2double(get(handles.theta4_text,'String')));
set(handles.slider4,'Value',str2double(get(handles.theta4_text,'String')));
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));



function theta4_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta5_text_Callback(hObject, eventdata, handles)
set(handles.theta5_text,'Value',str2double(get(handles.theta5_text,'String')));
set(handles.slider5,'Value',str2double(get(handles.theta5_text,'String')));
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));
 


function theta5_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta6_text_Callback(hObject, eventdata, handles)
set(handles.theta6_text,'Value',str2double(get(handles.theta6_text,'String')));
set(handles.slider6,'Value',str2double(get(handles.theta6_text,'String')));
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));



function theta6_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta7_text_Callback(hObject, eventdata, handles)
set(handles.theta7_text,'Value',str2double(get(handles.theta7_text,'String')));
set(handles.slider7,'Value',str2double(get(handles.theta7_text,'String')));
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));




function theta7_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton1_Callback(hObject, eventdata, handles)



function slider1_Callback(hObject, eventdata, handles)
sliderValue = get(handles.slider1,'Value');
set(handles.theta1_text,'String',num2str(sliderValue));
set(handles.theta1_text,'Value',sliderValue);
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
            
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));



function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider1_ButtonDownFcn(hObject, eventdata, handles)



function slider2_Callback(hObject, eventdata, handles)
sliderValue = get(handles.slider2,'Value');
set(handles.theta2_text,'String',num2str(sliderValue));
set(handles.theta2_text,'Value',sliderValue);
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
            
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));



function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function slider3_Callback(hObject, eventdata, handles)
sliderValue = get(handles.slider3,'Value');
set(handles.theta3_text,'String',num2str(sliderValue));
set(handles.theta3_text,'Value',sliderValue);
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
            
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));




function slider3_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function slider4_Callback(hObject, eventdata, handles)
sliderValue = get(handles.slider4,'Value');
set(handles.theta4_text,'String',num2str(sliderValue));
set(handles.theta4_text,'Value',sliderValue);
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));





function slider4_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function slider5_Callback(hObject, eventdata, handles)
sliderValue = get(handles.slider5,'Value');
set(handles.theta5_text,'String',num2str(sliderValue));
set(handles.theta5_text,'Value',sliderValue);
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));



            
function slider5_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function slider6_Callback(hObject, eventdata, handles)
sliderValue = get(handles.slider6,'Value');
set(handles.theta6_text,'String',num2str(sliderValue));
set(handles.theta6_text,'Value',sliderValue);
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));




function slider6_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function slider7_Callback(hObject, eventdata, handles)
sliderValue = get(handles.slider7,'Value');
set(handles.theta7_text,'String',num2str(sliderValue));
set(handles.theta7_text,'Value',sliderValue);
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));



function slider7_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
set(handles.theta1_text,'String','0');
set(handles.theta1_text,'Value',0);
set(handles.theta2_text,'String','90');
set(handles.theta2_text,'Value',90);
set(handles.theta3_text,'String','0');
set(handles.theta3_text,'Value',0);
set(handles.theta4_text,'String','-90');
set(handles.theta4_text,'Value',-90);
set(handles.theta5_text,'String','0');
set(handles.theta5_text,'Value',0);
set(handles.theta6_text,'String','0');
set(handles.theta6_text,'Value',0);
set(handles.theta7_text,'String','0');
set(handles.theta7_text,'Value',0);

set(handles.slider1,'Value',0);
set(handles.slider2,'Value',90);
set(handles.slider3,'Value',0);
set(handles.slider4,'Value',-90);
set(handles.slider5,'Value',0);
set(handles.slider6,'Value',0);
set(handles.slider7,'Value',0);

kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
             T08 = transformation_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
set(handles.r11,'String',num2str(T08(1,1)));
set(handles.r12,'String',num2str(T08(1,2)));
set(handles.r13,'String',num2str(T08(1,3)));
set(handles.r14,'String',num2str(T08(1,4)));
set(handles.r21,'String',num2str(T08(2,1)));
set(handles.r22,'String',num2str(T08(2,2)));
set(handles.r23,'String',num2str(T08(2,3)));
set(handles.r24,'String',num2str(T08(2,4)));
set(handles.r31,'String',num2str(T08(3,1)));
set(handles.r32,'String',num2str(T08(3,2)));
set(handles.r33,'String',num2str(T08(3,3)));
set(handles.r34,'String',num2str(T08(3,4)));
set(handles.r41,'String',num2str(T08(4,1)));
set(handles.r42,'String',num2str(T08(4,2)));
set(handles.r43,'String',num2str(T08(4,3)));
set(handles.r44,'String',num2str(T08(4,4)));




% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider12_Callback(hObject, eventdata, handles)
% hObject    handle to slider12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider13_Callback(hObject, eventdata, handles)
% hObject    handle to slider13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider14_Callback(hObject, eventdata, handles)
% hObject    handle to slider14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(~, ~, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider15_Callback(hObject, eventdata, handles)
% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider16_Callback(hObject, eventdata, handles)
% hObject    handle to slider16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider16_CreateFcn(hObject, ~, handles)
% hObject    handle to slider16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider17_Callback(hObject, eventdata, handles)
% hObject    handle to slider17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider18_Callback(hObject, eventdata, handles)
% hObject    handle to slider18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider19_Callback(hObject, eventdata, handles)
% hObject    handle to slider19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider20_Callback(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider21_Callback(hObject, eventdata, handles)
% hObject    handle to slider21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
winopen('SIA50D.pdf');
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function yonslider_Callback(hObject, eventdata, handles)
kinematics_plot(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'),...
                get(handles.yonslider,'Value'));
% hObject    handle to yonslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function yonslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yonslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    %%
    % 
    % * ITEM1
    % * ITEM2
    % 
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
jak = jacobian_matrix(get(handles.theta1_text,'Value'),...
                get(handles.theta2_text,'Value'),...
                get(handles.theta3_text,'Value'),...
                get(handles.theta4_text,'Value'),...
                get(handles.theta5_text,'Value'),...
                get(handles.theta6_text,'Value'),...
                get(handles.theta7_text,'Value'));
            
            
set(handles.j11,'String',num2str(jak(1,1)));
set(handles.j12,'String',num2str(jak(1,2)));
set(handles.j13,'String',num2str(jak(1,3)));
set(handles.j14,'String',num2str(jak(1,4)));
set(handles.j15,'String',num2str(jak(1,5)));
set(handles.j16,'String',num2str(jak(1,6)));
set(handles.j17,'String',num2str(jak(1,7)));

set(handles.j21,'String',num2str(jak(2,1)));
set(handles.j22,'String',num2str(jak(2,2)));
set(handles.j23,'String',num2str(jak(2,3)));
set(handles.j24,'String',num2str(jak(2,4)));
set(handles.j25,'String',num2str(jak(2,5)));
set(handles.j26,'String',num2str(jak(2,6)));
set(handles.j27,'String',num2str(jak(2,7)));

set(handles.j31,'String',num2str(jak(3,1)));
set(handles.j32,'String',num2str(jak(3,2)));
set(handles.j33,'String',num2str(jak(3,3)));
set(handles.j34,'String',num2str(jak(3,4)));
set(handles.j35,'String',num2str(jak(3,5)));
set(handles.j36,'String',num2str(jak(3,6)));
set(handles.j37,'String',num2str(jak(3,7)));

set(handles.j41,'String',num2str(jak(4,1)));
set(handles.j42,'String',num2str(jak(4,2)));
set(handles.j43,'String',num2str(jak(4,3)));
set(handles.j44,'String',num2str(jak(4,4)));
set(handles.j45,'String',num2str(jak(4,5)));
set(handles.j46,'String',num2str(jak(4,6)));
set(handles.j47,'String',num2str(jak(4,7)));

set(handles.j51,'String',num2str(jak(5,1)));
set(handles.j52,'String',num2str(jak(5,2)));
set(handles.j53,'String',num2str(jak(5,3)));
set(handles.j54,'String',num2str(jak(5,4)));
set(handles.j55,'String',num2str(jak(5,5)));
set(handles.j56,'String',num2str(jak(5,6)));
set(handles.j57,'String',num2str(jak(5,7)));

set(handles.j61,'String',num2str(jak(6,1)));
set(handles.j62,'String',num2str(jak(6,2)));
set(handles.j63,'String',num2str(jak(6,3)));
set(handles.j64,'String',num2str(jak(6,4)));
set(handles.j65,'String',num2str(jak(6,5)));
set(handles.j66,'String',num2str(jak(6,6)));
set(handles.j67,'String',num2str(jak(6,7)));



% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
jakobiyen_sembolik
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
