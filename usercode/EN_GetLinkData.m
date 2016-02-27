function varargout = EN_GetLinkData(varargin)
% EN_GetLinkData M-file for EN_GetLinkData.fig
%      EN_GetLinkData, by itself, creates a new EN_GetLinkData or raises the existing
%      singleton*.
%
%      H = EN_GetLinkData returns the handle to a new EN_GetLinkData or the handle to
%      the existing singleton*.
%
%      EN_GetLinkData('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_GetLinkData.M with the given input arguments.
%
%      EN_GetLinkData('Property','Value',...) creates a new EN_GetLinkData or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EN_GetLinkData_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_GetLinkData_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_GetLinkData

% Last Modified by GUIDE v2.5 30-Apr-2012 21:01:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_GetLinkData_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_GetLinkData_OutputFcn, ...
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


% --- Executes just before EN_GetLinkData is made visible.
function EN_GetLinkData_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_GetLinkData (see VARARGIN)

% Choose default command line output for EN_GetLinkData
handles.output = hObject;
handles.ep = varargin{1};

handles.closehelp=0;% help button

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EN_GetLinkData wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Get Link Data');

set(handles.text1,'visible','off');
set(handles.loading,'visible','off');
set(handles.athours,'String',0);

set(handles.checkbox1diameter,'Value',1);    
set(handles.length,'Value',1);    
set(handles.roughness,'Value',1);    
set(handles.minorloss,'Value',0);    
set(handles.initstatus,'Value',1);    
set(handles.initsetting,'Value',0);    
set(handles.kbulk,'Value',0);    
set(handles.kwall,'Value',0);    
set(handles.flow,'Value',0);    
set(handles.velocity,'Value',0);    
set(handles.headloss,'Value',0);    
set(handles.status,'Value',0);    
set(handles.setting,'Value',0);    
set(handles.energy,'Value',0);    

set(handles.allparameters,'Value',0);   

writeBasicOntable(handles);

set(handles.figure1,'Position',[40 15 171.7 39]);
handles.link=0;
guidata(hObject, handles);
okbutton_Callback(hObject, eventdata, handles)

% --- Outputs from this function are returned to the command line.
function varargout = EN_GetLinkData_OutputFcn(hObject, eventdata, handles) 
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

EN_GraphsLinks(handles.ep);


% --- Executes on button press in checkbox1diameter.
function checkbox1diameter_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1diameter


% --- Executes on button press in okbutton.
function okbutton_Callback(hObject, eventdata, handles)
% hObject    handle to okbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.loading,'visible','on');
pause(0.01);
    
% insert data in table
[lcnt]=writeBasicOntable(handles);

%%%continued, CHECKBOX
diameter = get(handles.checkbox1diameter,'String');
diametercount = get(handles.checkbox1diameter,'Value');

length = get(handles.length,'String');
lengthcount= get(handles.length,'Value');

%energy
energy = get(handles.energy,'String');
energycount= get(handles.energy,'Value');

%roughness
roughness = get(handles.roughness,'String');
roughnesscount= get(handles.roughness,'Value');

%minorloss
minorloss = get(handles.minorloss,'String');
minorlosscount= get(handles.minorloss,'Value');

%initstatus
initstatus = get(handles.initstatus,'String');
initstatuscount= get(handles.initstatus,'Value');

%initsetting
initsetting = get(handles.initsetting,'String');
initsettingcount= get(handles.initsetting,'Value');

%Wall reaction 
kwall = get(handles.kwall,'String');
kwallcount= get(handles.kwall,'Value');

%Flow 
flow = get(handles.flow,'String');
flowcount= get(handles.flow,'Value');

%Actual velocity 
velocity = get(handles.velocity,'String');
velocitycount= get(handles.velocity,'Value');

%headlossloss 
headloss = get(handles.headloss,'String');
headlosscount= get(handles.headloss,'Value');

%status 
status = get(handles.status,'String');
statuscount= get(handles.status,'Value');

%Bulk Reaction
kbulk = get(handles.kbulk,'String');
kbulkcount= get(handles.kbulk,'Value');

%setting
setting = get(handles.setting,'String');
settingcount= get(handles.setting,'Value');

