function varargout = Example1(varargin)
% EXAMPLE1 M-file for Example1.fig
%      EXAMPLE1, by itself, creates a new EXAMPLE1 or raises the existing
%      singleton*.
%
%      H = EXAMPLE1 returns the handle to a new EXAMPLE1 or the handle to
%      the existing singleton*.
%
%      EXAMPLE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXAMPLE1.M with the given input arguments.
%
%      EXAMPLE1('Property','Value',...) creates a new EXAMPLE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs
%      are
%      applied to the GUI before Example1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Example1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Example1

% Last Modified by GUIDE v2.5 24-Oct-2015 23:51:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Example1_OpeningFcn, ...
                   'gui_OutputFcn',  @Example1_OutputFcn, ...
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


% --- Executes just before Example1 is made visible.
function Example1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Example1 (see VARARGIN)

% Choose default command line output for Example1
handles.output = hObject;
handles.closegraphs=0;
handles.count=0;
handles.open = 0;
handles.ep=varargin{1};
guidata(hObject, handles);
[~,inputfile]=fileparts(handles.ep.B.inputfile);
descpr='This example can be used to create fire hydrant evaluation curve, because the water pressure depends also ';
descpr=[descpr,'from fire hydrants. Through ',inputfile,'.inp network we simulate, for any maximum uncertainty (%), a numerous '];
descpr=[descpr,'Monde Carlo Simulations (N) for a specific period in order to find the lowest possible pressures in all nodes'];
descpr=[descpr,' in the network.                                                                                            '];
descpr=[descpr,'                                                                                                             '];
descpr=[descpr,'                                     '];
descpr=[descpr,'NOTE: User through graphical user interfaces can control pressure and possible node consumption. He can also set new values.'];



set(handles.text5,'String',descpr);


calldef(hObject, eventdata, handles)
okbutton_Callback(hObject, eventdata, handles);% run

function calldef(hObject, eventdata, handles, varargin)
% UIWAIT makes Example1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Minimum Pressure Monte Carlo');

set(handles.figure1,'Position',[35 10 145.5 41.3]);

set(handles.loading,'visible','off');

% set value for data 
set(handles.edit1,'String',100);% scenario 
set(handles.edit2,'String',20);% uncertainty
set(handles.edit3,'String',15);% duration hours
set(handles.edit4,'String',100);% minimum pressures
set(handles.Graphsbutton,'String','Graphs');

try
    delete(handles.g); 
catch err;
end        
handles.g=axes('Parent',handles.axes2);        
handles.g=handles.ep.B.plot('axes',handles.g);    
set(handles.axes2,'HighlightColor','k')   
     
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Example1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in okbutton.
function okbutton_Callback(hObject, eventdata, handles)
% hObject    handle to okbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.loading,'visible','on');
pause(0.01)

%clear table
table = {''};
set(handles.uitable1,'data',table);
ndcnt=handles.ep.B.getNodeJunctionCount;
k=1;
if k==1
    N = str2num(get(handles.edit1,'String'));
    uncertainty = str2num(get(handles.edit2,'String'));
    duration = str2num(get(handles.edit3,'String'));
    minpressure = str2num(get(handles.edit4,'String'));
    if  size(N)~=0 
        if size(uncertainty)~=0 
            if size(duration)~=0 
                if size(minpressure)~=0 
                    set(handles.next,'enable','on');
                    set(handles.back,'enable','on');
                    handles.N = N;
                    handles.uncertainty = uncertainty;
                    handles.duration = duration;
                    % Update handles structure
                    guidata(hObject, handles);
                    indices=handles.ep.B.getNodeJunctionIndex;
                    [minnodes,iderror,~,~]=MinimumPressure(handles,N,uncertainty,duration,minpressure,indices);
                    table = get(handles.uitable1,'Data');
                    for i=1:ndcnt
                        %Minimum Pressures
                        mins = minnodes(i);
                        table(i,3) = {mins};
                        set(handles.uitable1,'data', table);
                    end

                    for i=1:length(iderror)
                        %iderror
                        idproblem = char(iderror(i)); 
                        indexnode = handles.ep.B.getNodeIndex({idproblem});
                        idproblem = str2num(idproblem);
                        set(handles.uitable1,'data', table);
                        if idproblem~=0
                            idproblem = char('                     *****');
                        end
                        if indexnode~=0
                            table(indexnode,4) = {idproblem};
                        end
                        set(handles.uitable1,'data', table);
                    end

                end
            end
        end
    end
end
    
set(handles.loading,'visible','off');

