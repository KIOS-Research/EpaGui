function varargout = Initqual(varargin)
% INITQUAL M-file for Initqual.fig
%      INITQUAL, by itself, creates a new INITQUAL or raises the existing
%      singleton*.
%
%      H = INITQUAL returns the handle to a new INITQUAL or the handle to
%      the existing singleton*.
%
%      INITQUAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INITQUAL.M with the given input arguments.
%
%      INITQUAL('Property','Value',...) creates a new INITQUAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Initqual_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Initqual_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Initqual

% Last Modified by GUIDE v2.5 25-Oct-2015 03:56:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Initqual_OpeningFcn, ...
                   'gui_OutputFcn',  @Initqual_OutputFcn, ...
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


% --- Executes just before Initqual is made visible.
function Initqual_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Initqual (see VARARGIN)

% Choose default command line output for Initqual
handles.output = hObject;
handles.ep=varargin{1};
% Update handles structure
guidata(hObject, handles);

set(handles.figure1,'name','Initial Concentration');
set(handles.uitable1,'visible','off');
set(handles.text2,'visible','off');
set(handles.text5,'visible','off');

node_Callback(hObject, eventdata, handles)
link_Callback(hObject, eventdata, handles)
% set(handles.figure1,'Position',[103.8 30 66 12.3]);
% UIWAIT makes Initqual wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Initqual_OutputFcn(hObject, eventdata, handles) 
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

% --------------------------------------------------------------------
function node_Callback(hObject, eventdata, handles)
% hObject    handle to node (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1,'Visible','on')
% clear table
table = {''};
set(handles.uitable1,'data',table);

table = get(handles.uitable1,'data');
ndcnt=handles.ep.B.getNodeCount;
ids=handles.ep.B.getNodeNameID;
ndtypes=handles.ep.B.getNodeType;
for i=1:ndcnt
    table{i,2} = char(ids(i));     % set in table -> Type and ID nodes
    table{i,1} = char(ndtypes(i));   % column 1 and 2.
end

Idspecies{1} = char('Type');
Idspecies{2} = char('ID');
columneditTable{1} =  false; % false = 0, %True=1
columneditTable{2} = false;
initquals=handles.ep.B.getMsxNodeInitqualValue;%nodeindex speciesindex
idsp=handles.ep.B.getMsxSpeciesNameID;
units=handles.ep.B.getMsxSpeciesUnits;
W=3;
for i=1:ndcnt  %for each node, calculate value for species.
    t=3;
    for j=1:handles.ep.B.getMsxSpeciesCount
       table{i,t} = initquals{i}(j); 
       t=t+1; % column
       columneditTable{W} = true;
       sp{j}=[char(idsp{j}),' (',char(units{j}),')'];
       W=W+1;
    end
end
Idspecies=[Idspecies,sp];
set(handles.uitable1,'ColumnName',{char(Idspecies)});
for i=1:length(columneditTable)  %set edit column
    c(i) = logical(columneditTable{i});
end

set(handles.uitable1,'ColumnEditable',c);
set(handles.uitable1,'data',table);
handles.Idspecies = Idspecies;

% Update handles structure
guidata(hObject, handles);

a =  size(table);
if a(2)==2
    set(handles.text2,'visible','on');
end
% --------------------------------------------------------------------
function link_Callback(hObject, eventdata, handles)
% hObject    handle to link (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1,'Visible','on')
% clear table
table = {''};
set(handles.uitable2,'data',table);

table = get(handles.uitable2,'data');
lcnt=handles.ep.B.getLinkCount;
ids=handles.ep.B.getLinkNameID;
ltypes=handles.ep.B.getLinkType;
for i=1:lcnt
    table{i,2} = char(ids(i));     % set in table -> Type and ID nodes
    table{i,1} = char(ltypes(i));   % column 1 and 2.
end

Idspecies{1} = char('Type');
Idspecies{2} = char('ID');
columneditTable{1} =  false; % false = 0, %True=1
columneditTable{2} = false;
initquals=handles.ep.B.getMsxLinkInitqualValue;%linkindex speciesindex
idsp=handles.ep.B.getMsxSpeciesNameID;
units=handles.ep.B.getMsxSpeciesUnits;
W=3;
for i=1:lcnt  %for each node, calculate value for species.
    t=3;
    for j=1:handles.ep.B.getMsxSpeciesCount
       table{i,t} = initquals{i}(j); 
       t=t+1; % column
       columneditTable{W} = true;
       sp{j}=[char(idsp{j}),' (',char(units{j}),')'];
       W=W+1;
    end
end
Idspecies=[Idspecies,sp];
set(handles.uitable2,'ColumnName',{char(Idspecies)});
for i=1:length(columneditTable)  %set edit column
    c(i) = logical(columneditTable{i});
end

set(handles.uitable2,'ColumnEditable',c);
set(handles.uitable2,'data',table);
handles.Idspecies = Idspecies;

% Update handles structure
guidata(hObject, handles);

a =  size(table);
if a(2)==2
    set(handles.text5,'visible','on');
end

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
index = row ; % from table, index for node  = row

%NODES
spindex=column-2;
values=handles.ep.B.getMsxNodeInitqualValue;
if d==1 % an den einai grammata sinexise
    values{index}(spindex)=new;%
    handles.ep.B.setMsxNodeInitqualValue(values)  
    table{row,column} = new ; 
    set(handles.uitable1,'data',table);
    return;
elseif d==0
    table{row,column} = previous ; 
    set(handles.uitable1,'data',table);    
    return;
end

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
table = get(handles.uitable2,'data');
row = eventdata.Indices(1); 
column = eventdata.Indices(2); 
new = eventdata.NewData;
previous = eventdata.PreviousData;
c = eventdata.EditData; %EditData
d = str2num(c); % elexgos an einai arithmos ii grammata 
d = length(d);
index = row ; % from table, index for node  = row

%LINKS
spindex=column-2;
values=handles.ep.B.getMsxLinkInitqualValue;
if d==1 % an den einai grammata sinexise
    values{index}(spindex)=new;%
    handles.ep.B.setMsxLinkInitqualValue(values)  
    table{row,column} = new ; 
    set(handles.uitable2,'data',table);
    return;
elseif d==0
    table{row,column} = previous ; 
    set(handles.uitable2,'data',table);    
    return;
end
   


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
