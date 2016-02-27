function varargout = Source_and_Pattern(varargin)
% SOURCE_AND_PATTERN M-file for Source_and_Pattern.fig
%      SOURCE_AND_PATTERN, by itself, creates a new SOURCE_AND_PATTERN or raises the existing
%      singleton*.
%
%      H = SOURCE_AND_PATTERN returns the handle to a new SOURCE_AND_PATTERN or the handle to
%      the existing singleton*.
%
%      SOURCE_AND_PATTERN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SOURCE_AND_PATTERN.M with the given input arguments.
%
%      SOURCE_AND_PATTERN('Property','Value',...) creates a new SOURCE_AND_PATTERN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Source_and_Pattern_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Source_and_Pattern_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Source_and_Pattern

% Last Modified by GUIDE v2.5 25-May-2012 02:26:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Source_and_Pattern_OpeningFcn, ...
                   'gui_OutputFcn',  @Source_and_Pattern_OutputFcn, ...
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


% --- Executes just before Source_and_Pattern is made visible.
function Source_and_Pattern_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Source_and_Pattern (see VARARGIN)

% Choose default command line output for Source_and_Pattern
handles.output = hObject;
handles.help=0;
handles.index_species=1;
handles.ep=varargin{1};
set(handles.figure1,'name','Sources');

% UIWAIT makes Source_and_Pattern wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% set(handles.figure1,'position',[60 25 155.7 18.3])
set(handles.helpsource,'visible','off');

handles.Idspecies = handles.ep.B.getMsxSpeciesNameID;

%%CONSTANTS
concnt=handles.ep.B.getMsxConstantsCount;
idconst=handles.ep.B.getMsxConstantsNameID;
value=handles.ep.B.getMsxConstantsValue;
for i=1:concnt
    table{i,1} = char(idconst(i));   
    table{i,2} = value(i);    
end

%%PATTERNS
set(handles.listboxpattern,'String','');
patids=handles.ep.B.getMsxPatternsCount;
if handles.ep.B.getMsxPatternsCount~=0
    for i=1:handles.ep.B.getMsxPatternsCount
        id(i,1) = char(patids(i));   
    end
    set(handles.listboxpattern,'String',id);
end


%POP UP MENU

ids = handles.ep.B.getNodeNameID;
types = handles.ep.B.getNodeType;
ndcnt=handles.ep.B.getNodeCount;
for i=1:ndcnt
    %type
    type = types{i};
    NODES(i,1) ={type};
    %id
    id = sprintf(' %s',ids{i});
    NODES(i,1) = strcat(NODES(i,1),id);
end
set(handles.popupmenu,'String',NODES);

if ndcnt~=0
    %%Set Concentrations  *SOURCE*
    type=handles.ep.B.getMsxSourceType;
    level=handles.ep.B.getMsxSourceLevel;
    pat=handles.ep.B.getMsxSourcePatternIndex;
    idspecies=handles.ep.B.getMsxSpeciesNameID;
    set(handles.as3text,'string',idspecies(1));
    set(handles.source,'string',type{1}{1});
    set(handles.level,'string',level{1}(1));
    set(handles.pattern,'string',pat{1}(1));
    set(handles.popupmenu,'value',1);
end

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = Source_and_Pattern_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listboxpattern.
function listboxpattern_Callback(hObject, eventdata, handles)
% hObject    handle to listboxpattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listboxpattern contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listboxpattern

a = get(handles.listboxpattern,'Value'); 
list = (get(handles.listboxpattern,'String'));

% a is index pattern
if MSXgetcount('pattern')==0 && length(list)==0%an iparxei ii oxi pattern na sinexisi analoga.
    handles.zero = 0;
    % Update handles structure
    guidata(hObject, handles);
    savemat(hObject, eventdata, handles,a) % function where save index and call     MSX_PatternEditor;
elseif length(list)~=0
    handles.zero = 0;
    guidata(hObject, handles);
    savemat(hObject, eventdata, handles,a) % function where save index and call     MSX_PatternEditor;
else
    handles.zero = 1;
    guidata(hObject, handles);
    savemat(hObject, eventdata, handles,a) % function where save index and call     MSX_PatternEditor;
end


% --- Executes during object creation, after setting all properties.
function listboxpattern_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxpattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
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


% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

list = (get(handles.listboxpattern,'String'));
new_id= get(handles.edit2,'String');

if length(list)==0
    v=0;
end

c=1;
while c<length(list)+1
   v = strcmp(list(c),new_id);
   c = c+1;
end

