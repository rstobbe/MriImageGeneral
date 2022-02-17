%=========================================================
% 
%=========================================================

function [PLOT,err] = PlotLineProf_v1a_Func(PLOT,INPUT)

Status('busy','Plot LineProf');
Status2('done','',2);
Status2('done','',3);

err.flag = 0;
err.msg = '';

%---------------------------------------------
% Get Input
%---------------------------------------------
IMG = INPUT.IMG;
clear INPUT;

%---------------------------------------------
% Test Input
%---------------------------------------------
if iscell(IMG)
    if length(IMG) == 2
        Im = cat(4,IMG{1}.Im(:,:,:,1,1,1),IMG{2}.Im(:,:,:,1,1,1));
        ImInfo = IMG{1}.IMDISP.ImInfo;
    else
        IMG = IMG{1};
        Im = IMG.Im;
        ImInfo = IMG.IMDISP.ImInfo;
    end
else
    Im = IMG.Im;
    ImInfo = IMG.IMDISP.ImInfo;
end

fh = figure(10000); box on;
hold on;
%x = (-151.5:0.5:152) - 0.25;
x = (-152:0.5:151.5) + 0.25;
plot(x,squeeze(real(Im(204,:,304))));
%plot(x,squeeze(real(Im(255,:,304))));
xlim([-60 60]);
ylim([0 1.05]);
hAx = gca;
hAx.XTick = (-60:30:60);

% fh = figure(1234); hold on;
% x = 120*(0.5:1:431.5)/432;
% % plot(x,squeeze(abs(Im(204,:,216))),'g')
% % plot(x,squeeze(abs(Im(183,:,216))),'g')
% plot(x,squeeze(abs(Im(203,:,216))),'b')
% %plot([37.5 37.5 54.4 54.4 56.0 56.0 57.6 57.6 59.2 59.2 60.8 60.8 62.4 62.4 64.0 64.0 65.6 65.6 82.5 82.5]+0.025,[0 0.25 0.25 1 1 0.25 0.25 1 1 0.25 0.25 1 1 0.25 0.25 1 1 0.25 0.25 0]);
% %plot([37.0 37.0 53.7 53.7 55.5 55.5 57.3 57.3 59.1 59.1 60.9 60.9 62.7 62.7 64.5 64.5 66.2 66.2 83.0 83.0]+0.025,[0 0.25 0.25 1 1 0.25 0.25 1 1 0.25 0.25 1 1 0.25 0.25 1 1 0.25 0.25 0]);
% plot([37.0 37.0 53.875 53.875 55.625 55.625 57.375 57.375 59.125 59.125 60.875 60.875 62.625 62.625 64.375 64.375 66.125 66.125 83.0 83.0]+0.025,[0 0.25 0.25 1 1 0.25 0.25 1 1 0.25 0.25 1 1 0.25 0.25 1 1 0.25 0.25 0]);
% %xlim([32 88]);
% xlim([50 70]);
% ylim([0 1.05]);
% %ylim([0.2 0.7]);
% box on;
% xlabel('(mm)');
% ylabel('Image Magnitude');

fh.Units = 'inches';
fh.Position = [5 5 2.3 2.2];

PLOT.Figure(1).Name = 'LineProfile';
PLOT.Figure(1).Type = 'Graph';
PLOT.Figure(1).hFig = fh;
PLOT.Figure(1).hAx = gca;

%----------------------------------------------
% Change Matlab Path
%----------------------------------------------
%cd(IMG.path);
if isfield(IMG,'name')
    PLOT.name = IMG.name;
    if strfind(PLOT.name,'.mat')
        PLOT.name = PLOT.name(1:end-4);
    end
    if strfind(PLOT.name,'.nii')
        PLOT.name = PLOT.name(1:end-4);
    end  
    if strfind(PLOT.name,'.hdr')
        PLOT.name = PLOT.name(1:end-4);
    end  
    ind = strfind(PLOT.name,'IMG_');
    if ind
        PLOT.name = PLOT.name(ind+4:end);
    end
else
    PLOT.name = '';
end
if isfield(PLOT,'Figure')
    PLOT.Figure.hFig.Name = ['PLOT_',PLOT.name];
    PLOT.Figure.Name = ['PLOT_',PLOT.name];
end

%---------------------------------------------
% Get Input
%---------------------------------------------
if isfield(IMG,'PanelOutput')
    PLOT.PanelOutput = IMG.PanelOutput;
else 
    PLOT.PanelOutput = [];
end
    
Status('done','');
Status2('done','',2);
Status2('done','',3);
