function varargout = EN_Times(varargin)
% EN_TIMES M-file for EN_Times.fig
%      EN_TIMES, by itself, creates a new EN_TIMES or raises the existing
%      singleton*.
%
%      H = EN_TIMES returns the handle to a new EN_TIMES or the handle to
%      the existing singleton*.
%
%      EN_TIMES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_TIMES.M with the given input arguments.
%
%      EN_TIMES('Property','Value',...) creates a new EN_TIMES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EN_Times_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_Times_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_Times

% Last Modified by GUIDE v2.5 22-Oct-2015 05:49:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_Times_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_Times_OutputFcn, ...
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


% --- Executes just before EN_Times is made visible.
function EN_Times_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_Times (see VARARGIN)

% Choose default command line output for EN_Times
handles.output = hObject;
set(handles.popupmenu1,'visible','on');
handles.ep=varargin{1};
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EN_Times wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Times');
table = get(handles.uitable1,'data');

%duration
table{1,2} = handles.ep.B.getTimeSimulationDuration;
%hydtime
table{2,2} = handles.ep.B.getTimeHydraulicStep;
%qualtime
table{3,2} = handles.ep.B.getTimeQualityStep;
%patternstep
table{4,2} = handles.ep.B.getTimePatternStep;
%patternstart
table{5,2} = handles.ep.B.getTimePatternStart;
%reportstep
table{6,2} = handles.ep.B.getTimeReportingStep;
%reportstart
table{7,2} = handles.ep.B.getTimeReportingStart;
%statistic
table(8,2) = handles.ep.B.getTimeStatisticsType;

table(1,1) = {'Total Duration'};
table(2,1) = {'Hydraulic Time Step'};
table(3,1) = {'Quality Time Step'};
table(4,1) = {'Pattern Time Step'};
table(5,1) = {'Pattern Start Time'};
table(6,1) = {'Reporting Time Step'};
table(7,1) = {'Report Start Time'};
table(8,1) = {'Statistic'};
set(handles.uitable1,'data',table);
set(handles.text,'String',table(8,2));
set(handles.uitable1,'ColumnWidth',{140 112});
set(handles.text,'Position',[29.8 0.9 20 1.4]);
set(handles.uitable1,'Position',[1.8 0.8461538461538465 50.80000000000001 13.153846153846157]);
set(handles.figure1,'Position',[100 30 55 15]);
set(handles.popupmenu1,'Position',[29.8 1.077 22.8 1.2]);

% --- Outputs from this function are returned to the command line.
function varargout = EN_Times_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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

handles.d = get(handles.uitable1,'Data'); %handles.d = table

a = eventdata.Indices(1); %row
b = eventdata.Indices(2); %column

c = eventdata.EditData; %EditData

d = str2num(c); % elexgos an einai arithmos ii grammata 
d = length(d);

if a==1 && d==1 %otan to d=1 , tote exoume grammata.
    handles.ep.B.setTimeSimulationDuration(eventdata.NewData);
    handles.d{1,2}=eventdata.NewData;    
    if d==0
        handles.d{1,2} = eventdata.PreviousData;
    end
elseif a==1
    handles.d{1,2} = eventdata.PreviousData;
end

if a==2 && d==1
    handles.ep.B.setTimeHydraulicStep(eventdata.NewData);
    handles.d{2,2}=eventdata.NewData;   
    if d==0
        handles.d{2,2}=eventdata.PreviousData;   
    end
elseif a==2
    handles.d{2,2}=eventdata.PreviousData;   
end

if a==3 && d==1
    handles.ep.B.setTimeQualityStep(eventdata.NewData);
    handles.d{3,2}=eventdata.NewData;   
    if d==0
        handles.d{3,2}=eventdata.PreviousData;   
    end
elseif a==3
    handles.d{3,2}=eventdata.PreviousData;   
end


if a==4 && d==1
    handles.ep.B.setTimePatternStep(eventdata.NewData);
    handles.d{4,2}=eventdata.NewData;   
    if d==0
         handles.d{4,2}=eventdata.PreviousData;   
    end
    
elseif a==4
    
    handles.d{4,2}=eventdata.PreviousData;   
end

if a==5 && d==1
    handles.ep.B.setTimePatternStart(eventdata.NewData);
    handles.d{5,2}=eventdata.NewData;   
    if d==0
        handles.d{5,2}=eventdata.PreviousData;   
    end
elseif a==5
    handles.d{5,2}=eventdata.PreviousData;   
end

if a==6 && d==1
    handles.ep.B.setTimeReportingStep(eventdata.NewData);
    handles.d{6,2}=eventdata.NewData;   
    if d==0
        handles.d{6,2}=eventdata.PreviousData;   
    end
elseif a==6
    handles.d{6,2}=eventdata.PreviousData;   
end

if a==7 && d==1
    handles.ep.B.setTimeReportingStart(eventdata.NewData);
    handles.d{7,2}=eventdata.NewData;   
    if d==0
        handles.d{7,2}=eventdata.PreviousData;   
    end
elseif a==7
    handles.d{7,2}=eventdata.PreviousData;   
end
if a==8 
handles.d{8,2}='';   
end

set(handles.uitable1,'data',handles.d);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
ncode = get(handles.popupmenu1,'Value');
nc = ncode - 1;
switch nc
    case 0
        handles.ep.B.setTimeStatisticsType('NONE');
        t='NONE';
    case 1
        handles.ep.B.setTimeStatisticsType('AVERAGE');
        t='AVERAGE';
    case 2
        handles.ep.B.setTimeStatisticsType('MINIMUM');
        t='MINIMUM';
    case 3
        handles.ep.B.setTimeStatisticsType('MAXIMUM');
        t='MAXIMUM';
    case 4
        handles.ep.B.setTimeStatisticsType('RANGE');
        t='RANGE';
end
set(handles.text,'String',t);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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
%  
% table = get(handles.uitable1,'data');
% 
% a = eventdata.Indices(1);
% b = eventdata.Indices(2);
%     
% 
% if a==8 && b==2
%     
% set(handles.popupmenu1,'visible','on');
% else
%     
%  set(handles.popupmenu1,'visible','off');
% end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text as text
%        str2double(get(hObject,'String')) returns contents of text as a double


% --- Executes during object creation, after setting all properties.
function text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