if v~=1

    if MSXgetcount('pattern')~=0 
         % get list listbox. 
         a = MSXgetcount('pattern');
         i=1;
         while (i < (a+1))
             id(i,1) = (MSXgetID(i,'pattern')); %i is index
             i=i+1;
         end

         set(handles.listboxpattern,'String',id);

    end

        previousList = cellstr(get(handles.listboxpattern,'String'));

        % add new string to listbox
        new_id= get(handles.edit2,'String');
        new = char(new_id);
        new = cellstr(new);
        id = MSXaddpattern(char(new));

        if char(id)~=0
            listpattern = [previousList;{new_id}];

            set(handles.listboxpattern,'String',listpattern);
            
            if MSXgetcount('pattern')==1
                set(handles.listboxpattern,'String',{new_id});
            end
            
        else
            uiwait(msgbox('Invalid property values were specified.','Error','modal'));
        end
else
    uiwait(msgbox('Invalid pattern','Error','modal'));
end


if str2num(new_id)~=0
    set(handles.edit2,'String',str2num(new_id)+1);
end

 
function savemat(hObject, eventdata, handles,index)
list = (get(handles.listboxpattern,'String'));

if handles.zero==1 
    Getpatternindex = index-1;
    
elseif length(list)==0
    Getpatternindex = index-1;
else
    Getpatternindex = index;
end

if Getpatternindex~=0
    MSX_PatternEditor(Getpatternindex);
end

% --- Executes on selection change in listboxconcen.
function listboxconcen_Callback(hObject, eventdata, handles)
% hObject    handle to listboxconcen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listboxconcen contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listboxconcen


% --- Executes during object creation, after setting all properties.
function listboxconcen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listboxconcen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
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


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function pattern_Callback(hObject, eventdata, handles)
% hObject    handle to pattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pattern as text
%        str2double(get(hObject,'String')) returns contents of pattern as a double



% --- Executes during object creation, after setting all properties.
function pattern_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function patternNh2cl_Callback(hObject, eventdata, handles)
% hObject    handle to patternNh2cl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of patternNh2cl as text
%        str2double(get(hObject,'String')) returns contents of patternNh2cl as a double


% --- Executes during object creation, after setting all properties.
function patternNh2cl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to patternNh2cl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in help.
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes during object creation, after setting all properties.
function text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu.
function popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu

index = get(handles.popupmenu,'Value'); % index node

Idspecies = get(handles.as3text,'string'); % value = index node

Index_species = handles.ep.B.getMsxSpeciesIndex(char(Idspecies));
type=handles.ep.B.getMsxSourceType;
level=handles.ep.B.getMsxSourceLevel;
pat=handles.ep.B.getMsxSourcePatternIndex;

set(handles.source,'string',type{index}{Index_species});
set(handles.level,'string',level{index}(Index_species));
set(handles.pattern,'string',pat{index}(Index_species));
    


% --- Executes during object creation, after setting all properties.
function popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function level_Callback(hObject, eventdata, handles)
% hObject    handle to level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of level as text
%        str2double(get(hObject,'String')) returns contents of level as a double


