function FullReport(reportname,handles)
% Syntax:  FullReport(reportname)
% Input:   reportname - A string with a file name
% Output:  Returns an report.txt 
% Example:  FullReport('Report.txt')

handles.ep.B.setTimeSimulationDuration(3600*24)
name = sprintf('FILE %s',[handles.path,reportname]);
%set report
handles.ep.B.setReportFormatReset();
handles.ep.B.setReportStatus('FULL');
handles.ep.B.setReport(name);
handles.ep.B.setReport('SUMMARY YES');
handles.ep.B.setReport('ENERGY YES');
handles.ep.B.setReport('NODES ALL');
handles.ep.B.setReport('LINK ALL');
handles.ep.B.setReport('ELEVATION YES');
handles.ep.B.setReport('PRESSURE YES');
handles.ep.B.setReport('HEAD YES');
handles.ep.B.setReport('DEMAND YES');
handles.ep.B.setReport('LENGTH YES');
handles.ep.B.setReport('DIAMETER YES');
handles.ep.B.setReport('VELOCOTY YES');
handles.ep.B.setReport('HEADLOSS YES');
handles.ep.B.setReport('LINKSTATUS YES');                    
handles.ep.B.setReport('QUALITY YES');
handles.ep.B.setReport('FLOW YES');
handles.ep.B.setReport('LINKQUALITY YES');
handles.ep.B.setReport('SETTING YES');
handles.ep.B.setReport('REACTION YES');
handles.ep.B.setReport('F-FACTOR YES');

handles.ep.B.solveCompleteHydraulics;
handles.ep.B.saveHydraulicsOutputReportingFile;

handles.ep.B.writeLineInReportFile('hellloooo')
handles.ep.B.writeReport;
open([handles.path,reportname]);
end

