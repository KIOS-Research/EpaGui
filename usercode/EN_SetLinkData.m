function varargout = EN_SetLinkData(varargin)
% EN_SETLINKDATA M-file for EN_SetLinkData.fig
%      EN_SETLINKDATA, by itself, creates a new EN_SETLINKDATA or raises the existing
%      singleton*.
%
%      H = EN_SETLINKDATA returns the handle to a new EN_SETLINKDATA or the handle to
%      the existing singleton*.
%
%      EN_SETLINKDATA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_SETLINKDATA.M with the given input arguments.
%
%      EN_SETLINKDATA('Property','Value',...) creates a new EN_SETLINKDATA or raises the
%      existing singleton*.  Starting from the leunits1, property value pairs are
%      applied to the GUI before EN_SetLinkData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_SetLinkData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_SetLinkData

% Last Modified by GUIDE v2.5 04-Apr-2012 08:37:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_SetLinkData_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_SetLinkData_OutputFcn, ...
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


% --- Executes just before EN_SetLinkData is made visible.
function EN_SetLinkData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_SetLinkData (see VARARGIN)

% Choose default command line output for EN_SetLinkData
handles.output = hObject;

handles.link=0;
handles.initial_link =0;
handles.closehelp=0;

handles.ep=varargin{1};
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EN_SetLinkData wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Set Link Data');
set(handles.text1,'visible','off');
set(handles.figure1,'Position',[75 23 104.9 25]);

set(handles.length,'Value',1);
set(handles.roughness,'Value',1);
set(handles.minorloss,'Value',1);
set(handles.initsetting,'Value',1);
set(handles.diameter,'Value',1);
set(handles.initstatus,'Value',1);
set(handles.kbulk,'Value',1);
set(handles.kwall,'Value',1);

ok(hObject, eventdata, handles);
function [lcnt]=writeBasicOntable(handles)

lcnt=handles.ep.B.getLinkCount;

% clear table
table = {''};
set(handles.uitable1,'Data',table);

ids = handles.ep.B.getLinkNameID;
types = handles.ep.B.getLinkType;
%matrix
table = get(handles.uitable1,'Data');
for i=1:lcnt
    %id
    id = ids{i};
    table(i,2) = {id};
    %type
    type = types{i};
    table(i,1) ={type};
end
set(handles.uitable1,'data', table);
set(handles.uitable1, 'ColumnName', {'Type','ID'});


% --- Outputs from this function are returned to the command line.
function varargout = EN_SetLinkData_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in length.
function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of length

ok(hObject, eventdata, handles)


% --- Executes on button press in diameter.
function diameter_Callback(hObject, eventdata, handles)
% hObject    handle to diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of diameter

ok(hObject, eventdata, handles)

% --- Executes on button press in roughness.
function roughness_Callback(hObject, eventdata, handles)
% hObject    handle to roughness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of roughness

ok(hObject, eventdata, handles)


% --- Executes on button press in minorloss.
function minorloss_Callback(hObject, eventdata, handles)
% hObject    handle to minorloss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of minorloss

ok(hObject, eventdata, handles)


% --- Executes on button press in initstatus.
function initstatus_Callback(hObject, eventdata, handles)
% hObject    handle to initstatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of initstatus

ok(hObject, eventdata, handles)


% --- Executes on button press in initsetting.
function initsetting_Callback(hObject, eventdata, handles)
% hObject    handle to initsetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of initsetting

ok(hObject, eventdata, handles)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.figure1,'visible','off');

function ok(hObject, eventdata, handles)
%%%continued, CHECKBOX
lcnt=writeBasicOntable(handles);

diameter = get(handles.diameter,'String');
diametercount = get(handles.diameter,'Value');
if diametercount==0
    msg(2)=0; % for editcallback
end
    
length = get(handles.length,'String');
lengthcount= get(handles.length,'Value');
if lengthcount==0
    msg(1)=0;
