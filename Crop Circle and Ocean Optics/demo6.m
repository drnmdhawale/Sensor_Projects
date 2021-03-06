function varargout = demo6(varargin)
% DEMO6 MATLAB code for demo6.fig
%      DEMO6, by itself, creates a new DEMO6 or raises the existing
%      singleton*.
%
%      H = DEMO6 returns the handle to a new DEMO6 or the handle to
%      the existing singleton*.
%
%      DEMO6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO6.M with the given input arguments.
%
%      DEMO6('Property','Value',...) creates a new DEMO6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo6

% Last Modified by GUIDE v2.5 30-Oct-2010 15:02:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo6_OpeningFcn, ...
                   'gui_OutputFcn',  @demo6_OutputFcn, ...
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


% --- Executes just before demo6 is made visible.
function demo6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo6 (see VARARGIN)

% Choose default command line output for demo6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pbClickMe.
function pbClickMe_Callback(hObject, eventdata, handles)
% hObject    handle to pbClickMe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val= str2num(get(handles.editinput, 'String'))+1;
msgbox(num2str(val))



function editinput_Callback(hObject, eventdata, handles)
% hObject    handle to editinput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editinput as text
%        str2double(get(hObject,'String')) returns contents of editinput as a double

%msgbox(get(hObject,'String'))

% --- Executes during object creation, after setting all properties.
function editinput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editinput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
