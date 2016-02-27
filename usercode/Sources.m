function varargout = Sources(varargin)
% Sources M-file for Sources.fig
%      Sources, by itself, creates a new Sources or raises the existing
%      singleton*.
%
%      H = Sources returns the handle to a new Sources or the handle to
%      the existing singleton*.
%
%      Sources('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Sources.M with the given input arguments.
%
%      Sources('Property','Value',...) creates a new Sources or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Sources_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Sources_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sources

% Last Modified by GUIDE v2.5 06-May-2012 07:40:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sources_OpeningFcn, ...
                   'gui_OutputFcn',  @Sources_OutputFcn, ...
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


% --- Executes just before Sources is made visible.
function Sources_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Sources (see VARARGIN)

% Choose default command line output for Sources
handles.output = hObject;
handles.closehelp=0;
handles.msg=0;
handles.ep=varargin{1};
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sources wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.helptext,'visible','on');
% set(handles.figure1,'Position',[78 22 87.8 30.5]);

set(handles.figure1,'name','Sources');
set(handles.edit1,'Visible','on');

table={''};
set(handles.uitable1,'data',table);
set(handles.uitable1,'RowName',table);
set(handles.uitable1,'ColumnName',table);

ids = handles.ep.B.getNodeNameID;
types = handles.ep.B.getNodeType;
for i=1:handles.ep.B.getNodeCount
    %type
    type = types{i};
    table(i,1) ={type};
    %id
    id = sprintf(' %s',ids{i});
    table(i,1) = strcat(table(i,1),id);
end

set(handles.listbox2,'String',table);
set(handles.listbox2,'value',1);
listbox2_Callback(hObject, eventdata, handles)
 
 
% --- Outputs from this function are returned to the command line.
function varargout = Sources_OutputFcn(hObject, eventdata, handles) 
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




% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

result = handles.msg;
checkLabels = {'Save results to workspace'};
varNames = {'result'};
items = {result};
export2wsdlg(checkLabels, varNames, items, 'Save results to Workspace'); 


% --- Executes when entered data in editable cell(s) in uitable2.
function uitable2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

function durationedit_Callback(hObject, eventdata, handles)
% hObject    handle to durationedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationedit as text
%        str2double(get(hObject,'String')) returns contents of durationedit as a double


% --- Executes during object creation, after setting all properties.
function durationedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2

hours = get(handles.listbox2,'Value');

set(handles.durationedit,'String',hours);

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

table = get(handles.uitable1,'data');

row = eventdata.Indices(1); 
column = eventdata.Indices(2); 
new = eventdata.NewData;
previous = eventdata.PreviousData;
c = eventdata.EditData; %EditData
d = str2num(c); % elexgos an einai arithmos ii grammata 
d = length(d);
node = get(handles.listbox2,'Value'); %anaktisi minimatos NODE ID 'A'
pat = table{3,column};
patindex = handles.ep.B.getMsxPatternsIndex(pat);

%Type Source
if d==0 && row==1
    type = char(new);
    table{row,column} = char(type);
    level = table{2,column};
    switch upper(new) 
          case 'CONCEN'
                 code=0;
          case 'MASS'
                 code=1;
          case 'SETPOINT'
                 code=2;
          case 'FLOWPACED'
                 code=3;
          otherwise
                code=-1;
    end                                               
        
    if table{2,column}==0 % den prepei na einai miden
        level=1;
        table{2,column}=level;
    end
    
    if code~=-1 
        handles.ep.B.setMsxSources(node,column,code,level,patindex);clc;
        set(handles.uitable1,'data',table);
    else
        table{row,column}=previous;
        set(handles.uitable1,'data',table);
    end
    
elseif row==1 && d==1
    table{row,column} = previous;
end

type = table{1,column};
switch upper(type) 
      case 'CONCEN'
             code=0;
      case 'MASS'
             code=1;
      case 'SETPOINT'
             code=2;
      case 'FLOWPACED'
             code=3;
      otherwise
            code=-1;
end  
f = strcmp('NOSOURCE',char(type));
if f==1
    type = char('CONCEN');
    table{1,column} = type;
end
    
% Level
if row == 2 && d==1 %gia na allazoume tis ipolipes stiles pou einai arithmoi.
    if new==0
        level=1;
        table{2,column}=level;
    else
        level = new;
    end    
    handles.ep.B.setMsxSources(node,column,code,level,patindex);clc; % set type =0
    
elseif row==2 && d==0
    table{row,column} = previous;   
end
set(handles.uitable1,'data',table);

if row==3    
    table{row,column}= char(new);
    pat = handles.ep.B.getMsxPatternsIndex(new);
    if table{2,column}==0 % den prepei na einai miden
        level=1;
        table{2,column}=level;
    end
    if pat~=0
        table{row,column} = char(new);
        level = table{2,column};
        handles.ep.B.setMsxSources(node,column,code,level,pat);clc;%char(type)--code
        set(handles.uitable1,'data',table); 
    else
        uiwait(msgbox('Reference made to an undefined object ID.','Modal'));
        table{row,column}=previous;
        set(handles.uitable1,'data',table); 
    end
end
    
set(handles.uitable1,'data',table);

          
    
% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2

index = get(handles.listbox2,'Value');
nodes = sprintf('NODE %s',char(handles.ep.B.getNodeNameID(index)));


columneditTable{1} =  false; % false = 0, %True=1
columneditTable{2} = false;
Idspecies{1}='';

spcnt=handles.ep.B.getMsxSpeciesCount;
type=handles.ep.B.getMsxSourceType;
level=handles.ep.B.getMsxSourceLevel;
pat=handles.ep.B.getMsxSourcePatternIndex;
idspecies=handles.ep.B.getMsxSpeciesNameID;
units=handles.ep.B.getMsxSpeciesUnits;
for i=1:spcnt
   table{1,i} = type{index}{i};                   
   table{2,i} = level{index}(i);
   if pat{index}(i)~=0
       patid=handles.ep.B.getMsxPatternsNameID{pat{index}(i)};
   else
       patid='None Pattern';
   end
   if isempty(patid)
       table{3,i}='None Pattern';
   else
       table{3,i} = patid;
   end
   sp{i}=[char(idspecies{i}),' (',char(units{i}),')'];

   columneditTable{i} = true;
end
set(handles.uitable1,'data',table);
for i=1:length(columneditTable) %set edit column
    c(i) = logical(columneditTable{i});
end    
set(handles.uitable1,'ColumnEditable',c); % false = ok
                                                     % true = edit column
table1{1,1} = char('Source Type');
table1{2,1} = char('Level');
table1{3,1} = char('Pattern ID');
set(handles.uitable1,'RowName',table1);
set(handles.uitable1,'ColumnName',sp);
set(handles.uitable1,'data',table);
set(handles.uitable1,'ColumnWidth',{70 68 68 68 80});
% for to workspace button
handles.msg = get(handles.uitable1,'Data');

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
