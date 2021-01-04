%=========================================================
% (v1d) 
%   - Colour Option Drop (to ImScale)
%   - Facilite Images with 'imbedded' colour
%=========================================================

function [SCRPTipt,SCRPTGBL,MONT,err] = MontageFigure_v1d(SCRPTipt,SCRPTGBL,MONTipt)

Status2('busy','Montage Figure',2);
Status2('done','',3);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Get Input
%---------------------------------------------
MONT.method = MONTipt.Func; 
MONT.imscalefunc = MONTipt.('ImScalefunc').Func;  
MONT.slclbl = MONTipt.('SliceLabel');
MONT.scale = MONTipt.('Scale');
MONT.visible = MONTipt.('FigureVisible');

CallingLabel = MONTipt.Struct.labelstr;
%---------------------------------------------
% Get Working Structures from Sub Functions
%---------------------------------------------
IMSCLipt = MONTipt.('ImScalefunc');
if isfield(MONTipt,([CallingLabel,'_Data']))
    if isfield(MONTipt.([CallingLabel,'_Data']),'ImScalefunc_Data')
        IMSCLipt.('ImScalefunc_Data') = MONTipt.([CallingLabel,'_Data']).('ImScalefunc_Data');
    end
end

%------------------------------------------
% Get Info
%------------------------------------------
func = str2func(MONT.imscalefunc);           
[SCRPTipt,IMSCL,err] = func(SCRPTipt,IMSCLipt);
if err.flag
    return
end

%------------------------------------------
% Return
%------------------------------------------
MONT.IMSCL = IMSCL;


Status2('done','',2);
Status2('done','',3);