if handles.count==0;
    handles.count=1;
    % Update handles structure
    guidata(hObject, handles);
else
    if (handles.open == 1)% for position figure
        handles.closegraphs =0; 
        Graphsbutton_Callback(hObject, eventdata, handles);
    else
        handles.closegraphs =1; 
        Graphsbutton_Callback(hObject, eventdata, handles);
    end
end

ids = handles.ep.B.getNodeNameID;
types = handles.ep.B.getNodeType;
%matrix
for i=1:ndcnt
    %id
    id = ids{i};
    table(i,2) = {id};
    %type
    type = types{i};
    table(i,1) ={type};
end
set(handles.uitable1,'data', table);
set(handles.uitable1,'ColumnWidth', {65 50 125 157});
set(handles.uitable1,'ColumnName', {'Type','ID','Minimum Pressures','Junction with problem'});

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


% --- Executes on button press in ClearButton.
function ClearButton_Callback(hObject, eventdata, handles)
% hObject    handle to ClearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% set value for data 
set(handles.edit1,'String',[]);% scenario 
set(handles.edit2,'String',[]);% uncertainty
set(handles.edit3,'String',[]);% duration hours
set(handles.edit4,'String',[]);% minimum pressures
cla(handles.axes3)
cla(handles.axes4)
xlabel(handles.axes3,'');
xlabel(handles.axes4,'');
ylabel(handles.axes3,'');
ylabel(handles.axes4,'');

title(handles.axes3,'');
title(handles.axes4,'');

set(handles.axes3,'xcolor',[0.941 0.941 0.941]);
set(handles.axes3,'ycolor',[0.941 0.941 0.941]);
set(handles.axes4,'ycolor',[0.941 0.941 0.941]);
set(handles.axes4,'xcolor',[0.941 0.941 0.941]);
set(handles.axes3,'xgrid','off');
set(handles.axes3,'ygrid','off');
set(handles.axes4,'xgrid','off');
set(handles.axes4,'ygrid','off');

[ndcnt]=writeBasicOntable(handles);    

set(handles.next,'enable','off');
set(handles.back,'enable','off');

function [ndcnt]=writeBasicOntable(handles)
% %matrix
ndcnt=handles.ep.B.getNodeCount;
tr = {'Type' 'ID','',''};
table={''};
set(handles.uitable1,'ColumnName',tr);
ids = handles.ep.B.getNodeNameID;
types = handles.ep.B.getNodeType;
%matrix
for i=1:ndcnt
    %id
    id = ids{i};
    table(i,2) = {id};
    %type
    type = types{i};
    table(i,1) ={type};
end
set(handles.uitable1,'data', table);
set(handles.uitable1,'ColumnWidth', {100 100 80 80});

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in Graphsbutton.
function Graphsbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Graphsbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Graphsbutton,'enable','inactive');
    
if handles.closegraphs ==0

    N = str2num(get(handles.edit1,'String'));
    uncertainty = str2num(get(handles.edit2,'String'));
    duration = str2num(get(handles.edit3,'String'));
    minpressure = str2num(get(handles.edit4,'String'));

    if  size(N)~=0 
        if size(uncertainty)~=0 
            if size(duration)~=0 
                if size(minpressure)~=0 
                     handles.ind_min = 1;
                     % Update handles structure
                     guidata(hObject, handles);    
                     handles.index=1;
                     handles.closegraphs=1;         
                     handles.open = 1; %for open possition figure
                     guidata(hObject, handles);
                     next_Callback(hObject, eventdata, handles)
                     set(handles.Graphsbutton,'String','Close Graphs');
                     set(handles.figure1,'Position',[18 10 223 41.3]);
                     set(handles.uipanel7,'Position',[0.5 0.8 142 40]);
                     datacursormode on
                end
            end
        end
    end
else
    set(handles.Graphsbutton,'String','Graphs');
    datacursormode off
    handles.closegraphs=0;
    handles.open = 0; %for open possition figure
    guidata(hObject, handles);
    set(handles.figure1,'Position',[35 10 145.5 41.3]);

end
set(handles.Graphsbutton,'enable','on');

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);

% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.closegraphs=1;
guidata(hObject, handles);
    
set(handles.next,'enable','inactive');
N = str2num(get(handles.edit1,'String'));
uncertainty = str2num(get(handles.edit2,'String'));
duration = str2num(get(handles.edit3,'String'));

handles.index=handles.index+1;
guidata(hObject, handles);
ndjcnt=handles.ep.B.getNodeJunctionCount;    

if (handles.index < ndjcnt+1) && (handles.index>0)
    Exam(handles.index,N,uncertainty,duration, handles)
