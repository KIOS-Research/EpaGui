function varargout = Speciesmsx(varargin)
% SPECIESMSX M-file for Speciesmsx.fig
%      SPECIESMSX, by itself, creates a new SPECIESMSX or raises the existing
%      singleton*.
%
%      H = SPECIESMSX returns the handle to a new SPECIESMSX or the handle to
%      the existing singleton*.
%
%      SPECIESMSX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPECIESMSX.M with the given input arguments.
%
%      SPECIESMSX('Property','Value',...) creates a new SPECIESMSX or raises the
%      existing singleton*.  Starting from the left, property value pairs
%      are
%      applied to the GUI before Speciesmsx_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Speciesmsx_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Speciesmsx

% Last Modified by GUIDE v2.5 16-Apr-2012 01:31:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Speciesmsx_OpeningFcn, ...
                   'gui_OutputFcn',  @Speciesmsx_OutputFcn, ...
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


% --- Executes just before Speciesmsx is made visible.
function Speciesmsx_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Speciesmsx (see VARARGIN)

% Choose default command line output for Speciesmsx
handles.output = hObject;
handles.ep=varargin{1};
% Update handles structure
guidata(hObject, handles);

set(handles.figure1,'name','Chemical Species');
% UIWAIT makes Speciesmsx wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% Species

table = get(handles.uitable1,'data');

spcount=handles.ep.B.getMSXSpeciesCount;

idspecies=handles.ep.B.getMSXSpeciesNameID;
type=handles.ep.B.getMSXSpeciesType;
units=handles.ep.B.getMSXSpeciesUnits;
atol=handles.ep.B.getMSXSpeciesATOL;
rtol=handles.ep.B.getMSXSpeciesRTOL;
for i=1:spcount
    table{i,1} = char(idspecies{i});
    table{i,2} = char(type{i});
    table{i,3} = char(units{i});
    table{i,4} = atol;
    table{i,5} = rtol;
end
% set(handles.uitable1,'ColumnWidth',{'bank','bank','bank','bank','bank'});

set(handles.uitable1,'ColumnName',{'Species','Type','Units','Atol','Rtol'});
set(handles.uitable1,'ColumnWidth',{60,60,60,60,60});

set(handles.uitable1,'data',table);


% --- Outputs from this function are returned to the command line.
function varargout = Speciesmsx_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
