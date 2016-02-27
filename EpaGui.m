function varargout = EpaGui(varargin)
% EPAGUI MATLAB code for EpaGui.fig
%      EPAGUI, by itself, creates a new EPAGUI or raises the existing
%      singleton*.
%
%      H = EPAGUI returns the handle to a new EPAGUI or the handle to
%      the existing singleton*.
%
%      EPAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EPAGUI.M with the given input arguments.
%
%      EPAGUI('Property','Value',...) creates a new EPAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EpaGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EpaGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EpaGui

% Last Modified by GUIDE v2.5 12-Feb-2016 18:32:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EpaGui_OpeningFcn, ...
                   'gui_OutputFcn',  @EpaGui_OutputFcn, ...
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


% --- Executes just before EpaGui is made visible.
function EpaGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EpaGui (see VARARGIN)

% Choose default command line output for EpaGui
handles.output = hObject;
handles.logoE=0;
addpath(genpath(pwd));
% UIWAIT makes EpaGui wait for user response (see UIRESUME)
% Update handles structure


opening(hObject, eventdata, handles)

function opening(hObject, eventdata, handles)

try
    delete(handles.g); 
catch err
end    

if handles.logoE==0
    try
        delete(handles.logo); 
    catch err
    end
    handles.g=axes('Parent',handles.axes1);
    cla(handles.g);
    handles.logo=imshow('\logo\epagui2.png','Parent',handles.g);
    handles.logoE=1;
end

guidata(hObject, handles);
    
handles.lib='';    
handles.ZoomIO=1;
handles.PanIO=1;  
handles.MapOn=1;
handles.Count=0;
set(handles.figure1,'name','EpaGui');

% %MENU BAR
set(handles.get_data,'enable','off');
set(handles.set_data,'enable','off');
set(handles.get_set_pattern,'enable','off');
set(handles.project,'enable','off');
set(handles.report,'enable','off');
set(handles.msxepanet,'enable','off');
set(handles.graphnodes,'enable','off');
set(handles.graphlinks,'enable','off');
% set(handles.curves,'enable','off');
set(handles.restart,'enable','off');
set(handles.save,'enable','off');
set(handles.controls,'enable','off');
set(handles.options,'enable','off');
set(handles.examples,'enable','off');
set(handles.msxsimulate,'enable','off');
set(handles.msxfullreport,'enable','off');
set(handles.msxpatterns,'enable','off');
set(handles.msxtablereport,'enable','off')

set(handles.loadmsxfile,'enable','off');
set(handles.savemsx,'enable','off');

set(handles.SaveNetwork,'visible','off');
set(handles.Zoom,'visible','off');
set(handles.pan,'visible','off');
set(handles.NodesID,'visible','off');
set(handles.nodesindex,'visible','off');
set(handles.linksindex,'visible','off');
set(handles.LinksID,'visible','off');
set(handles.FontsizeENplot,'visible','off');
set(handles.FontsizeENplotText,'visible','off');
% set(handles.hide,'visible','on');
set(handles.flowUnits,'visible','off');

set(handles.exitbutton,'enable','on');
set(handles.loadinpfile,'enable','on');

% set(handles.uipanel4,'position',[50.00000000000003 0.46153846153847045 120.2 3.307692307692308]);

set(handles.popupmenu2,'visible','off');
set(handles.popupmenu1,'visible','off');
set(handles.popupmenu3,'visible','off');
set(handles.time,'visible','off');
set(handles.panelRun,'visible','off');
set(handles.node,'visible','off');
set(handles.link,'visible','off');

set(handles.t1,'visible','off');
set(handles.t2,'visible','off');
set(handles.t3,'visible','off');
set(handles.t4,'visible','off');
set(handles.t5,'visible','off');