% --- Executes during object creation, after setting all properties.
function level_CreateFcn(hObject, eventdata, handles)
% hObject    handle to level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function source_Callback(hObject, eventdata, handles)
% hObject    handle to source (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of source as text
%        str2double(get(hObject,'String')) returns contents of source as a double


% --- Executes during object creation, after setting all properties.
function source_CreateFcn(hObject, eventdata, handles)
% hObject    handle to source (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in next.
function next_Callback(hObject, eventdata, handles)
% hObject    handle to next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
spcnt=handles.ep.B.getMsxSpeciesCount;

index = get(handles.popupmenu,'Value'); % index node
handles.index_species=handles.index_species+1;
if handles.index_species==-1 || handles.index_species==spcnt+1
    handles.index_species=1;
end

if handles.index_species<spcnt+1 && handles.index_species>0
    type=handles.ep.B.getMsxSourceType;
    level=handles.ep.B.getMsxSourceLevel;
    pat=handles.ep.B.getMsxSourcePatternIndex;
    idspecies=handles.ep.B.getMsxSpeciesNameID;
    set(handles.as3text,'string',idspecies(handles.index_species));
    set(handles.source,'string',type{index}{handles.index_species});
    set(handles.level,'string',level{index}(handles.index_species));
    set(handles.pattern,'string',pat{index}(handles.index_species));
    set(handles.popupmenu,'value',index);
else
    handles.index_species=-1;
    next_Callback(hObject, eventdata, handles)
end
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

spcnt=handles.ep.B.getMsxSpeciesCount;

index = get(handles.popupmenu,'Value'); % index node
handles.index_species=handles.index_species-1;
if handles.index_species==-1 || handles.index_species==0
    handles.index_species=spcnt;
end
if handles.index_species<spcnt+1 && handles.index_species>0
    type=handles.ep.B.getMsxSourceType;
    level=handles.ep.B.getMsxSourceLevel;
    pat=handles.ep.B.getMsxSourcePatternIndex;
    idspecies=handles.ep.B.getMsxSpeciesNameID;
    set(handles.as3text,'string',idspecies(handles.index_species));
    set(handles.source,'string',type{index}{handles.index_species});
    set(handles.level,'string',level{index}(handles.index_species));
    set(handles.pattern,'string',pat{index}(handles.index_species));
    set(handles.popupmenu,'value',index);
else
    handles.index_species=-1;
    back_Callback(hObject, eventdata, handles)
end

% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
error1=1;
error=0;

index = get(handles.popupmenu,'Value'); % index node
Idspecies = get(handles.as3text,'string'); % value = index node
Index_species = handles.ep.B.getMsxSpeciesIndex(Idspecies{1});

type = get(handles.source,'string');
level = (get(handles.level,'string'));
pat = str2num(get(handles.pattern,'string'));

d = str2num(level); % elexgos an einai arithmos ii grammata 
j = length(d);
if d==0 
    level=1;
    set(handles.level,'string',level);
else
    level = str2num(level);
end

if j==0
    level=1;
    set(handles.level,'string',level);
elseif d==0
    if ~isnumeric(level)
        level = str2num(level);
    end
end

%Type Source
switch upper(type) 
    case 'CONCEN'
         code=0;
    case 'MASS'
         code=1;
    case 'SETPOINT'
         code=2;
    case 'FLOWPACED'
         code=3;
    otherwise
         code=0;
         type = char('CONCEN');
         set(handles.source,'string',type);
end
patid = handles.ep.B.getMsxPatternsNameID(pat);

f = strcmp('NOSOURCE',char(type));
if f==1
    type = char('CONCEN');
    set(handles.source,'string',char(type));
end


if isempty(patid)==0 
    uiwait(msgbox('Invalid pattern. Other option its ok.','modal'));
    handles.ep.B.setMsxSources(index,Index_species,code,level,pat)
    error=1;
else
    handles.ep.B.setMsxSources(index,Index_species,code,level,pat)
    error=0;
end

if length(str2num(type))~=0 
    uiwait(msgbox('Invalid source.','modal'));
    error1=1;
else
    handles.ep.B.setMsxSources(index,Index_species,code,level,pat)
    error1=0;
end

if error1==0 && error==0
    
        uiwait(msgbox('Changes is succesful.','modal'));

end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if handles.help==0
    
    set(handles.helpsource,'visible','on');
    
    handles.help=1;
    % Update handles structure
    guidata(hObject, handles);

else
    
    set(handles.helpsource,'visible','off');

    handles.help=0;
    % Update handles structure
    guidata(hObject, handles);

end


function [units_species] = UNITS_SPECIES(hObject, eventdata, handles)

%function is the same with ReadSpecies

fid = fopen(handles.filenamemsx,'r');
Number_of_characters = fread(fid,1,'uint32');

% OPEN MSX FILE AND READ
fid = fopen(handles.filenamemsx);
c = fread(fid,Number_of_characters);
a = char(c)';
str = char(a);
pat = '\s+';
s = regexp(str, pat, 'split');


A=char('[SPECIES]');

B= char('[COEFFICIENTS]');

C= char('RTOL');

D= char('ATOL');

r=1;i=1;
u=0;t=0;

while u~=1 

    g = s(i);

    i =i +1;
    u = strcmp(g,A);
    
    q = strcmp(g,C);
    if q==1
        RTOL = s(i); 
        handles.q = q;
        guidata(hObject, handles);
    end
    
    w = strcmp(g,D);
    if w==1
        ATOL = s(i);
        handles.w = w;
        guidata(hObject, handles);
    end
    
    if u==1
        while t~=1
        SPECIES(r) = s(i);
        r=r+1;
        
        t = strcmp(SPECIES,B);
        i=i+1;
        end      
    end
    
end
    
r=1;i=1;
u=1;


if length(SPECIES)~=0
    while u < length(SPECIES)

        table{r,i} = SPECIES{u};
        t= strcmp(char('BULK'),SPECIES{u+1});
        k = strcmp(char('WALL'),SPECIES{u+1});
        u=u+1;
        i=i+1;

        if (t==1 || k==1)
            r=r+1;i=1;
        end

    end
end

i=1;
while i < MSXgetcount('species')+1
    
      units_species{i} = table{i,3};
      i=i+1;
end
