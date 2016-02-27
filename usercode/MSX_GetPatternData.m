function varargout = MSX_GetPatternData(varargin)
% MSX_GETPATTERNDATA M-file for MSX_GetPatternData.fig
%      MSX_GETPATTERNDATA, by itself, creates a new MSX_GETPATTERNDATA or raises the existing
%      singleton*.
%
%      H = MSX_GETPATTERNDATA returns the handle to a new MSX_GETPATTERNDATA or the handle to
%      the existing singleton*.
%
%      MSX_GETPATTERNDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MSX_GETPATTERNDATA.M with the given input arguments.
%
%      MSX_GETPATTERNDATA('Property','Value',...) creates a new MSX_GETPATTERNDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MSX_GetPatternData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MSX_GetPatternData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MSX_GetPatternData

% Last Modified by GUIDE v2.5 25-Oct-2015 19:26:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MSX_GetPatternData_OpeningFcn, ...
                   'gui_OutputFcn',  @MSX_GetPatternData_OutputFcn, ...
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


% --- Executes just before MSX_GetPatternData is made visible.
function MSX_GetPatternData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MSX_GetPatternData (see VARARGIN)

% Choose default command line output for MSX_GetPatternData
handles.output = hObject;
handles.ep=varargin{1};
% Update handles structure

% UIWAIT makes MSX_GetPatternData wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','');

handles.patcnt=handles.ep.B.getMsxPatternsCount;
ids=handles.ep.B.getMsxPatternsNameID;
if handles.patcnt~=0
    for i=1:handles.patcnt
        handles.id{i} = ids{i};
    end
    set(handles.listbox1,'String', handles.id);
end

set(handles.figure1,'Position',[103.8 30 36 17.808]);
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = MSX_GetPatternData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
a = get(handles.listbox1,'Value'); 
list = (get(handles.listbox1,'String'));

try
% a is index pattern
if handles.patcnt==0 && length(list)==0%an iparxei ii oxi pattern na sinexisi analoga.
    handles.zero = 0;
    % Update handles structure
    guidata(hObject, handles);
    savemat(hObject, eventdata, handles,a) % function where save index and call    ENP_PatternEditor;
elseif length(list)~=0
    handles.zero = 0;
    guidata(hObject, handles);
    savemat(hObject, eventdata, handles,a) % function where save index and call     ENP_PatternEditor;
else
    handles.zero = 1;
    guidata(hObject, handles);
    savemat(hObject, eventdata, handles,a) % function where save index and call     ENP_PatternEditor;
end
catch e
end

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
pushbutton1_Callback(hObject, eventdata, handles)

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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
list = (get(handles.listbox1,'String'));
new_id= {get(handles.edit1,'String')};

if length(list)==0
    v=0;
end

for i=1:length(list)
   v(i) = strcmp(list(i),new_id);
end

if sum(v)~=1
    handles.patcnt=handles.ep.B.getMsxPatternsCount;
    ids=handles.ep.B.getMsxPatternsNameID;
    if handles.patcnt~=0
        for i=1:handles.patcnt
            handles.id{i} = ids{i};
        end
        set(handles.listbox1,'String', handles.id);
    end

    previousList = cellstr(get(handles.listbox1,'String'));

    % add new string to listbox
    new_id= get(handles.edit1,'String');
    new = char(new_id);
    new = cellstr(new);
    id = handles.ep.B.MsxAddPattern(char(new));

    if char(id)~=0
        listpattern = [previousList;{new_id}];
        set(handles.listbox1,'String',listpattern(find(strcmp(listpattern,'')==0)));
    else
        uiwait(msgbox('Invalid property values were specified.','Error','modal'));
    end
else
    uiwait(msgbox('Invalid pattern.','Error','modal'));
    return;
end
if str2num(new_id)~=0
    set(handles.edit1,'String',str2num(new_id)+1);
end
set(handles.listbox1,'Value',length(listpattern(find(strcmp(listpattern,'')==0))));
listbox1_Callback(hObject, eventdata, handles)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);

function savemat(hObject, eventdata, handles,index)

list = (get(handles.listbox1,'String'));

if handles.zero==1 
    Getpatternindex = index-1;
    
elseif length(list)==0
    Getpatternindex = index-1;
else
    Getpatternindex = index;
end

if Getpatternindex~=0
    MSXP_PatternEditor(handles.ep,Getpatternindex);
end
