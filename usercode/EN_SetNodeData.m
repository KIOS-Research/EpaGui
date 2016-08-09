function varargout = EN_SetNodeData(varargin)
% EN_SETNODEDATA M-file for EN_SetNodeData.fig
%      EN_SETNODEDATA, by itself, creates a new EN_SETNODEDATA or raises the existing
%      singleton*.
%
%      H = EN_SETNODEDATA returns the handle to a new EN_SETNODEDATA or the handle to
%      the existing singleton*.
%
%      EN_SETNODEDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_SETNODEDATA.M with the given input arguments.
%
%      EN_SETNODEDATA('Property','Value',...) creates a new EN_SETNODEDATA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EN_SetNodeData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_SetNodeData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_SetNodeData

% Last Modified by GUIDE v2.5 04-Apr-2012 02:43:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_SetNodeData_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_SetNodeData_OutputFcn, ...
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


% --- Executes just before EN_SetNodeData is made visible.
function EN_SetNodeData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_SetNodeData (see VARARGIN)
% Choose default command line output for EN_SetNodeData
handles.output = hObject;

handles.ep=varargin{1};
handles.initial_node =0;
handles.node =0;
handles.closehelp=0;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EN_SetNodeData wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Set Node Data');
set(handles.figure1,'Position',[65 10 137.1 40]);
set(handles.text1,'visible','off');

set(handles.elevation,'Value',1);
set(handles.demandpattern,'Value',1);
set(handles.emitter,'Value',1);
set(handles.sourcequal,'Value',1);
set(handles.basedemand,'Value',1);
set(handles.initqual,'Value',1);
set(handles.sourcetype,'Value',1);
set(handles.Tank_kbulk,'Value',1);
set(handles.minlevel,'Value',1);
set(handles.maxlevel,'Value',1);
set(handles.tanklevel,'Value',1);
set(handles.tankdiameter,'Value',1);
set(handles.minvolume,'Value',1);
set(handles.mixfraction,'Value',1);
set(handles.mixmodel,'Value',1);
set(handles.sourcepat,'Value',1);


ok(hObject, eventdata, handles);


% --- Outputs from this function are returned to the command line.
function varargout = EN_SetNodeData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in elevation.
function elevation_Callback(hObject, eventdata, handles)
% hObject    handle to elevation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of elevation

ok(hObject, eventdata, handles)

% --- Executes on button press in basedemand.
function basedemand_Callback(hObject, eventdata, handles)
% hObject    handle to basedemand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of basedemand

ok(hObject, eventdata, handles)

% --- Executes on button press in demandpattern.
function demandpattern_Callback(hObject, eventdata, handles)
% hObject    handle to demandpattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of demandpattern


ok(hObject, eventdata, handles)


% --- Executes on button press in emitter.
function emitter_Callback(hObject, eventdata, handles)
% hObject    handle to emitter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of emitter

ok(hObject, eventdata, handles)


% --- Executes on button press in initqual.
function initqual_Callback(hObject, eventdata, handles)
% hObject    handle to initqual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of initqual

ok(hObject, eventdata, handles)

% --- Executes on button press in sourcequal.
function sourcequal_Callback(hObject, eventdata, handles)
% hObject    handle to sourcequal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sourcequal

ok(hObject, eventdata, handles)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.figure1,'Visible','off');

ok(hObject, eventdata, handles)

function ok(hObject, eventdata, handles)
    
ndcnt=handles.ep.B.getNodeCount;
tr = {'Type' 'ID'};
set(handles.uitable1,'Data',tr);
ids = handles.ep.B.getNodeNameID;
types = handles.ep.B.getNodeType;
%matrix
table = get(handles.uitable1,'Data');
for i=1:ndcnt
    %id
    id = ids{i};
    table(i,2) = {id};
    %type
    type = types{i};
    table(i,1) ={type};
end
set(handles.uitable1,'data', table);
set(handles.uitable1, 'ColumnName', {'Type','ID'});

%%%continued, CHECKBOX

