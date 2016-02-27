function [id] = parameterNode(parameter,control,value,duration)
% parameterNode - Example2, type select 
%
% Syntax:   parameterNode(parameter,control,value)
%
% Inputs:   parameter - elevation,basedemand,initqual,head,pressure,chlorine,demand
%           control  - Above > , Below < 
%           value - ex. above > value
%           duration - duration of control
% 
% Outputs: find what nodes are above or below a price accordingly.
% 
% Example:    [id] = EN_parameterNode('elevation','above',100)
%
% Other m-files
% required:ENsettimeparam,ENsolveH,ENsolveQ
% Subfunctions: none
% MAT-files required: none
%
% See also: 

% Professor:Marios M. Polycarpou, Department of Electrical and Computer Engineering
% Author: Demetrios G. Eliades, Ph.D., Electrical Engineering
% Student: Marios Kyriakou
% KIOS Research Center for Intelligent Systems and Networks
% emails: mpolycar@ucy.ac.cy, eldemet@ucy.ac.cy , mkiria01@ucy.ac.cy 
% Website: http://www.kios.ucy.ac.cy
% Oct 2011; Last revision: 5-Oct-2011

%------------- BEGIN CODE --------------
%    /*Duration*/

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
while index < ENgetcount('nodes') + 1

    i=1;u=0;
    while i<duration+1
        ENsolveH;
        ENsolveQ;
        ENsettimeparam('duration',3600*u);%nodes
        valuess(i)=ENgetnodevalue(index,parameter);
        u=u+1;i=i+1;
    end
    
    v(index,:)=valuess;

    f = index;  % because Subscript indices must either be real positive integers or logicals.
    id=ENgetnodeid(index);

    index = index + 1;
end

t = 1;
b=1;


if control==1
    e = v > value ;
else
    e = v < value ;
end

if e==0 % osa  den isxiei o elegxos, eite megalitera eite mikrotera apo kapoia parametro.
    id ='';
end

while t < ENgetcount('nodes') + 1
    
   if  e(t)~=0
       id(b) = ENgetnodeid(t);
       b=b+1;
   end
   
t =t+1;
end


end