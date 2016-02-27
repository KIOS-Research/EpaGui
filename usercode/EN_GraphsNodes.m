function varargout = EN_GraphsNodes(varargin)
% EN_GraphsNodes M-file for EN_GraphsNodes.fig
%      EN_GraphsNodes, by itself, creates a new EN_GraphsNodes or raises the existing
%      singleton*.
%
%      H = EN_GraphsNodes returns the handle to a new EN_GraphsNodes or the handle to
%      the existing singleton*.
%
%      EN_GraphsNodes('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_GraphsNodes.M with the given input arguments.
%
%      EN_GraphsNodes('Property','Value',...) creates a new EN_GraphsNodes or raises the
%      existing singleton*.  Starting from the leunits1, property value pairs are
%      applied to the GUI before NODEgraph_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_GraphsNodes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_GraphsNodes

% Last Modified by GUIDE v2.5 26-Oct-2015 12:29:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_GraphsNodes_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_GraphsNodes_OutputFcn, ...
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

% --- Executes just before EN_GraphsNodes is made visible.
function EN_GraphsNodes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_GraphsNodes (see VARARGIN)

% Choose default command line output for EN_GraphsNodes
handles.output = hObject;
handles.ep=varargin{1};
handles.res=handles.ep.resParameters;
handles.resQuality=handles.ep.resQuality;
handles.durationbuttoncount = 0;

handles.msg=0; % for To Wortkspace
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EN_GraphsNodes wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Graphs for Nodes');
set(handles.loading,'visible','off');

ids = handles.ep.B.getNodeNameID;
types = handles.ep.B.getNodeType;
for i=1:handles.ep.B.getNodeCount
    %type
    type = types{i};
    table(i,1) ={type};
    %id
    id = sprintf(' %s',ids{i});
    table(i,1) = strcat(table(i,1),id);
end

set(handles.listbox,'String',table);
set(handles.searchNodes,'String',ids{1});

set(handles.bar,'Value',0);
set(handles.plot,'Value',1);
cla;grid off
title(handles.axes2,'');
xlabel(handles.axes2,'');
ylabel(handles.axes2,'');
% off x and y axes
set(handles.axes2,'XColor',[0.941 0.941 0.941]);
set(handles.axes2,'yColor',[0.941 0.941 0.941]);
set(handles.figure1,'Position',[40 7 183 44]);
set(handles.axes2,'position',[55 1.8 90 35]);

set(handles.loading,'visible','on');
pause(0.1);  
yesokpushbutton_Callback(hObject, eventdata, handles)

% --- Outputs from this function are returned to the command line.
function varargout = EN_GraphsNodes_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes on selection change in nodegraphsmenu.
function nodegraphsmenu_Callback(hObject, eventdata, handles)
% hObject    handle to nodegraphsmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns nodegraphsmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nodegraphsmenu



% --- Executes during object creation, aunits1er setting all properties.
function nodegraphsmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodegraphsmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until aunits1er all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in yesokpushbutton.
function yesokpushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to yesokpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.axes2,'position',[61.6 5.923 75.4 27]);

    index = get(handles.listbox,'Value');
    [units,duration,x,T,parameter,type_plot]=GraphNodes(handles,index);
    % clear table
    tr = {'' ''};
    set(handles.uitable2,'Data',tr);
    % insert data in table
    table=get(handles.uitable2,'data');
    set(handles.uitable2,'ColumnName',{'Time (sec)' units});
    if T==0
        handles.ep.msg=get(handles.ep.LoadText,'String');
        handles.ep.msg=[handles.ep.msg;{'>>Warning Simulation Duration.'}];
        set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
        set(handles.ep.LoadText,'String',handles.ep.msg);
        set(handles.loading,'visible','off');
        return;
    end
    u=1;
    for j=0:handles.ep.B.getTimeReportingStep:duration*3600
        table{u,2}=num2str(x(u,index));u=u+1;
    end
    if handles.ep.B.getTimeReportingStep>duration*3600 && duration~=0
        table{u,2}=num2str(x(u,index)); 
    end
    
    u=1;
    for j=0:handles.ep.B.getTimeReportingStep:duration*3600
        table{u,1}=num2str(T(u));u=u+1;
    end
    if handles.ep.B.getTimeReportingStep>duration*3600 && duration~=0
        table{u,1}=num2str(T(u)); 
    end    
    set(handles.uitable2,'data',table);

    if duration < 24
        set(handles.uitable2,'ColumnWidth',{60 130});
    else
        set(handles.uitable2,'ColumnWidth',{60 110});
    end
    
    %to workspace
    result = get(handles.uitable2,'Data');
    handles.msg = result;
    % Update handles structure
    guidata(hObject, handles);

    set(handles.loading,'visible','off');
    set(handles.uitable2,'ColumnFormat',{'bank','bank'});
    set(handles.uitable2, 'FontName','Courier');
