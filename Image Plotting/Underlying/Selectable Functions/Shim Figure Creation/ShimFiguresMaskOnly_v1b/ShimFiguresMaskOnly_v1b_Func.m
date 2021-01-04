%=========================================================
% 
%=========================================================

function [MOF,err] = ShimFiguresMaskOnly_v1b_Func(MOF,INPUT)

Status2('busy','Plot Shimming Figures',2);
Status2('done','',3);

err.flag = 0;
err.msg = '';

%----------------------------------------------
% Get input
%----------------------------------------------
Image = INPUT.Image;
MSTRCT = INPUT.MSTRCT;
clear INPUT

%----------------------------------------------
% Test Image Size
%----------------------------------------------
BaseIm = squeeze(Image(:,:,:,1));
fMap = squeeze(Image(:,:,:,2));
Mask = squeeze(Image(:,:,:,3));
Prof = squeeze(Image(:,:,:,4));
plotshim = 0;
plotmask = 0;
if sum(Mask(:)) ~= 0
    plotmask = 1;
end
if sum(Prof(:)) ~= 0
    plotshim = 1;
end

%----------------------------------------------
% Base Image
%----------------------------------------------
dispwid1 = [0 0.9*max(abs(BaseIm(:)))];
MSTRCT.dispwid1 = dispwid1;

%----------------------------------------------
% Image Aspects
%----------------------------------------------
MSTRCT.intensity = 'Flat75';
MSTRCT.type1 = 'abs';
MSTRCT.type2 = 'real';


if plotmask == 1;
    %----------------------------------------------
    % Plot Original Masked Image
    %----------------------------------------------
    MSTRCT.figno = '1001';
    if strcmp(MOF.dispmaskwid,'Full')
        maskdispwid(1) = -max(abs(fMap(:).*Mask(:)));
        maskdispwid(2) = -maskdispwid(1);
        MSTRCT.dispwid2 = maskdispwid;
    else
        ind = strfind(MOF.dispmaskwid,',');
        if isempty(ind)
            err.flag = 1;
            err.msg = 'Enter comma separated numbers for ''DispMask (Hz)''';
            return
        end
        MSTRCT.dispwid2(1) = str2double(MOF.dispmaskwid(1:ind-1));
        MSTRCT.dispwid2(2) = str2double(MOF.dispmaskwid(ind+1:end));
        maskdispwid(1) = MSTRCT.dispwid2(1);
        maskdispwid(2) = MSTRCT.dispwid2(2);
    end
    INPUT.MSTRCT = MSTRCT;
    INPUT.Image(:,:,:,1) = BaseIm;
    INPUT.Image(:,:,:,2) = fMap.*Mask;
    [~,err] = PlotMontageOverlay_v1c(INPUT);
    title('Masked Original B0 Map');

    %---------------------------------------------
    % Plot Original Masked Histogram
    %---------------------------------------------
    test = fMap(:).*Mask(:);
    test(test<maskdispwid(1)) = NaN;
    test(test>maskdispwid(2)) = NaN;
    test = test(not(isnan(test)));
    figure(2001); hold on;
    cens = (maskdispwid(1):MOF.histstepmask:maskdispwid(2));
    [nels,cens] = hist(test,cens);
    nels = smooth(nels,5,'moving');
    plot(cens,nels,'r');
    xlabel('Off Resonance (Hz)'); ylabel('Voxels');
    title('Masked Histogram');
   set(gca,'XDir','reverse');
end

if plotshim == 0
    return
end

if plotmask == 1;
    %----------------------------------------------
    % Plot Fitted Masked Image
    %----------------------------------------------
    MSTRCT.figno = '1003';
    MSTRCT.dispwid2(1) = maskdispwid(1);
    MSTRCT.dispwid2(2) = maskdispwid(2);
    INPUT.MSTRCT = MSTRCT;
    INPUT.Image(:,:,:,1) = BaseIm;
    INPUT.Image(:,:,:,2) = (fMap-Prof).*Mask;
    [~,err] = PlotMontageOverlay_v1c(INPUT);
    title('Masked Fitted B0 Map');

    %---------------------------------------------
    % Plot Fitted Masked Histogram
    %---------------------------------------------
    test = (fMap(:)-Prof(:)).*Mask(:);
    test(test<maskdispwid(1)) = NaN;
    test(test>maskdispwid(2)) = NaN;
    test = test(not(isnan(test)));
    figure(2001); hold on;
    cens = (maskdispwid(1):MOF.histstepmask:maskdispwid(2));
    [nels,cens] = hist(test,cens);
    nels = smooth(nels,5,'moving');
    plot(cens,nels,'k');
    set(gca,'XDir','reverse');
end


%---------------------------------------------
% Return
%---------------------------------------------
Status2('done','',3);