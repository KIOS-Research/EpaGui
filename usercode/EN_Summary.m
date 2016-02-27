function varargout = EN_Summary(varargin)
% EN_SUMMARY M-file for EN_Summary.fig
%      EN_SUMMARY, by itself, creates a new EN_SUMMARY or raises the existing
%      singleton*.
%
%      H = EN_SUMMARY returns the handle to a new EN_SUMMARY or the handle to
%      the existing singleton*.
%
%      EN_SUMMARY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EN_SUMMARY.M with the given input arguments.
%
%      EN_SUMMARY('Property','Value',...) creates a new EN_SUMMARY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EN_Summary_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EN_Summary_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EN_Summary

% Last Modified by GUIDE v2.5 23-Oct-2015 21:21:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EN_Summary_OpeningFcn, ...
                   'gui_OutputFcn',  @EN_Summary_OutputFcn, ...
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


% --- Executes just before EN_Summary is made visible.
function EN_Summary_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EN_Summary (see VARARGIN)

% Choose default command line output for EN_Summary
handles.output = hObject;
handles.ep=varargin{1};
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EN_Summary wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.figure1,'name','Summary');
position=get(handles.figure1,'Position');

set(handles.figure1,'Position',[position(1) position(2) 47 14.5]);

statistics{1}='Number of Junctions      ';
statistics{2}='Number of Reservoirs    ';
statistics{3}='Number of Tanks            ';
statistics{4}='Number of Pipes            ';
statistics{5}='Number of Pumps          ';
statistics{6}='Number of Valves           ';
statistics{7}='Number of Patterns        ';
statistics{8}='Number of Curves          ';
statistics{9}='Number of Controls        ';
opn(1)=handles.ep.B.getNodeJunctionCount;
opn(2)=handles.ep.B.getNodeReservoirCount;
opn(3)=handles.ep.B.getNodeTankCount;
opn(4)=handles.ep.B.getLinkPipeCount;
opn(5)=handles.ep.B.getLinkPumpCount;
opn(6)=handles.ep.B.getLinkValveCount;
opn(7)=handles.ep.B.getPatternCount;
opn(8)=handles.ep.B.getCurveCount;
opn(9)=handles.ep.B.getControlRulesCount;

for i=1:9
    table(i,1) = {[statistics{i},' ',num2str(opn(i))]};
end

set(handles.statistics,'String',table);

% set(handles.uitable1,'ColumnWidth',{140 109});
% --- Outputs from this function are returned to the command line.
function varargout = EN_Summary_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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


% --- Executes on selection change in statistics.
function statistics_Callback(hObject, eventdata, handles)
% hObject    handle to statistics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns statistics contents as cell array
%        contents{get(hObject,'Value')} returns selected item from statistics


% --- Executes during object creation, after setting all properties.
function statistics_CreateFcn(hObject, eventdata, handles)
% hObject    handle to statistics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
