function functionFormatReport(summary,energy,elevation,demand,head,pressure,...
    quality,length,diameter,velocity,headloss,setting,reaction,friction,flow,linkk,nodess,duration,reportname,handles)
 

    handles.ep.B.setTimeSimulationDuration(3600*duration)
    name = sprintf('FILE %s',[handles.path,reportname]);
    handles.ep.B.setReportFormatReset();
    handles.ep.B.setReportStatus(handles.ep.B.TYPEREPORT{1});%yes
    handles.ep.B.setReport(name);
    handles.ep.B.setReport(summary);
    handles.ep.B.setReport(energy);
    handles.ep.B.setReport(nodess);
    handles.ep.B.setReport(linkk);
    handles.ep.B.setReport(elevation);
    handles.ep.B.setReport(pressure);
    handles.ep.B.setReport(head);
    handles.ep.B.setReport(demand);
    handles.ep.B.setReport(length);
    handles.ep.B.setReport(diameter);
    handles.ep.B.setReport(velocity);
    handles.ep.B.setReport(headloss);
    handles.ep.B.setReport(quality);
    handles.ep.B.setReport(flow);
    handles.ep.B.setReport(setting);
    handles.ep.B.setReport(reaction);
    handles.ep.B.setReport(friction);
    handles.ep.B.solveCompleteHydraulics;
    handles.ep.B.solveCompleteQuality;
    handles.ep.B.writeReport;
    open(reportname)
end

