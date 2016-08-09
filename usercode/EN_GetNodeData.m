function varargout = EN_GetNodeData(varargin)
% EN_GetNodeData M-file for EN_GetNodeData.fig
%      EN_GetNodeData, by itself, creates a new EN_GetNodeData or raises the existing
%      singleton*.
%
%      H = EN_GetNodeData returns the handle to a new EN_GetNodeData or the handle to
%      the existing singleton*.
%
%      EN_GetNodeData('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_GetNodeData.M with the given input arguments.
%
%      EN_GetNodeData('Property','Value',...) creates a new EN_GetNodeData or raises the
%      existing singleton*.  Starting from the leunits1, property value pairs are
%      applied to the GUI before EN_GetNodeData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_GetNodeData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_GetNodeData

% Last Modified by GUIDE v2.5 22-Oct-2015 04:27:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_GetNodeData_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_GetNodeData_OutputFcn, ...
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


% --- Executes just before EN_GetNodeData is made visible.
function EN_GetNodeData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_GetNodeData (see VARARGIN)

% Choose default command line output for EN_GetNodeData
handles.output = hObject;
handles.ep = varargin{1};
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EN_GetNodeData wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Get Node Data');
set(handles.loading,'visible','off');

%count en_getnodedata
set(handles.athours,'String',0);

writeBasicOntable(handles);

set(handles.uitable8,'Position',[2.2 0.692 168.2 15.154]);
set(handles.figure1,'Position',[40 15 172.5 39.7]);

set(handles.checkbox1elevation,'Value',1);    
set(handles.basedemand,'Value',1);    
set(handles.demandpattern,'Value',0);    
set(handles.emitter,'Value',1);    
set(handles.initqual,'Value',0);    
set(handles.sourcequal,'Value',0);    
set(handles.sourcepat,'Value',0);    
set(handles.sourcetype,'Value',0);    
set(handles.tanklevel,'Value',0);    
set(handles.demand,'Value',0);    
set(handles.head,'Value',0);    
set(handles.pressure,'Value',0);    
set(handles.quality,'Value',0);  
set(handles.sourcemass,'Value',0);    
set(handles.InitialVolume,'Value',0);    
set(handles.mixmodel,'Value',0);    
set(handles.Mixzonevolume,'Value',0);    
set(handles.tankdiameter,'Value',0);    
set(handles.minvolume,'Value',0);    
set(handles.VolumeCurve,'Value',0);    
set(handles.Minlevel,'Value',0);    
set(handles.Maxlevel,'Value',0);    
set(handles.MixFraction,'Value',0);    
set(handles.Tank_kbulk,'Value',0);   
set(handles.allparameters,'Value',0);   
    
    
handles.NODE=0;

guidata(hObject, handles);
okbutton_Callback(hObject, eventdata, handles)
% --- Outputs from this function are returned to the command line.
function varargout = EN_GetNodeData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable3.
function uitable3_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Graphsbutton.
function Graphsbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Graphsbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

EN_GraphsNodes(handles.ep);


% --- Executes on button press in checkbox1elevation.
function checkbox1elevation_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1elevation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1elevation


% --- Executes on button press in okbutton.
function okbutton_Callback(hObject, eventdata, handles)
% hObject    handle to okbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.loading,'visible','on');
pause(0.01);
% clear table


% insert data in table
%count en_getnodedata
[ndcnt]=writeBasicOntable(handles);

%%%continued, CHECKBOX

elevation = get(handles.checkbox1elevation,'String');
elecount = get(handles.checkbox1elevation,'Value');

basedemand = get(handles.basedemand,'String');
basecount= get(handles.basedemand,'Value');

%demandpattern
demandpattern = get(handles.demandpattern,'String');
demandpatterncount= get(handles.demandpattern,'Value');

%emitter
emitter = get(handles.emitter,'String');
emittercount= get(handles.emitter,'Value');

%initqual
initqual = get(handles.initqual,'String');
initqualcount= get(handles.initqual,'Value');

%sourcequal
sourcequal = get(handles.sourcequal,'String');
sourcequalcount= get(handles.sourcequal,'Value');