end

%roughness
roughness = get(handles.roughness,'String');
roughnesscount= get(handles.roughness,'Value');
if roughnesscount==0
    msg(3)=0;
end

%minorloss
minorloss = get(handles.minorloss,'String');
minorlosscount= get(handles.minorloss,'Value');
if minorlosscount==0
    msg(4)=0;
end

%initstatus
initstatus = get(handles.initstatus,'String');
initstatuscount= get(handles.initstatus,'Value');
if initstatuscount==0
    msg(5)=0;
end

%initsetting
initsetting = get(handles.initsetting,'String');
initsettingcount= get(handles.initsetting,'Value');
if initsetting==0
   msg(6)=0;
end

%Wall reaction 
kwall = get(handles.kwall,'String');
kwallcount= get(handles.kwall,'Value');
if kwallcount==0
    msg(8)=0;
end

%Bulk Reaction
kbulk = get(handles.kbulk,'String');
kbulkcount= get(handles.kbulk,'Value');
if kbulkcount==0
    msg(7)=0;
end

%control checkbox choise, 1-yes. 0-no
 total = [1 1 lengthcount diametercount roughnesscount minorlosscount initstatuscount... 
    initsettingcount kbulkcount kwallcount];

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
            ColumnWidth{i}=100;
        case 2
            cnames{i}='ID'; 
            ColumnWidth{i}=100;
        case 3
            length=sprintf('%s (%s)',length,units.BinLinkLengthsUnits);
            cnames{i}=length;
            ColumnWidth{i}=120;
        case 4
            diameter=sprintf('%s (%s)',diameter,units.BinLinkPipeDiameterUnits);
            cnames{i}=diameter; 
            ColumnWidth{i}=125;
        case 5            
            cnames{i}=roughness;
            ColumnWidth{i}=130;
        case 6
            cnames{i}= minorloss;
            ColumnWidth{i}=130;
        case 7
            cnames{i}=initstatus;
            ColumnWidth{i}=130;
        case 8
            cnames{i}=initsetting;
            ColumnWidth{i}=120;
        case 9
            cnames{i}=kbulk;
            ColumnWidth{i}=140;
        case 10
            cnames{i}=kwall;
            ColumnWidth{i}=140;
    end
    Columnnamess = char(cnames);   
end

set(handles.uitable1, 'ColumnName', {Columnnamess});
set(handles.uitable1, 'ColumnWidth',ColumnWidth);

%TABLE
table = get(handles.uitable1,'Data');
cp=3; %counttable ------ cp = number for column 
if lengthcount
    link.llength=handles.ep.B.getLinkLength;
    for i=1:lcnt
    %length
        table(i,cp) = {num2str(link.llength(i))};
    end
    msg(1)=cp;
    cp=4;
end

if diametercount
    link.ldiameter=handles.ep.B.getLinkDiameter;
    for i=1:lcnt
        %diameter
        table(i,cp) = {num2str(link.ldiameter(i))};
    end
    msg(2)=cp;cp=cp+1;
end

if roughnesscount
    link.lroughness=handles.ep.B.getLinkRoughnessCoeff;
    for i=1:lcnt
        %roughness
        table(i,cp) = {num2str(link.lroughness(i))};
    end
    msg(3)=cp;cp=cp+1;
end

if minorlosscount
    link.lminorloss=handles.ep.B.getLinkMinorLossCoeff;
    for i=1:lcnt
    %minorloss
        table(i,cp) = {num2str(link.lminorloss(i))};
    end
    msg(4)=cp;cp=cp+1;
end

if initstatuscount
    link.linitstatus=handles.ep.B.getLinkInitialStatus;
    for i=1:lcnt
        %Initial status
        switch link.linitstatus(i)
            case 0
                initstatus=char('Closed');
            case 1
                initstatus=char('Open');
        end
        table(i,cp) = {initstatus};
    end
    msg(5)=cp;cp=cp+1;