elevation = get(handles.elevation,'String');
elecount = get(handles.elevation,'Value');
if elecount==0
    msg(1)=0;
end

basedemand = get(handles.basedemand,'String');
basecount= get(handles.basedemand,'Value');
if basecount==0
    msg(2)=0;
end

%demandpattern
demandpattern = get(handles.demandpattern,'String');
demandpatterncount= get(handles.demandpattern,'Value');
if demandpatterncount==0
    msg(3)=0;
end
    
%emitter
emitter = get(handles.emitter,'String');
emittercount= get(handles.emitter,'Value');
if emittercount==0
    msg(4)=0;
end

%initqual
initqual = get(handles.initqual,'String');
initqualcount= get(handles.initqual,'Value');
if initqualcount==0
    msg(5)=0;
end

%sourcequal
sourcequal = get(handles.sourcequal,'String');
sourcequalcount= get(handles.sourcequal,'Value');
if sourcequalcount==0
    msg(6)=0;
end

%sourcetype
sourcetype = get(handles.sourcetype,'String');
sourcetypecount= get(handles.sourcetype,'Value');
if sourcetypecount==0
    msg(7)=0;
end

%Initial_level_tank 
tanklevel = get(handles.tanklevel,'String');
tanklevelcount= get(handles.tanklevel,'Value');
if tanklevelcount==0
    msg(8)=0;
end

%sourcepat
sourcepat = get(handles.sourcepat,'String');
sourcepatcount= get(handles.sourcepat,'Value');
if sourcepatcount==0
    msg(9)=0;
end

%TANK ONLY
%Mixing model 
mixmodel = get(handles.mixmodel,'String');
mixmodelcount= get(handles.mixmodel,'Value');
if mixmodelcount==0
    msg(10)=0;
end

%tank diameter
tankdiameter  = get(handles.tankdiameter,'String');
tankdiametercount= get(handles.tankdiameter,'Value');
if tankdiametercount==0
    msg(12)=0;
end

%Minimum water volume 
minvolume = get(handles.minvolume,'String');
minvolumecount = get(handles.minvolume,'Value');
if minvolumecount==0
    msg(13)=0;
end

%Minimum water level  
Minlevel = get(handles.minlevel,'String');
Minlevelcount = get(handles.minlevel,'Value');
if Minlevelcount==0
    msg(14)=0;
end

%Maximum water level 
Maxlevel = get(handles.maxlevel,'String');
Maxlevelcount = get(handles.maxlevel,'Value');
if Maxlevelcount==0
    msg(15)=0;
end

%mixfraction
MixFraction = get(handles.mixfraction,'String');
MixFractioncount = get(handles.mixfraction,'Value');
if MixFractioncount==0
    msg(16)=0;
end

%Bulk reaction  
Tank_kBulk = get(handles.Tank_kbulk,'String');
Tank_kbulkcount = get(handles.Tank_kbulk,'Value');
if Tank_kbulkcount==0
    msg(17)=0;
end

%control checkbox choise, 1-yes. 0-no
 total = [1 1 elecount basecount  emittercount demandpatterncount initqualcount sourcequalcount... 
    sourcepatcount sourcetypecount tanklevelcount mixmodelcount...
    tankdiametercount minvolumecount Minlevelcount Maxlevelcount...
    MixFractioncount Tank_kbulkcount];

f = sum(total);% f is variable

if f==2 % ean den egine kamia epilogi
            set(handles.uitable1,'ColumnEditable',[false false]);
end
units=handles.ep.B.getBinUnits;