%control checkbox choise, 1-yes. 0-no
 total = [1 1 1 diametercount lengthcount  roughnesscount minorlosscount initstatuscount... 
    initsettingcount kbulkcount kwallcount flowcount velocitycount headlosscount...
    statuscount settingcount energycount];

f = sum(total);% f is variable
units=handles.ep.B.getBinUnits;
%Column names :
for i=1:f
    v= strfind(total,1);
  switch v(i)
        case 1
            cnames{i}='Index'; 
            ColumnWidth{i}=100;
        case 2
            cnames{i}='Type'; 
            ColumnWidth{i}=100;
        case 3
            cnames{i}='Id'; 
            ColumnWidth{i}=100;
        case 4
            diameter=sprintf('%s (%s)',diameter,units.BinLinkPipeDiameterUnits);
            cnames{i}=diameter; 
            ColumnWidth{i}=125;
        case 5
            length=sprintf('%s (%s)',length,units.BinLinkLengthsUnits);
            cnames{i}=length;
            ColumnWidth{i}=120;
        case 6            
            cnames{i}=roughness;
            ColumnWidth{i}=130;
        case 7
            cnames{i}= minorloss;
            ColumnWidth{i}=130;
        case 8
            cnames{i}=initstatus;
            ColumnWidth{i}=130;
        case 9
            cnames{i}=initsetting;
            ColumnWidth{i}=120;
        case 10
            cnames{i}=kbulk;
            ColumnWidth{i}=140;
        case 11
            cnames{i}=kwall;
            ColumnWidth{i}=140;
        case 12
            flow=sprintf('%s (%s)',flow, units.BinLinkFlowUnits);
            cnames{i}=flow;
            ColumnWidth{i}=130;
        case 13
            velocity=sprintf('%s (%s)',velocity, units.BinLinkVelocityUnits);
            cnames{i}=velocity;
            ColumnWidth{i}=130;
        case 14
            headloss=sprintf('%s (%s)',headloss,units.BinLinkMinorLossCoeffUnits);
            cnames{i}=headloss;
            ColumnWidth{i}=140;
        case 15
            cnames{i}=status;
            ColumnWidth{i}=100;
        case 16
            cnames{i}=setting;
            ColumnWidth{i}=100;
        case 17
            energy=sprintf('%s (%s)',energy,units.BinEnergyUnits);
            cnames{i}=energy;
            ColumnWidth{i}=140;
    end
    Columnnamess = char(cnames);   
end

%AT HOURS
athours  = str2num(get(handles.athours,'String'));
set(handles.athours,'String',athours);
if (max(size(athours))==0)   
    set(handles.loading,'visible','off');
    uiwait(msgbox('Please set "Links at (number) Hrs"','modal'));
    return
end
%TABLE
table = get(handles.uitable8,'Data');
cp=4; %counttable ------ cp = number for column 
if diametercount
    ldiameter=handles.ep.B.getLinkDiameter;
    for i=1:lcnt
        %diameter
        table(i,cp) = {num2str(ldiameter(i))};
    end
    cp=5;
end

if lengthcount
    llength=handles.ep.B.getLinkLength;
    for i=1:lcnt
    %length
        table(i,cp) = {num2str(llength(i))};
    end
    cp=cp+1;
end

if roughnesscount
    lroughness=handles.ep.B.getLinkRoughnessCoeff;
    for i=1:lcnt
        %roughness
        table(i,cp) = {num2str(lroughness(i))};
    end
    cp=cp+1;
end

if minorlosscount
    lminorloss=handles.ep.B.getLinkMinorLossCoeff;
    for i=1:lcnt
    %minorloss
        table(i,cp) = {num2str(lminorloss(i))};
    end
    cp=cp+1;
end

if initstatuscount
    linitstatus=handles.ep.B.getLinkInitialStatus;
    for i=1:lcnt
        %Initial status
        switch linitstatus(i)
            case 0
                initstatus=char('Closed');
            case 1
                initstatus=char('Open');
        end
        table(i,cp) = {initstatus};
    end
    cp=cp+1;
end

if initsettingcount
    linitsetting=handles.ep.B.getLinkInitialSetting;
    for i=1:lcnt
        %initial setting
        table(i,cp) = {num2str(linitsetting(i))};
    end
    cp=cp+1;
end

