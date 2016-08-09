function varargout = Controls(varargin)
% CONTROLS M-file for Controls.fig
%      CONTROLS, by itself, creates a new CONTROLS or raises the existing
%      singleton*.
%
%      H = CONTROLS returns the handle to a new CONTROLS or the handle to
%      the existing singleton*.
%
%      CONTROLS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROLS.M with the given input arguments.
%
%      CONTROLS('Property','Value',...) creates a new CONTROLS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Controls_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Controls_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Controls

% Last Modified by GUIDE v2.5 24-Oct-2015 06:15:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Controls_OpeningFcn, ...
                   'gui_OutputFcn',  @Controls_OutputFcn, ...
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


% --- Executes just before Controls is made visible.
function Controls_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Controls (see VARARGIN)

% Choose default command line output for Controls
handles.output = hObject;
handles.ep=varargin{1};
set(handles.text1,'visible','off');
set(handles.listbox1,'String','') 

set(handles.figure1,'name','Controls Editor');
% UIWAIT makes Controls wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'Position',[85 20 83.8 26.685]);
set(handles.replacebutton,'Value',1);
set(handles.removebutton,'Value',0);
set(handles.addcontrol,'Value',0);
% handles.count = varargin;
handles.closehelp=0;
previouslist=cellstr(get(handles.listbox1,'String'));
handles.newlist = previouslist;

% list = get(handles.listbox1,'Value');
for i=1:handles.ep.B.getControlRulesCount
    % controlRuleIndex,controlTypeIndex,linkIndex,controlSettingValue,nodeIndex,controlLevel
    controls=handles.ep.B.getControls{i};
    linkid=char(handles.ep.B.getLinkNameID(controls{3}));
    setting=controls{4};
    if ~setting
        setting='CLOSED';
    elseif setting
        setting='OPEN';
    end
    level=controls{6};
    if controls{2}==0
        nodeid=char(handles.ep.B.getNodeNameID(controls{5}));
        ctype = 'BELOW';
        a= sprintf('LINK %s %s IF NODE %s %s %.f',linkid,setting,nodeid,ctype,level);
        handles.newlist(i) = cellstr(a);
    end

    if controls{2}==1
        nodeid=char(handles.ep.B.getNodeNameID(controls{5}));
        ctype = 'ABOVE';
        a= sprintf('LINK %s %s IF NODE %s %s %.f',linkid,setting,nodeid,ctype,level);
        handles.newlist(i) = cellstr(a);
    end

    if controls{2}==2
        a = sprintf('LINK %s %s AT TIME %d (seconds) \n',linkid,setting,level);
        handles.newlist(i) = cellstr(a);
    end

    if controls{2}==3
        a = sprintf('LINK %s %s AT CLOCKTIME %d (seconds)',linkid,setting,level); 
        handles.newlist(i) = cellstr(a);
    end
end
set(handles.listbox1,'String',handles.newlist) 

handles.controlsprevious = handles.newlist;

% Update handles structure
guidata(hObject, handles);
% count = ENgetcount('controls');
% Controls(count);

% --- Outputs from this function are returned to the command line.
function varargout = Controls_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
p=cellstr(get(hObject,'String'));
value=get(hObject,'Value');
set(handles.edit1,'String',p(value));

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
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


% --- Executes on button press in replacebutton.
function replacebutton_Callback(hObject, eventdata, handles)
% hObject    handle to replacebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of replacebutton
set(handles.replacebutton,'Value',1);
set(handles.removebutton,'Value',0);
set(handles.addcontrol,'Value',0);
% --- Executes on button press in OKbutton.
function OKbutton_Callback(hObject, eventdata, handles)
% hObject    handle to OKbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


set(handles.text1,'visible','off');
replremove(hObject, handles);



function replremove(hObject, handles)

help = get(handles.text1,'visible');
help = strcmp(help,'on');
controlsprevious = get(handles.listbox1,'String');