%Column names :
for i=1:f
    v= strfind(total,1);
    switch v(i)
        case 1
            cnames{i}='Type'; 
            ColumnWidth{i}=120;
        case 2
            cnames{i}='ID'; 
            ColumnWidth{i}=110;
        case 3
            elevation=sprintf('%s (%s)',elevation,units.BinNodeElevationUnits);
            cnames{i}=elevation; 
            ColumnWidth{i}=140;
        case 4
            basedemand=sprintf('%s (%s)',basedemand,units.BinLinkFlowUnits);
            cnames{i}=basedemand;
            ColumnWidth{i}=180;
        case 5
            cnames{i}=emitter;
            ColumnWidth{i}=140;
        case 6
            cnames{i}= demandpattern;
            ColumnWidth{i}=150;
        case 7
            initqual=sprintf('%s (%s)',initqual,units.BinQualityUnits(1:4));
            cnames{i}=initqual;
            ColumnWidth{i}=160;
        case 8
            sourcequal=sprintf('%s (%s)',sourcequal,units.BinQualityUnits(1:4));
            cnames{i}=sourcequal;
            ColumnWidth{i}=160;
        case 9
            cnames{i}=sourcepat;    
            ColumnWidth{i}=160;
        case 10
            cnames{i}=sourcetype;
            ColumnWidth{i}=160;
        case 11
            tanklevel=sprintf('%s (%s)',tanklevel,units.BinNodeTankDiameterUnits);
            cnames{i}=tanklevel;
            ColumnWidth{i}=160;
        case 12
            cnames{i}=mixmodel;
            ColumnWidth{i}=160;
        case 13
            tankdiameter=sprintf('%s (%s)',tankdiameter,units.BinNodeTankVolumeUnits);
            cnames{i}=tankdiameter;
            ColumnWidth{i}=180;
        case 14
            minvolume = sprintf('%s (%s)',minvolume,units.BinNodeTankVolumeUnits);
            cnames{i}=minvolume;
            ColumnWidth{i}=200;
        case 15
            Minlevel=sprintf('%s (%s)',Minlevel,units.BinNodeTankDiameterUnits);
            cnames{i}=Minlevel;
            ColumnWidth{i}=180;
         case 16
            Maxlevel=sprintf('%s (%s)',Maxlevel,units.BinNodeTankDiameterUnits);
            cnames{i}=Maxlevel;
            ColumnWidth{i}=180;
         case 17
            cnames{i}=MixFraction;
            ColumnWidth{i}=160;
         case 18
            cnames{i}=Tank_kBulk;
            ColumnWidth{i}=160;
    end
    Columnnamess = char(cnames);   
end

%TABLE
table = get(handles.uitable1,'Data');
cp=3; %counttable ------ cp = number for column 
if elecount
    node.ndelevations=handles.ep.B.getNodeElevations;
    for i=1:ndcnt
        %elevation
        table(i,cp) = {num2str(node.ndelevations(i))};
    end
    msg(1)=cp;
    cp=4;
end

if basecount
    node.ndbasedemands=handles.ep.B.getNodeBaseDemands;
    basedemand=node.ndbasedemands{1};
    for i=1:ndcnt
    %basedemand
        table(i,cp) = {num2str(basedemand(i))};
    end
    msg(2)=cp; cp=cp+1;  
end

if emittercount
    node.ndemitters=handles.ep.B.getNodeEmitterCoeff;
    for i=1:ndcnt
        %emitter
        table(i,cp) = {num2str(node.ndemitters(i))};
    end
    msg(3)=cp; cp=cp+1;  
end


if demandpatterncount    
    nddemandpattern=handles.ep.B.getPatternNameID;
    node.nddemandpatternIndex=handles.ep.B.getNodeDemandPatternIndex{1};  
    for i=1:ndcnt
        if node.nddemandpatternIndex(i)
            table(i,cp) = {nddemandpattern{node.nddemandpatternIndex(i)}};
        else
            table(i,cp) = {'None Pattern'};
        end
    end
    msg(4)=cp; cp=cp+1;  
end

if initqualcount
    node.ndinitqual=handles.ep.B.getNodeInitialQuality;
    for i=1:ndcnt
        %initqual
        table(i,cp) = {num2str(node.ndinitqual(i))};
    end
    msg(5)=cp; cp=cp+1;  
end

if sourcequalcount
    node.ndsourcequal=handles.ep.B.getNodeSourceQuality;
    for i=1:ndcnt
        %sourcequal
        table(i,cp) = {num2str(node.ndsourcequal(i))};
    end
    msg(6)=cp; cp=cp+1;  
