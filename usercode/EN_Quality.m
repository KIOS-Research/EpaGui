function varargout = EN_Quality(varargin)
% EN_QUALITY M-file for EN_Quality.fig
%      EN_QUALITY, by itself, creates a new EN_QUALITY or raises the existing
%      singleton*.
%
%      H = EN_QUALITY returns the handle to a new EN_QUALITY or the handle to
%      the existing singleton*.
%
%      EN_QUALITY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_QUALITY.M with the given input arguments.
%
%      EN_QUALITY('Property','Value',...) creates a new EN_QUALITY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EN_Quality_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_Quality_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_Quality

% Last Modified by GUIDE v2.5 28-Feb-2012 08:52:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_Quality_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_Quality_OutputFcn, ...
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


% --- Executes just before EN_Quality is made visible.
function EN_Quality_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_Quality (see VARARGIN)

% Choose default command line output for EN_Quality
handles.output = hObject;
handles.ep = varargin{1};

% UIWAIT makes EN_Quality wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','');

table = get(handles.uitable1,'data');

handles.type= handles.ep.B.getQualityType;
check_type = strcmp(handles.type, 'NONE');
if check_type==0
    table(2,2) = {'mg/L'};
else
    table(2,2) = {'NONE'};
end
table(1,2) = handles.type;

if handles.ep.B.getQualityTraceNodeIndex==0
    table(4,2) = {'Set TRACE in Parameter and set tracenode for ID reservoir or tank'};
else
    tracenode = handles.ep.B.getNodeNameID(handles.ep.B.getQualityTraceNodeIndex);
    table(4,2) = tracenode;
end
links=handles.ep.B.getBinLinksInfo;
table(5,2)={links.BinLinkGlobalBulkReactionCoeff};
table(6,2)={links.BinLinkGlobalWallReactionCoeff};


tolerance = handles.ep.B.getOptionsQualityTolerance;
tolerance = sprintf('%.2f',tolerance);
table(3,2) = {tolerance};
table(1,1) = {'Parameter'};
table(2,1) = {'Mass Units'};
table(3,1) = {'Toleramce'};
table(4,1) = {'Tracenode'};
table(5,1) = {'Global Bulk C.'};
table(6,1) = {'Global Wall C.'};
set(handles.uitable1,'data',table);
set(handles.text1,'String',handles.type);

% posT=get(handles.uitable1,'position');
% posT=[0.0367    0.0296    1.0000    0.8800];
% posT(1)=0.03;
% posT(2)=0.16;
% posT(4)=0.78;%heigh
% posT(3)=0.877;%weight
% set(handles.uitable1,'position',posT);
% set(handles.uitable1,'ColumnWidth',{113 122});
% 
% % posfig=get(handles.figure1,'position');
% posfig = [103.8000   51.1538   49.0000   10.3846];
% % posfig(1)=150;
% % posfig(2)=40;
% posfig(3)=54;
% posfig(4)=13;
% set(handles.figure1,'position',posfig);

% pospop=get(handles.popupmenu4,'position');
% pospop(3)=19.3;
% pospop(4)=1.55;
% set(handles.popupmenu4,'position',pospop);
% 
% postex=get(handles.text1,'position');
% postex(3)=21;
% postex(4)=1.38;
% postex(2)=7.5;
% set(handles.text1,'position',postex);



% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = EN_Quality_OutputFcn(hObject, eventdata, handles) 
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

handles.d = get(handles.uitable1,'Data');

% set(handles.uitable1,'ColumnFormat',{'numeric',{'Chem' 'Age'}});

indicesa = eventdata.Indices(1);%row
indicesb = eventdata.Indices(2);%column

a = eventdata.EditData;
a =str2num(a); 
a = length(a); % a = lenght([])%error a=0


if indicesa == 1
    handles.d(1,2) = {eventdata.EditData}; 
    
    switch char(handles.d(4,2))
        case 'Set TRACE in Parameter and set tracenode for ID reservoir or tank'
            code = char({'0'}) ;
        otherwise
            code = char({eventdata.EditData});
    end
    
    errorcode = ENsetqualtype(char(handles.d(1,2)),code);
    if errorcode==251
            handles.d(1,2) = {eventdata.PreviousData}; 
    end
    
end