set(handles.run,'enable','on');

function [units,duration,x,T,parameter,type_plot]=GraphNodes(handles,index)
    set(handles.uitable2,'Visible','on');    
    duration = str2num(get(handles.edit2,'String'));
    if isempty(duration)
       duration=max(handles.res.Time)/3600; 
       set(handles.edit2,'String',duration);
    end
    %RADIOBUTTON
    a = get(handles.bar, 'Value');
    b = get(handles.plot, 'Value');
    param = get(handles.nodegraphmenu,'Value');
    if a==1 
        type_plot='bar';
        set(handles.plot,'value',0);
    end
    if b==1
        type_plot='plot';
        set(handles.bar,'value',0);
    end
    if a==0 && b==0
            uiwait(msgbox('             Select type plot','modal'));
    else  
        if (length(duration)==0)
            duration=24;
            set(handles.edit2,'String',duration);
        end
        t = handles.ep.B.getNodeCount;
        if size(index)~=0
            units=handles.ep.B.getBinUnits;
            if index > t || index==0
                    uiwait(msgbox('Wrong node ID.','modal'));return;
            else         
                switch param 
                    case 1
                        parameter='Head';
                        times=handles.res.Time;
                        res=handles.res.Head;
                        units =sprintf('Head (%s)',units.BinNodeElevationUnits);
                    case 2
                        parameter='Demand';
                        times=handles.res.Time;
                        res=handles.res.Demand;
                        units = sprintf('Demand (%s)',units.BinLinkFlowUnits);
                    case 3 
                        parameter='Pressure';
                        times=handles.res.Time;
                        res=handles.res.Pressure;
                        units = sprintf('Pressure (%s)',units.BinNodePressureUnits);
                    case 4
                        parameter='Elevation';
                        times=handles.res.Time;
                        e=handles.ep.B.getNodeElevations;
                        res=ones(length(handles.res.Time),index)*e(index);
                        units = sprintf('Elevation (%s)',units.BinNodeElevationUnits);
                    case 5 
                        parameter='Base Demand';
                        times=handles.res.Time;
                        e=handles.ep.B.getNodeBaseDemands;
                        try
                            e=e{1};
                        catch e 
                        end
                        res=ones(length(handles.res.Time),index)*e(index);
                        units = sprintf('Base Demand (%s)',units.BinLinkFlowUnits);
                    case 6
                        parameter='InitQual';
                        times=handles.res.Time;
                        e=handles.ep.B.getNodeInitialQuality;
                        res=ones(length(handles.res.Time),index)*e(index);
                        units = sprintf('Initial Quality (%s)',units.BinQualityUnits(1:4));
                    case 7
                        parameter='Quality';
                        times=handles.resQuality.Time;
                        res=handles.resQuality.Quality;
                        units = sprintf('Quality (%s)',units.BinQualityUnits(1:4));     
                end
            end
        end
        [x,T]=GraphsN(index,parameter,times,res,duration,type_plot,units,handles);
    end

% --- Executes on selection change in nodegraphmenu.
function nodegraphmenu_Callback(hObject, eventdata, handles)
% hObject    handle to nodegraphmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns nodegraphmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nodegraphmenu
set(handles.loading,'visible','on');
pause(0.01);
yesokpushbutton_Callback(hObject, eventdata, handles)


% --- Executes during object creation, aunits1er setting all properties.
function nodegraphmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nodegraphmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until aunits1er all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in yesokpushbutton.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to yesokpushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, aunits1er setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until aunits1er all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double




% --- Executes during object creation, aunits1er setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until aunits1er all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bar.
function bar_Callback(hObject, eventdata, handles)
% hObject    handle to bar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bar

a = get(handles.bar,'Value');

if a==1 
    set(handles.plot,'Value',0);
