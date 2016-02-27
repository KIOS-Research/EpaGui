function [id] = parameterLink(parameter,control,value,duration)
% parameterLink - Example2, type select 
%
% Syntax:   parameterLink(parameter,control,value)
%
% Inputs:   parameter - length,diameter,roughness,flow,bulk,wall,chlorine..
%           control  - Above > , Below < 
%           value - ex. above > value
%           duration - duration of control
% 
% Outputs:     find what nodes are above or below a price accordingly.
% 
% Example:    [id] = parameterLink('flow','above',100)
%
% Other m-files
% required: ENsettimeparam, ENsolveH, ENsolveQ
% Subfunctions:  
% MAT-files required:  
%
% See also: 
% 
% Professor:Marios M. Polycarpou, Department of Electrical and Computer Engineering
% Author: Demetrios G. Eliades, Ph.D., Electrical Engineering
% Student: Marios Kyriakou
% KIOS Research Center for Intelligent Systems and Networks
% emails: mpolycar@ucy.ac.cy, eldemet@ucy.ac.cy , mkiria01@ucy.ac.cy 
% Website: http://www.kios.ucy.ac.cy
% Oct 2011; Last revision: 5-Oct-2011

%------------- BEGIN CODE --------------
%    /*Duration*/
    d=duration+1;
    ENsettimeparam('duration',3600*duration)

    % LIMIDED for parameter
control = upper(control);
switch control
    case 'ABOVE'
        control= 1 ;% char('>');
        
    case 'BELOW'
        control= 2 ;%char('<');
end

index = 1 ; 
while index < ENgetcount('link') + 1

    i=1;u=0;
    while i<duration+1
        ENsolveH;
        ENsolveQ;
        ENsettimeparam('duration',3600*u);%nodes
        valuess(i)=ENgetlinkvalue(index,parameter);
        u=u+1;i=i+1;
    end
    
    v(index,:)=valuess;

    f = index;  % because Subscript indices must either be real positive integers or logicals.
    id=ENgetlinkid(index);

    index = index + 1;
end

t = 1;
b=1;


if control==1
    e = v > (value);
else
    e = v < (value);
end

if e==0 % osa  den isxiei o elegxos, eite megalitera eite mikrotera apo kapoia parametro.
    id ='';
end

while t < ENgetcount('link') + 1
    
   if  e(t)~=0
       id(b) = ENgetlinkid(t);
       b=b+1;
   end
   
t =t+1;
end


end