%Bulk Reaction
if kbulkcount
    lkbulk=handles.ep.B.getLinkBulkReactionCoeff;
    for i=1:lcnt
        table(i,cp) = {num2str(lkbulk(i))};   
    end
    cp=cp+1;
end

if kwallcount
    lkwall=handles.ep.B.getLinkWallReactionCoeff;
    for i=1:lcnt
        table(i,cp) = {num2str(lkwall(i))};    
    end
    cp=cp+1;
end

% flow rat
% lflow=
if flowcount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    lflows=handles.ep.B.getLinkFlows;
    for i=1:lcnt
        table(i,cp) = {num2str(lflows(i))};    
    end
    cp=cp+1;
end
 
%flow velocity 
if velocitycount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    lvelocity=handles.ep.B.getLinkVelocity;
    for i=1:lcnt;
        table(i,cp) = {num2str(lvelocity(i))};    
    end
    cp=cp+1;
end

%Unit headlossloss 
if headlosscount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    lheadloss=handles.ep.B.getLinkVelocity;
    for i=1:lcnt
        table(i,cp) = {num2str(lheadloss(i))};    
    end
    cp=cp+1;
end

%status 
if statuscount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    lstatus=handles.ep.B.getLinkStatus;
    for i=1:lcnt
        switch lstatus(i)
            case 0
                status=char('Closed');
            case 1
                status=char('Open');
        end
        table(i,cp) = {status};
    end
    cp=cp+1;
end

%Actual setting 
if settingcount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    lsetting=handles.ep.B.getLinkSettings;
    for i=1:lcnt
        table(i,cp) = {num2str(lsetting(i))};    
    end
    cp=cp+1;
end

%Energy
if energycount
    handles.ep.B.setTimeSimulationDuration(athours*3600); 
    handles.ep.B.solveCompleteHydraulics;
    lenergy=handles.ep.B.getLinkPumpEnergy;
    for i=1:lcnt
        table(i,cp) = {num2str(lenergy(i))};    
    end
end

set(handles.uitable8,'data', table);
link = get(handles.uitable8,'Data');
handles.link= link;
guidata(hObject, handles);

set(handles.uitable8, 'ColumnName',{Columnnamess});
set(handles.uitable8,'ColumnFormat',{'bank','bank','bank','bank','bank','bank',...
    'bank','bank','bank','bank','bank','bank','bank','bank','bank',...
    'bank','bank','bank'});
set(handles.uitable8, 'ColumnWidth',ColumnWidth);
set(handles.uitable8, 'FontName','Courier');

set(handles.loading,'visible','off');


% --- Executes on button press in length.
function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of length


% --- Executes on button press in roughness.
function roughness_Callback(hObject, eventdata, handles)
% hObject    handle to roughness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of roughness


% --- Executes on button press in minorloss.
function minorloss_Callback(hObject, eventdata, handles)
% hObject    handle to minorloss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of minorloss


% --- Executes on button press in initstatus.
function initstatus_Callback(hObject, eventdata, handles)
% hObject    handle to initstatus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of initstatus


% --- Executes on button press in initsetting.
function initsetting_Callback(hObject, eventdata, handles)
% hObject    handle to initsetting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of initsetting


% --- Executes on button press in kwall.
function kwall_Callback(hObject, eventdata, handles)
% hObject    handle to kwall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of kwall


% --- Executes on button press in flow.
function flow_Callback(hObject, eventdata, handles)
% hObject    handle to flow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of flow


% --- Executes on button press in velocity.
function velocity_Callback(hObject, eventdata, handles)
% hObject    handle to velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of velocity


% --- Executes on button press in headlossloss.
function headloss_Callback(hObject, eventdata, handles)
% hObject    handle to headlossloss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of headlossloss


% --- Executes on button press in status.
function status_Callback(hObject, eventdata, handles)
% hObject    handle to status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of status


% --- Executes on button press in setting.
function setting_Callback(hObject, eventdata, handles)
% hObject    handle to setting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of setting


% --- Executes on button press in kbulk.
function kbulk_Callback(hObject, eventdata, handles)
% hObject    handle to kbulk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of kbulk


% --- Executes on button press in energy.
function energy_Callback(hObject, eventdata, handles)
% hObject    handle to energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of energy


% --- Executes on button press in clearbutton.
function clearbutton_Callback(hObject, eventdata, handles)
% hObject    handle to clearbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


