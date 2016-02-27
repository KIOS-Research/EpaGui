function varargout = ENP_PatternEditor(varargin)
% ENP_PATTERNEDITOR M-file for ENP_PatternEditor.fig
%      ENP_PATTERNEDITOR, by itself, creates a new ENP_PATTERNEDITOR or raises the existing
%      singleton*.
%
%      H = ENP_PATTERNEDITOR returns the handle to a new ENP_PATTERNEDITOR or the handle to
%      the existing singleton*.
%
%      ENP_PATTERNEDITOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENP_PATTERNEDITOR.M with the given input arguments.
%
%      ENP_PATTERNEDITOR('Property','Value',...) creates a new ENP_PATTERNEDITOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ENP_PatternEditor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ENP_PatternEditor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".% clear table
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ENP_PatternEditor

% Last Modified by GUIDE v2.5 11-Feb-2016 11:38:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ENP_PatternEditor_OpeningFcn, ...
                   'gui_OutputFcn',  @ENP_PatternEditor_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end


if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State,  varargin{:});
end
% End initialization code - DO NOT EDIT
    

% --- Executes just before ENP_PatternEditor is made visible.
function ENP_PatternEditor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ENP_PatternEditor (see VARARGIN)

% Choose default command line output for ENP_PatternEditor
handles.output = hObject;

handles.Getpatternindex=varargin{2};
handles.closehelp=0;
handles.ep=varargin{1};
% Update handles structure
guidata(hObject, handles);

%clear table
table = '';
set(handles.uitable1,'data',table);

set(handles.figure1,'Position',[75 15 104.5 39]);

% UIWAIT makes ENP_PatternEditor wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Pattern Editor');

index = handles.Getpatternindex;

len = handles.ep.B.getPatternLengths(index);

if len==24 || len==12
else
    handles.ep.B.setPattern(index,ones(1,24));
    len=24;
end

handles.len = len;


idpattern = handles.ep.B.getPatternNameID(index);
set(handles.idtext,'String',idpattern);


table = get(handles.uitable1,'data');

%Multiplier
for period=1:len;
    t = handles.ep.B.getPatternValue(index,period); 
    table{2,period}=sprintf('%.1f',t);
end       
    
set(handles.uitable1,'data',table);

%Time Period 24 hour
for period=1:len;
    table{1,period}= num2str(period);
end       
    
set(handles.uitable1,'data',table);


% setting table
set(handles.uitable1,'RowName',{'Time Period','Multiplier'});
set(handles.uitable1,'ColumnEditable',[true true true true true true true true...
    true true true true true true true true true true true true true true true true]);

%color table
foregroundColor = [1 1 1];
set(handles.uitable1, 'ForegroundColor', foregroundColor);
backgroundColor = [.4 .1 .1; .1 .1 .4];
set(handles.uitable1, 'BackgroundColor', backgroundColor);

str = sprintf('Pattern Length %.f',len);
set(handles.edit2,'String',str);

% call function
PatternEditor(index,len,handles);

%visible --on or off
set(handles.helptext,'visible','off');
set(handles.edit2,'visible','on');
set(handles.pushbutton5,'visible','on');

handles.previous = table;
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = ENP_PatternEditor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in helpbutton.
function helpbutton_Callback(hObject, eventdata, handles)
% hObject    handle to helpbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if handles.closehelp==0
    
    set(handles.helptext,'visible','on');
    set(handles.edit2,'visible','off');
    
    handles.closehelp=1;
    % Update handles structure
    guidata(hObject, handles);

else
    
    set(handles.helptext,'visible','off');
    set(handles.edit2,'visible','on');

    handles.closehelp=0;
    % Update handles structure
    guidata(hObject, handles);

end


% --- Executes during object creation, after setting all properties.
function idtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to idtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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



% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


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
cla
table = get(handles.uitable1,'data');
new = eventdata.NewData;
if isnumeric(new)
    new = num2str(new);
end

previous = eventdata.PreviousData;
edit = eventdata.EditData;

row = eventdata.Indices(1);
column = eventdata.Indices(2);

edit = str2num(edit);
d = length(edit);

if row ~= 2 
    table{row,column}=previous;
    set(handles.uitable1,'data',table);
end

Getpatternindex = handles.Getpatternindex;

len = handles.ep.B.getPatternLengths(Getpatternindex);