end

if sourcepatcount
    node.ndsourcepat=handles.ep.B.getNodeSourcePatternIndex;
    chisnan=isnan(node.ndsourcepat);
    for i=1:ndcnt
        if ~chisnan(i) && node.ndsourcepat(i)
            table(i,cp) = {handles.ep.B.getPatternNameID{node.ndsourcepat(i)}};
        else
            table(i,cp) = {'None Pattern'};
        end
    end
    msg(7)=cp; cp=cp+1;  
end

if sourcetypecount
    node.ndsourcetype=handles.ep.B.getNodeSourceType;
    for i=1:ndcnt
        if isempty(node.ndsourcetype{i}); node.ndsourcetype{i}='NaN'; end
        table(i,cp) = {node.ndsourcetype{i}};  
    end
    msg(8)=cp; cp=cp+1;  
end

% %Initial_level_tank
if tanklevelcount
    node.ndtanklevel=handles.ep.B.getNodeTankInitialLevel;
    for i=1:ndcnt
        table(i,cp) = {num2str(node.ndtanklevel(i))}; 
    end
    msg(9)=cp; cp=cp+1;  
end

%TANK ONLY
%Mixing model 
if mixmodelcount
    node.ndmixmodel=handles.ep.B.getNodeTankMixingModelType;
    for i=1:ndcnt
        if handles.ep.B.getNodeTankCount
            typemixmodel = node.ndmixmodel{i};
            table(i,cp) = {typemixmodel};
        else
            table(i,cp) = {'No Tank'};
        end
        if isempty(node.ndmixmodel)
            table(i,cp) = {'No Tank'};
        end
    end
    msg(10)=cp; cp=cp+1;  
end

%tank diameter
if tankdiametercount
    node.ndtankdiameter=handles.ep.B.getNodeTankDiameter;
    for i=1:ndcnt       
        table(i,cp) = {num2str(node.ndtankdiameter(i))};
    end
    msg(11)=cp; cp=cp+1;  
end

%Minimum water volume 
if minvolumecount
    node.ndminvolume=handles.ep.B.getNodeTankMinimumWaterVolume;
    for i=1:ndcnt    
        table(i,cp) = {num2str(node.ndminvolume(i))};
    end
    msg(12)=cp; cp=cp+1;  
end

%Minimum water level
if Minlevelcount
    node.ndminlevel=handles.ep.B.getNodeTankMinimumWaterLevel;
    for i=1:ndcnt     
        table(i,cp) = {num2str(node.ndminlevel(i))};
    end
    msg(13)=cp; cp=cp+1;  
end
 
%Maximum water level
if Maxlevelcount
    node.ndmaxlevel=handles.ep.B.getNodeTankMaximumWaterLevel;
    for i=1:ndcnt    
        table(i,cp) = {num2str(node.ndmaxlevel(i))};
    end
    msg(14)=cp; cp=cp+1;  
end

%MixFraction
if MixFractioncount
    node.ndmixfraction=handles.ep.B.getNodeTankMinimumFraction;
    for i=1:ndcnt    
        table(i,cp) = {num2str(node.ndmixfraction(i))};
    end
    msg(15)=cp; cp=cp+1;  
end

%Bulk reaction
if Tank_kbulkcount
    node.ndbulk=handles.ep.B.getNodeTankBulkReactionCoeff;
    for i=1:ndcnt   
        table(i,cp) = {num2str(node.ndbulk(i))};
    end
    msg(16)=cp;
end

% what column can edit 
i=1;ColumnEditable='false false ';
while i<sum(total)-1
    ColumnEditable = strcat({ColumnEditable},' true');
    ColumnEditable = ColumnEditable{1,1};
    i=i+1;
end
set(handles.uitable1,'ColumnEditable',str2num(ColumnEditable));
 