%sourcepat
sourcepat = get(handles.sourcepat,'String');
sourcepatcount= get(handles.sourcepat,'Value');

%Source type 
sourcetype = get(handles.sourcetype,'String');
Sourcetypecount= get(handles.sourcetype,'Value');

%Initial_level_tank 
tanklevel = get(handles.tanklevel,'String');
tanklevelcount= get(handles.tanklevel,'Value');

%Actual demand 
demand = get(handles.demand,'String');
demandcount= get(handles.demand,'Value');


%Hydraulic head 
head = get(handles.head,'String');
headcount= get(handles.head,'Value');


%Pressure 
pressure = get(handles.pressure,'String');
pressurecount= get(handles.pressure,'Value');

%Actual quality 
quality = get(handles.quality,'String');
qualitycount= get(handles.quality,'Value');

%Mass flow rate
sourcemass = get(handles.sourcemass,'String');
sourcemasscount= get(handles.sourcemass,'Value');


%TANK ONLY
%InitialVolume
InitialVolume = get(handles.InitialVolume,'String');
InitialVolumecount= get(handles.InitialVolume,'Value');

%Mixing model 
mixmodel = get(handles.mixmodel,'String');
mixmodelcount= get(handles.mixmodel,'Value');

%Mixzonevolume
Mixzonevolume = get(handles.Mixzonevolume,'String');
Mixzonevolumecount= get(handles.Mixzonevolume,'Value');

%tank diameter
tankdiameter  = get(handles.tankdiameter,'String');
tankdiametercount= get(handles.tankdiameter,'Value');

%Minimum water volume 
minvolume = get(handles.minvolume,'String');
minvolumecount = get(handles.minvolume,'Value');

%VolumeCurve
VolumeCurve = get(handles.VolumeCurve,'String');
VolumeCurvecount = get(handles.VolumeCurve,'Value');

%Minimum water level  
Minlevel = get(handles.Minlevel,'String');
Minlevelcount = get(handles.Minlevel,'Value');

%Maximum water level 
Maxlevel = get(handles.Maxlevel,'String');
Maxlevelcount = get(handles.Maxlevel,'Value');

%MixFraction
MixFraction = get(handles.MixFraction,'String');
MixFractioncount = get(handles.MixFraction,'Value');

%Bulk reaction  
Tank_kBulk = get(handles.Tank_kbulk,'String');
Tank_kbulkcount = get(handles.Tank_kbulk,'Value');

%control checkbox choise, 1-yes. 0-no
 total = [1 1 1 elecount basecount  emittercount demandpatterncount initqualcount sourcequalcount... 
    sourcepatcount Sourcetypecount tanklevelcount demandcount headcount pressurecount...
    qualitycount sourcemasscount InitialVolumecount mixmodelcount Mixzonevolumecount...
    tankdiametercount minvolumecount VolumeCurvecount Minlevelcount Maxlevelcount...
    MixFractioncount Tank_kbulkcount];