if row==2 && d==1 && column < len+1
    
    handles.ep.B.setPatternValue(Getpatternindex,column,str2num(new))
    if isnumeric(new)
        new = str2num(new);
    end
    table{row,column}=new;
    set(handles.uitable1,'data',table);

else
    
    table{row,column}=previous;
    set(handles.uitable1,'data',table);

end


table = get(handles.uitable1,'data');

index = Getpatternindex;

len = handles.ep.B.getPatternLengths(index);

i=len+1;%clear table.
while i < len
    table{2,i} = 0;
    i=i+1;
end
set(handles.uitable1,'data',table);

for i=1:len
    if length(table{2,i})==0
        table{2,i}=0;
        handles.ep.B.setPatternValue(Getpatternindex,i,(table{2,i}))% to 2 einai
    else
        handles.ep.B.setPatternValue(Getpatternindex,i,str2num(table{2,i}))% to 2 einai
    end
end
set(handles.uitable1,'data',table);
idpattern = handles.ep.B.getPatternNameID(index);
set(handles.idtext,'String',idpattern);
%Multiplier
period = 1;
while period < len+1;
    t = handles.ep.B.getPatternValue(index,period); 
    table{2,period}=sprintf('%.1f',t);
    period = period +1;
end       
set(handles.uitable1,'data',table);

%Time Period 24 hour
for period=1:len
    table{1,period}= num2str(period);
end       
    
set(handles.uitable1,'data',table);


% setting table
set(handles.uitable1,'RowName',{'Time Period','Multiplier'});
set(handles.uitable1,'ColumnEditable',[true true true true true true true true...
    true true true true true true true true true true true true true true true true]);

%color table
foregroundColor = [1 1 1];
set(handles.uitable1, 'ForegroundColor', foregroundColor);
backgroundColor = [.4 .1 .1; .1 .1 .4];
set(handles.uitable1, 'BackgroundColor', backgroundColor);

% str = sprintf('%.f',len);
% set(handles.edit2,'String',str);

% call function
PatternEditor(index,len, handles);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
% set(handles.OKEDIT,'visible','on');

% newlen = str2num(get(handles.edit2,'String'));
% 
% d = length(newlen);
%     
% if d~=0
%     
%     if newlen>25
%         newlen=24;
%         set(handles.edit2,'String',newlen);
%     end
%     
%     b = length(newlen);
% 
%     Getpatternindex = handles.Getpatternindex;
% 
%     if b~=0
%         ENsetpattern(Getpatternindex,newlen);
%     end
% 
%     table = get(handles.uitable1,'data');
% 
%     i=1;%clear table.
%     while i < 25
%         table{2,i} = '';
%         i=i+1;
%     end
%     set(handles.uitable1,'data',table);
% 
%     cla
% 
% end

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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.figure1,'visible','off');


% --- Executes on button press in cancelbutton.
function cancelbutton_Callback(hObject, eventdata, handles)
% hObject    handle to cancelbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

table = handles.previous;

set(handles.uitable1,'data',table);

previous = table;

Getpatternindex = handles.Getpatternindex;

len = handles.len;

handles.ep.B.setPattern(Getpatternindex,[1:len]);


i=1;% vazw tis times tou pinaka sto pattern.
while i<len + 1
    if length(previous{2,i})==0
        previous{2,i}=0;
        handles.ep.B.setPatternValue(Getpatternindex,i,(previous{2,i}))% to 2 einai
    else
        handles.ep.B.setPatternValue(Getpatternindex,i,str2num(previous{2,i}))% to 2 einai
    end
    
    i=i+1;
end


set(handles.figure1,'visible','off');

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

cancelbutton_Callback(hObject, eventdata, handles);

set(handles.figure1,'visible','off');


function [y]= PatternEditor(index,len, handles)
cla %clear figure
% initial variables
p=1;%period
a=24/len;
group=a;%period group
r=1;
z=0;
t=1;
%Demand pattern
while t~=26
    while (r<25)&&(z<a)
        y(r)=handles.ep.B.getPatternValue(index,p);
        z=z+1;
        r=r+1;
    end
    t=t+1;
    a=a+group;
    p=p+1;
end

% Plot Demand pattern
axes(handles.axes1)
bar(handles.axes1,y)
title('Demand Pattern');
str= sprintf('Time(Time Period: %.f hrs)',24/len);
xlabel(str);
ylabel('Average=1');
xlim([1,24]);

hold on

plot(handles.axes1,1:24,1,'*r')
