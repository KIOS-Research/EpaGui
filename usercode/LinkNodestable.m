function varargout = LinkNodestable(varargin)
% LINKNODESTABLE M-file for LinkNodestable.fig
%      LINKNODESTABLE, by itself, creates a new LINKNODESTABLE or raises the existing
%      singleton*.
%
%      H = LINKNODESTABLE returns the handle to a new LINKNODESTABLE or the handle to
%      the existing singleton*.
%
%      LINKNODESTABLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINKNODESTABLE.M with the given input arguments.
%
%      LINKNODESTABLE('Property','Value',...) creates a new LINKNODESTABLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LinkNodestable_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LinkNodestable_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LinkNodestable

% Last Modified by GUIDE v2.5 03-Mar-2012 23:59:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LinkNodestable_OpeningFcn, ...
                   'gui_OutputFcn',  @LinkNodestable_OutputFcn, ...
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


% --- Executes just before LinkNodestable is made visible.
function LinkNodestable_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LinkNodestable (see VARARGIN)

% Choose default command line output for LinkNodestable
handles.output = hObject;
handles.ep=varargin{1};
% Update handles structure
guidata(hObject, handles);

set(handles.figure1,'name','Link-Node Table');
% UIWAIT makes LinkNodestable wait for user response (see UIRESUME)

lcnt=handles.ep.B.getLinkCount;

% clear table
table = {''};
set(handles.uitable1,'Data',table);
ids = handles.ep.B.getLinkNameID;
indices = handles.ep.B.getLinkIndex(ids);
types = handles.ep.B.getLinkType;
linkNodes=handles.ep.B.getNodesConnectingLinksID;
lengths=handles.ep.B.getLinkLength;
diameters=handles.ep.B.getLinkDiameter;
%matrix
table = get(handles.uitable1,'Data');
for i=1:lcnt
    %id
    id = ids{i};
    table(i,2) = {id};
    %type
    type = types{i};
    table(i,1) ={type};
    %start node
    table(i,3) = linkNodes(i,1);
    %end node
    table(i,4) = linkNodes(i,2);
    %length
    table(i,5) = {lengths(i)};
    %diameter
    table(i,6) = {diameters(i)};
end
set(handles.uitable1,'data', table);

units=handles.ep.B.getBinUnits;
parameter1 = sprintf('Length | (%s)',units.BinLinkLengthsUnits);
parameter2 = sprintf('Diameter | (%s)',units.BinLinkPipeDiameterUnits);
    
set(handles.uitable1, 'ColumnName', {'Type','ID','Start Node','End Node',parameter1,parameter2});
set(handles.uitable1, 'ColumnWidth', {65 65 80 80 85 85});

if lcnt < 6 
    set(handles.uitable1, 'position', [2 -13 92 22]);
    set(handles.figure1,'Position',[60 25 96 9.7]);
else
    set(handles.figure1,'Position',[60 25 96 22.5]);
end

% --- Outputs from this function are returned to the command line.
function varargout = LinkNodestable_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