set(handles.uitable1,'data', table);
set(handles.uitable1, 'ColumnName', {Columnnamess});
set(handles.uitable1,'ColumnFormat',{'bank','bank','bank','bank','bank','bank',...
    'bank','bank','bank','bank','bank','bank','bank','bank','bank',...
    'bank','bank','bank','bank','bank','bank'});
set(handles.uitable1, 'ColumnWidth',ColumnWidth);
set(handles.uitable1, 'FontName','Courier');


handles.msg =msg;


if handles.initial_node == 0
    
    
    if sum(total)~=2
        handles.node = node;
    else
        handles.node = 0;
    end


    if msg==0
        handles.node = 0;
    end


   handles.initial_node = 1;
end

% Update handles structure
guidata(hObject, handles);

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

%matrix
table = get(handles.uitable1,'data');

row = eventdata.Indices(1);
col = eventdata.Indices(2);
edit = eventdata.EditData;
previous = eventdata.PreviousData;
new = eventdata.NewData;

%CHECKBOX
%elevation
elecount = get(handles.elevation,'Value');
%basedemand
basecount= get(handles.basedemand,'Value');

%demandpattern
demandpatterncount= get(handles.demandpattern,'Value');

%emitter
emittercount= get(handles.emitter,'Value');

%initqual
initqualcount= get(handles.initqual,'Value');

%sourcequal
sourcequalcount= get(handles.sourcequal,'Value');

%sourcetype
sourcetypecount= get(handles.sourcetype,'Value');

%source pattern
sourcepatcount= get(handles.sourcepat,'Value');

%Initial_level_tank 
tanklevelcount= get(handles.tanklevel,'Value');

%TANK ONLY
%Mixing model 
mixmodelcount= get(handles.mixmodel,'Value');

%tank diameter
tankdiametercount= get(handles.tankdiameter,'Value');

%Minimum water volume 
minvolumecount = get(handles.minvolume,'Value');

%Minimum water level  
Minlevelcount = get(handles.minlevel,'Value');

%Maximum water level 
Maxlevelcount = get(handles.maxlevel,'Value');

%mixfraction
MixFractioncount = get(handles.mixfraction,'Value');

%Bulk reaction  
Tank_kbulkcount = get(handles.Tank_kbulk,'Value');

edit = str2num(edit);
d = length(edit);

[colelevation,colbasedemand,colemitter,coldemandpattern,...%thesi sto pinaka
    colinitqual,colsqual,colspat,colstype,coltanklevel,colmixmodel,...
    coltankdiameter,colminvolume,colminlevel,colmaxlevel,...
    colmixfraction,coltankbulk] = setcolnode(hObject, eventdata, handles); %control D! (see the END code)

%elevation
if elecount %simainei an epilexthike ii oxi
    if d && col==colelevation
        nd=handles.ep.B.getNodeElevations;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setNodeElevations(nd);
    elseif col==colelevation
        table{row,col}=previous;
    end
    set(handles.uitable1,'data',table);
end

