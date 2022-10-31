% This script compiles data from the 50 participants collected as part of
% the study described in Lencioni et al., 2019 and also recreates most of
% Figure 3 from the same manuscript.
%
% James M. Finley 2022/10/29

% Clear console and workspace and close open figure windows
clc
clear
close all

% Create variable, Home, to store the location of the home directory. This
% is the directory where our scripts are stored.
Home = cd;

% Preallocate space to store the average joint angle trajectories for each
% partcipant. Note that there are 12 joints angles, each is
% time-normalized to 101 points, and we have data from 50 participants.
Avg_Joint_Angles_Walking = zeros(12,101,50);
Avg_Joint_Angles_HeelWalking = zeros(12,101,50);
Avg_Joint_Angles_ToeWalking = zeros(12,101,50);
Avg_Joint_Angles_Ascend = zeros(12,101,50);
Avg_Joint_Angles_Descend = zeros(12,101,50);

% Move to the directory where the data are stored
cd('All_Subjects')

% Open figure window, remove figure number title, and give figure an
% informative name
f1 = figure;
set(f1,'NumberTitle','off','Name','Manuscript Figure 3')

% Loop over each participant
for Subj = 1:50

    % Load each participant's data
    if Subj < 10
        Filename = ['Subject0' num2str(Subj) '.mat'];
    else
        Filename = ['Subject' num2str(Subj) '.mat'];
    end

    load(Filename)

    % Initialze variables to store joint angle trajectories for each
    % partcipant. Since we do not know how many trials of each task were
    % completed by each participant, we initialize these variables as empty
    % arrays that will grow as we loop through the participant's data.
    Joint_Angles_Walking = [];
    Joint_Angles_HeelWalking = [];
    Joint_Angles_ToeWalking = [];
    Joint_Angles_Ascend = [];
    Joint_Angles_Descend = [];

    % Loop through trials for current participant
    for Trial_Num = 1:numel(s.Data)
        
        Task = s.Data(Trial_Num).Task;

        % Here, we use "switch" to define different variables based on the
        % current trial type. The variable "Panels" will be used to dictate
        % where the data from the current trial are plotted while
        % "Trial_Name" refers to the task that was performed in the current
        % trial. At the each of each case block, we use "cat" to append the
        % set of joint angles for the current trial to the array that
        % contains the joint angles for the other trials of the same task.

%------------------------------------------------------------------
% Complete the switch-case block to include cases for Toe Walking,
% Step Ascent, and Step Descent. Be sure to use the correct number
% of characters for the name of the task (i.e., the text after the
% use of "case."
%------------------------------------------------------------------

        switch Task
            case 'Walking'
                Panels = [1 6 11];
                Trial_Name = "Walking";
                Joint_Angles_Walking = cat(3,Joint_Angles_Walking,s.Data(Trial_Num).Ang);
            case 'HeelWalking'
                Panels = [2 7 12];
                Trial_Name = "Heel Walking";
                Joint_Angles_HeelWalking = cat(3,Joint_Angles_HeelWalking,s.Data(Trial_Num).Ang);
        end 

        % Plot ankle angle
        subplot(3,5,Panels(1))

%------------------------------------------------------------------
% Specify the first input to the call "plot" to make sure that you 
% plot the ankle angle.
%------------------------------------------------------------------        

        plot(  ,'b'), hold on
        xlabel('% Task Duration')
        ylabel('Ankle [deg] extension   flexion')
        title(Trial_Name)

%------------------------------------------------------------------
% Create plots for knee and hip angles
%------------------------------------------------------------------
    end
end
