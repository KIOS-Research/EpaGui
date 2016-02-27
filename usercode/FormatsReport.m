function varargout = FormatsReport(varargin)
% FORMATSREPORT M-file for FormatsReport.fig
%      FORMATSREPORT, by itself, creates a new FORMATSREPORT or raises the existing
%      singleton*.
%
%      H = FORMATSREPORT returns the handle to a new FORMATSREPORT or the handle to
%      the existing singleton*.
%
%      FORMATSREPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORMATSREPORT.M with the given input arguments.
%
%      FORMATSREPORT('Property','Value',...) creates a new FORMATSREPORT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FormatsReport_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FormatsReport_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FormatsReport

% Last Modified by GUIDE v2.5 24-Oct-2015 19:39:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FormatsReport_OpeningFcn, ...
                   'gui_OutputFcn',  @FormatsReport_OutputFcn, ...
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


% --- Executes just before FormatsReport is made visible.
function FormatsReport_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FormatsReport (see VARARGIN)

% Choose default command line output for FormatsReport
handles.output = hObject;
handles.ep=varargin{1};

% [handles.path,~]=fileparts(handles.ep.B.pathfile);
handles.path=[pwd,'\results\'];
       
handles.namefile='';
set(handles.edit2,'String','');
set(handles.dir,'String',handles.path);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FormatsReport wait for user response (see UIRESUME)
% uiwait(handles.figure1);
    
set(handles.text1,'visible','off');
posfig=get(handles.figure1,'Position');

set(handles.figure1,'Position',posfig);


set(handles.figure1,'name','Format Report');
    
set(handles.summary,'Value',1);
set(handles.energy,'Value',1);
set(handles.elevation,'Value',1);
set(handles.demand,'Value',1);
set(handles.head,'Value',1);
set(handles.pressure,'Value',1);
set(handles.quality,'Value',1);
set(handles.length,'Value',1);
set(handles.diameter,'Value',1);
set(handles.velocity,'Value',1);
set(handles.headloss,'Value',1);
set(handles.setting,'Value',1);
set(handles.reaction,'Value',1);
set(handles.friction,'Value',1);
set(handles.flow,'Value',1);
set(handles.links,'Value',1);
set(handles.nodes,'Value',1);
set(handles.edit2,'String','24');
set(handles.edit1,'String','test');


% --- Outputs from this function are returned to the command line.
function varargout = FormatsReport_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
summary = get(handles.summary,'Value');
energy = get(handles.energy,'Value');

if summary==1 ; summary = 'SUMMARY YES'; else summary = 'SUMMARY NO'; end
if energy==1 ; energy = 'ENERGY YES'; else energy = 'ENERGY NO'; end

%NODES
elevation = get(handles.elevation,'Value');
demand = get(handles.demand,'Value');
head = get(handles.head,'Value');
pressure = get(handles.pressure,'Value');
quality = get(handles.quality,'Value');
nodes = get(handles.nodes,'Value');

a = [nodes,elevation,demand,head,pressure,quality];
if sum(a)
    nodess = 'NODES ALL';
else
    nodess = 'NODE NO';
end

if elevation==1 ; elevation = 'ELEVATION YES'; else elevation = 'ELEVATION NO'; end
if demand==1 ; demand = 'DEMAND YES'; else demand = 'DEMAND NO'; end
if head==1 ; head = 'HEAD YES'; else head = 'HEAD NO'; end
if pressure==1 ; pressure = 'PRESSURE YES'; else pressure = 'PRESSURE NO'; end
if quality==1 ; quality = 'CHLORINE YES'; else quality = 'QUALITY NO'; end


links = get(handles.links,'Value');
length = get(handles.length,'Value');
diameter = get(handles.diameter,'Value');
velocity = get(handles.velocity,'Value');
headloss = get(handles.headloss,'Value');
setting = get(handles.setting,'Value');
reaction = get(handles.reaction,'Value');
friction = get(handles.friction,'Value');
flow = get(handles.flow,'Value');

a = [links,diameter,length,velocity,headloss,setting,reaction,friction,flow];
if sum(a)
    linkk = 'LINK ALL';
else
    linkk = 'LINK NO';
end
if length==1 ; length = 'LENGTH YES'; else length = 'LENGTH NO'; end
if diameter==1 ; diameter = 'DIAMETER YES'; else diameter = 'DIAMETER NO'; end
if velocity==1 ; velocity = 'VELOCITY YES'; else velocity = 'VELOCITY NO'; end
if headloss==1 ; headloss = 'HEADLOSS YES'; else headloss = 'HEADLOSS NO'; end
if setting==1 ; setting = 'SETTING YES'; else setting = 'SETTING NO'; end
if reaction==1 ; reaction = 'REACTION YES'; else reaction = 'REACTION NO'; end
if friction==1 ; friction = 'F-FACTOR YES'; else friction = 'F-FACTOR NO'; end
if flow==1 ; flow = 'FLOW YES'; else flow = 'FLOW NO'; end


duration= str2num(get(handles.edit2,'String'));
reportname= get(handles.edit1,'String');
if isempty(reportname)
   uiwait(msgbox('Wrong report name.','Modal'));
   return;
end
if duration ~=0
    if reportname ~= 0
        warning off;
        if isempty(handles.namefile)
            reportname =strcat(reportname,'.txt');
        end
        [yes] = replace(char('\*.txt'),reportname,handles.path);            
        warning on;
       if (yes==2 || yes==1) % replcase
           functionFormatReport(summary,energy,elevation,demand,head,pressure,...
           quality,length,diameter,velocity,headloss,setting,reaction,friction,flow,linkk,nodess,duration,reportname,handles)
           set(handles.figure1,'Visible','off');
       end

       if yes==0
           return;
       end

    end

else
    uiwait(msgbox('            Wrong Duration','Error','modal'));
end

% --- Executes on button press in summary.
function summary_Callback(hObject, eventdata, handles)
% hObject    handle to summary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of summary


% --- Executes on button press in energy.
function energy_Callback(hObject, eventdata, handles)
% hObject    handle to energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of energy
a = get(handles.energy,'Value');

if a==1    
    set(handles.text1,'visible','on');
else
    set(handles.text1,'visible','off');
end

% --- Executes on button press in nodes.
function nodes_Callback(hObject, eventdata, handles)
% hObject    handle to nodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nodes

nodes = get(handles.nodes,'Value');

if nodes==1 
    
    set(handles.elevation,'Value',1);
    set(handles.demand,'Value',1);
    set(handles.head,'Value',1);
    set(handles.pressure,'Value',1);
    set(handles.quality,'Value',1);

else
    
    set(handles.elevation,'Value',0);
    set(handles.demand,'Value',0);
    set(handles.head,'Value',0);
    set(handles.pressure,'Value',0);
    set(handles.quality,'Value',0);

end
% --- Executes on button press in links.
function links_Callback(hObject, eventdata, handles)
% hObject    handle to links (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of links
links = get(handles.links,'Value');



if links==1  %an epile3i link o xristis tote ola epilegonte gi auto ginetai 1.

    set(handles.length,'Value',1);
    set(handles.diameter,'Value',1);
    set(handles.velocity,'Value',1);
    set(handles.headloss,'Value',1);
    set(handles.setting,'Value',1);
    set(handles.reaction,'Value',1);
    set(handles.friction,'Value',1);
    set(handles.flow,'Value',1);
    
else

    set(handles.length,'Value',0);
    set(handles.diameter,'Value',0);
    set(handles.velocity,'Value',0);
    set(handles.headloss,'Value',0);
    set(handles.setting,'Value',0);
    set(handles.reaction,'Value',0);
    set(handles.friction,'Value',0);
    set(handles.flow,'Value',0);
    
end

% --- Executes on button press in elevation.
function elevation_Callback(hObject, eventdata, handles)
% hObject    handle to elevation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of elevation


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


% --- Executes on button press in cancel.
function cancel_Callback(hObject, eventdata, handles)
% hObject    handle to cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.figure1,'visible','off');


% --- Executes on button press in length.
function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of length


% --- Executes on button press in diameter.
function diameter_Callback(hObject, eventdata, handles)
% hObject    handle to diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of diameter


% --- Executes on button press in velocity.
function velocity_Callback(hObject, eventdata, handles)
% hObject    handle to velocity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of velocity


% --- Executes on button press in headloss.
function headloss_Callback(hObject, eventdata, handles)
% hObject    handle to headloss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of headloss


% --- Executes on button press in quality.
function quality_Callback(hObject, eventdata, handles)
% hObject    handle to quality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of quality


% --- Executes on button press in setting.
function setting_Callback(hObject, eventdata, handles)
% hObject    handle to setting (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of setting


% --- Executes on button press in reaction.
function reaction_Callback(hObject, eventdata, handles)
% hObject    handle to reaction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of reaction


% --- Executes on button press in friction.
function friction_Callback(hObject, eventdata, handles)
% hObject    handle to friction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of friction



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in flow.
function flow_Callback(hObject, eventdata, handles)
% hObject    handle to flow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of flow



function dir_Callback(hObject, eventdata, handles)
% hObject    handle to dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dir as text
%        str2double(get(hObject,'String')) returns contents of dir as a double
[name,PathFile] = uiputfile([handles.ep.B.pathfile,'*.txt']);
if PathFile
    handles.path=PathFile;
    handles.namefile=name;
end
set(handles.dir,'String',handles.path);
set(handles.edit1,'String',handles.namefile);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function dir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

ncode = get(handles.popupmenu1,'Value');
nc = ncode - 1;
switch nc
    case 0
        t = 'NONE';
    case 1
        t = 'AVERAGE';
    case 2
        t = 'MINIMUM';
    case 3
        t = 'MAXIMUM';
    case 4
        t = 'RANGE';
end
handles.ep.B.setTimeStatisticsType(t)

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
