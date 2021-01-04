%=========================================================
% 
%=========================================================

function [default] = PlotLineProf_v1a_Default2(SCRPTPATHS)

if strcmp(filesep,'\')
    loadpath = [SCRPTPATHS.voyagerloc,'Image Format Related\Underlying\Selectable Functions\Load\Generic\'];
elseif strcmp(filesep,'/')
end
loadfunc = 'Im1LoadGeneric_v1c';

m = 1;
default{m,1}.entrytype = 'OutputName';
default{m,1}.labelstr = 'Plot_Name';
default{m,1}.entrystr = '';

m = m+1;
default{m,1}.entrytype = 'ScriptName';
default{m,1}.labelstr = 'Script_Name';
default{m,1}.entrystr = '';

m = m+1;
default{m,1}.entrytype = 'ScrptFunc';
default{m,1}.labelstr = 'ImLoadfunc';
default{m,1}.entrystr = loadfunc;
default{m,1}.searchpath = loadpath;
default{m,1}.path = [loadpath,loadfunc];

m = m+1;
default{m,1}.entrytype = 'Choose';
default{m,1}.labelstr = 'SaveOption';
default{m,1}.entrystr = 'No';
default{m,1}.options = {'Yes','No'};

m = m+1;
default{m,1}.entrytype = 'RunScrptFunc';
default{m,1}.scrpttype = 'PlotImage';
default{m,1}.labelstr = 'LineProf';
default{m,1}.entrystr = '';
default{m,1}.buttonname = 'Plot';