else
    handles.index = 0;
    guidata(hObject, handles);
    next_Callback(hObject, eventdata, handles)
end
set(handles.next,'enable','on');

function Exam(index,N,uncertainty,duration, handles)
if  size(N)==0 
    cla(handles.axes3)
    cla(handles.axes4)
    return
end
if size(uncertainty)==0 
    cla(handles.axes3)
    cla(handles.axes4)
    return
end
if size(duration)==0 
    cla(handles.axes3)
    cla(handles.axes4)
    return
end

set(handles.axes3,'xcolor',[0 0 0]);
set(handles.axes3,'ycolor',[0 0 0]);
set(handles.axes4,'ycolor',[0 0 0]);
set(handles.axes4,'xcolor',[0 0 0]);

cla(handles.axes3)
cla(handles.axes4)
%    /*Duration*/
d=duration+1;
[~,~,P,D]=MinimumPressure(handles,N,uncertainty,duration,0,index);
units=handles.ep.B.getBinUnits;

axes(handles.axes3)
plot(handles.axes3,P)
grid on
id= char(handles.ep.B.getNodeNameID(index));
str = sprintf('Pressures for node %s',id);
title(str);
xlabel('Time(hrs)');
a = sprintf('Pressure (%s)',units.BinNodePressureUnits);
ylabel(a);
xlim([1,d]);
% Plot Demands for node
axes(handles.axes4)
plot(handles.axes4,D); %plot(v)
grid on
str = sprintf('Demands for node %s',id);
title(str);
xlabel('Time(hrs)');
a = sprintf('Demand (%s)',units.BinLinkFlowUnits);
ylabel(a);
xlim([1,d]);  %for 24 hours


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.back,'enable','inactive');

N = str2num(get(handles.edit1,'String'));
uncertainty = str2num(get(handles.edit2,'String'));
duration = str2num(get(handles.edit3,'String'));
minpressure = str2num(get(handles.edit4,'String'));


handles.index=handles.index-1;
guidata(hObject, handles);
    
ndjcnt=handles.ep.B.getNodeJunctionCount;    
if (handles.index < ndjcnt+1) && (handles.index>0)
    Exam(handles.index,N,uncertainty,duration, handles);
else
    handles.index = ndjcnt+1;
    guidata(hObject, handles);
    back_Callback(hObject, eventdata, handles)
end
set(handles.back,'enable','on');

function [z,id,P,D]=MinimumPressure(handles,N,pr_un,duration,minparam,indices,varargin)
% MinimumPressure - minimum pressure monte carlo
% Syntax:   MinimumPressure(filename,id,N,percent_uncertainty)
% Inputs:
%           filename - name for input file. 
%           N - different demand levels stored in the array D(different
%               day)
%           pr_un - percent_uncertainty
%           duration - hours control
%           minparam - minimum value for pressure ex. 110!
d=duration+1;
handles.ep.B.setTimeSimulationDuration(3600*duration)

%constant for N, with rand.    
pr_un=pr_un/100;
half=pr_un/2;
NDJCNT=handles.ep.B.getNodeJunctionCount;
step=round(handles.ep.B.getTimeReportingStep/3600);
res=handles.ep.B.getComputedHydraulicTimeSeries;

for index=indices        
    D(1:length(res.Demand(:,index)),1)=res.Demand(:,index)';
    P(1:length(res.Pressure(:,index)),1)=res.Pressure(:,index)';
    
    q=1;
    while q<N %N number days demand
      q=q+1;
      D(1:length(res.Demand(:,index)),q) = res.Demand(:,index).*(1+(pr_un)*rand(length(res.Demand(:,index)),1)-half);
      P(1:length(res.Pressure(:,index)),q) = res.Pressure(:,index).*(1+(pr_un).*rand(length(res.Pressure(:,index)),1)-half);
    end

    j = min(P);
    z(index,:)=min(j);
    f = index;  % because Subscript indices must either be real positive integers or logicals.
    id=handles.ep.B.getNodeNameID(index);
    index = index + 1;
end
if minparam
    % LIMIDED for pressure
    e  = z < minparam;
    b=1;
    if e==0
        id =0;
    end
    for t=1:NDJCNT
       if  e(t)~=0
           id(b) = handles.ep.B.getNodeNameID(t);
           b=b+1;
       end
    end
end


% --- Executes on button press in default.
function default_Callback(hObject, eventdata, handles)
% hObject    handle to default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calldef(hObject, eventdata, handles)
writeBasicOntable(handles);
handles.open=0;
guidata(hObject, handles);