f = sum(total);% f is variable
units=handles.ep.B.getBinUnits;
%Column names :
for i=1:f
  v= strfind(total,1);
  switch v(i)
        case 1
            cnames{i}='Index'; 
            ColumnWidth{i}=120;
        case 2
            cnames{i}='Type'; 
            ColumnWidth{i}=120;
        case 3
            cnames{i}='ID'; 
            ColumnWidth{i}=110;
        case 4
            elevation=sprintf('%s (%s)',elevation,units.BinNodeElevationUnits);
            cnames{i}=elevation; 
            ColumnWidth{i}=140;
        case 5
            basedemand=sprintf('%s (%s)',basedemand,units.BinLinkFlowUnits);
            cnames{i}=basedemand;
            ColumnWidth{i}=180;
        case 6
            cnames{i}=emitter;
            ColumnWidth{i}=140;
        case 7
            cnames{i}= demandpattern;
            ColumnWidth{i}=150;
        case 8
            initqual=sprintf('%s (%s)',initqual,units.BinQualityUnits(1:4));
            cnames{i}=initqual;
            ColumnWidth{i}=160;
        case 9
            sourcequal=sprintf('%s (%s)',sourcequal,units.BinQualityUnits(1:4));
            cnames{i}=sourcequal;
            ColumnWidth{i}=160;
        case 10
            cnames{i}=sourcepat;    
            ColumnWidth{i}=160;
        case 11
            cnames{i}=sourcetype;
            ColumnWidth{i}=160;
        case 12
            tanklevel=sprintf('%s (%s)',tanklevel,units.BinNodeTankDiameterUnits);
            cnames{i}=tanklevel;
            ColumnWidth{i}=160;
        case 13
            demand=sprintf('%s (%s)',demand,units.BinLinkFlowUnits);
            cnames{i}=demand;
            ColumnWidth{i}=180;
        case 14
            head=sprintf('%s (%s)',head,units.BinNodeHeadUnits);
            cnames{i}=head;  
            ColumnWidth{i}=160;
        case 15
            pressure=sprintf('%s (%s)',pressure,units.BinNodePressureUnits); 
            cnames{i}=pressure;  
            ColumnWidth{i}=160;
        case 16
            quality=sprintf('%s (%s)',quality,units.BinQualityUnits(1:4));
            cnames{i}=quality;    
            ColumnWidth{i}=160;
        case 17
            sourcemass=sprintf('%s (%s)',sourcemass,units.BinQualitySourceMassInjectionUnits);
            cnames{i}=sourcemass;
            ColumnWidth{i}=180;
        case 18
            InitialVolume = sprintf('%s (%s)',InitialVolume,units.BinNodeTankVolumeUnits);
            cnames{i}=InitialVolume;
            ColumnWidth{i}=160;
        case 19
            cnames{i}=mixmodel;
            ColumnWidth{i}=160;
        case 20
            Mixzonevolume = sprintf('%s (%s)',Mixzonevolume,units.BinNodeTankVolumeUnits);
            cnames{i}=Mixzonevolume;
            ColumnWidth{i}=180;
        case 21
            tankdiameter=sprintf('%s (%s)',tankdiameter,units.BinNodeTankVolumeUnits);
            cnames{i}=tankdiameter;
            ColumnWidth{i}=180;
        case 22
            minvolume = sprintf('%s (%s)',minvolume,units.BinNodeTankVolumeUnits);
            cnames{i}=minvolume;
            ColumnWidth{i}=200;
        case 23
            VolumeCurve = sprintf('%s (%s)',VolumeCurve,units.BinNodeTankVolumeUnits);
            cnames{i}=VolumeCurve;
            ColumnWidth{i}=180;
        case 24
            Minlevel=sprintf('%s (%s)',Minlevel,units.BinNodeTankDiameterUnits);
            cnames{i}=Minlevel;
            ColumnWidth{i}=180;
         case 25
            Maxlevel=sprintf('%s (%s)',Maxlevel,units.BinNodeTankDiameterUnits);
            cnames{i}=Maxlevel;
            ColumnWidth{i}=180;
         case 26
            cnames{i}=MixFraction;
            ColumnWidth{i}=160;
         case 27
            cnames{i}=Tank_kBulk;
            ColumnWidth{i}=160;
    end
    Columnnamess = char(cnames);   
end

%AT HOURS
athours  = str2num(get(handles.athours,'String'));
set(handles.athours,'String',athours);

if (length(athours)==0)   
    set(handles.loading,'visible','off');
    uiwait(msgbox('Please set "Nodes at (number) Hrs"','modal'));
    return
end

%TABLE
table = get(handles.uitable8,'Data');
cp=4; %counttable ------ cp = number for column 
if elecount
    ndelevations=handles.ep.B.getNodeElevations;
    for i=1:ndcnt
        %elevation
        table(i,cp) = {num2str(ndelevations(i))};
    end
    cp=5;
end

if basecount
    ndbasedemands=handles.ep.B.getNodeBaseDemands;
    try
        ndbasedemands=ndbasedemands{1};
    catch e
    end
    for i=1:ndcnt
    %basedemand
        table(i,cp) = {num2str(ndbasedemands(i))};
    end
    cp=cp+1;
end

if emittercount
    ndemitters=handles.ep.B.getNodeEmitterCoeff;
    for i=1:ndcnt
        %emitter
        table(i,cp) = {num2str(ndemitters(i))};
    end
    cp=cp+1;
