% Here, we compute peak ankle dorsiflexion for the average trajectories
% collected in Lencioni et al., 2019. We then perform a repeated measures
% ANOVA to determine if these kinematic features varied between normal
% walking, toe walking, and heel walking.
%
% We also create a type of dot plot known as a swarm plot to visualize all
% of our data and denote pairs of conditions whose angles were found to be
% significantly different. 
%
% Finally, we save our results and export our figure in a
% publication-quality format.

% James M. Finley 2022/10/29

clc
close all
clear

% Load the average joint trajectories for each participant in the full
% dataset. 
load Avg_Joint_Angles.mat

% Compute the peak ankle dorsiflexion and peak knee flexion across all
% trial types

Peak_Ankle_Dorsi = [max(squeeze(Avg_Joint_Angles_Walking(10,:,:))); ...
    max(squeeze(Avg_Joint_Angles_HeelWalking(10,:,:))); ...
    max(squeeze(Avg_Joint_Angles_ToeWalking(10,:,:))); ...
    max(squeeze(Avg_Joint_Angles_Ascend(10,:,:))); ...
    max(squeeze(Avg_Joint_Angles_Descend(10,:,:)))];

%--------------------------------------------------------------------------
% Compute the peak knee flexion angle across all trial types and store as
% the variable 'Peak_Knee_Flex'. This variable should have the same
% dimensions as Peak_Ankle_Dorsi.
%--------------------------------------------------------------------------

% Create dot plot to compare distribution of peak ankle dorsiflexion values
% for walking, heel walking, and toe walking

f1 = figure;
set(f1,'Name', 'Peak Dorisflexion Angle', 'NumberTitle','off', 'Units',...
    'centimeters','Position',[12 9 9 7])

%--------------------------------------------------------------------------
% Create a swarm chart to illustrate the distribution of peak ankle
% dorsiflexion angles for Walking, Heel Walking, and Toe Walking. Use
% filled markers with the MarkerFaceAlpha and MarkerEdgeAlpha properties
% each set to 0.5.
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Modify the x-axis so that it only has tick marks at values 1, 2, and 3.
% Change the tick labels to 'Walking', 'Heel Walking', and 'Toe Walking.'
% Add a ylabel that says 'Peak Ankle Dorsiflexion (deg)' and arrange the
% label so that 'Dorsiflexion (deg)' is on the second line of the label.
%--------------------------------------------------------------------------

%% Perform repeated-measures ANOVA on peak ankle dorsiflexion angle

% To perform a repeated-measures ANOVA, we first need to organize our data
% in a specific table format. The first column of the table contains our
% participant ID numbers and the second through fourth columns contain the
% peak ankle dorsiflexion values for walking, heel walking, and toe
% walking, respectively.
Ankle_Dorsi_Table = table((1:50)', Peak_Ankle_Dorsi(1,:)', ...
    Peak_Ankle_Dorsi(2,:)', Peak_Ankle_Dorsi(3,:)', ...
   'VariableNames', {'Subject' 'Walking' 'Heel_Walking' 'Toe_Walking'});

% Define a variable that lists the number of distinct trial types
% represented in this dataset.
Condition = [1 2 3]';

% Use "fitrm" to fit a repeated-measures model to our data. This is used
% solely to illustrate how one can perform statistical analysis within
% MATLAB and then annotate a corresponding figure to illustrate which
% conditions differ from one another. 
RM_Model_Ankle_Dorsi = fitrm(Ankle_Dorsi_Table,'Walking-Toe_Walking ~ 1','WithinDesign', ...
    Condition,'WithinModel','orthogonalcontrasts');

ANOVA_Table_Ankle_Dorsi = anova(RM_Model_Ankle_Dorsi);
Mult_Compare_Ankle_Dorsi = multcompare(RM_Model_Ankle_Dorsi,'Time')

Range = diff(ylim);
SignificantDifference(gca,1,2,20,0.05*Range,'*')
SignificantDifference(gca,1,3,20+Range*0.15,0.05*Range,'*')
SignificantDifference(gca,2,3,20+Range*0.30,0.05*Range,'*')

saveas(f1,'Peak_Ankle_Dorisflexion_Task','pdf')
saveas(f1,'Peak_Ankle_Dorisflexion_Task','fig')

% Create dot plot to compare distribution of peak knee flexion values
% for walking, heel walking, and toe walking
f2 = figure;

set(f2,'Name', 'Peak Knee Flexion Angle', 'NumberTitle','off', 'Units',...
    'centimeters','Position',[12 9 9 7])

swarmchart([ones(1,50) 2*ones(1,50) 3*ones(1,50)],...
    [Peak_Knee_Flex(1,:) Peak_Knee_Flex(2,:) Peak_Knee_Flex(3,:)],...
    'filled','MarkerFaceAlpha',0.5,'MarkerEdgeAlpha',0.5)

set(gca,'XTick',[1 2 3],...
    'XTickLabel',{'Walking', 'Heel Walking', 'Toe Walking'})
ylabel({'Peak Knee' 'Flexion (deg)'})

% Create table containing peak knee flexion values
Knee_Flex_Table = table((1:50)', Peak_Knee_Flex(1,:)', ...
    Peak_Knee_Flex(2,:)', Peak_Knee_Flex(3,:)', ...
   'VariableNames', {'Subject' 'Walking' 'Heel_Walking' 'Toe_Walking'});

%--------------------------------------------------------------------------
function SignificantDifference(Axis,X1,X2,Y,Height,Symbol)
% This local function is used to add annotations to our plot to denote
% statistically significant differences. This type of annotation is
% commonly added using an external application like Adobe Illustrator, but
% if you are clever, then you can add all the annotations you need within
% MATLAB. 

% Make sure that the appropriate axis is active and that the data won't be
% erased from the axis
get(Axis)
hold on

% Build annotation by adding vertical and horizontal lines of defined
% length, width, or height
l1 = line([X1 X1],[Y Y+Height]); set(l1,'Color','k')
l2 = line([X2 X2],[Y Y+Height]); set(l2,'Color','k')
l3 = line([mean([X1 X2]) mean([X1 X2])],[Y+Height Y+2*Height]); set(l3,'Color','k')
l4 = line([X1 X2],[Y+Height Y+Height]); set(l4,'Color','k')

% Add an asterisk to denote statistical significance
text(mean([X1 X2])-0.05, Y+2.1*Height, Symbol,'FontSize',14)


end