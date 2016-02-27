function varargout = Type(varargin)
%TYPE M-file for Type.fig
%      TYPE, by itself, creates a new TYPE or raises the existing
%      singleton*.
%
%      H = TYPE returns the handle to a new TYPE or the handle to
%      the existing singleton*.
%
%      TYPE('Property','Value',...) creates a new TYPE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Type_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      TYPE('CALLBACK') and TYPE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in TYPE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Type

% Last Modified by GUIDE v2.5 17-Mar-2012 00:59:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Type_OpeningFcn, ...
                   'gui_OutputFcn',  @Type_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Type is made visible.
function Type_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Type
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Type wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'Position',[103 30 41.2 13.615]);

% --- Outputs from this function are returned to the command line.
function varargout = Type_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in nodesbutton.
function nodesbutton_Callback(hObject, eventdata, handles)
% hObject    handle to nodesbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Table_selection_NodeA;

% --- Executes on button press in linksbutton.
function linksbutton_Callback(hObject, eventdata, handles)
% hObject    handle to linksbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Table_selection_LinkA;


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


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);

delete typelink.mat
delete typenode.mat