end


if demandpatterncount    
    nddemandpattern=handles.ep.B.getPatternNameID;
    nddemandpatternIndex=handles.ep.B.getNodeDemandPatternIndex; 
    try
        nddemandpatternIndex=nddemandpatternIndex{1};
    catch e
    end
    for i=1:ndcnt
        if nddemandpatternIndex(i)
            table(i,cp) = {nddemandpattern{nddemandpatternIndex(i)}};
        else
            table(i,cp) = {'None Pattern'};
        end
    end
    cp=cp+1;
end

if initqualcount
    ndinitqual=handles.ep.B.getNodeInitialQuality;
    for i=1:ndcnt
        %initqual
        table(i,cp) = {num2str(ndinitqual(i))};
    end
    cp=cp+1;
end

if sourcequalcount
    ndsourcequal=handles.ep.B.getNodeSourceQuality;
    for i=1:ndcnt
        %sourcequal
        table(i,cp) = {num2str(ndsourcequal(i))};
    end
    cp=cp+1;
end

if sourcepatcount
    ndsourcepat=handles.ep.B.getNodeSourcePatternIndex;
    chisnan=isnan(ndsourcepat);
    for i=1:ndcnt
        if chisnan(i)==0
            table(i,cp) = {'NaN'};
        elseif ~chisnan(i)
            table(i,cp) = {handles.ep.B.getPatternNameID{ndsourcepat(i)}};
        else
            table(i,cp) = {'NaN'};%{num2str(ndsourcepat(i))};
        end
    end
    cp=cp+1;
end

if Sourcetypecount
    ndsourcetype=handles.ep.B.getNodeSourceType;
    for i=1:ndcnt
        if isempty(ndsourcetype{i}); ndsourcetype{i}='NaN'; end
        table(i,cp) = {ndsourcetype{i}};  
    end
    cp=cp+1;
end

% %Initial_level_tank
if tanklevelcount
    ndtanklevel=handles.ep.B.getNodeTankInitialLevel;
    for i=1:ndcnt
        table(i,cp) = {num2str(ndtanklevel(i))}; 
    end
    cp=cp+1;
end
 
% %Actual demand 
if demandcount
    handles.ep.B.setTimeSimulationDuration(athours*3600);   
    handles.ep.B.solveCompleteHydraulics;
    nddemand=handles.ep.B.getNodeActualDemand;
    for i=1:ndcnt
        table(i,cp) = {num2str(nddemand(i))};
    end
    cp=cp+1;
end

%Hydraulic head 
if headcount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    ndhead=handles.ep.B.getNodeHydaulicHead;
    for i=1:ndcnt
        table(i,cp) = {num2str(ndhead(i))};
    end
    cp=cp+1;
end

%Pressure 
if pressurecount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    ndpressure=handles.ep.B.getNodePressure;
    for i=1:ndcnt
        table(i,cp) = {num2str(ndpressure(i))};
    end
    cp=cp+1;
end

%Actual quality 
if qualitycount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    handles.ep.B.solveCompleteQuality;
    ndquality=handles.ep.B.getNodeActualQuality;
    for i=1:ndcnt          
        table(i,cp) = {num2str(ndquality(i))};
    end
    cp=cp+1;
end

%Mass flow rate
if sourcemasscount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    ndsourcemass=handles.ep.B.getNodeMassFlowRate;
    for i=1:ndcnt       
        table(i,cp) = {num2str(ndsourcemass(i))};
    end
    cp=cp+1;
end

%TANK ONLY
%InitialVolume
if InitialVolumecount
    ndinitvolume=handles.ep.B.getNodeTankInitialWaterVolume;
    for i=1:ndcnt
        table(i,cp) = {num2str(ndinitvolume(i))};
    end
    cp=cp+1;
end

%Mixing model 
if mixmodelcount
    ndmixmodel=handles.ep.B.getNodeTankMixingModelType;
    for i=1:ndcnt
        if handles.ep.B.getNodeTankCount
            typemixmodel = ndmixmodel{i};
            table(i,cp) = {typemixmodel};
        else
            table(i,cp) = {'No Tank'};
        end
        if isempty(ndmixmodel)
            table(i,cp) = {'No Tank'};
        end
    end
    cp=cp+1;