if handles.ep.B.getControlRulesCount || get(handles.addcontrol,'Value')
    
    for i=1:length(controlsprevious)
        handles.newlist(i)= controlsprevious(i);
    end
    a = get(handles.replacebutton,'Value');  %Button Replace
    if a==1 || get(handles.addcontrol,'Value')
        add = get(handles.edit1,'String'); %elegxo an patithike to koumpi.
        valuelist = get(handles.listbox1,'Value');
        t=1;
        while t < valuelist+1
            try
                Sentences=regexp(add{1},'\ ','split'); %xwrizw tin protasi se le3eis.
                if length(Sentences)<6
                    uiwait(msgbox('           Wrong Control.','Modal'));
                    return;
                end
            u=1;
            for rr=1:length(Sentences)
                if isempty(Sentences{rr})
                    u=u+1;
                end
                try
                    ss(rr)=Sentences(u);
                catch e
                    Sentences=ss;
                end
                u=u+1;
            end
            catch e
                uiwait(msgbox('           Wrong Control.','Modal'));
                return;
            end
            r = Sentences(1);
            cmp = strcmp(r,'LINK');
            q = length(Sentences);
            if q == 8 && cmp==1  %elegxos an einai 8 le3eis 
                linkid = Sentences(2);
                lindex = handles.ep.B.getLinkIndex(linkid);
                if lindex ~=0 
                    setting= char(Sentences(3));
                    setting = upper(setting);
                    switch setting
                        case 'CLOSED'
                            settingp=0;
                        case 'OPEN'
                            settingp=1;
                    end
                    nodeid=Sentences(6);
                    nindex = handles.ep.B.getNodeIndex(nodeid);

                    if nindex ~=0
                        ctype = char(Sentences(7));
                        ctype = upper(ctype);
                        switch ctype
                            case 'BELOW'
                                ctypep =0; %('LOW LEVEL CONTROL');
                            case 'ABOVE'
                                ctypep =1; %('HIGH LEVEL CONTROL');
                            otherwise
                                ctypep = -1;
                        end

                        if ctypep==-1
                            uiwait(msgbox('           Wrong Control.','Modal'));
                            return;
                        end
                        level = str2double(Sentences(8));
                        linkid = char(Sentences(2));
                        nodeid=char(Sentences(6));
                        if get(handles.addcontrol,'Value');
                            handles.ep.B.addBinControl(linkid,setting,nodeid,ctype,level);
                            newl= sprintf('LINK %s %s IF NODE %s %s %.f',linkid,setting,nodeid,ctype,level);
                            handles.newlist(length(controlsprevious)+1) = cellstr(newl);    
                            set(handles.listbox1,'String',handles.newlist);
                            set(handles.listbox1,'Value',length(handles.newlist));
                            return;
                        else
                            % controlRuleIndex,controlTypeIndex,linkIndex,controlSettingValue,nodeIndex,controlLevel
                            handles.ep.B.setControl(valuelist,ctypep,lindex,settingp,nindex,level); 

                            newl= sprintf('LINK %s %s IF NODE %s %s %.f',linkid,setting,nodeid,ctype,level);
                            handles.newlist(valuelist) = cellstr(newl);
                        end
                    else
                        str = sprintf('           Undefined node ID.');
                        uiwait(msgbox(str,'Modal'));return;
                    end
                else 
                    str = sprintf('           Undefined link ID.');
                    uiwait(msgbox(str,'Modal'));return;
                end
            end


            %For TIME (gia tis protaseis me TIME)
            if strcmp(upper(Sentences(4)),'AT') && (~strcmp(upper(Sentences(5)),'TIME') || ~strcmp(upper(Sentences(5)),'CLOCKTIME'))
                if strcmp(upper(Sentences(5)),'TIME') || strcmp(upper(Sentences(5)),'CLOCKTIME')
                else
                    uiwait(msgbox('           Wrong Control.','Modal'));
                    return;
                end
            end
                            
            if strcmp(upper(Sentences(5)),'TIME') && cmp==1
                linkid = Sentences(2);
                lindex = handles.ep.B.getLinkIndex(linkid);
                setting= char(Sentences(3));
                setting = upper(setting);
                if lindex ~=0 % elegxo ean iparxi ayto to ID pou dothike apo to xristi.
                    switch setting
                        case 'CLOSED'
                            settingp=0;
                        case 'OPEN'
                            settingp=1;
                        otherwise
                        uiwait(msgbox('           Wrong Control.','Modal'));
                        return;
                    end
                    level = str2double(Sentences(6));
                    nindex = 0; %For Timer or Time-of-Day controls the nindex parameter equals 0.  
                    linkid = char(Sentences(2)); 
                    if get(handles.addcontrol,'Value')
                        handles.ep.B.addBinControl(linkid,setting,num2str(level/3600));
                        newl = sprintf('LINK %s %s AT TIME %s (seconds)\n',linkid,setting,num2str(level));
                        handles.newlist(length(controlsprevious)+1) = cellstr(newl);    
                        set(handles.listbox1,'String',handles.newlist);
                        set(handles.listbox1,'Value',length(handles.newlist));
                        return;
                    else
                        handles.ep.B.setControl(valuelist,2,lindex,settingp,nindex,level);  %2 = ctype , code for Timer Control
                        newl = sprintf('LINK %s %s AT TIME %s \n',linkid,setting,num2str(level));
                        handles.newlist(valuelist) = cellstr(newl);
                    end                    
                    t=t+1;
                else
                    str = sprintf('           Undefined link ID.');
                    uiwait(msgbox(str,'Modal'));return;
                end
            end


            if strcmp(upper(Sentences(5)),'CLOCKTIME') && cmp==1
                linkid = Sentences(2);
                lindex = handles.ep.B.getLinkIndex(linkid);
                setting= char(Sentences(3));
                setting = upper(setting);
                
                if lindex ~=0 % elegxo ean iparxi ayto to ID pou dothike apo to xristi.
                    switch setting
                        case 'CLOSED'
                            settingp=0;
                        case 'OPEN'
                            settingp=1;
                    end
                    level = str2double(Sentences(6));
                    nindex = 0; %For Timer or Time-of-Day controls the nindex parameter equals 0.  
                    linkid=char(linkid);
                    if get(handles.addcontrol,'Value')
                        handles.ep.B.addBinControl(linkid,setting,num2str(level/3600),'AM');
                        newl = sprintf('LINK %s %s AT CLOCKTIME %s (seconds)',linkid,setting,num2str(level));
                        handles.newlist(length(controlsprevious)+1) = cellstr(newl);    
                        set(handles.listbox1,'String',handles.newlist);
                        set(handles.listbox1,'Value',length(handles.newlist));
                        return;
                    else
                        handles.ep.B.setControl(valuelist,3,lindex,settingp,nindex,level); %3 = ctype , code for Timer of day..
                        linkid = char(Sentences(2)); 
                        newl = sprintf('LINK %s %s AT CLOCKTIME %s (seconds)',linkid,setting,num2str(level));
                        handles.newlist(valuelist) = cellstr(newl);
                    end
                    t=t+1;
               else
                    str = sprintf('           Undefined link ID.');
                    uiwait(msgbox(str,'Modal'));return;
               end
            end
            t=t+1;
            set(handles.listbox1,'String',handles.newlist) 
        end
    end


    b= get(handles.removebutton,'Value');
    if b==1
        valuelist = get(handles.listbox1,'Value');
        try
            Sentences=regexp(controlsprevious{valuelist},'\ ','split'); %xwrizw tin protasi se le3eis.
        u=1;
        for rr=1:length(Sentences)
            if isempty(Sentences{rr})
                u=u+1;
            end
            try
                ss(rr)=Sentences(u);
            catch e
                Sentences=ss;
            end
            u=u+1;
        end
        catch e
        end
        linkid = Sentences(2);
        
        previouslist=cellstr(get(handles.listbox1,'String'));
        previouslist(valuelist)=cellstr('');
        handles.ep.B.saveInputFile(handles.ep.B.BinTempfile,1);
        cpp=handles.ep.B.getControls;
        pp=handles.ep.B.getBinControlsInfo;
        handles.ep.B.removeBinControlLinkID(linkid);
       
        if sum(strcmp(pp.BinControlLinksID,linkid))>1
            for i=1:sum(strcmp(pp.BinControlLinksID,linkid))
                if i~=valuelist
                    switch cpp{i}{4}
                        case 1
                            stat='OPEN';
                        case 0
                            stat='CLOSED';
                    end
                    if strcmp(cpp{i}{1},handles.ep.B.TYPECONTROL{1}) || strcmp(cpp{i}{1},handles.ep.B.TYPECONTROL{2})
                        handles.ep.B.addBinControl(pp.BinControlsInfo{i}{2},stat,pp.BinControlsInfo{i}{6},pp.BinControlsInfo{i}{7},str2num(pp.BinControlsInfo{i}{8}));
                    elseif strcmp(cpp{i}{1},handles.ep.B.TYPECONTROL{3})
                        % LINK x status AT TIME t
                        handles.ep.B.addBinControl(char(handles.ep.B.getLinkNameID(cpp{i}{3})),stat,num2str(cpp{i}{6}/3600));
                    elseif strcmp(cpp{i}{1},handles.ep.B.TYPECONTROL{4})
                        % LINK x status AT CLOCKTIME c AM
                        handles.ep.B.addBinControl(char(handles.ep.B.getLinkNameID(cpp{i}{3})),stat,num2str(cpp{i}{6}/3600),'AM');
                    end
                    if handles.ep.B.Errcode
                        uiwait(msgbox('Control contains illegal numeric value.','Modal'));return;
                    end
                end
            end
        end
        try
        u=1;
        for rr=1:length(previouslist)
            if isempty(previouslist{rr})
                u=u+1;
            end
            try
                rs(rr)=previouslist(u);
            catch e
                previouslist=rs;
            end
            u=u+1;
        end
        catch e
      end
       set(handles.listbox1,'Value',1);
       set(handles.listbox1,'String',previouslist);
    end
elseif help==0 
    uiwait(msgbox('In the network there are no controls.','Modal'));return;
end

guidata(hObject, handles);

% --- Executes on button press in helpbutton.
function helpbutton_Callback(hObject, eventdata, handles)
% hObject    handle to helpbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text1,'visible','on');
if handles.closehelp==0
    set(handles.text1,'visible','on');
    handles.closehelp=1;
else
    set(handles.text1,'visible','off');
    handles.closehelp=0;
end
guidata(hObject, handles);

% --- Executes on button press in removebutton.
function removebutton_Callback(hObject, eventdata, handles)
% hObject    handle to removebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of removebutton
set(handles.replacebutton,'Value',0);
set(handles.removebutton,'Value',1);
set(handles.addcontrol,'Value',0);





% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes on button press in addcontrol.
function addcontrol_Callback(hObject, eventdata, handles)
% hObject    handle to addcontrol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of addcontrol
set(handles.replacebutton,'Value',0);
set(handles.removebutton,'Value',0);
set(handles.addcontrol,'Value',1);
