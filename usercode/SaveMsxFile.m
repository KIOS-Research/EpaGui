function varargout = SaveMsxFile(varargin)
% SAVEMSXFILE M-file for SaveMsxFile.fig
%      SAVEMSXFILE, by itself, creates a new SAVEMSXFILE or raises the existing
%      singleton*.
%
%      H = SAVEMSXFILE returns the handle to a new SAVEMSXFILE or the handle to
%      the existing singleton*.
%
%      SAVEMSXFILE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAVEMSXFILE.M with the given input arguments.
%
%      SAVEMSXFILE('Property','Value',...) creates a new SAVEMSXFILE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SaveMsxFile_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SaveMsxFile_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SaveMsxFile

% Last Modified by GUIDE v2.5 25-Oct-2015 01:15:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SaveMsxFile_OpeningFcn, ...
                   'gui_OutputFcn',  @SaveMsxFile_OutputFcn, ...
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


% --- Executes just before SaveMsxFile is made visible.
function SaveMsxFile_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SaveMsxFile (see VARARGIN)

% Choose default command line output for SaveMsxFile
handles.output = hObject;
handles.ep=varargin{1};


% UIWAIT makes SaveMsxFile wait for user response (see UIRESUME)
% uiwait(handles.figure1);
handles.path=[fileparts(handles.ep.B.MSXTempFile),'\'];
handles.namefile='';
set(handles.edit1,'String','');
set(handles.dir,'String',handles.path);
set(handles.figure1,'name','Save');
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = SaveMsxFile_OutputFcn(hObject, eventdata, handles) 
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

name  = get(handles.edit1,'String'); %name = name Inputfile
[path,name]=fileparts(name);
if isempty(name)
   uiwait(msgbox('Wrong inp file name.','Modal'));
   return;
end
Sentences=regexp(name,'\ ','split'); %xwrizw tin protasi se le3eis.
if length(Sentences)==1
    if name~=0 
       warning off;
        if isempty(handles.namefile)
            name =strcat(name,'.msx');
            savename=[handles.path,name];
            [yes] = replace(char('\*.msx'),name,'');
        else
            if isempty(regexp(name,'.msx','match'))
                name =strcat(name,'.msx');
            end
            savename=[handles.path,name];
            [yes] = replace(char('\*.msx'),name,handles.path);
        end
       warning on;
       if (yes==1) % replcase
            handles.ep.B.saveMSXFile(savename)
            open(savename)
            set(handles.figure1,'visible','off');
       elseif (yes==2)  
            handles.ep.B.saveMSXFile(savename)
            open(savename)
            set(handles.figure1,'visible','off');
       end
       handles.ep.msg=get(handles.ep.LoadText,'String');
       ss = ['>>Save MSX as: ',savename];
       handles.ep.msg=[handles.ep.msg;{ss}];
       set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
       set(handles.ep.LoadText,'String',handles.ep.msg);
    end

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
[name,PathFile] = uiputfile([handles.ep.B.pathfile,'*.msx']);
if PathFile
    handles.path=PathFile;
    handles.namefile=name;
end
set(handles.dir,'String',handles.path);
set(handles.edit1,'String',handles.namefile);
guidata(hObject, handles);