end

%Mixzonevolume
if Mixzonevolumecount
    ndmixzonevolume=handles.ep.B.getNodeTankMixZoneVolume;
    for i=1:ndcnt     
        table(i,cp) = {num2str(ndmixzonevolume(i))};
    end
    cp=cp+1;
end

%tank diameter
if tankdiametercount
    ndtankdiameter=handles.ep.B.getNodeTankDiameter;
    for i=1:ndcnt       
        table(i,cp) = {num2str(ndtankdiameter(i))};
    end
    cp=cp+1;
end

%Minimum water volume 
if minvolumecount
    ndminvolume=handles.ep.B.getNodeTankMinimumWaterVolume;
    for i=1:ndcnt    
        table(i,cp) = {num2str(ndminvolume(i))};
    end
    cp=cp+1;
end

%VolumeCurve
if VolumeCurvecount
    ndvolumeCurve=handles.ep.B.getNodeTankVolumeCurveIndex;
    for i=1:ndcnt    
        table(i,cp) = {num2str(ndvolumeCurve(i))};
    end
    cp=cp+1;
end

%Minimum water level
if Minlevelcount
    ndminlevel=handles.ep.B.getNodeTankMinimumWaterLevel;
    for i=1:ndcnt     
        table(i,cp) = {num2str(ndminlevel(i))};
    end
    cp=cp+1;
end
 
%Maximum water level
if Maxlevelcount
    ndmaxlevel=handles.ep.B.getNodeTankMaximumWaterLevel;
    for i=1:ndcnt    
        table(i,cp) = {num2str(ndmaxlevel(i))};
    end
    cp=cp+1;
end

%MixFraction
if MixFractioncount
    ndmixfraction=handles.ep.B.getNodeTankMinimumFraction;
    for i=1:ndcnt    
        table(i,cp) = {num2str(ndmixfraction(i))};
    end
    cp=cp+1;
end

%Bulk reaction
if Tank_kbulkcount
    ndbulk=handles.ep.B.getNodeTankBulkReactionCoeff;
    for i=1:ndcnt   
        table(i,cp) = {num2str(ndbulk(i))};
    end
end
set(handles.uitable8,'data', table);
set(handles.uitable8, 'ColumnName', {Columnnamess});
set(handles.uitable8,'ColumnFormat',{'bank','bank','bank','bank','bank','bank',...
    'bank','bank','bank','bank','bank','bank','bank','bank','bank',...
    'bank','bank','bank','bank','bank','bank','bank','bank','bank','bank','bank',...
    'bank'});
set(handles.uitable8, 'ColumnWidth',ColumnWidth);
set(handles.uitable8, 'FontName','Courier');
% set(handles.uitable8,'units','normalized');  % this will resize the table whenever its container is resized

set(handles.loading,'visible','off');

NODE = get(handles.uitable8,'Data');
handles.NODE= NODE;
guidata(hObject, handles);

% --- Executes on button press in basedemand.
function basedemand_Callback(hObject, eventdata, handles)
% hObject    handle to basedemand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of basedemand


% --- Executes on button press in emitter.
function emitter_Callback(hObject, eventdata, handles)
% hObject    handle to emitter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of emitter


% --- Executes on button press in initqual.
function initqual_Callback(hObject, eventdata, handles)
% hObject    handle to initqual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of initqual


% --- Executes on button press in sourcequal.
function sourcequal_Callback(hObject, eventdata, handles)
% hObject    handle to sourcequal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sourcequal


% --- Executes on button press in sourcepat.
function sourcepat_Callback(hObject, eventdata, handles)
% hObject    handle to sourcepat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sourcepat


% --- Executes on button press in sourcetype.
function sourcetype_Callback(hObject, eventdata, handles)
% hObject    handle to sourcetype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sourcetype


% --- Executes on button press in tanklevel.
function tanklevel_Callback(hObject, eventdata, handles)
% hObject    handle to tanklevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tanklevel


% --- Executes on button press in demand.
function demand_Callback(hObject, eventdata, handles)
% hObject    handle to demand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of demand