if indicesa == 2
        
    chemunits1 = strcmp({eventdata.EditData},'mg/L');
    chemunits2 = strcmp({eventdata.EditData},'ug/L');
    
    if chemunits1 == 1
        
        handles.d(2,2) = {eventdata.EditData}; 
    elseif chemunits2 == 1
        handles.d(2,2) = {eventdata.EditData}; 
    else
        handles.d(2,2) = {eventdata.PreviousData}; 
    end
    
end


if indicesa == 3
    y = handles.d{3,2};
    if ~isnumeric(y)
        y = str2num(y);
        f = length(y);
    else
        f=1;
    end
    
    if f == 0
        handles.d(3,2)={eventdata.PreviousData};
    else    
        handles.ep.B.setOptionsQualityTolerance(y);
        handles.d(3,2)={y};
    end
end


if indicesa == 4
    
    handles.d(4,2) = {eventdata.EditData}; 
        
    t = strcmp(handles.d(1,2),char('TRACE')); %%TRACE USE ONLY RESERVOIRS AND TANKS
    y = strcmp(handles.d(1,2),char('trace')); %%TRACE USE ONLY RESERVOIRS AND TANKS
    
    if t==1
        y=1;
    elseif y==1
        t=1;
    end
    
    index=handles.ep.B.getNodeIndex(handles.d(4,2));
    nodetype=handles.ep.B.getNodeTypeIndex;
    if index==0
        handles.d(4,2)={eventdata.PreviousData};
    else
        typecode=nodetype(index);  %typecode=0 = junctions
        if t~=1 || typecode==0 || typecode==-1 || y~=1% when no TRACE(SEE BELOW)
            handles.d(4,2) = {'Set TRACE in Parameter and set tracenode for ID reservoir or tank'};
            a={'0'};
            handles.ep.B.setQualityType(char(handles.d(1,2)), char(a));
        else
            handles.d(4,2) = {eventdata.EditData};
            handles.ep.B.setQualityType(char(handles.d(1,2)),char(handles.d(4,2)));
        end   
    end
end

if indicesa == 5
    y = handles.d{5,2};
    if ~isnumeric(y)
        y = str2num(y);
        f = length(y);
    else
        f=1;
    end
    
    if f == 0 || isnan(y)
        handles.d(5,2)={eventdata.PreviousData};
    else    
        handles.ep.B.setBinLinkGlobalBulkReactionCoeff(y);
        handles.d(5,2)={y};
    end
end

if indicesa == 6
    y = handles.d{6,2};
    if ~isnumeric(y)
        y = str2num(y);
        f = length(y);
    else
        f=1;
    end
    
    if f == 0 || isnan(y)
        handles.d(6,2)={eventdata.PreviousData};
    else    
        handles.ep.B.setBinLinkGlobalWallReactionCoeff(y);
        handles.d(6,2)={y};
    end
end
set(handles.uitable1,'data',handles.d);
 



% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)

% a = eventdata.Indices(1);
% b = eventdata.Indices(2);
% 
% if a==1 && b==2
% set(handles.uitable1,'ColumnFormat',{'numeric',{'CHEM' 'AGE' 'CHLORINE' 'TRACE' 'NONE'}});
% else
% set(handles.uitable1,'ColumnFormat',{'numeric','numeric'});
% end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
ncode = get(handles.popupmenu4,'Value');
handles.d = get(handles.uitable1,'Data');

switch ncode
    case 1
        parameter = 'NONE';
    case 2
        parameter = 'CHEM';
    case 3
        parameter = 'AGE';
    case 4
        parameter = 'TRACE';
end
handles.d(1,2) = {parameter} ; 

switch char(handles.d(4,2))
    case 'Set TRACE in Parameter and set tracenode for ID reservoir or tank'
        code = char({'0'}) ;
    otherwise
        code = char(handles.d(4,2));
end
a = char(handles.d(4,2));
a = str2num(a); 
a = length(a); 

if ncode>3
    if a==0
        handles.d(4,2) = {'Set TRACE in Parameter and set tracenode for ID reservoir or tank'}; 
    else
        handles.d(4,2) = {code};
    end
    handles.ep.B.setQualityType(char(handles.d(1,2)),code);
else
    handles.ep.B.setQualityType(char(handles.d(1,2)));
    handles.d(4,2) = {'Set TRACE in Parameter and set tracenode for ID reservoir or tank'}; 
end
set(handles.text1,'String',handles.d(1,2));
set(handles.uitable1,'data',handles.d);

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
