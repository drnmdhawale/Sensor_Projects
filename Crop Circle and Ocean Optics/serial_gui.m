function varargout = serial_gui(varargin)
% SERIAL_GUI MATLAB code for serial_gui.fig
%      SERIAL_GUI, by itself, creates a new SERIAL_GUI or raises the existing
%      singleton*.
%
%      H = SERIAL_GUI returns the handle to a new SERIAL_GUI or the handle to
%      the existing singleton*.
%
%      SERIAL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERIAL_GUI.M with the given input arguments.
%
%      SERIAL_GUI('Property','Value',...) creates a new SERIAL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before serial_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to serial_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help serial_gui

% Last Modified by GUIDE v2.5 30-Oct-2010 16:43:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @serial_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @serial_gui_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before serial_gui is made visible.
function serial_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to serial_gui (see VARARGIN)

% Choose default command line output for serial_gui
handles.output = hObject;

clc

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes serial_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = serial_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in EnterBaud.
function EnterBaud_Callback(hObject, eventdata, handles)
% hObject    handle to EnterBaud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n1=str2num(get(handles.baudrate,'String'));
msgbox(num2str(n1))

% --- Executes on button press in I_time.
function I_time_Callback(hObject, eventdata, handles)
% hObject    handle to I_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n2=str2num(get(handles.Itime,'String'));
msgbox(num2str(n2))

% --- Executes on button press in Data_Word.
function Data_Word_Callback(hObject, eventdata, handles)
% hObject    handle to Data_Word (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n3=str2num(get(handles.DataWord,'String'));
msgbox(num2str(n3))

% --- Executes on button press in Pixel_Resol.
function Pixel_Resol_Callback(hObject, eventdata, handles)
% hObject    handle to Pixel_Resol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n4=str2num(get(handles.PixelResol,'String'));
msgbox(num2str(n4))


% --- Executes on button press in future_use.
function future_use_Callback(hObject, eventdata, handles)
% hObject    handle to future_use (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n5=str2num(get(handles.future,'String'));
msgbox(num2str(n5),'Error')


% --- Executes on button press in close_app.
function close_app_Callback(hObject, eventdata, handles)
% hObject    handle to close_app (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

msgbox('Good Bye !')
k = waitforbuttonpress;
clear all
close all

% --- Executes on button press in Start_sample.
function Start_sample_Callback(hObject, eventdata, handles)
% hObject    handle to Start_sample (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=0:0.1:10;
y=sin(x);
plot(x,y)

% --- Executes on button press in plot_fig.
function plot_fig_Callback(hObject, eventdata, handles)
% hObject    handle to plot_fig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get(eventdata.Start_sample.x)



function baudrate_Callback(hObject, eventdata, handles)
% hObject    handle to baudrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of baudrate as text
%        str2double(get(hObject,'String')) returns contents of baudrate as a double


% --- Executes during object creation, after setting all properties.
function baudrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baudrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Itime_Callback(hObject, eventdata, handles)
% hObject    handle to Itime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Itime as text
%        str2double(get(hObject,'String')) returns contents of Itime as a double


% --- Executes during object creation, after setting all properties.
function Itime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Itime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DataWord_Callback(hObject, eventdata, handles)
% hObject    handle to DataWord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DataWord as text
%        str2double(get(hObject,'String')) returns contents of DataWord as a double


% --- Executes during object creation, after setting all properties.
function DataWord_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DataWord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PixelResol_Callback(hObject, eventdata, handles)
% hObject    handle to PixelResol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PixelResol as text
%        str2double(get(hObject,'String')) returns contents of PixelResol as a double


% --- Executes during object creation, after setting all properties.
function PixelResol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PixelResol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function future_Callback(hObject, eventdata, handles)
% hObject    handle to future (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of future as text
%        str2double(get(hObject,'String')) returns contents of future as a double


% --- Executes during object creation, after setting all properties.
function future_CreateFcn(hObject, eventdata, handles)
% hObject    handle to future (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