end

if initsettingcount
    link.linitsetting=handles.ep.B.getLinkInitialSetting;
    for i=1:lcnt
        %initial setting
        table(i,cp) = {num2str(link.linitsetting(i))};
    end
    msg(6)=cp;cp=cp+1;
end

%Bulk Reaction
if kbulkcount
    link.lkbulk=handles.ep.B.getLinkBulkReactionCoeff;
    for i=1:lcnt
        table(i,cp) = {num2str(link.lkbulk(i))};   
    end
    msg(7)=cp;cp=cp+1;
end

if kwallcount
    link.lkwall=handles.ep.B.getLinkWallReactionCoeff;
    for i=1:lcnt
        table(i,cp) = {num2str(link.lkwall(i))};    
    end
    msg(8)=cp;
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

handles.msg =msg;

if handles.initial_link == 0
    if sum(total)~=2
        handles.link = link;
    else
        handles.link = 0;
    end
    if msg==0
        handles.link = 0;
    end
    handles.initial_link = 1;
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
table = get(handles.uitable1,'Data');
row = eventdata.Indices(1);
col = eventdata.Indices(2);
edit = eventdata.EditData;
previous = eventdata.PreviousData;
new = eventdata.NewData;

%CHECKBOX
%length
lengthcount = get(handles.length,'Value');
%diameter
diametercount= get(handles.diameter,'Value');

%roughness
roughnesscount= get(handles.roughness,'Value');

%minorloss
minorlosscount= get(handles.minorloss,'Value');

%initstatus
initstatuscount= get(handles.initstatus,'Value');

%initsetting
settingcount= get(handles.initsetting,'Value');

%kbulk
kbulkcount= get(handles.kbulk,'Value');

%kwall
kwallcount= get(handles.kwall,'Value');

V = strcmp(edit,'CLOSE');
E = strcmp(edit,'close');

if V==1 || E==1
edit = char('closed');
end

edit = str2num(edit);
d = length(edit);

 [columnlength,columndiameter,columnroughness,columnminorloss,columnstatus,...
    columnsetting,columnkbulk,columnkwall] = setcolumnlink(hObject, eventdata, handles);

%length
if lengthcount==1
    if d==1 && col==columnlength
        nd=handles.ep.B.getLinkLength;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setLinkLength(nd);
    elseif col==columnlength
        table{row,col}=previous;
        set(handles.uitable1,'data', table);
    end
end

%  diameter 
if diametercount ==1 
    if col==columndiameter && d==1 
        nd=handles.ep.B.getLinkDiameter;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setLinkDiameter(nd);
    elseif col==columndiameter
        table{row,col}=previous;
        set(handles.uitable1,'data', table);
    end
end

%minorloss
if minorlosscount==1 
    if d==1 && col==columnminorloss
        nd=handles.ep.B.getLinkMinorLossCoeff;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setLinkMinorLossCoeff(nd);
    elseif col==columnminorloss
        table{row,col}=previous;
        set(handles.uitable1,'data', table);
    end
end
 
%roughness
if roughnesscount==1 
    if d==1 && col==columnroughness
        nd=handles.ep.B.getLinkRoughnessCoeff;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setLinkRoughnessCoeff(nd);
    elseif col==columnroughness
        table{row,col}=previous;
        set(handles.uitable1,'data', table);
    end
end

%initstatus
if initstatuscount==1
    if col==columnstatus
        table{row,col}= new;

        switch  upper(char(new))
            case 'CLOSED'
                new=0;
            case 'CLOSE'
                table{row,col}= 'Closed';
                new=0;
                
            case 'OPEN'
                new=1;
            otherwise
                new=-1;
        end
        
        if new ~=-1
            nd=handles.ep.B.getLinkInitialStatus;
            nd(row)=(new);
            table{row,col}= new;
            handles.ep.B.setLinkInitialStatus(nd);
        else
            table{row,col}=previous;
            set(handles.uitable1,'data', table);
        end
    end