set(handles.text1,'visible','off');
set(handles.loading,'visible','off');

% clear table
table = {''};
set(handles.uitable8,'Data',table);
set(handles.athours,'String',0);
ids = handles.ep.B.getLinkNameID;
indices = handles.ep.B.getLinkIndex(ids);
types = handles.ep.B.getLinkType;
%matrix
table = get(handles.uitable8,'Data');
for i=1:handles.ep.B.getLinkCount
    %index
    table(i,1) = {indices(i)};
    set(handles.uitable8,'data', table);

    %id
    id = ids{i};
    table(i,3) = {id};
    set(handles.uitable8,'data', table);

    %type
    type = types{i};
    table(i,2) ={type};
    set(handles.uitable8,'data', table);
end

set(handles.uitable8, 'ColumnName', {'Index','Type','ID'});
set(handles.figure1,'Position',[40 15 171.7 39]);
handles.link=0;
guidata(hObject, handles);

set(handles.checkbox1diameter,'Value',0);    
set(handles.length,'Value',0);    
set(handles.roughness,'Value',0);    
set(handles.minorloss,'Value',0);    
set(handles.initstatus,'Value',0);    
set(handles.initsetting,'Value',0);    
set(handles.kbulk,'Value',0);    
set(handles.kwall,'Value',0);    
set(handles.flow,'Value',0);    
set(handles.velocity,'Value',0);    
set(handles.headloss,'Value',0);    
set(handles.status,'Value',0);    
set(handles.setting,'Value',0);    
set(handles.energy,'Value',0);    
set(handles.allparameters,'Value',0);
    
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

% --- Executes on button press in linklink.
function linklink_Callback(hObject, eventdata, handles)
% hObject    handle to linklink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in setting.
% function setting_Callback(hObject, eventdata, handles)
% hObject    handle to setting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of setting


% --- Executes on button press in allparameters.
function allparameters_Callback(hObject, eventdata, handles)
% hObject    handle to allparameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of allparameters

% all parameters checkbox
all = get(handles.allparameters,'Value');

if all
    
    set(handles.checkbox1diameter,'Value',1);    
    set(handles.length,'Value',1);    
    set(handles.roughness,'Value',1);    
    set(handles.minorloss,'Value',1);    
    set(handles.initstatus,'Value',1);    
    set(handles.initsetting,'Value',1);    
    set(handles.kbulk,'Value',1);    
    set(handles.kwall,'Value',1);    
    set(handles.flow,'Value',1);    
    set(handles.velocity,'Value',1);    
    set(handles.headloss,'Value',1);    
    set(handles.status,'Value',1);    
    set(handles.setting,'Value',1);    
    set(handles.energy,'Value',1);    

else
    
    set(handles.checkbox1diameter,'Value',0);    
    set(handles.length,'Value',0);    
    set(handles.roughness,'Value',0);    
    set(handles.minorloss,'Value',0);    
    set(handles.initstatus,'Value',0);    
    set(handles.initsetting,'Value',0);    
    set(handles.kbulk,'Value',0);    
    set(handles.kwall,'Value',0);    
    set(handles.flow,'Value',0);    
    set(handles.velocity,'Value',0);    
    set(handles.headloss,'Value',0);    
    set(handles.status,'Value',0);    
    set(handles.setting,'Value',0);    
    set(handles.energy,'Value',0);    
    
end
% --- Executes on button press in linknode.
function linknode_Callback(hObject, eventdata, handles)
% hObject    handle to linknode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LinkNodestable(handles.ep);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

link = handles.link;
checkLabels = {'Save results to workspace'};
varNames = {'Link_Data'};
items = {link};
  
a = export2wsdlg(checkLabels, varNames, items, 'Save'); 
set(a, 'resize','off')

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Close Get Link Data.'}];
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

function [lcnt]=writeBasicOntable(handles)
% %matrix
lcnt=handles.ep.B.getLinkCount;

% clear table
table = {''};
set(handles.uitable8,'Data',table);

ids = handles.ep.B.getLinkNameID;
indices = handles.ep.B.getLinkIndex(ids);
types = handles.ep.B.getLinkType;
%matrix
table = get(handles.uitable8,'Data');
for i=1:lcnt
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
