%% Visualize summary data and save as a publication-quality figure

% We will create a single figure with four subplots. The left column will
% show the distribution of estimated and actual parameters for the slow
% process and the right column will show the distribution of estimated and
% actual parameters for the fast process.
%
% Note that we explicitly define many of the parameters of the plot
% including the axis limits and labels, line widths, and font sizes. We
% even add panel labels as you would do for a publication.
%
% Finally, we set the figure's size to 15 x 12 cm which is approximately
% two columns in a standard scientific publication.

cd('Simulated_Adaptation_Data')
load("Group_Data.mat")
load("True_Parameters.mat")

figure
Not_NaN = ~isnan(Coefficients_All.A_Slow); % Find indices of coefficients that are valid 

% Plot slow coefficient
A_Axes(1) = subplot(2,2,1); 
plot([Coefficients_All.A_Slow(Not_NaN)...
    True_Parameters(Not_NaN,1)]','-o','LineWidth',1,'Color',...
    [0.1 0.1 0.1],'MarkerFaceColor',[0.5 0.5 0.5])

% Set axis and label properties
set(gca,'XLim', [0.5 2.5], 'XTick',[1 2],'XTickLabel',...
    {'Estimated' 'True'},'FontSize',11,'LineWidth',1)
ylabel('Slow Coefficient')
XLimits = xlim; YLimits = ylim;
text(XLimits(1)-0.3*(XLimits(2)-XLimits(1)),YLimits(2) + ...
    0.1*(YLimits(2)-YLimits(1)),'A','FontSize',14)

% Plot slow rate parameters
A_Axes(2) = subplot(2,2,2); 
plot([Coefficients_All.A_Fast(Not_NaN)...
    True_Parameters(Not_NaN,3)]','-o','LineWidth',1,'Color',...
    [0.1 0.1 0.1],'MarkerFaceColor',[0.5 0.5 0.5])

% Set axis and label properties
set(gca,'XLim', [0.5 2.5], 'XTick',[1 2],'XTickLabel',...
    {'Estimated' 'True'},'FontSize',11,'LineWidth',1)
ylabel('Fast Coefficient')
XLimits = xlim; YLimits = ylim;
text(XLimits(1)-0.3*(XLimits(2)-XLimits(1)),YLimits(2) + ...
    0.1*(YLimits(2)-YLimits(1)),'B','FontSize',14)

linkaxes(A_Axes)

% Plot fast coefficient
B_Axes(1) = subplot(2,2,3);
plot([Coefficients_All.B_Slow(Not_NaN)...
    True_Parameters(Not_NaN,2)]','-o','LineWidth',1,'Color',...
    [0.1 0.1 0.1],'MarkerFaceColor',[0.5 0.5 0.5])

% Set axis and label properties
set(gca,'XLim', [0.5 2.5], 'XTick',[1 2],'XTickLabel',...
    {'Estimated' 'True'},'FontSize',11,'LineWidth',1)
ylabel('Slow Rate Constant')
XLimits = xlim; YLimits = ylim;
text(XLimits(1)-0.3*(XLimits(2)-XLimits(1)),YLimits(2) + ...
    0.1*(YLimits(2)-YLimits(1)),'C','FontSize',14)

% Plot fast rate parameter
B_Axes(2) = subplot(2,2,4); 
plot([Coefficients_All.B_Fast(Not_NaN)...
    True_Parameters(Not_NaN,4)]','-o','LineWidth',1,'Color',...
    [0.1 0.1 0.1],'MarkerFaceColor',[0.5 0.5 0.5])

% Set axis and label properties
set(gca,'XLim', [0.5 2.5], 'XTick',[1 2],'XTickLabel',...
    {'Estimated' 'True'},'FontSize',11,'LineWidth',1)
ylabel('Fast Rate Constant')
XLimits = xlim; YLimits = ylim;
text(XLimits(1)-0.3*(XLimits(2)-XLimits(1)),YLimits(2) + ...
    0.1*(YLimits(2)-YLimits(1)),'D','FontSize',14)

% linkaxes(B_Axes)

% Perform a set of paired t-tests to determine if there is evidence to
% reject the null hypothesis that the mean of the differences between the
% estimated and actual model parameters is different from zero.
[h_A_Slow, p_A_Slow] = ttest(Coefficients_All.A_Slow(Not_NaN), ...
    True_Parameters(Not_NaN,1));
[h_A_Fast, p_A_Fast] = ttest(Coefficients_All.A_Fast(Not_NaN), ...
    True_Parameters(Not_NaN,3));
[h_B_Slow, p_B_Slow] = ttest(Coefficients_All.B_Slow(Not_NaN), ...
    True_Parameters(Not_NaN,2));
[h_B_Fast, p_B_Fast] = ttest(Coefficients_All.B_Fast(Not_NaN), ...
    True_Parameters(Not_NaN,4));

% Set figure size and save two versions of the figure - one as a .fig file
% and one as a .pdf.
set(gcf,'Units','Centimeters','Position',[5 5 15 12])
saveas(gcf,'Coefficient Estimates - Group')
saveas(gcf,'Coefficient Estimates - Group','pdf')