else
    set(handles.plot,'Value',1);
end
set(handles.loading,'visible','on');
pause(0.01);
yesokpushbutton_Callback(hObject, eventdata, handles)


% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot
a = get(handles.plot,'Value');

if a==1 
    set(handles.bar,'Value',0);
else
    set(handles.bar,'Value',1);
end
set(handles.loading,'visible','on');
pause(0.01);
yesokpushbutton_Callback(hObject, eventdata, handles)

% --- Executes during object creation, aunits1er setting all properties.
function mintext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mintext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until aunits1er all CreateFcns called


% --- Executes during object creation, aunits1er setting all properties.
function maxtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until aunits1er all CreateFcns called


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

result = handles.msg;

checkLabels = {'Save results to workspace'};
varNames = {'Result'};
items = {result};

a = export2wsdlg(checkLabels, varNames, items, 'Save'); 
set(a, 'resize','off')

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

% --- Executes during object creation, aunits1er setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until aunits1er all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Durationbutton.
function Durationbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Durationbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.durationbuttoncount==0)
    
    set(handles.listbox1,'visible','on');

    u=1;
    for i=0:25 
        handles.hours(u)= [ ;{i}]; u=u+1;
    end
    set(handles.listbox1,'String',handles.hours);


    handles.durationbuttoncount = 1;
    % Update handles structure
    guidata(hObject, handles);
        
else

    set(handles.listbox1,'visible','off');

    handles.durationbuttoncount = 0;
    % Update handles structure
    guidata(hObject, handles);
end

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Close Graphs for Nodes.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

delete(hObject);


% --- Executes during object creation, aunits1er setting all properties.
function uitable3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until aunits1er all CreateFcns called


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
function [paramres,times]=GraphsN(index,parameter,times,paramres,duration,type_plot,units,handles)
% Plots
switch type_plot
    case 'bar'
        cmp=1;
    case 'plot'
        cmp=0;
end
% timestep=double(handles.ep.B.getTimeHydraulicStep);
% T=T*3600;
ids=handles.ep.B.getNodeNameID;
axes(handles.axes2);
cla(handles.axes2);
if cmp==1
    bar(handles.axes2,times/3600,paramres(:,index),'b');
elseif cmp==0
%     plot(handles.axes1,(T(find(mod(T,timestep)==0)))/timestep,x(find(mod(T,timestep)==0),index),'r');
    plot(handles.axes2,times/3600,paramres(:,index),'r');
end
n= ids{index};
str = [parameter,' ','for Node ',n];
title(handles.axes2,str);
ylabel(handles.axes2,units);
xlabel(handles.axes2,'Time(hours)');
grid on;
if duration
    xlim([0,duration]);
end

% --- Executes on selection change in listbox.
function listbox_Callback(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox
index=get(handles.listbox,'Value');
id=handles.ep.B.getNodeNameID(index);
set(handles.loading,'visible','on');
pause(0.01);
set(handles.searchNodes,'String',id);
yesokpushbutton_Callback(hObject, eventdata, handles)

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


function searchNodes_Callback(hObject, eventdata, handles)
% hObject    handle to searchNodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of searchNodes as text
%        str2double(get(hObject,'String')) returns contents of searchNodes as a double

id=get(hObject,'String');
index=handles.ep.B.getNodeIndex(id);
if index
    set(handles.listbox,'Value',index);
    listbox_Callback(hObject, eventdata, handles)
else
    uiwait(msgbox('Wrong node ID.','modal'));
    index=get(handles.listbox,'Value');
    id=handles.ep.B.getNodeNameID(index);
    set(handles.searchNodes,'String',id);
end

% --- Executes during object creation, after setting all properties.
function searchNodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to searchNodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.run,'enable','inactive');

duration = str2num(get(handles.edit2,'String'));
if isempty(duration)
   duration=24; 
   set(handles.edit2,'String',duration);
end
if (length(duration)==0)
    duration=24;
    set(handles.edit2,'String',duration);
end
handles.ep.B.setTimeSimulationDuration(duration*3600)
set(handles.loading,'visible','on');
pause(0.1);  
handles.res=handles.ep.B.getComputedHydraulicTimeSeries;
handles.resQuality=handles.ep.B.getComputedQualityTimeSeries;
yesokpushbutton_Callback(hObject, eventdata, handles)
guidata(hObject, handles);

    