% Update handles structure
guidata(hObject, handles);

    
% --- Outputs from this function are returned to the command line.
function varargout = EpaGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadinpfile.
function loadinpfile_Callback(hObject, eventdata, handles)
% hObject    handle to loadinpfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    if sum(strcmp(fields(handles),'B'))
        if libisloaded(handles.B.libepanet)
            if exist(handles.B.Bintempfile)==2
                [~,f]=fileparts(handles.B.Bintempfile);
                handles.B.saveInputFile([pwd,'\results\',f,'.inp'])
                handles.B.unload;warning off;
                if libisloaded('epanetmsx')
                    handles.ep.B.MsxUnload;
                end
                delete(handles.B.Bintempfile);warning on;
            end

            if exist([handles.B.Bintempfile(1:end-4),'.bin'])==2
                delete([handles.B.Bintempfile(1:end-4),'.bin']);
            end
            if exist([handles.B.Bintempfile(1:end-4),'.txt'])==2
                delete([handles.B.Bintempfile(1:end-4),'.txt']);
            end
            [p,f]=fileparts(handles.B.inputfile);
            if exist([p,'/',f,'.txt'])==2
                delete([p,'/',f,'.txt']);
            end
            if exist(handles.B.MsxTempFile)==2
                delete(handles.B.MsxTempFile);
            end
        end
    end   
    warning off;
    [InputFile,PathFile] = uigetfile('networks\*.inp');
    if InputFile~=0
        set(handles.SaveNetwork,'enable','inactive');
        set(handles.Zoom,'enable','inactive');
        set(handles.pan,'enable','inactive');
        set(handles.NodesID,'enable','inactive');
        set(handles.LinksID,'enable','inactive');  
        set(handles.nodesindex,'enable','inactive');
        set(handles.linksindex,'enable','inactive');        
        set(handles.FontsizeENplot,'enable','inactive');
        set(handles.FontsizeENplotText,'enable','inactive');   
        set(handles.flowUnits,'enable','inactive');
        
        col = get(handles.loadinpfile,'backg');  % Get the background color of the figure.
        set(handles.loadinpfile,'str','LOADING...','backg','w');
        pause(.1)
        
%         if isempty(handles.lib)
%             if strcmp(computer('arch'),'win64')% if no DLL is given, select one automatically
%                 libepanet=[pwd,'\LIBRARIES\epanet\win64\epanetdev21x64']; % Get DLL libepanet (e.g. epanet20012x86 for 32-bit)
%             elseif strcmp(computer('arch'),'win32')
%                 libepanet=[pwd,'\LIBRARIES\epanet\win32\epanetdev21x86']; % epanet20012x86
%             end
%         else
%             libepanet=handles.lib;
%         end

        % Load Input File
        handles.B=epanet([PathFile,InputFile]); %clc;
        handles.ep.msg=get(handles.LoadText,'String');
        if handles.B.errcode>0
            handles.ep.msg = [handles.ep.msg; {sprintf('>>Could not open network ''%s'', please insert the correct filename(*.inp).\n',InputFile)}]; 
            set(handles.LoadText,'Value',length(handles.ep.msg)); 
            set(handles.LoadText,'String',handles.ep.msg);
            set(handles.loadinpfile,'str','Load Input File','backg',col);
            return;
        elseif handles.B.errcode==-1
            [~,lib]=fileparts(libepanet);
            handles.ep.msg = [handles.ep.msg; {['>>DLL "', lib, '" is not a valid win application.']}];
            set(handles.LoadText,'Value',length(handles.ep.msg)); 
            set(handles.LoadText,'String',handles.ep.msg);
            set(handles.loadinpfile,'str','Load Input File','backg',col);
            return;
        end
            
        warning off;
        if exist([pwd,'\results\','hNodesIhandles.B.f'])==2
            delete([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');
        end
        if exist([pwd,'\results\','hLinksIhandles.B.f'])==2
            delete([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
        end
        if exist([pwd,'\results\','hNodesIndhandles.B.f'])==2
            delete([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');
        end
        if exist([pwd,'\results\','hLinksIndhandles.B.f'])==2
            delete([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
        end
        warning on;
        handles.ep.B = handles.B;
        handles.ep.flowunits=handles.flowUnits;
        handles.ep.LoadText = handles.LoadText;
        set(handles.LoadText,'Value',length(handles.ep.msg)); 
        set(handles.LoadText,'String',handles.ep.msg);
        
        handles.ep.msg=[handles.ep.msg; {['>>Load Input File "',InputFile,'" Successful.']}];
        Gethandles.msg=['>>Current version of EPANET:',num2str(handles.B.Version),'.'];
        handles.ep.msg=[handles.ep.msg;{Gethandles.msg}];
        set(handles.LoadText,'Value',length(handles.ep.msg)); 
        set(handles.LoadText,'String',handles.ep.msg);

        try
            delete(handles.logo); 
        catch err
        end
        try
            delete(handles.g); 
        catch err
        end        
        handles.g=axes('Parent',handles.axes1);        
        if handles.Count==1
            handles.g=handles.ep.B.plot('axes',handles.g);    
        else
            handles.g=handles.ep.B.plot('axes',handles.g);
        end
        set(handles.axes1,'HighlightColor','k')    
        % graphs
        %handles=movegraphs(handles,0);
        set(handles.NodesID,'value',0);
        set(handles.LinksID,'value',0);
        set(handles.FontsizeENplot,'String',12);
        handles.Count=1;
        guidata(hObject, handles);
        
        set(handles.NodesID,'value',0);
        set(handles.nodesindex,'value',0);
        set(handles.linksindex,'value',0);
        set(handles.LinksID,'value',0);
        set(handles.NodesID,'value',0);
        set(handles.LinksID,'value',0);
        set(handles.FontsizeENplot,'String',12);
        set(handles.SaveNetwork,'visible','on');
        set(handles.Zoom,'visible','on');
        set(handles.pan,'visible','on');
        set(handles.NodesID,'visible','on');
        set(handles.LinksID,'visible','on');  
        set(handles.nodesindex,'visible','on');
        set(handles.linksindex,'visible','on');        
        set(handles.FontsizeENplot,'visible','on');
        set(handles.FontsizeENplotText,'visible','on');   
        set(handles.flowUnits,'visible','on');

        set(handles.popupmenu2,'visible','off');
        set(handles.popupmenu1,'visible','off');
        set(handles.popupmenu3,'visible','off');
        set(handles.time,'visible','off');
        set(handles.panelRun,'visible','off');
        set(handles.node,'visible','off');
        set(handles.link,'visible','off');

        set(handles.t1,'visible','off');
        set(handles.t2,'visible','off');
        set(handles.t3,'visible','off');
        set(handles.t4,'visible','off');
        set(handles.t5,'visible','off');

        set(handles.flowUnits,'string',['Flow Units: ',char(handles.ep.B.LinkFlowUnits)]);
%         set(handles.uipanel4,'position',[50.00000000000003 0.46153846153847045 120.2 3.307692307692308]);
        
        set(handles.graphnodes,'enable','off');
        set(handles.graphlinks,'enable','off');

        set(handles.get_data,'enable','on');
        set(handles.set_data,'enable','on');
        set(handles.get_set_pattern,'enable','on');
        set(handles.project,'enable','on');
        set(handles.report,'enable','on');
        %set(handles.msxepanet,'enable','on');
%         set(handles.graphs,'enable','on');
%         set(handles.curves,'enable','on');
        set(handles.restart,'enable','on');
        set(handles.save,'enable','on');
        set(handles.controls,'enable','on');
        set(handles.options,'enable','on');
        set(handles.examples,'enable','on');
        set(handles.SaveNetwork,'enable','on');
        set(handles.Zoom,'enable','on');
        set(handles.pan,'enable','on');
        set(handles.NodesID,'enable','on');
        set(handles.LinksID,'enable','on');  
        set(handles.nodesindex,'enable','on');
        set(handles.linksindex,'enable','on');        
        set(handles.FontsizeENplot,'enable','on');
        set(handles.FontsizeENplotText,'enable','on');   
        set(handles.flowUnits,'enable','on');
        
        set(handles.msxepanet,'enable','off');
        set(handles.msxtablereport,'enable','off')

        set(handles.loadmsxfile,'enable','on');
        set(handles.loadinpfile,'str','Load Input File','backg',col)  % Now reset the button features.
    else
        if sum(strcmp(fields(handles),'B'))
            loadlibrary([handles.B.libepanetpath,handles.B.libepanet],[handles.B.libepanetpath,handles.B.libepanet,'.h'])
            [~,f]=fileparts(handles.B.Bintempfile);
            movefile([pwd,'\results\',f,'.inp'],handles.B.Bintempfile)
            handles.B.LoadFile(handles.B.Bintempfile);
            if strcmp(get(handles.msxepanet,'enable'),'on')
                loadlibrary([handles.B.MsxlibepanetPath,handles.B.Msxlibepanet],[handles.B.MsxlibepanetPath,handles.B.Msxlibepanet,'.h'])
                handles.B.msx(handles.B.MsxFile);
            end
        end
    end
% --- Executes on button press in Zoom.
function Zoom_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    str = get(handles.Zoom,'String');

    if strcmp('Zoom',str) || strcmp('Reset',str)
        if handles.ZoomIO==1
            try
                zoom on;
            catch err;
            end
            handles.ZoomIO=0;
            set(handles.Zoom,'String','Reset');
        elseif handles.ZoomIO==0
            for i=1:2
                try
                    zoom off;
                    zoom out;
                    zoom reset;
                catch err;
                end
            end
            set(handles.Zoom,'String','Zoom');
            handles.ZoomIO=1;
        end
    end
    % Update handles structure
    guidata(hObject, handles);

% --- Executes on button press in LinksID.
function LinksID_Callback(hObject, eventdata, handles)
% hObject    handle to LinksID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LinksID
    if exist([pwd,'\results\','hNodesIhandles.B.f'])==2
        load([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');
        delete(hNodesID(:)); hNodesID=[];
        save([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');    
    end
    if exist([pwd,'\results\','hLinksIhandles.B.f'])==2
        load([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
        delete(hLinksID(:)); hLinksID=[];
        save([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
    end
    if exist([pwd,'\results\','hNodesIndhandles.B.f'])==2
        load([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');
        delete(hNodesInd(:)); hNodesInd=[];
        save([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');    
    end
    if exist([pwd,'\results\','hLinksIndhandles.B.f'])==2
        load([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
        delete(hLinksInd(:)); hLinksInd=[];
        save([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
    end
    
    FontSize = str2num(get(handles.FontsizeENplot,'String'));
    if  ~length(FontSize) || FontSize<0 || FontSize>20
        handles.ep.msg=[handles.ep.msg;{'>>Give Font Size(max 20).'}];
        set(handles.LoadText,'String',handles.ep.msg);
        set(handles.LoadText,'Value',length(handles.ep.msg));
        return
    end
    
    value=get(handles.LinksID,'Value');
    if value==1
        set(handles.nodesindex,'Value',0);
        set(handles.NodesID,'Value',0);
        set(handles.linksindex,'Value',0);
        for i=1:handles.ep.B.LinkCount
            x1=handles.ep.B.getNodeCoordinates{1}(handles.ep.B.NodesConnectingLinksIndex(i,1));
            y1=handles.ep.B.getNodeCoordinates{2}(handles.ep.B.NodesConnectingLinksIndex(i,1));
            x2=handles.ep.B.getNodeCoordinates{1}(handles.ep.B.NodesConnectingLinksIndex(i,2));
            y2=handles.ep.B.getNodeCoordinates{2}(handles.ep.B.NodesConnectingLinksIndex(i,2));
            hLinksID(i)=text((x1+x2)/2,(y1+y2)/2,handles.ep.B.LinkNameID(i),'FontSize',FontSize);
        end
        save([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
    end
    
    guidata(hObject, handles);

% --- Executes on button press in NodesID.
function NodesID_Callback(hObject, eventdata, handles)
% hObject    handle to NodesID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NodesID
    if exist([pwd,'\results\','hNodesIhandles.B.f'])==2
        load([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');
        delete(hNodesID(:)); hNodesID=[];
        save([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');    
    end
    if exist([pwd,'\results\','hLinksIhandles.B.f'])==2
        load([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
        delete(hLinksID(:)); hLinksID=[];
        save([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
    end
    if exist([pwd,'\results\','hNodesIndhandles.B.f'])==2
        load([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');
        delete(hNodesInd(:)); hNodesInd=[];
        save([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');    
    end
    if exist([pwd,'\results\','hLinksIndhandles.B.f'])==2
        load([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
        delete(hLinksInd(:)); hLinksInd=[];
        save([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
    end
    
    FontSize = str2num(get(handles.FontsizeENplot,'String'));
    if  ~length(FontSize) || FontSize<0 || FontSize>20
        handles.ep.msg=[handles.ep.msg;{'>>Give Font Size(max 20).'}];
        set(handles.LoadText,'String',handles.ep.msg);
        set(handles.LoadText,'Value',length(handles.ep.msg));
        return
    end
    
    value=get(handles.NodesID,'Value');
    if value==1 
        set(handles.nodesindex,'Value',0);
        set(handles.LinksID,'Value',0);
        set(handles.linksindex,'Value',0);
        for i=1:handles.ep.B.NodeCount
            hNodesID(i)=text(handles.ep.B.getNodeCoordinates{1}(i),handles.ep.B.getNodeCoordinates{2}(i),char(handles.ep.B.NodeNameID(i)),'FontSize',FontSize,'Tag','Task String');
        end
        save([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');
    end
    
    guidata(hObject, handles);


function FontsizeENplot_Callback(hObject, eventdata, handles)
% hObject    handle to FontsizeENplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FontsizeENplot as text
%        str2double(get(hObject,'String')) returns contents of FontsizeENplot as a double
    if get(handles.NodesID,'Value')
        NodesID_Callback(hObject, eventdata, handles);
    elseif get(handles.LinksID,'Value')
        LinksID_Callback(hObject, eventdata, handles);
    elseif get(handles.nodesindex,'Value')
        nodesindex_Callback(hObject, eventdata, handles);
    elseif get(handles.linksindex,'Value')
        linksindex_Callback(hObject, eventdata, handles);
    end
% --- Executes during object creation, after setting all properties.
function FontsizeENplotText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FontsizeENplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SaveNetwork.
function SaveNetwork_Callback(hObject, eventdata, handles)
% hObject    handle to SaveNetwork (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.SaveNetwork,'visible','off');
    set(handles.Zoom,'visible','off');
    set(handles.NodesID,'visible','off');
    set(handles.LinksID,'visible','off');
    set(handles.nodesindex,'visible','off');
    set(handles.linksindex,'visible','off');
    set(handles.FontsizeENplot,'visible','off');
    set(handles.FontsizeENplotText,'visible','off');
    set(handles.pan,'visible','off');

    try
        f=getframe(handles.figure1);
        imwrite(f.cdata,[handles.ep.B.inputfile(1:end-4),'.bmp'],'bmp');

        figure(1);
        imshow([handles.ep.B.inputfile(1:end-4),'.bmp']);

        % save to pdf and bmp
        print(gcf,'-dpdf',handles.ep.B.inputfile(1:end-4),sprintf('-r%d',150));
    catch e
    end
    % graphs
    set(handles.SaveNetwork,'visible','on');
    set(handles.Zoom,'visible','on');
    set(handles.NodesID,'visible','on');
    set(handles.LinksID,'visible','on');
    set(handles.nodesindex,'visible','on');
    set(handles.linksindex,'visible','on');    
    set(handles.FontsizeENplotText,'visible','on');
    set(handles.FontsizeENplot,'visible','on');   
    set(handles.pan,'visible','on');
    close(1);   

% --- Executes on button press in pan.
function pan_Callback(hObject, eventdata, handles)
% hObject    handle to pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    str = get(handles.pan,'String');

    if strcmp('Pan',str) || strcmp('Reset',str)
        if handles.PanIO==1
            try
            pan on;
            catch err
            end
            handles.PanIO=0;
            set(handles.pan,'String','Reset');
            % History
            handles.ep.msg=get(handles.ep.LoadText,'String');
            handles.ep.msg=[handles.ep.msg;{'>>Pan Selected.'}];
            set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
            set(handles.ep.LoadText,'String',handles.ep.msg);
        elseif handles.PanIO==0
            try
            zoom out;
            zoom reset;
            pan off;
            catch err
            end
            set(handles.pan,'String','Pan');
            handles.PanIO=1;
            handles.ep.msg=get(handles.ep.LoadText,'String');
            handles.ep.msg=[handles.ep.msg;{'>>Reset Selected.'}];
            set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
            set(handles.ep.LoadText,'String',handles.ep.msg);
        end
    end

    % Update handles structure
    guidata(hObject, handles);

% --- Executes on selection change in LoadText.
function LoadText_Callback(hObject, eventdata, handles)
% hObject    handle to LoadText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns LoadText contents as cell array
%        contents{get(hObject,'Value')} returns selected item from LoadText


% --- Executes during object creation, after setting all properties.
function LoadText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LoadText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function FontsizeENplot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FontsizeENplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12



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


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in SelectSub.
function SelectSub_Callback(hObject, eventdata, handles)
% hObject    handle to SelectSub (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SelectSub


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in none.
function none_Callback(hObject, eventdata, handles)
% hObject    handle to none (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of none
    set(handles.s1,'Value',0);
    set(handles.s2,'Value',0);
    set(handles.s3,'Value',0);
    set(handles.s4,'Value',0);
    set(handles.none,'Value',1);

% --- Executes on button press in exitbutton.
function exitbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exitbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button = questdlg('Are you sure?',...
'Exit','Yes','No','No');

button = strcmp(button,'Yes');

if button==1             
    sfilesexist = dir('s*'); 
    if (~isempty(sfilesexist)), delete('s*'), end;
    if sum(strcmp(fields(handles),'B'))
        if libisloaded(handles.B.libepanet)
            handles.B.unload;
        end
    end
    fclose all
    delete(hObject)
%%%%%%%%%%%%Close all Windows%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    set(0,'ShowHiddenHandles','on');
    delete(get(0,'Children'));
    clear all;
    clc;
    rmpath(genpath(pwd));
end


% function handles=movegraphs(handles,var)
% 
% if var==1
%     handles.psaveN=handles.psave;
%     handles.psaveN(2)=6.5;
%     set(handles.SaveNetwork,'position',handles.psaveN);
%     handles.pZN=handles.pZ;
%     handles.pZN(2)=6.5;
%     set(handles.Zoom,'position',handles.pZN);
%     handles.pnodesN=handles.pnodes;
%     handles.pnodesN(2)=6.5;
%     set(handles.NodesID,'position',handles.pnodesN);
%     handles.plinksN=handles.plinks;
%     handles.plinksN(2)=6.5;
%     set(handles.LinksID,'position',handles.plinksN);
%     handles.pfonttxtN=handles.pfonttxt;
%     handles.pfonttxtN(2)=6.7;
%     set(handles.FontsizeENplot,'position',handles.pfonttxtN);
%     handles.pfontszN=handles.pfontsz;
%     handles.pfontszN(2)=6.7;
%     set(handles.FontsizeENplot,'position',handles.pfontszN);
%     handles.ppp=handles.ppan;
%     handles.ppp(2)=6.5;
%     set(handles.pan,'position',handles.ppp); 
%     pst=[50.2000000000001 6.1025641025641 120.2 39.974358974359];
%     set(handles.axes1,'position',pst);
% elseif var==0
%         set(handles.SaveNetwork,'visible','on');
%         handles.psave=[80.40000000000009 1.076923076923078 13.8000 1.692307692307693];
%         set(handles.Zoom,'visible','on');
%         handles.pZ=[155.00000000000028 1.076923076923078 13.8000 1.692307692307693];
%         set(handles.pan,'visible','on');
%         handles.ppan=[144.80000000000032 1.076923076923078 8 1.692307692307693];
%         set(handles.NodesID,'visible','on');
%         handles.pnodes=[116.2 0.9230769230769242 14.4000 1.7692307692307696];
%         set(handles.LinksID,'visible','on');  
%         handles.plinks=[131.20000000000016 0.9230769230769242 13.200000000000001 1.7692307692307696];
%         set(handles.FontsizeENplot,'visible','on');
%         handles.pfonttxt=[96.20000000000007 1.2307692307692313 10.4000 1.153846153846154];
%         set(handles.FontsizeENplotText,'visible','on');   
%         handles.pfontsz=[106.80000000000001 1.1538461538461544 6.800000000000001 1.3076923076923077];
%         handles.pstInit=[50.2000 0.7692 120.2000 45.3077];
%         set(handles.axes1,'position',handles.pstInit);
%         set(handles.pan,'position',handles.ppan);
%         set(handles.Zoom,'position',handles.pZ);
%         set(handles.SaveNetwork,'position',handles.psave);
%         set(handles.NodesID,'position',handles.pnodes);
%         set(handles.LinksID,'position',handles.plinks);
%         set(handles.FontsizeENplot,'position',handles.pfonttxt);
%         set(handles.FontsizeENplot,'position',handles.pfontsz);        % Update handles structure
% end


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes when axes1 is resized.
function axes1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
button = questdlg('Are you sure?',...
'Exit','Yes','No','No');

button = strcmp(button,'Yes');

if button==1             
    sfilesexist = dir('s*'); 
    if (~isempty(sfilesexist)), delete('s*'), end;
    if sum(strcmp(fields(handles),'B'))
        if libisloaded(handles.B.libepanet)
            handles.B.unload;
        end
    end
    fclose all
    delete(hObject)
%%%%%%%%%%%%Close all Windows%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    set(0,'ShowHiddenHandles','on');
    delete(get(0,'Children'));
    clear all;
    clc;
    rmpath(genpath(pwd));
end


% --- Executes on button press in loadmsxfile.
function loadmsxfile_Callback(hObject, eventdata, handles)
% hObject    handle to loadmsxfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    if sum(strcmp(fields(handles),'B'))
        if libisloaded('epanetmsx')
            if exist(handles.B.MsxTempFile)==2
                [~,f]=fileparts(handles.B.MsxTempFile);
                handles.B.MsxSaveFile([pwd,'\results\',f,'.msx'])
                handles.B.MsxUnload;
                delete(handles.B.MsxTempFile);
            end
        end
    end
    
set(handles.loadmsxfile,'enable','inactive');  
set(handles.exitbutton,'enable','inactive');
set(handles.loadinpfile,'enable','inactive');

[name,path] = uigetfile('.\networks\*.msx');
if path    
    errcode=0;
    try
       unloadlibrary('epanetmsx'); 
    catch e
    end
    if name~=0
        try
            handles.ep.B.msx([path,name]);
        catch e
            errcode=501;% errcode
        end
        if ~errcode
            col = get(handles.loadmsxfile,'backg'); 
            set(handles.loadmsxfile,'str','LOADING...','backg','w');
            pause(.1) 
            set(handles.loadmsxfile,'str','Load MSX File','backg',col)  
            handles.ep.msg=get(handles.ep.LoadText,'String');
            handles.ep.msg=[handles.ep.msg;{['>>Load Msx File "',name,'" Successful.']}];
            set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
            set(handles.ep.LoadText,'String',handles.ep.msg);
            set(handles.savemsx,'enable','on');
            set(handles.msxsimulate,'enable','on');
            set(handles.msxtablereport,'enable','off');
            set(handles.msxfullreport,'enable','on');
            set(handles.msxepanet,'enable','on');
            set(handles.msxpatterns,'enable','on');
        else
            uiwait(msgbox('             Wrong msx file.','','Modal'));
        end    
    end
else
    if sum(strcmp(fields(handles),'B')) 
        loadlibrary([handles.B.MsxlibepanetPath,handles.B.Msxlibepanet],[handles.B.MsxlibepanetPath,[handles.B.Msxlibepanet,'.h']]);
        [~,f]=fileparts(handles.B.MsxTempFile);
        copyfile([pwd,'\results\',f,'.msx'],handles.B.MsxTempFile)
        handles.B.msx([pwd,'\networks\',f(1:end-5),'.msx']);
    end
end

% Buttons
set(handles.exitbutton,'enable','on');
set(handles.loadinpfile,'enable','on');  
set(handles.loadmsxfile,'enable','on');  


% --------------------------------------------------------------------
function networks_Callback(hObject, eventdata, handles)
% hObject    handle to networks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function get_data_Callback(hObject, eventdata, handles)
% hObject    handle to get_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function set_data_Callback(hObject, eventdata, handles)
% hObject    handle to set_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function get_set_pattern_Callback(hObject, eventdata, handles)
% hObject    handle to get_set_pattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function project_Callback(hObject, eventdata, handles)
% hObject    handle to project (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function report_Callback(hObject, eventdata, handles)
% hObject    handle to report (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function msxepanet_Callback(hObject, eventdata, handles)
% hObject    handle to msxepanet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function species_Callback(hObject, eventdata, handles)
% hObject    handle to species (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select MSX Species.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

Speciesmsx(handles.ep)
% --------------------------------------------------------------------
function sources_Callback(hObject, eventdata, handles)
% hObject    handle to sources (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select MSX Sources.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

Sources(handles.ep)
% Source_and_Pattern(handles.ep)
% --------------------------------------------------------------------
function constant_Callback(hObject, eventdata, handles)
% hObject    handle to constant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select MSX Reaction Constant.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

if handles.ep.B.getMsxConstantsCount
    Constants(handles.ep)
else
    uiwait(msgbox('             No constants.','Modal'));
end

% --------------------------------------------------------------------
function initialconce_Callback(hObject, eventdata, handles)
% hObject    handle to initialconce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select MSX Initial Concentration.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

Initqual(handles.ep)
% --------------------------------------------------------------------
function fullreport_Callback(hObject, eventdata, handles)
% hObject    handle to fullreport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Full Report.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

EN_FullReport(handles.ep)

% --------------------------------------------------------------------
function format_Callback(hObject, eventdata, handles)
% hObject    handle to format (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Format Report.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

FormatsReport(handles.ep)
% --------------------------------------------------------------------
function statusreport_Callback(hObject, eventdata, handles)
% hObject    handle to statusreport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button = questdlg('Do you want to continue?',...
'Status Report','Yes','No','No');

handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Status Report.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

button = strcmp(button,'Yes');

if button==1
    [statusfile] = makebatfile(handles);
    open(statusfile)
end

function [statusfile] = makebatfile(handles)
    binfile=[handles.ep.B.Bintempfile(1:end-4),'.bin'];
    if exist(binfile)==2, fclose all; delete(binfile); end
    if strcmp(computer('arch'),'win64')
            folder='64bit';
        r = sprintf('%s\\%s\\epanet2d.exe %s %s %s',pwd,folder,handles.ep.B.Bintempfile,[handles.ep.B.Bintempfile(1:end-4),'.txt'],binfile);
    elseif strcmp(computer('arch'),'win32')
            folder='32bit';
        r = sprintf('%s\\%s\\epanet2d.exe %s %s %s',pwd,folder,handles.ep.B.Bintempfile,[handles.ep.B.Bintempfile(1:end-4),'.txt'],binfile);
    else
        r = sprintf('./runcode2 %s %s %s',handles.ep.B.Bintempfile,[handles.ep.B.Bintempfile(1:end-4),'.txt'],binfile);
    end
    f=fopen([handles.ep.B.pathfile,'Simulate.bat'],'w');
    try fprintf(f,'%s \n',r); fclose(f); catch; end
    system([handles.ep.B.pathfile,'Simulate.bat']);
    delete([handles.ep.B.pathfile,'Simulate.bat']);
    statusfile=[handles.ep.B.Bintempfile(1:end-4),'.txt'];

% --------------------------------------------------------------------
function table_Callback(hObject, eventdata, handles)
% hObject    handle to table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function options_Callback(hObject, eventdata, handles)
% hObject    handle to options (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function summary_Callback(hObject, eventdata, handles)
% hObject    handle to summary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Summary.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

EN_Summary(handles.ep);


% --------------------------------------------------------------------
function controls_Callback(hObject, eventdata, handles)
% hObject    handle to controls (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function pattern_data_Callback(hObject, eventdata, handles)
% hObject    handle to pattern_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Patterns.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

EN_GetPatternData(handles.ep);


% --------------------------------------------------------------------
function setnode_Callback(hObject, eventdata, handles)
% hObject    handle to setnode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Set Node Data.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);
EN_SetNodeData(handles.ep);

% --------------------------------------------------------------------
function set_link_Callback(hObject, eventdata, handles)
% hObject    handle to set_link (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Set Link Data.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);
EN_SetLinkData(handles.ep);

% --------------------------------------------------------------------
function getnode_Callback(hObject, eventdata, handles)
% hObject    handle to getnode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Get Node Data.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);
        
EN_GetNodeData(handles.ep);

% Update handles structure
guidata(hObject, handles);

% --------------------------------------------------------------------
function getlink_Callback(hObject, eventdata, handles)
% hObject    handle to getlink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Get Link Data.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);
guidata(hObject, handles);
   
EN_GetLinkData(handles.ep);

% Update handles structure
guidata(hObject, handles);

% --------------------------------------------------------------------
function networks_open_Callback(hObject, eventdata, handles)
% hObject    handle to networks_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = uigetfile ('.\networks\*.inp;*.msx');

if filename~=0
    open(filename);
end


% --------------------------------------------------------------------
function graphs_Callback(hObject, eventdata, handles)
% hObject    handle to graphs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function graphnodes_Callback(hObject, eventdata, handles)
% hObject    handle to graphnodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Graphs for Nodes.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);
guidata(hObject, handles);
    
EN_GraphsNodes(handles.ep);

% --------------------------------------------------------------------
function graphlinks_Callback(hObject, eventdata, handles)
% hObject    handle to graphlinks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Graphs for Links.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

EN_GraphsLinks(handles.ep);


function FontsizeENplotText_Callback(hObject, eventdata, handles)
% hObject    handle to FontsizeENplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FontsizeENplot as text
%        str2double(get(hObject,'String')) returns contents of FontsizeENplot as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FontsizeENplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in NodesID.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to NodesID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NodesID


% --- Executes on button press in LinksID.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to LinksID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of LinksID


% --- Executes on button press in SaveNetwork.
function pushbutton49_Callback(hObject, eventdata, handles)
% hObject    handle to SaveNetwork (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pan.
function pushbutton48_Callback(hObject, eventdata, handles)
% hObject    handle to pan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Zoom.
function pushbutton47_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in loadepanetdll.
function loadepanetdll_Callback(hObject, eventdata, handles)
% hObject    handle to loadepanetdll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(computer('arch'),'win64')
    [lib,pathlib] = uigetfile('LIBRARIES\epanet\win64\*.dll');
elseif strcmp(computer('arch'),'win32')
    [lib,pathlib] = uigetfile('LIBRARIES\epanet\win32\*.dll');
end
if lib
    handles.lib=[pathlib,lib(1:length(lib)-4)];
    handles.ep.msg=get(handles.LoadText,'String');
    handles.ep.msg=[handles.ep.msg;{['>>Select epanet library "',lib,'"']}];
    set(handles.LoadText,'Value',length(handles.ep.msg)); 
    set(handles.LoadText,'String',handles.ep.msg);
    
    set(handles.loadmsxdll,'enable','on')
    guidata(hObject, handles);
end
% --- Executes on button press in loadmsxdll.
function loadmsxdll_Callback(hObject, eventdata, handles)
% hObject    handle to loadmsxdll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(computer('arch'),'win64')
    [lib,pathlib] = uigetfile('LIBRARIES\msx\win64\*.dll');
elseif strcmp(computer('arch'),'win32')
    [lib,pathlib] = uigetfile('LIBRARIES\msx\win32\*.dll');
end

if lib
    handles.libMsx=[pathlib,lib(1:length(lib)-4)];
    handles.ep.msg=get(handles.LoadText,'String');
    handles.ep.msg=[handles.ep.msg;{['>>Select msx library "',lib,'"']}];
    set(handles.LoadText,'Value',length(handles.ep.msg)); 
    set(handles.LoadText,'String',handles.ep.msg);
    guidata(hObject, handles);
end

% --- Executes on button press in restart.
function restart_Callback(hObject, eventdata, handles)
% hObject    handle to restart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.B.unload;
rmfield(handles,'B');
opening(hObject, eventdata, handles)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Restart.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);
guidata(hObject, handles);


% --------------------------------------------------------------------
function curves_Callback(hObject, eventdata, handles)
% hObject    handle to curves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function curvesData_Callback(hObject, eventdata, handles)
% hObject    handle to curvesData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Instructions_Callback(hObject, eventdata, handles)
% hObject    handle to Instructions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Instructions.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

web('Instructions.html');


% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select About.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);
about;


% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function examples_Callback(hObject, eventdata, handles)
% hObject    handle to examples (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function saveinp_Callback(hObject, eventdata, handles)
% hObject    handle to saveinp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Save input file.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

EN_Saveinputfile(handles.ep);

% --------------------------------------------------------------------
function savemsx_Callback(hObject, eventdata, handles)
% hObject    handle to savemsx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Save MSX file.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

SaveMsxFile(handles.ep);

% --------------------------------------------------------------------
function reactionparam_Callback(hObject, eventdata, handles)
% hObject    handle to reactionparam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select MSX Reaction Parameter.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

if handles.ep.B.getMsxParametersCount
    ParametersMsx(handles.ep);  
else
    uiwait(msgbox('             No parameters.','Modal'));
end

% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function msxsimulate_Callback(hObject, eventdata, handles)
% hObject    handle to msxsimulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function msxfullreport_Callback(hObject, eventdata, handles)
% hObject    handle to msxfullreport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
button = questdlg('Do you want to continue?',...
'','Yes','No','No');

handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Full MSX Report.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

button = strcmp(button,'Yes');

if button==1    
    fid = fopen('ReportMsx.bat','w');
    if strcmp(computer('arch'),'win32')
        folder='32bit';
    elseif strcmp(computer('arch'),'win64')
        folder='64bit';
    end
    r = sprintf('%s\\%s\\epanetmsx.exe %s %s %s',pwd,folder,handles.ep.B.inputfile,handles.ep.B.MsxTempFile,[handles.ep.B.MsxTempFile(1:end-4),'.txt']);
    fprintf(fid,'%s \n',r);fclose all;
    !ReportMsx.bat
    open([handles.ep.B.MsxTempFile(1:end-4),'.txt'])
    delete('ReportMsx.bat');
end

% --------------------------------------------------------------------
function hydraulics_Callback(hObject, eventdata, handles)
% hObject    handle to hydraulics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Hydraulics options.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

EN_Hydraulics(handles.ep);

% --------------------------------------------------------------------
function quality_Callback(hObject, eventdata, handles)
% hObject    handle to quality (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Quality & Reactions options.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

EN_Quality(handles.ep);

% --------------------------------------------------------------------
function times_Callback(hObject, eventdata, handles)
% hObject    handle to times (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Times option.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

EN_Times(handles.ep);

% --------------------------------------------------------------------
function simplecontrols_Callback(hObject, eventdata, handles)
% hObject    handle to simplecontrols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Simple Controls.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

Controls(handles.ep);


% --------------------------------------------------------------------
function minimumpresure_Callback(hObject, eventdata, handles)
% hObject    handle to minimumpresure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select Example Minimum Pressure.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

Example1(handles.ep)


% --------------------------------------------------------------------
function chlorinetest_Callback(hObject, eventdata, handles)
% hObject    handle to chlorinetest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function msxpatterns_Callback(hObject, eventdata, handles)
% hObject    handle to msxpatterns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select MSX Patterns.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

MSX_GetPatternData(handles.ep)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.popupmenu3,'Value',1);

h = waitbar(0,'Please wait...');

handles.ep.resParameters=handles.ep.B.getComputedHydraulicTimeSeries;
waitbar(50/1000,h);
handles.ep.resQuality=handles.ep.B.getComputedQualityTimeSeries;
waitbar(1,h);
close(h);
uiwait(msgbox('            Run Succesfful.','Modal'));
set(handles.graphnodes,'enable','on');
set(handles.graphlinks,'enable','on');


handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Run Succesfful.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);


set(handles.popupmenu2,'visible','on');
set(handles.popupmenu1,'visible','on');
set(handles.popupmenu3,'visible','on');
set(handles.time,'visible','on');
set(handles.panelRun,'visible','on');
set(handles.node,'visible','on');
set(handles.link,'visible','on');

set(handles.t1,'visible','on');
set(handles.t2,'visible','on');
set(handles.t3,'visible','on');
set(handles.t4,'visible','on');
set(handles.t5,'visible','on');


set(handles.popupmenu3,'String',handles.ep.resParameters.Time);


warning off
ddplot(handles,0)
ddplot(handles,1)
warning on

guidata(hObject, handles);


% --- Executes on button press in nodesindex.
function nodesindex_Callback(hObject, eventdata, handles)
% hObject    handle to nodesindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nodesindex
    if exist([pwd,'\results\','hNodesIhandles.B.f'])==2
        load([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');
        delete(hNodesID(:)); hNodesID=[];
        save([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');    
    end
    if exist([pwd,'\results\','hLinksIhandles.B.f'])==2
        load([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
        delete(hLinksID(:)); hLinksID=[];
        save([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
    end
    if exist([pwd,'\results\','hNodesIndhandles.B.f'])==2
        load([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');
        delete(hNodesInd(:)); hNodesInd=[];
        save([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');    
    end
    if exist([pwd,'\results\','hLinksIndhandles.B.f'])==2
        load([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
        delete(hLinksInd(:)); hLinksInd=[];
        save([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
    end
    
    FontSize = str2num(get(handles.FontsizeENplot,'String'));
    if  ~length(FontSize) || FontSize<0 || FontSize>20
        handles.ep.msg=[handles.ep.msg;{'>>Give Font Size(max 20).'}];
        set(handles.LoadText,'String',handles.ep.msg);
        set(handles.LoadText,'Value',length(handles.ep.msg));
        return
    end
    
    value=get(handles.nodesindex,'Value');
    if value==1 
        set(handles.LinksID,'Value',0);
        set(handles.NodesID,'Value',0);
        set(handles.linksindex,'Value',0);
        for i=1:handles.ep.B.NodeCount
            hNodesInd(i)=text(handles.ep.B.getNodeCoordinates{1}(i),handles.ep.B.getNodeCoordinates{2}(i),num2str(handles.ep.B.NodeIndex(i)),'FontSize',FontSize);
        end
        save([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');
    end
    
    guidata(hObject, handles);

% --- Executes on button press in linksindex.
function linksindex_Callback(hObject, eventdata, handles)
% hObject    handle to linksindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of linksindex
    if exist([pwd,'\results\','hNodesIhandles.B.f'])==2
        load([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');
        delete(hNodesID(:)); hNodesID=[];
        save([pwd,'\results\','hNodesIhandles.B.f'],'hNodesID','-mat');    
    end
    if exist([pwd,'\results\','hLinksIhandles.B.f'])==2
        load([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
        delete(hLinksID(:)); hLinksID=[];
        save([pwd,'\results\','hLinksIhandles.B.f'],'hLinksID','-mat');
    end
    if exist([pwd,'\results\','hNodesIndhandles.B.f'])==2
        load([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');
        delete(hNodesInd(:)); hNodesInd=[];
        save([pwd,'\results\','hNodesIndhandles.B.f'],'hNodesInd','-mat');    
    end
    if exist([pwd,'\results\','hLinksIndhandles.B.f'])==2
        load([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
        delete(hLinksInd(:)); hLinksInd=[];
        save([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
    end
    
    FontSize = str2num(get(handles.FontsizeENplot,'String'));
    if  ~length(FontSize) || FontSize<0 || FontSize>20
        handles.ep.msg=[handles.ep.msg;{'>>Give Font Size(max 20).'}];
        set(handles.LoadText,'String',handles.ep.msg);
        set(handles.LoadText,'Value',length(handles.ep.msg));
        return
    end
    
    value=get(handles.linksindex,'Value');
    if value==1
        set(handles.nodesindex,'Value',0);
        set(handles.NodesID,'Value',0);
        set(handles.LinksID,'Value',0);
        for i=1:handles.ep.B.LinkCount
            x1=handles.ep.B.getNodeCoordinates{1}(handles.ep.B.NodesConnectingLinksIndex(i,1));
            y1=handles.ep.B.getNodeCoordinates{2}(handles.ep.B.NodesConnectingLinksIndex(i,1));
            x2=handles.ep.B.getNodeCoordinates{1}(handles.ep.B.NodesConnectingLinksIndex(i,2));
            y2=handles.ep.B.getNodeCoordinates{2}(handles.ep.B.NodesConnectingLinksIndex(i,2));
            hLinksInd(i)=text((x1+x2)/2,(y1+y2)/2,num2str(handles.ep.B.LinkIndex(i)),'FontSize',FontSize);
        end
        save([pwd,'\results\','hLinksIndhandles.B.f'],'hLinksInd','-mat');
    end
    
    guidata(hObject, handles);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
warning off
ddplot(handles,0)
warning on


function ddplot(handles, ch)
atTime = str2num(get(handles.popupmenu3,'String'));
atTimeIndex = (get(handles.popupmenu3,'Value'));

contents = cellstr(get(handles.popupmenu1,'String'));
value = contents{get(handles.popupmenu1,'Value')};

cL = cellstr(get(handles.popupmenu2,'String'));
vl = cL{get(handles.popupmenu2,'Value')};

nn = (eval(['handles.ep.resParameters.',value]));
handles.resNode = nn(atTimeIndex,:);
ll = (eval(['handles.ep.resParameters.',vl]));
handles.resLink = ll(atTimeIndex,:);
xtickNode = linspace(min((handles.resNode)), max((handles.resNode)), 5);
xtick = linspace(min(handles.resLink), max(handles.resLink), 5);
    
handles.indW=1;handles.IDW={''};handles.ColorW={[]};
handles.indb=1;handles.IDb={''};handles.Colorb={[]};
handles.indc=1;handles.IDc={''};handles.Colorc={[]};
handles.indg=1;handles.IDg={''};handles.Colorg={[]};
handles.indcc=1;handles.IDcc={''};handles.Colorcc={[]};
handles.indaa=1;handles.IDaa={''};handles.Coloraa={[]};

handles.indbl=1;handles.IDbl={''};handles.Colorbl={[]};
handles.indcl=1;handles.IDcl={''};handles.Colorcl={[]};
handles.indgl=1;handles.IDgl={''};handles.Colorgl={[]};
handles.indccl=1;handles.IDccl={''};handles.Colorccl={[]};
handles.indaal=1;handles.IDaal={''};handles.Coloraal={[]}; 

set(handles.t1,'BackgroundColor','b');
set(handles.t2,'BackgroundColor','c');
set(handles.t3,'BackgroundColor','g');
set(handles.t4,'BackgroundColor',[1 0.5 0]);
set(handles.t5,'BackgroundColor','r');

    if (handles.ep.B.getNodeCount>handles.ep.B.getLinkCount || handles.ep.B.getNodeCount==handles.ep.B.getLinkCount) 
        for i=1:handles.ep.B.getNodeCount
            if ch==0
                if handles.resNode(i)<xtickNode(2) 
                    handles.Colorb{i}='b';
                    handles.IDb(i)=handles.B.NodeNameID(i);
                    handles.indb=handles.indb+1;
                elseif xtickNode(2)<handles.resNode(i) && handles.resNode(i)<xtickNode(3) 
                    handles.Colorc{i}='c';
                    handles.IDc(i)=handles.B.NodeNameID(i);
                    handles.indc=handles.indc+1;
                elseif xtickNode(3)<handles.resNode(i) && handles.resNode(i)<xtickNode(4) 
                    handles.Colorg{i}='g';
                    handles.IDg(i)=handles.B.NodeNameID(i);
                    handles.indg=handles.indg+1;
                elseif xtickNode(4)<handles.resNode(i) && handles.resNode(i)<xtickNode(5) 
                    handles.Colorcc{i}=[1 .5 0];
                    handles.IDcc(i)=handles.B.NodeNameID(i);
                    handles.indcc=handles.indcc+1;
                elseif xtickNode(5)<handles.resNode(i) 
                    handles.Coloraa{i}='r'; 
                    handles.IDaa(i)=handles.B.NodeNameID(i);
                    handles.indaa=handles.indaa+1;
                else%if Demands(i)~=0
                    handles.Colorb{i}='b';
                    handles.IDb(i)=handles.B.NodeNameID(i);
                    handles.indb=handles.indb+1;
    %             else
    %                 handles.ColorW{i}='b';
    %                 handles.IDW(i)=handles.B.NodeNameID(i);
    %                 handles.indW=handles.indW+1;
                end
            end
            if (i<handles.ep.B.getLinkCount || i==handles.ep.B.getLinkCount) && ((ch==1) || (ch==2))
                if handles.resLink(i)<xtick(2) 
                    handles.Colorbl{i}='b';
                    handles.IDbl(i)=handles.B.LinkNameID(i);
                    handles.indbl=handles.indbl+1;
                elseif xtick(2)<handles.resLink(i) && handles.resLink(i)<xtick(3) 
                    handles.Colorcl{i}='c';
                    handles.IDcl(i)=handles.B.LinkNameID(i);
                    handles.indcl=handles.indcl+1;
                elseif xtick(3)<handles.resLink(i) && handles.resLink(i)<xtick(4) 
                    handles.Colorgl{i}='g';
                    handles.IDgl(i)=handles.B.LinkNameID(i);
                    handles.indgl=handles.indgl+1;
                elseif xtick(4)<handles.resLink(i) && handles.resLink(i)<xtick(5) 
                    handles.Colorccl{i}=[1 .5 0];
                    handles.IDccl(i)=handles.B.LinkNameID(i);
                    handles.indccl=handles.indccl+1;
                elseif xtick(5)<handles.resLink(i) 
                    handles.Coloraal{i}='r'; 
                    handles.IDaal(i)=handles.B.LinkNameID(i);
                    handles.indaal=handles.indaal+1;
                else 
                    handles.Colorbl{i}='b';
                    handles.IDbl(i)=handles.B.LinkNameID(i);
                    handles.indbl=handles.indbl+1;
                end
            end
        end
    elseif (handles.ep.B.getNodeCount<handles.ep.B.getLinkCount)
        for i=1:handles.ep.B.getLinkCount
            if ch==1
                if handles.resLink(i)<xtick(2) 
                    handles.Colorbl{i}='b';
                    handles.IDbl(i)=handles.B.LinkNameID(i);
                    handles.indbl=handles.indbl+1;
                elseif xtick(2)<handles.resLink(i) && handles.resLink(i)<xtick(3) 
                    handles.Colorcl{i}='c';
                    handles.IDcl(i)=handles.B.LinkNameID(i);
                    handles.indcl=handles.indcl+1;
                elseif xtick(3)<handles.resLink(i) && handles.resLink(i)<xtick(4) 
                    handles.Colorgl{i}='g';
                    handles.IDgl(i)=handles.B.LinkNameID(i);
                    handles.indgl=handles.indgl+1;
                elseif xtick(4)<handles.resLink(i) && handles.resLink(i)<xtick(5) 
                    handles.Colorccl{i}=[1 .5 0];
                    handles.IDccl(i)=handles.B.LinkNameID(i);
                    handles.indccl=handles.indccl+1;
                elseif xtick(5)<handles.resLink(i) 
                    handles.Coloraal{i}='r'; 
                    handles.IDaal(i)=handles.B.LinkNameID(i);
                    handles.indaal=handles.indaal+1;
                else
                    handles.Colorbl{i}='b';
                    handles.IDbl(i)=handles.B.LinkNameID(i);
                    handles.indbl=handles.indbl+1;
                end
            end
            
            if (i<handles.ep.B.getNodeCount || i==handles.ep.B.getNodeCount) && ((ch==0) || (ch==2))
                if handles.resNode(i)<xtickNode(2) 
                    handles.Colorb{i}='b';
                    handles.IDb(i)=handles.B.NodeNameID(i);
                    handles.indb=handles.indb+1;
                elseif xtickNode(2)<handles.resNode(i) && handles.resNode(i)<xtickNode(3) 
                    handles.Colorc{i}='c';
                    handles.IDc(i)=handles.B.NodeNameID(i);
                    handles.indc=handles.indc+1;
                elseif xtickNode(3)<handles.resNode(i) && handles.resNode(i)<xtickNode(4) 
                    handles.Colorg{i}='g';
                    handles.IDg(i)=handles.B.NodeNameID(i);
                    handles.indg=handles.indg+1;
                elseif xtickNode(4)<handles.resNode(i) && handles.resNode(i)<xtickNode(5) 
                    handles.Colorcc{i}=[1 .5 0];
                    handles.IDcc(i)=handles.B.NodeNameID(i);
                    handles.indcc=handles.indcc+1;
                elseif xtickNode(5)<handles.resNode(i) 
                    handles.Coloraa{i}='r'; 
                    handles.IDaa(i)=handles.B.NodeNameID(i);
                    handles.indaa=handles.indaa+1;
                else%if Demands(i)~=0
                    handles.Colorb{i}='b';
                    handles.IDb(i)=handles.B.NodeNameID(i);
                    handles.indb=handles.indb+1;
%                 else
%                     handles.ColorW{i}='b';
%                     handles.IDW(i)=handles.B.NodeNameID(i);
%                     handles.indW=handles.indW+1;                    
                end
            end       
        end
    end
    %cla(handles.g)
    nodes=[handles.IDb handles.IDc handles.IDg handles.IDcc handles.IDaa];
    nodesColors=[handles.Colorb handles.Colorc handles.Colorg handles.Colorcc handles.Coloraa];    
    if ch==0
        npoint='yes';
        lline='no';
        save([pwd,'\results\','nplot.f'],'nodes','-mat'); 
        save([pwd,'\results\','nplotC.f'],'nodesColors','-mat'); 
    elseif ch==1
        npoint='yes';
        lline='yes';
        load([pwd,'\results\','nplot.f'],'nodes','-mat'); 
        load([pwd,'\results\','nplotC.f'],'nodesColors','-mat'); 
    elseif (ch==2)
        npoint='yes';
        lline='yes';
    end

    handles.ep.B.plot('highlightnode',nodes,'colornode',nodesColors,...
    'highlightlink',[handles.IDbl handles.IDcl handles.IDgl handles.IDccl handles.IDaal],'colorlink',[handles.Colorbl handles.Colorcl handles.Colorgl handles.Colorccl handles.Coloraal],...
    'axes',handles.g,'point',npoint,'line',lline);
    delete(legend)
    
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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
warning off
ddplot(handles,1)
warning on

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
data=get(handles.g,'CurrentPoint');
Xp=(data(1));
Yp=(data(3));
X = handles.ep.B.NodeCoordinates{1};
Y = handles.ep.B.NodeCoordinates{2};
[a,Ip] = min((X-Xp).^2+(Y-Yp).^2);
Xc = X(Ip);
Yc = Y(Ip);
FontSize=15;
color='r';
names = fieldnames(handles.ep);
if a<0.01
    if sum(strcmp(names,'resParameters'))
        pp=get(handles.popupmenu1,'String');
        handles.resNode = mean(eval(['handles.ep.resParameters.',char(pp(get(handles.popupmenu1,'Value')))]));
        % Extract the closest coordinate values
        h=text(Xc,Yc,num2str(handles.resNode(Ip)),'FontSize',FontSize,'Color',color);
        pause(0.9)
        delete(h)
    else
        h=text(Xc,Yc, handles.ep.B.NodeNameID(Ip),'FontSize',FontSize,'Color',color);
        pause(0.9)
        delete(h)
    end
end    
catch e
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
warning off
ddplot(handles,2)%time 
warning on

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function wiki_Callback(hObject, eventdata, handles)
% hObject    handle to wiki (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Select G Wiki.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

web('https://github.com/OpenWaterAnalytics/EPANET/wiki')


% --------------------------------------------------------------------
function msxrun_Callback(hObject, eventdata, handles)
% hObject    handle to msxrun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = waitbar(0,'Please wait...');

warning off;
handles.ep.B.saveInputFile(handles.ep.B.Bintempfile);
handles.ep.B.LoadFile(handles.ep.B.Bintempfile);

handles.ep.resMsxNode=handles.ep.B.getMsxComputedQualityNode;
waitbar(50/100,h);
handles.ep.resMsxLink=handles.ep.B.getMsxComputedQualityLink;
warning on;
waitbar(1,h);
close(h);
uiwait(msgbox('            Run MSX was Succesfful.','Modal'));

handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>Run MSX was Succesfful.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

set(handles.msxtablereport,'enable','on')

guidata(hObject, handles);

    
% --------------------------------------------------------------------
function msxtablereport_Callback(hObject, eventdata, handles)
% hObject    handle to msxtablereport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.ep.msg=get(handles.ep.LoadText,'String');
handles.ep.msg=[handles.ep.msg;{'>>MSX Table & Graphs results.'}];
set(handles.ep.LoadText,'Value',length(handles.ep.msg)); 
set(handles.ep.LoadText,'String',handles.ep.msg);

TableReportmsx(handles.ep)
