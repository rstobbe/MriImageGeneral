%=========================================================
% (v1b) 
%    
%=========================================================

function [SCRPTipt,MCHRS,err] = MontageCharsImArrEdit1_v1b(SCRPTipt,MCHRSipt)

Status2('busy','Return Montage Image Chars',3);
Status2('done','',2);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Get Input
%---------------------------------------------
MCHRS.method = MCHRSipt.Func;
MCHRS.orient = MCHRSipt.('Orientation');
MCHRS.rotation = MCHRSipt.('Rotation');
MCHRS.slices = MCHRSipt.('Slices');
MCHRS.insets = MCHRSipt.('Inset');
MCHRS.ncolumns = str2double(MCHRSipt.('NumColumns')); 
MCHRS.imnum = MCHRSipt.('Arr');