%basedemand 
if basecount  
    if d && col==colbasedemand
        nd=handles.ep.B.getNodeBaseDemands;
        nd{1}(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setNodeBaseDemands(nd);
    elseif col==colbasedemand
        table{row,col}=previous;
    end
    set(handles.uitable1,'data',table);
end

%emitter
if emittercount 
    if d && col==colemitter
        nd=handles.ep.B.getNodeEmitterCoeff;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setNodeEmitterCoeff(nd);
    elseif col==colemitter
        table{row,col}=previous;
    end
    set(handles.uitable1,'data',table);
end
 
if demandpatterncount 
    if col==coldemandpattern
        table{row,col}= new;
        new=handles.ep.B.getPatternIndex(new);
        if ~new
            uiwait(msgbox('Invalid pattern.Set None Pattern. See Pattern Data.','Error','modal'));
            table{row,col}='None Pattern';
            set(handles.uitable1,'data',table);
            handles.ep.B.setNodeDemandPatternIndex(new);
        else
            handles.ep.B.setNodeDemandPatternIndex(new);
        end
        set(handles.uitable1,'data',table);
    end
end
% 
%initqual
if initqualcount
    if d && col==colinitqual
        nd=handles.ep.B.getNodeInitialQuality;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setNodeInitialQuality(nd);
    elseif col==colinitqual
        table{row,col}=previous;
    end
    set(handles.uitable1,'data',table);
end

%sourcequal
if sourcequalcount 
    if d && col==colsqual
        nd=handles.ep.B.getNodeSourceQuality;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setNodeSourceQuality(nd);
    elseif col==colsqual
        table{row,col}=previous;
    end
    set(handles.uitable1,'data',table);
end

%sourcepat
if sourcepatcount  
    if d && col==colspat
        table{row,col}= new;
        new=handles.ep.B.getPatternIndex(new);
        if ~new
            uiwait(msgbox('Invalid pattern.Set None Pattern. See Pattern Data.','Error','modal'));
            table{row,col}='None Pattern';
        end
        handles.ep.B.setNodeSourcePatternIndex(row,new);
        set(handles.uitable1,'data',table);
    end
end


%sourcetype
if sourcetypecount 
    if d && col==colstype
        table{row,col}= previous;
    elseif col==colstype
        table{row,col}= new;
        switch upper(new) 
           case 'CONCEN';
                 code=0;
           case 'MASS';
                 code=1;
           case 'SETPOINT';
                 code=2;
           case 'FLOWPACED';
                 code=3;
           case 'NONE';
                 code=4;
            otherwise
                code=-1;
        end                                               %row = index
    if code~=-1
        handles.ep.B.setNodeSourceType(row,new);
    else
        table{row,col}=previous;
    end
    
    elseif col==colstype
        table{row,col}=previous;
    end
    set(handles.uitable1,'data',table);
end

types=handles.ep.B.getNodeTypeIndex;
typecode=types(row);
if typecode == 2 
    %TANK
    %tanklevel
    if tanklevelcount 
        if d && col==coltanklevel
            nd=handles.ep.B.getNodeTankInitialLevel;
            nd(row)=str2num(new);
            table{row,col}= new;
            handles.ep.B.setNodeTankInitialLevel(nd);
        elseif col==coltanklevel
            table{row,col}=previous;
        end
        set(handles.uitable1,'data',table);
    end

    %mixmodel
    if mixmodelcount 
        if d && col==colmixmodel
            table{row,col}= previous;
        elseif col==colmixmodel
            table{row,col}=new;
            switch upper(new)
                case 'MIX1'
                    code=0;
                case 'MIX2'
                    code=1;
                case 'FIFO'
                    code=2;
                case 'LIFO'
                    code=3;
                otherwise
                    code=-1;
            end                                               %row = index
            if code~=-1
                calllib('epanet2','ENsetnodevalue',row,15,code);  % mixmodel code = 15
            else
                table{row,col}= previous;
            end
        end
        set(handles.uitable1,'data',table);
    end

    %tankdiameter
    if tankdiametercount 
        if d && col==coltankdiameter
            nd=handles.ep.B.getNodeTankDiameter;
            nd(row)=str2num(new);
            table{row,col}= new;
            handles.ep.B.setNodeTankDiameter(nd);
        elseif col==coltankdiameter
            table{row,col}=previous;
        end
        set(handles.uitable1,'data',table);
    end


    %minvolume
    if minvolumecount 
        if d && col==colminvolume
            nd=handles.ep.B.getNodeTankMinimumWaterVolume;
            nd(row)=str2num(new);
            table{row,col}= new;
            handles.ep.B.setNodeTankMinimumWaterVolume(nd);
        elseif col==colminvolume
            table{row,col}=previous;
        end
        set(handles.uitable1,'data',table);
    end

    %minlevel
    if Minlevelcount 
        if d && col==colminlevel
            nd=handles.ep.B.getNodeTankMinimumWaterLevel;
            nd(row)=str2num(new);
            table{row,col}= new;
            handles.ep.B.setNodeTankMinimumWaterLevel(nd);
        elseif col==colminlevel
            table{row,col}=previous;
        end
        set(handles.uitable1,'data',table);
    end
    % 
    %maxlevel
    if Maxlevelcount 
        if d && col==colmaxlevel
            nd=handles.ep.B.getNodeTankMaximumWaterLevel;
            nd(row)=str2num(new);
            table{row,col}= new;
            handles.ep.B.setNodeTankMaximumWaterLevel(nd);
        elseif col==colmaxlevel
            table{row,col}=previous;
        end
        set(handles.uitable1,'data',table);
    end

    %mixfraction
    if MixFractioncount 
        if d && col==colmixfraction
            nd=handles.ep.B.getNodeTankMinimumFraction;
            nd(row)=str2num(new);
            table{row,col}= new;
            handles.ep.B.setNodeTankMinimumFraction(nd);
        elseif col==colmixfraction
            table{row,col}=previous;
        end
        set(handles.uitable1,'data',table);
    end
    % 
    %Tank_bulk
    if Tank_kbulkcount 
        if d && col==coltankbulk
            nd=handles.ep.B.getNodeTankBulkReactionCoeff;
            nd(row)=str2num(new);
            table{row,col}= new;
            handles.ep.B.setNodeTankBulkReactionCoeff(nd);
        elseif col==coltankbulk
            table{row,col}=previous;
        end
        set(handles.uitable1,'data',table);
    end
     % col = column for tank
elseif (col == coltanklevel) || col==colmixmodel || col==coltankdiameter ...
            || col==colminlevel || col==colmaxlevel || col==colmixfraction...
            || col==coltankbulk || col==colminvolume

        table{row,col}=previous;
        set(handles.uitable1,'data',table);
end

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% w = waitforbuttonpress;
% if w == 0
%     fprintf('');
% else
%     disp('Key press');
% end


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in savebutton.
function savebutton_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EN_Saveinputfile(handles.ep);


% --- Executes on button press in sourcetype.
function sourcetype_Callback(hObject, eventdata, handles)
% hObject    handle to sourcetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sourcetype

ok(hObject, eventdata, handles)


% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.initial_node ==0
    set(handles.figure1,'visible','off');
    return
else
    node = handles.node;
end

[colelevation,colbasedemand,colemitter,coldemandpattern,...%thesi sto pinaka
    colinitqual,colsqual,colspat,colstype,coltanklevel,colmixmodel,...
    coltankdiameter,colminvolume,colminlevel,colmaxlevel,...
    colmixfraction,coltankbulk] = setcolnode(hObject, eventdata, handles); %control D! (see the END code)

ndcnt=handles.ep.B.getNodeCount;
if colelevation~=0    
    handles.ep.B.setNodeElevations(node.ndelevations);
end

if colbasedemand~=0    
    handles.ep.B.setNodeBaseDemands(node.ndbasedemands);
end

if colemitter~=0   
    handles.ep.B.setNodeEmitterCoeff(node.ndemitters);
end

if coldemandpattern~=0   
    handles.ep.B.setNodeDemandPatternIndex(node.nddemandpatternIndex);
end

if colinitqual~=0    
    handles.ep.B.setNodeInitialQuality(node.ndinitqual);
end

if colsqual~=0   
    handles.ep.B.setNodeSourceQuality(node.ndsourcequal);
end

if colspat~=0   
    handles.ep.B.setNodeSourcePatternIndex(node.ndsourcepat);
end

if colstype~=0   
    for i=1:ndcnt
        if ~isnan(node.ndsourcetype{i})
            handles.ep.B.setNodeSourceType(i,node.ndsourcetype{i});
        end
    end
end

if handles.ep.B.getNodeTankCount
    if coltanklevel~=0   
        handles.ep.B.setNodeTankInitialLevel(node.ndtanklevel);
    end

    if colmixmodel~=0   
        handles.ep.B.setNodeTankMixingModelType(node.ndmixmodel);
    end

    if coltankdiameter~=0   
        handles.ep.B.setNodeTankDiameter(node.ndtankdiameter);
    end

    if colminvolume~=0   
        handles.ep.B.setNodeTankMinimumWaterVolume(node.ndminvolume);
    end

    if colminlevel~=0   
        handles.ep.B.setNodeTankMinimumWaterLevel(node.ndminlevel);
    end

    if colmaxlevel~=0   
        handles.ep.B.setNodeTankMaximumWaterLevel(node.ndmaxlevel);
    end

    if colmixfraction~=0   
        handles.ep.B.setNodeTankMinimumFraction(node.ndmixfraction);
    end

    if coltankbulk~=0   
        handles.ep.B.setNodeTankBulkReactionCoeff(node.ndbulk);
    end
end

set(handles.figure1,'visible','off');

% --- Executes on button press in InitialVolume.
function InitialVolume_Callback(hObject, eventdata, handles)
% hObject    handle to InitialVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of InitialVolume

ok(hObject, eventdata, handles)


% --- Executes on button press in mixmodel.
function mixmodel_Callback(hObject, eventdata, handles)
% hObject    handle to mixmodel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hint: get(hObject,'Value') returns toggle state of mixmodel

ok(hObject, eventdata, handles)

% --- Executes on button press in tankdiameter.
function tankdiameter_Callback(hObject, eventdata, handles)
% hObject    handle to tankdiameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tankdiameter

ok(hObject, eventdata, handles)


% --- Executes on button press in minvolume.
function minvolume_Callback(hObject, eventdata, handles)
% hObject    handle to minvolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of minvolume

ok(hObject, eventdata, handles)


% --- Executes on button press in mixfraction.
function mixfraction_Callback(hObject, eventdata, handles)
% hObject    handle to mixfraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mixfraction

ok(hObject, eventdata, handles)


% --- Executes on button press in Tank_kbulk.
function Tank_kbulk_Callback(hObject, eventdata, handles)
% hObject    handle to Tank_kbulk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Tank_kbulk

ok(hObject, eventdata, handles)


% --- Executes on button press in minlevel.
function minlevel_Callback(hObject, eventdata, handles)
% hObject    handle to minlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of minlevel

ok(hObject, eventdata, handles)



% --- Executes on button press in maxlevel.
function maxlevel_Callback(hObject, eventdata, handles)
% hObject    handle to maxlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of maxlevel

ok(hObject, eventdata, handles)


% --- Executes on button press in tanklevel.
function tanklevel_Callback(hObject, eventdata, handles)
% hObject    handle to tanklevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tanklevel

ok(hObject, eventdata, handles)


% --- Executes on button press in sourcepat.
function sourcepat_Callback(hObject, eventdata, handles)
% hObject    handle to sourcepat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sourcepat

ok(hObject, eventdata, handles)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cancel_Callback(hObject, eventdata, handles);
% Hint: delete(hObject) closes the figure
delete(hObject);

function [colelevation,colbasedemand,colemitter,coldemandpattern,...
    colinitqual,colsqual,colspat,colstype,coltanklevel,colmixmodel,...
    coltankdiameter,colminvolume,colminlevel,colmaxlevel,...
    colmixfraction,coltankbulk] = setcolnode(hObject, eventdata, handles)

% thesi sto pinaka
msg = handles.msg; 

colelevation = msg(1);
colbasedemand = msg(2);
colemitter = msg(3);
coldemandpattern = msg(4);
colinitqual = msg(5);
colsqual = msg(6);
colspat = msg(7);
colstype = msg(8);
coltanklevel = msg(9);
colmixmodel = msg(10);
coltankdiameter = msg(11);
colminvolume = msg(12);
colminlevel = msg(13);
colmaxlevel = msg(14);
colmixfraction = msg(15);
coltankbulk = msg(16);


% --- Executes on button press in cancel.
function helpbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.closehelp==0
    
    set(handles.text1,'visible','on');
    
    handles.closehelp=1;
    % Update handles structure
    guidata(hObject, handles);

else
    
    set(handles.text1,'visible','off');
    handles.closehelp=0;
    % Update handles structure
    guidata(hObject, handles);

end
