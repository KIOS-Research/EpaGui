function varargout = TableReportmsx(varargin)
% TABLEREPORTMSX M-file for TableReportmsx.fig
%      TABLEREPORTMSX, by itself, creates a new TABLEREPORTMSX or raises the existing
%      singleton*.
%
%      H = TABLEREPORTMSX returns the handle to a new TABLEREPORTMSX or the handle to
%      the existing singleton*.
%
%      TABLEREPORTMSX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABLEREPORTMSX.M with the given input arguments.
%
%      TABLEREPORTMSX('Property','Value',...) creates a new TABLEREPORTMSX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TableReportmsx_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TableReportmsx_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TableReportmsx

% Last Modified by GUIDE v2.5 27-Feb-2016 01:16:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TableReportmsx_OpeningFcn, ...
                   'gui_OutputFcn',  @TableReportmsx_OutputFcn, ...
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


% --- Executes just before TableReportmsx is made visible.
function TableReportmsx_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TableReportmsx (see VARARGIN)

% Choose default command line output for TableReportmsx
handles.output = hObject;
handles.msg=0;
handles.setformula = 0;
handles.ep=varargin{1};

spind=handles.ep.B.getMSXSpeciesCount;
idspecies=handles.ep.B.getMSXSpeciesNameID;
units=handles.ep.B.getMSXSpeciesUnits;
u=2;
for i=1:spind       
   sp{u}=[char(idspecies{i}),' (',char(units{i}),')'];
   u=u+1;
end
      
handles.Idspecies = sp;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TableReportmsx wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.axes2,'xcolor',[0.941 0.941 0.941]);
set(handles.axes2,'ycolor',[0.941 0.941 0.941]);
psfig=get(handles.figure1,'Position');
psfig(4)=41.9;
set(handles.figure1,'Position',psfig);

% set(handles.figure1,'Position',[35 10 192 42.7]);

set(handles.loading,'visible','off');
set(handles.select,'visible','on');
set(handles.formtext,'Visible','off');
set(handles.next,'visible','off');
set(handles.back,'visible','off');
set(handles.LoadingAxes,'Visible','off');

set(handles.figure1,'name','Table Report');
set(handles.text5,'visible','on');

% clear table & axes
table = {''};cla;
set(handles.uitable1,'data', table);
% set listbox hours
set(handles.duration_,'String',handles.ep.B.getTimeSimulationDuration/3600);
set(handles.checkbox1,'Value',1);

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

set(handles.listbox3,'String',table);
set(handles.search,'String',ids{1});
 
% %image
% axes(handles.axes2);
% imshow('water-conserve.jpg');
% handles.ep.B.setTimeSimulationDuration(48*3600);
listbox3_Callback(hObject, eventdata, handles)


% --- Outputs from this function are returned to the command line.
function varargout = TableReportmsx_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
set(handles.checkbox1,'enable','inactive');

set(handles.selectnodelink,'String','Select NODE');
set(handles.next,'visible','on');
set(handles.back,'visible','on');
set(handles.next,'visible','off');
set(handles.back,'visible','off');
set(handles.select,'visible','on');
cla(handles.axes2);
title(handles.axes2,'');
xlabel(handles.axes2,'');
ylabel(handles.axes2,'');

value = get(handles.checkbox1,'Value');
if value == 1
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
    set(handles.listbox3,'String',table);
    set(handles.checkbox2,'Value',0);
    listbox3_Callback(hObject, eventdata, handles)
else
    set(handles.checkbox1,'Value',1);
    set(handles.checkbox2,'Value',0);
end

set(handles.checkbox1,'enable','on');

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


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
set(handles.checkbox2,'enable','inactive');

set(handles.selectnodelink,'String','Select LINK');
set(handles.next,'visible','on');
set(handles.back,'visible','on');
set(handles.next,'visible','off');
set(handles.back,'visible','off');
set(handles.select,'visible','on');
cla(handles.axes2);
title(handles.axes2,'');
xlabel(handles.axes2,'');
ylabel(handles.axes2,'');

