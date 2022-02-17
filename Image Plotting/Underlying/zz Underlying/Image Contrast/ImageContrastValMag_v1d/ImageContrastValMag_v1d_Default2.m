%=========================================================
% 
%=========================================================

function [default] = ImageContrastValMag_v1d_Default2(SCRPTPATHS)

m = 1;
default{m,1}.entrytype = 'Input';
default{m,1}.labelstr = 'MaxValue';
default{m,1}.entrystr = '100';

m = m+1;
default{m,1}.entrytype = 'Input';
default{m,1}.labelstr = 'MinValue';
default{m,1}.entrystr = '0';

m = m+1;
default{m,1}.entrytype = 'Choose';
default{m,1}.labelstr = 'Colour';
default{m,1}.entrystr = 'No';
default{m,1}.options = {'Yes','No'};

m = m+1;
default{m,1}.entrytype = 'RunExtFunc';
default{m,1}.labelstr = 'ColourMap';
default{m,1}.entrystr = '';
default{m,1}.buttonname = 'Select';
default{m,1}.runfunc1 = 'SelectGenericFileCur';
default{m,1}.(default{m,1}.runfunc1).curloc = 'D:\Compass\ColorMaps';
default{m,1}.runfunc2 = 'SelectGenericFileDef';
default{m,1}.(default{m,1}.runfunc2).defloc = 'D:\Compass\ColorMaps';
default{m,1}.searchpath = SCRPTPATHS.scrptshareloc;
default{m,1}.path = SCRPTPATHS.scrptshareloc;