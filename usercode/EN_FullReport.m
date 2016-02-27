function varargout = EN_FullReport(varargin)
% EN_FULLREPORT M-file for EN_FullReport.fig
%      EN_FULLREPORT, by itself, creates a new EN_FULLREPORT or raises the existing
%      singleton*.
%
%      H = EN_FULLREPORT returns the handle to a new EN_FULLREPORT or the handle to
%      the existing singleton*.
%
%      EN_FULLREPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_FULLREPORT.M with the given input arguments.
%
%      EN_FULLREPORT('Property','Value',...) creates a new EN_FULLREPORT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EN_FullReport_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_FullReport_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_FullReport

% Last Modified by GUIDE v2.5 24-Oct-2015 09:53:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_FullReport_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_FullReport_OutputFcn, ...
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


% --- Executes just before EN_FullReport is made visible.
function EN_FullReport_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_FullReport (see VARARGIN)

% Choose default command line output for EN_FullReport
handles.output = hObject;
handles.ep=varargin{1};

% [handles.path,~]=fileparts(handles.ep.B.pathfile);
% findslash=find(handles.path=='\');
handles.path=[pwd,'\results\'];
       
handles.namefile='';
set(handles.edit1,'String','');
set(handles.dir,'String',handles.path);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EN_FullReport wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Save As');

% --- Outputs from this function are returned to the command line.
function varargout = EN_FullReport_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in savebutton.
function savebutton_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

name  = get(handles.edit1,'String'); %name = name FullReport

Sentences=regexp(name,'\ ','split'); %xwrizw tin protasi se le3eis.
[~,name]=fileparts(name);
if isempty(name)
   uiwait(msgbox('Wrong report name.','Modal'));
   return;
end
if length(Sentences)==1
    if name~=0 
        warning off;
        if isempty(handles.namefile)
            name =strcat(name,'.txt');
        end
        if isempty(regexp(name,'.txt','match'))
            name =strcat(name,'.txt');
        end
        [yes] = replace(char('\*.txt'),name,handles.path);            
        warning on;
       if (yes==1 || yes==2) % replcase
            FullReport(name,handles); %new name save  
       else
           return;
       end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    end
    set(handles.figure1,'visible','off');
end
        
% --- Executes on button press in cancelbutton.
function cancelbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cancelbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.figure1,'visible','off');


% --- Executes on selection change in dir.
function dir_Callback(hObject, eventdata, handles)
% hObject    handle to dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dir contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dir
[name,PathFile] = uiputfile([handles.ep.B.pathfile,'*.txt']);
if PathFile
    handles.path=PathFile;
    handles.namefile=name;
end
set(handles.dir,'String',handles.path);
set(handles.edit1,'String',handles.namefile);
guidata(hObject, handles);