value = get(handles.checkbox2,'Value');
if value == 1
    ids = handles.ep.B.getLinkNameID;
    types = handles.ep.B.getLinkType;
    for i=1:handles.ep.B.getLinkCount
        %type
        type = types{i};
        table(i,1) ={type};
        %id
        id = sprintf(' %s',ids{i});
        table(i,1) = strcat(table(i,1),id);
    end
    set(handles.listbox3,'String',table);
    set(handles.checkbox1,'Value',0);%link
    listbox3_Callback(hObject, eventdata, handles)
else
    set(handles.checkbox1,'Value',0);
    set(handles.checkbox2,'Value',1);
end


set(handles.checkbox2,'enable','on');

function durationedit_Callback(hObject, eventdata, handles)
% hObject    handle to durationedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationedit as text
%        str2double(get(hObject,'String')) returns contents of durationedit as a double


% --- Executes during object creation, after setting all properties.
function durationedit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see UITABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to asedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in toworkspace.
function toworkspace_Callback(hObject, eventdata, handles)
% hObject    handle to toworkspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

result = handles.msg;

checkLabels = {'Save results to workspace'};
varNames = {'result'};
items = {result};

a = export2wsdlg(checkLabels, varNames, items, 'Save'); 
set(a, 'resize','off')



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to durationedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of durationedit as text
%        str2double(get(hObject,'String')) returns contents of durationedit as a double

listbox3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to durationedit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in duration_.
function duration__Callback(hObject, eventdata, handles)
% hObject    handle to duration_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns duration_ contents as cell array
%        contents{get(hObject,'Value')} returns selected item from duration_
% hours = get(handles.duration_,'Value');
% 
% set(handles.durationedit,'String',hours);

% listbox3_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function duration__CreateFcn(hObject, eventdata, handles)
% hObject    handle to duration_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.LoadingAxes,'Visible','on');
pause(0.01);

next(hObject, eventdata, handles);
datacursormode on

set(handles.LoadingAxes,'Visible','off');

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles,res)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
back(hObject, eventdata, handles,0);
function back(hObject, eventdata, handles,res)
set(handles.LoadingAxes,'Visible','on');
pause(0.01);
index=get(handles.listbox3,'Value');    
spcnt=handles.ep.B.getMSXSpeciesCount;
handles.speciesID=handles.speciesID-1;
if handles.speciesID==-1 || handles.speciesID==0
    handles.speciesID=spcnt;
end
if (handles.speciesID < spcnt+1 && handles.speciesID>0)
    cla(handles.axes2); % clear plot
    valuenode = get(handles.checkbox1,'Value'); % NODES
    valuelink = get(handles.checkbox2,'Value'); % LINKS
    if ~isstruct(res)
        if valuelink==1
            res=handles.ep.resMsxLink;
        elseif valuenode==1
            res=handles.ep.resMsxNode;
        end    
    end

    axes(handles.axes2);
