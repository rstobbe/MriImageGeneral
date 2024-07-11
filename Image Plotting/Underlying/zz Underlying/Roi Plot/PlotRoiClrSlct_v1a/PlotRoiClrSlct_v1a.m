%=========================================================
% (v1a)
%     
%=========================================================

function [SCRPTipt,PLOTROI,err] = PlotRoiClrSlct_v1a(SCRPTipt,PLOTROIipt)

Status2('busy','Plot ROI',3);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Get Input
%---------------------------------------------
PLOTROI.method = PLOTROIipt.Func;
PLOTROI.clr = PLOTROIipt.Clr;
PLOTROI.linewidth = str2double(PLOTROIipt.LineWidth);

Status2('done','',2);
Status2('done','',3);


