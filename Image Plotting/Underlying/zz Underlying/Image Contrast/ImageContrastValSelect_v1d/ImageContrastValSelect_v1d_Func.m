%=====================================================
%
%=====================================================

function [IMSCL,err] = ImageContrastValSelect_v1d_Func(IMSCL,INPUT)

Status2('busy','Image Scale',3);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Get Input
%---------------------------------------------
Image = INPUT.Image;
MSTRCT = INPUT.MSTRCT;
clear INPUT;

%---------------------------------------------
% MSTRCT
%---------------------------------------------
MSTRCT.dispwid = [IMSCL.minval IMSCL.maxval];
MSTRCT.type = IMSCL.type;
MSTRCT.colour = IMSCL.colour;
MSTRCT.colourmap = IMSCL.colourmap;
MSTRCT.zero = 'black';

%---------------------------------------------
% Return
%---------------------------------------------
IMSCL.Image = Image;
IMSCL.MSTRCT = MSTRCT;

Status2('done','Image Scale',3);