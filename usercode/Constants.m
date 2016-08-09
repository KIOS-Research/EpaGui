function varargout = Constants(varargin)
% CONSTANTS M-file for Constants.fig
%      CONSTANTS, by itself, creates a new CONSTANTS or raises the existing
%      singleton*.
%
%      H = CONSTANTS returns the handle to a new CONSTANTS or the handle to
%      the existing singleton*.
%
%      CONSTANTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONSTANTS.M with the given input arguments.
%
%      CONSTANTS('Property','Value',...) creates a new CONSTANTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Constants_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Constants_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Constants

% Last Modified by GUIDE v2.5 16-Apr-2012 01:33:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Constants_OpeningFcn, ...
                   'gui_OutputFcn',  @Constants_OutputFcn, ...
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


% --- Executes just before Constants is made visible.
function Constants_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Constants (see VARARGIN)

% Choose default command line output for Constants
handles.output = hObject;
handles.ep=varargin{1};
% Update handles structure
guidata(hObject, handles);

set(handles.figure1,'name','Reaction');

% UIWAIT makes Constants wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% COEFFICIENTS
table = get(handles.uitable1,'data');
concnt=handles.ep.B.getMSXConstantsCount;
idconst=handles.ep.B.getMSXConstantsNameID;
value=handles.ep.B.getMSXConstantsValue;
for i=1:concnt
    table{i,1} = char(idconst(i));   
    table{i,2} = value(i);    
end

set(handles.uitable1,'ColumnName',{'Constants','Value'});
set(handles.uitable1,'ColumnWidth',{95,96});
set(handles.uitable1,'ColumnEditable',[false true]); % false = ok
                                                     % true = edit column table
set(handles.uitable1,'data',table);
set(handles.figure1,'Position',[103.8 30 42.5 10.5]);
% --- Outputs from this function are returned to the command line.
function varargout = Constants_OutputFcn(hObject, eventdata, handles) 
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

a = eventdata.Indices(1); %row
b = eventdata.Indices(2); %column
new = eventdata.NewData;

c = eventdata.EditData; %EditData

d = str2num(c); % elexgos an einai arithmos ii grammata 
d = length(d);

values=handles.ep.B.getMSXConstantsValue;

if b==2 % for column 2
    
    if d==1 % d=1 then d is number
        values(a)=new;
        handles.ep.B.setMSXConstantsValue(values); %a = row is index for constant
        table{a,b}=new;   
        set(handles.uitable1,'data',table);
    else
        table{a,b} = eventdata.PreviousData;
        set(handles.uitable1,'data',table);
    end 
end