%     (T(find(mod(T,timestep)==0)))/timestep,x(find(mod(T,timestep)==0)
    plot(res.Time(find(mod(res.Time,handles.ep.B.getMSXTimeStep)==0))/3600,res.Quality{index}{handles.speciesID}((find(mod(res.Time,handles.ep.B.getMSXTimeStep)==0))),'r');
    Idspecies = handles.ep.B.getMSXSpeciesNameID(handles.speciesID);
    str = sprintf('  Amount of chemical spesies %s',char(Idspecies));
    title(handles.axes2,str);
    ylabel(handles.axes2,'Quantity');
    xlabel(handles.axes2,'Time(hrs)');
    set(handles.axes2,'xcolor',[0 0 0]);
    set(handles.axes2,'ycolor',[0 0 0]);
%     if handles.duration
%         xlim(handles.axes2,[0,handles.duration]);
%     end
else
    handles.speciesID = -1;
    back(hObject, eventdata, handles,0);
end

set(handles.LoadingAxes,'Visible','off');
% Update handles structure
guidata(hObject, handles);

function next(hObject, eventdata, handles, res)
index=get(handles.listbox3,'Value');    
spcnt=handles.ep.B.getMSXSpeciesCount;

handles.speciesID=handles.speciesID+1;
if handles.speciesID==-1 || handles.speciesID==spcnt+1
    handles.speciesID=1;
end

if (handles.speciesID < spcnt+1 && handles.speciesID>0)
    cla(handles.axes2); % clear plot
    valuenode = get(handles.checkbox1,'Value'); % NODES
    valuelink = get(handles.checkbox2,'Value'); % LINKS
    if valuelink==1
        res=handles.ep.resMsxLink;
    elseif valuenode==1
        res=handles.ep.resMsxNode;
    end        

    axes(handles.axes2);
    plot(res.Time(find(mod(res.Time,handles.ep.B.getMSXTimeStep)==0))/3600,res.Quality{index}{handles.speciesID}((find(mod(res.Time,handles.ep.B.getMSXTimeStep)==0))),'r');
    Idspecies = handles.ep.B.getMSXSpeciesNameID(handles.speciesID);
    str = sprintf('Amount of chemical spesies %s',char(Idspecies));
    title(handles.axes2,str);
    ylabel(handles.axes2,'Quantity');
    xlabel(handles.axes2,'Time(hrs)');
    set(handles.axes2,'xcolor',[0 0 0]);
    set(handles.axes2,'ycolor',[0 0 0]);
%     if handles.duration
%         xlim(handles.axes2,[0,handles.duration]);
%     end
else
    handles.speciesID = 0;
    next_Callback(hObject, eventdata, handles);
end

guidata(hObject, handles);

% --- Executes on button press in formules.
function formules_Callback(hObject, eventdata, handles)
% hObject    handle to formules (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (handles.setformula==0)
    set(handles.formtext,'Visible','on');
    FORMULES{1}='Formules - Equations';
    FORMULES{4}='Pipes:';
    FORMULES{2}='..................................';
    FORMULES{3}='';
    for i=4:length(handles.ep.B.getMSXEquationsPipes)
        FORMULES{i}=handles.ep.B.getMSXEquationsPipes{i};
    end
    if isempty(i); i=4; end
    FORMULES{i}='';
    FORMULES{i+1}='Tanks:';
    u=i+2;
    for i=1:length(handles.ep.B.getMSXEquationsTanks)
        FORMULES{u}=handles.ep.B.getMSXEquationsTanks{i};u=u+1;
    end
    FORMULES{u}='';u=u+1;
    FORMULES{u}='Terms:';u=u+1;
    for i=1:length(handles.ep.B.getMSXEquationsTerms)
        FORMULES{u}=handles.ep.B.getMSXEquationsTerms{i};u=u+1;
    end
    handles.setformula = 1;
    % Update handles structure
    guidata(hObject, handles);
    set(handles.formtext,'String',FORMULES);
else
    handles.setformula = 0;
    % Update handles structure
    guidata(hObject, handles);
    set(handles.formtext,'Visible','off');

end



% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3
index=get(handles.listbox3,'Value');
valuenode = get(handles.checkbox1,'Value'); % NODES
valuelink = get(handles.checkbox2,'Value'); % LINKS
if valuelink==1
    id=handles.ep.B.getLinkNameID(index);
elseif valuenode==1
    id=handles.ep.B.getNodeNameID(index);
end
set(handles.loading,'visible','on');
pause(0.01);
set(handles.search,'String',id);

set(handles.loading,'Visible','on');
pause(0.5)
set(handles.next,'visible','on');
set(handles.back,'visible','on');

Idspecies = handles.Idspecies;
value = get(handles.listbox3,'Value');
set(handles.text5,'visible','off');
set(handles.select,'visible','off');
% loading

valuenode = get(handles.checkbox1,'Value'); % NODES
valuelink = get(handles.checkbox2,'Value'); % LINKS

%set duration_
duration = str2num(get(handles.duration_,'String'));
if isempty(duration)
   duration=handles.ep.B.getTimeSimulationDuration*3600; 
end

% if duration_ < 14
%     set(handles.uitable1, 'ColumnWidth', {80 80 80 80 80 99});
% else
    set(handles.uitable1, 'ColumnWidth', {80 80 90 90 90 90});
% end
table = {''}; %clear table
set(handles.uitable1,'data', table);
if duration ~=0
    handles.ep.B.setTimeSimulationDuration(duration*3600);
else
    duration=24;
    handles.ep.B.setTimeSimulationDuration(duration*3600);
end
set(handles.duration_,'String',duration);

table1 = get(handles.uitable1,'data');
if valuenode==0 && valuelink==0
    return
end
handles.value = value;
handles.duration = duration;
Idspecies{1}=char('Time (sec)');
%     Retrieves a chemical species concentration at a given 
%     node or the average concentration along a link at the 
%     current simulation time step. 
spcnt=handles.ep.B.getMSXSpeciesCount;

% handles.ep.B.setTimeSimulationDuration(3600*duration_);
% handles.ep.B.saveInputFile(handles.ep.B.BinTempfile);
% handles.ep.B.loadEPANETFile(handles.ep.B.BinTempfile);
% handles.ep.B.loadEPANETFile(handles.ep.B.BinTempfile);
if valuelink==1 
%     res=handles.ep.B.getMSXComputedQualityLink(value,handles.ep.B.getMSXSpeciesIndex);
    res=handles.ep.resMsxLink;
elseif valuenode==1
%     res=handles.ep.B.getMSXComputedQualityNode(value,handles.ep.B.getMSXSpeciesIndex);
    res=handles.ep.resMsxNode;
end
sp=1;
for s=1:spcnt
    for i=1:length(res.Time)
        try
        table1{i,s+1} = res.Quality{value}{sp}(i); 
        catch e
           a=1; 
        end
        if s==1
           table1{i,1} = res.Time(i); 
        end
    end
    sp=1+sp;
end

set(handles.uitable1, 'ColumnName', Idspecies);
set(handles.uitable1,'data', table1);

handles.speciesID=0;
back(hObject, eventdata, handles,res);% GRAPHS

set(handles.uitable1,'data', table1);

% TO WORKSPACE
handles.msg= get(handles.uitable1,'DATA');
set(handles.loading,'visible','off');
guidata(hObject, handles); 


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Settings.
function Settings_Callback(hObject, eventdata, handles)
% hObject    handle to Settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in constants.
function constants_Callback(hObject, eventdata, handles)
% hObject    handle to constants (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select MSX Reaction Constant.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

if handles.ep.B.getMSXConstantsCount
    Constants(handles.ep)
else
    uiwait(msgbox('             No constants.','Modal'));
end

% --- Executes on button press in sources.
function sources_Callback(hObject, eventdata, handles)
% hObject    handle to sources (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Sources(handles.ep);

% --- Executes on button press in pattern.
function pattern_Callback(hObject, eventdata, handles)
% hObject    handle to pattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MSX_GetPatternData(handles.ep);


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton17,'enable','inactive');
set(handles.loading,'visible','on');
pause(0.01)

duration = str2num(get(handles.duration_,'String'));
if isempty(duration)
   duration=24; 
   set(handles.duration_,'String',duration);
end
if (length(duration)==0)
    duration=24;
    set(handles.duration_,'String',duration);
end
handles.ep.B.setTimeSimulationDuration(duration*3600)

warning off;
handles.ep.B.saveInputFile(handles.ep.B.BinTempfile);
handles.ep.B.loadEPANETFile(handles.ep.B.BinTempfile);
handles.ep.resMsxNode=handles.ep.B.getMSXComputedQualityNode;
handles.ep.resMsxLink=handles.ep.B.getMSXComputedQualityLink;
warning on;
set(handles.pushbutton17,'enable','on');

listbox3_Callback(hObject, eventdata, handles)



function search_Callback(hObject, eventdata, handles)
% hObject    handle to search (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of search as text
%        str2double(get(hObject,'String')) returns contents of search as a double
id=get(hObject,'String');
valuenode = get(handles.checkbox1,'Value'); % NODES
valuelink = get(handles.checkbox2,'Value'); % LINKS
if valuelink==1
    index=handles.ep.B.getLinkIndex(id);
elseif valuenode==1
    index=handles.ep.B.getNodeIndex(id);
end
if index
    set(handles.listbox3,'Value',index);
    listbox3_Callback(hObject, eventdata, handles)
else
    uiwait(msgbox('Wrong node ID.','modal'));
    index=get(handles.listbox3,'Value');
    id=handles.ep.B.getNodeNameID(index);
    set(handles.search,'String',id);
end


% --- Executes during object creation, after setting all properties.
function search_CreateFcn(hObject, eventdata, handles)
% hObject    handle to search (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