elseif col==columnstatus && d==0
        table{row,col}=previous;
        set(handles.uitable1,'data', table);
end
    
%initsetting
if settingcount==1 
    if d==1 && col==columnsetting
        nd=handles.ep.B.getLinkInitialSetting;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setLinkInitialSetting(nd);
    elseif col==columnsetting
        table{row,col}=previous;
        set(handles.uitable1,'data', table);
    end
end

%kbulk
if kbulkcount==1 
    if col==columnkbulk && d==1
        nd=handles.ep.B.getLinkBulkReactionCoeff;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setLinkBulkReactionCoeff(nd);
    elseif col==columnkbulk
        table{row,col}=previous;
        set(handles.uitable1,'data', table);
    end
end

%kwall
if kwallcount==1 
    if col==columnkwall && d==1
        nd=handles.ep.B.getLinkWallReactionCoeff;
        nd(row)=str2num(new);
        table{row,col}= new;
        handles.ep.B.setLinkWallReactionCoeff(nd);
    elseif col==columnkwall
        table{row,col}=previous;
        set(handles.uitable1,'data', table);
    end
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


% --- Executes during object creation, aunits1er setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until aunits1er all CreateFcns called


% --- Executes on button press in savebutton.
function savebutton_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EN_Saveinputfile(handles.ep);


% --- Executes on button press in kbulk.
function kbulk_Callback(hObject, eventdata, handles)
% hObject    handle to kbulk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of kbulk

ok(hObject, eventdata, handles)


% --- Executes on button press in kwall.
function kwall_Callback(hObject, eventdata, handles)
% hObject    handle to kwall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of kwall

ok(hObject, eventdata, handles)

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 cancelbutton_Callback(hObject, eventdata, handles);
% Hint: delete(hObject) closes the figure
delete(hObject);

function [columnlength,columndiameter,columnroughness,columnminorloss,columnstatus,...
    columnsetting,columnkbulk,columnkwall] = setcolumnlink(hObject, eventdata, handles)

% thesi sto pinaka

 msg = handles.msg;


 columnlength = msg(1);
 columndiameter = msg(2);
 columnroughness = msg(3);
 columnminorloss = msg(4);
 columnstatus = msg(5);
 columnsetting = msg(6);
 columnkbulk = msg(7);
 columnkwall = msg(8);
 


% --- Executes on button press in cancelbutton.
function cancelbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cancelbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.initial_link ==0
    set(handles.figure1,'visible','off');
    return
else
    link = handles.link;
end

 [columnlength,columndiameter,columnroughness,columnminorloss,columnstatus,...
    columnsetting,columnkbulk,columnkwall] = setcolumnlink(hObject, eventdata, handles);

if columnlength~=0    
    handles.ep.B.setLinkLength(link.llength);
end

if columndiameter~=0    
    handles.ep.B.setLinkDiameter(link.ldiameter);
end

if columnroughness~=0   
    handles.ep.B.setLinkRoughnessCoeff(link.lroughness);
end

if columnminorloss~=0   
    handles.ep.B.setLinkMinorLossCoeff(link.lminorloss);
end

if columnstatus~=0    
    handles.ep.B.setLinkInitialStatus(link.linitstatus);
end

if columnsetting~=0    
    handles.ep.B.setLinkInitialSetting(link.linitsetting);
end

if columnkbulk~=0   
    handles.ep.B.setLinkBulkReactionCoeff(link.lkbulk);
end

if columnkwall~=0   
    handles.ep.B.setLinkWallReactionCoeff(link.lkwall);
end

set(handles.figure1,'visible','off');


% --- Executes on button press in helpbutton.
function helpbutton_Callback(hObject, eventdata, handles)
% hObject    handle to helpbutton (see GCBO)
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
