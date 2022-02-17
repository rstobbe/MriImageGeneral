%=====================================================
% (v1c)
%       
%=====================================================

function [SCRPTipt,IMSCL,err] = ImageContrastValSelect_v1d(SCRPTipt,IMSCLipt)

Status2('busy','Image Scale',2);
Status2('done','',2);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Return Panel Input
%---------------------------------------------
IMSCL.type = IMSCLipt.('Type');
IMSCL.method = IMSCLipt.Func;
IMSCL.maxval = str2double(IMSCLipt.('MaxValue'));
IMSCL.minval = str2double(IMSCLipt.('MinValue'));
IMSCL.colour = IMSCLipt.('Colour');
IMSCL.colourmap = IMSCLipt.('ColourMap').EntryStr;