% --- Executes on button press in head.
function head_Callback(hObject, eventdata, handles)
% hObject    handle to head (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of head


% --- Executes on button press in pressure.
function pressure_Callback(hObject, eventdata, handles)
% hObject    handle to pressure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pressure


% --- Executes on button press in quality.
function quality_Callback(hObject, eventdata, handles)
% hObject    handle to quality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of quality


% --- Executes on button press in sourcemass.
function sourcemass_Callback(hObject, eventdata, handles)
% hObject    handle to sourcemass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sourcemass


% --- Executes on button press in InitialVolume.
function InitialVolume_Callback(hObject, eventdata, handles)
% hObject    handle to InitialVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of InitialVolume


% --- Executes on button press in mixmodel.
function mixmodel_Callback(hObject, eventdata, handles)
% hObject    handle to mixmodel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mixmodel


% --- Executes on button press in Mixzonevolume.
function Mixzonevolume_Callback(hObject, eventdata, handles)
% hObject    handle to Mixzonevolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Mixzonevolume


% --- Executes on button press in tankdiameter.
function tankdiameter_Callback(hObject, eventdata, handles)
% hObject    handle to tankdiameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tankdiameter


% --- Executes on button press in minvolume.
function minvolume_Callback(hObject, eventdata, handles)
% hObject    handle to minvolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of minvolume


% --- Executes on button press in VolumeCurve.
function VolumeCurve_Callback(hObject, eventdata, handles)
% hObject    handle to VolumeCurve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of VolumeCurve


% --- Executes on button press in Minlevel.
function Minlevel_Callback(hObject, eventdata, handles)
% hObject    handle to Minlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Minlevel


% --- Executes on button press in Maxlevel.
function Maxlevel_Callback(hObject, eventdata, handles)
% hObject    handle to Maxlevel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Maxlevel


% --- Executes on button press in MixFraction.
function MixFraction_Callback(hObject, eventdata, handles)
% hObject    handle to MixFraction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MixFraction


% --- Executes on button press in Tank_kbulk.
function Tank_kbulk_Callback(hObject, eventdata, handles)
% hObject    handle to Tank_kbulk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Tank_kbulk


% --- Executes on button press in demandpattern.
function demandpattern_Callback(hObject, eventdata, handles)
% hObject    handle to demandpattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of demandpattern


% --- Executes on button press in clearbutton.
function clearbutton_Callback(hObject, eventdata, handles)
% hObject    handle to clearbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.loading,'visible','off');

%count en_getnodedata
set(handles.athours,'String',0);

writeBasicOntable(handles);
set(handles.uitable8,'Position',[2.2 0.692 168.2 15.154]);
set(handles.figure1,'Position',[40 15 172.5 39.7]);

handles.NODE=0;
guidata(hObject, handles);

% Set value 0 for all checkbox
set(handles.checkbox1elevation,'Value',0);    
set(handles.basedemand,'Value',0);    
set(handles.demandpattern,'Value',0);    
set(handles.emitter,'Value',0);    
set(handles.initqual,'Value',0);    
set(handles.sourcequal,'Value',0);    
set(handles.sourcepat,'Value',0);    
set(handles.sourcetype,'Value',0);    
set(handles.tanklevel,'Value',0);    
set(handles.demand,'Value',0);    
set(handles.head,'Value',0);    
set(handles.pressure,'Value',0);    
set(handles.quality,'Value',0);  
set(handles.sourcemass,'Value',0);    
set(handles.InitialVolume,'Value',0);    
set(handles.mixmodel,'Value',0);    
set(handles.Mixzonevolume,'Value',0);    
set(handles.tankdiameter,'Value',0);    
set(handles.minvolume,'Value',0);    
set(handles.VolumeCurve,'Value',0);    
set(handles.Minlevel,'Value',0);    
set(handles.Maxlevel,'Value',0);    
set(handles.MixFraction,'Value',0);    
set(handles.Tank_kbulk,'Value',0);   
set(handles.allparameters,'Value',0);

% --- Executes on button press in allparameters.
function allparameters_Callback(hObject, eventdata, handles)
% hObject    handle to allparameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of allparameters

% all parameters checkbox
all = get(handles.allparameters,'Value');

