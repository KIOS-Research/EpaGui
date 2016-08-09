function varargout = EN_Hydraulics(varargin)
% EN_HYDRAULICS M-file for EN_Hydraulics.fig
%      EN_HYDRAULICS, by itself, creates a new EN_HYDRAULICS or raises the existing
%      singleton*.
%
%      H = EN_HYDRAULICS returns the handle to a new EN_HYDRAULICS or the handle to
%      the existing singleton*.
%
%      EN_HYDRAULICS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_HYDRAULICS.M with the given input arguments.
%
%      EN_HYDRAULICS('Property','Value',...) creates a new EN_HYDRAULICS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EN_Hydraulics_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_Hydraulics_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_Hydraulics

% Last Modified by GUIDE v2.5 23-Oct-2015 20:37:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_Hydraulics_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_Hydraulics_OutputFcn, ...
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


% --- Executes just before EN_Hydraulics is made visible.
function EN_Hydraulics_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_Hydraulics (see VARARGIN)

% Choose default command line output for EN_Hydraulics
handles.output = hObject;
handles.ep = varargin{1};
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EN_Hydraulics wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','');
table = get(handles.uitable1,'data');
table(1,2) = {handles.ep.B.getBinOptionsInfo.BinLinkFlowUnits};
table(2,2) = {handles.ep.B.getBinOptionsInfo.BinOptionsHeadloss};

table(3,2) = {handles.ep.B.getOptionsMaxTrials};
table(4,2) = {handles.ep.B.getOptionsAccuracyValue};
table(5,2) = {handles.ep.B.getOptionsPatternDemandMultiplier};
table(6,2) = {handles.ep.B.getOptionsEmitterExponent};

table(1,1) = {'Flow units'};
table(2,1) = {'Headloss Formula'};
table(3,1) = {'Maximum Trials'};
table(4,1) = {'Accuracy'};
table(5,1) = {'Demand Pattern'};
table(6,1) = {'Emitter Exponent'};

set(handles.uitable1,'data',table);

set(handles.uitable1,'ColumnWidth',{90 90});
psfig=get(handles.figure1,'Position');
psfig(3)=39.8;
psfig(4)=11.5;
set(handles.figure1,'Position',psfig);
psTa=get(handles.uitable1,'Position');
psTa(4)=10.5;
psTa(3)=36.4;
set(handles.uitable1,'Position',psTa);

% --- Outputs from this function are returned to the command line.
function varargout = EN_Hydraulics_OutputFcn(hObject, eventdata, handles) 
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
handles.d  = get(handles.uitable1,'Data');
if ~strcmp(handles.ep.B.getBinOptionsInfo.BinLinkFlowUnits,upper(handles.d{1,2}))
    switch  upper(handles.d{1,2})
        case 'CFS' 
            handles.ep.B.setBinFlowUnitsCFS;
            handles.d(1,2)={'CFS'};
        case 'MGD'
            handles.ep.B.setBinFlowUnitsMGD;
            handles.d(1,2)={'MGD'};
        case 'IMGD'
            handles.ep.B.setBinFlowUnitsIMGD;
            handles.d(1,2)={'IMGD'};
        case 'AFD'
            handles.ep.B.setBinFlowUnitsAFD;
            handles.d(1,2)={'AFD'};
        case 'LPS'
            handles.ep.B.setBinFlowUnitsLPS;
            handles.d(1,2)={'LPS'};
        case 'LPM'
            handles.ep.B.setBinFlowUnitsLPM;
            handles.d(1,2)={'LPM'};
        case 'MLD'
            handles.ep.B.setBinFlowUnitsMLD;
            handles.d(1,2)={'MLD'};
        case 'CMH'
            handles.ep.B.setBinFlowUnitsCMH;
            handles.d(1,2)={'CMH'};
        case 'CMD'
            handles.ep.B.setBinFlowUnitsCMD;
            handles.d(1,2)={'CMD'};
        case 'GPM'
            handles.ep.B.setBinFlowUnitsGPM;    
            handles.d(1,2)={'GPM'};
        otherwise
            handles.d(1,2)={handles.ep.B.getBinOptionsInfo.BinLinkFlowUnits};
    end
else
    handles.d(1,2)={handles.ep.B.getBinOptionsInfo.BinLinkFlowUnits};
end

set(handles.ep.flowunits,'String',['Flow Units: ',handles.d{1,2}]);

if ~strcmp(handles.ep.B.getBinOptionsInfo.BinOptionsHeadloss,upper(handles.d{2,2}))
    switch  upper(handles.d{2,2})
        case 'H-W'
            handles.ep.B.setBinHeadlossHW;
            handles.d(2,2)={'H-W'};
        case 'D-W'
            handles.ep.B.setBinHeadlossDW;
            handles.d(2,2)={'D-W'};
        case 'C-M'
            handles.ep.B.setBinHeadlossCM;  
            handles.d(2,2)={'C-M'};
        otherwise
            handles.d(2,2)={handles.ep.B.getBinOptionsInfo.BinOptionsHeadloss};
    end
else
    handles.d(2,2)={handles.ep.B.getBinOptionsInfo.BinOptionsHeadloss};
end
a = eventdata.EditData;
a =str2num(a); 
a = length(a); % a = lenght([])%error a=0

if eventdata.Indices(1)>2
    if a==0  %set table = handles.d
        handles.d(eventdata.Indices(1),eventdata.Indices(2))={eventdata.PreviousData};
    elseif eventdata.Indices(1)==3
        handles.ep.B.setOptionsMaxTrials(eventdata.NewData);
        handles.d(3,2)={eventdata.NewData};
    end

    if a==0
        handles.d(eventdata.Indices(1),eventdata.Indices(2))={eventdata.PreviousData};
    elseif eventdata.Indices(1)==4    
        handles.ep.B.setOptionsAccuracyValue(eventdata.NewData);
        if handles.ep.B.Errcode==0
            handles.d(4,2)={eventdata.NewData};
        else
            handles.d(4,2)={eventdata.PreviousData};
        end
    end

    if a==0
       handles.d(eventdata.Indices(1),eventdata.Indices(2))={eventdata.PreviousData};
    elseif eventdata.Indices(1)==5
        handles.ep.B.setOptionsPatternDemandMultiplier(eventdata.NewData);
        handles.d(5,2)={eventdata.NewData};
    end

    if a==0
        handles.d(eventdata.Indices(1),eventdata.Indices(2))={eventdata.PreviousData};
    elseif eventdata.Indices(1)==6
        handles.ep.B.setOptionsEmitterExponent(eventdata.NewData);
        handles.d(6,2)={eventdata.NewData};
    end
end

set(handles.uitable1,'data',handles.d);

return