if all
    
    set(handles.checkbox1elevation,'Value',1);    
    set(handles.basedemand,'Value',1);    
    set(handles.demandpattern,'Value',1);    
    set(handles.emitter,'Value',1);    
    set(handles.initqual,'Value',1);    
    set(handles.sourcequal,'Value',1);    
    set(handles.sourcepat,'Value',1);    
    set(handles.sourcetype,'Value',1);    
    set(handles.tanklevel,'Value',1);    
    set(handles.demand,'Value',1);    
    set(handles.head,'Value',1);    
    set(handles.pressure,'Value',1);    
    set(handles.quality,'Value',1);  
    set(handles.sourcemass,'Value',1);    
    set(handles.InitialVolume,'Value',1);    
    set(handles.mixmodel,'Value',1);    
    set(handles.Mixzonevolume,'Value',1);    
    set(handles.tankdiameter,'Value',1);    
    set(handles.minvolume,'Value',1);    
    set(handles.VolumeCurve,'Value',1);    
    set(handles.Minlevel,'Value',1);    
    set(handles.Maxlevel,'Value',1);    
    set(handles.MixFraction,'Value',1);    
    set(handles.Tank_kbulk,'Value',1);   
    
else
    
    set(handles.checkbox1elevation,'Value',0);    
    set(handles.basedemand,'Value',0);    
    set(handles.demandpattern,'Value',0);    
    set(handles.emitter,'Value',0);    
    set(handles.initqual,'Value',0);    
    set(handles.sourcequal,'Value',0);    
    set(handles.sourcepat,'Value',0);    
    set(handles.sourcetype,'Value',0);    
    set(handles.tanklevel,'Value',0);    
    set(handles.demand,'Value',0);    
    set(handles.head,'Value',0);    
    set(handles.pressure,'Value',0);    
    set(handles.quality,'Value',0);  
    set(handles.sourcemass,'Value',0);    
    set(handles.InitialVolume,'Value',0);    
    set(handles.mixmodel,'Value',0);    
    set(handles.Mixzonevolume,'Value',0);    
    set(handles.tankdiameter,'Value',0);    
    set(handles.minvolume,'Value',0);    
    set(handles.VolumeCurve,'Value',0);    
    set(handles.Minlevel,'Value',0);    
    set(handles.Maxlevel,'Value',0);    
    set(handles.MixFraction,'Value',0);    
    set(handles.Tank_kbulk,'Value',0);   
    
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

NODE = handles.NODE;
checkLabels = {'Save results to workspace'};
varNames = {'Node_Data'};
items = {NODE};
a = export2wsdlg(checkLabels, varNames, items, 'Save'); 
set(a, 'resize','off')

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Close Get Node Data.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

set(handles.figure1,'visible','off');

% Update handles structure
guidata(hObject, handles);


function athours_Callback(hObject, eventdata, handles)
% hObject    handle to athours (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of athours as text
%        str2double(get(hObject,'String')) returns contents of athours as a double
okbutton_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function athours_CreateFcn(hObject, eventdata, handles)
% hObject    handle to athours (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected cell(s) is changed in uitable8.
function uitable8_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable8 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when entered data in editable cell(s) in uitable8.
function uitable8_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable8 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uitable8_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uitable8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function [ndcnt]=writeBasicOntable(handles)
% %matrix
ndcnt=handles.ep.B.getNodeCount;
tr = {'Index' 'Type' 'ID'};
set(handles.uitable8,'Data',tr);
ids = handles.ep.B.getNodeNameID;
indices = handles.ep.B.getNodeIndex(ids);
types = handles.ep.B.getNodeType;
%matrix
table = get(handles.uitable8,'Data');
for i=1:ndcnt
    %index
    table(i,1) = {num2str(indices(i))};
    %id
    id = ids{i};
    table(i,3) = {id};
    %type
    type = types{i};
    table(i,2) ={type};
end
set(handles.uitable8,'data', table);
set(handles.uitable8, 'ColumnName', {'Index','Type','ID'});


% --- Executes on selection change in listbox.
function listbox_Callback(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox


% --- Executes during object creation, after setting all properties.
function listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
