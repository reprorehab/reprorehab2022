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

%--------------------------------------------------------------------------
% Update the values of the looping variable to make sure that the data from
% each of the 50 participants are loaded. 
%--------------------------------------------------------------------------

for Subj = 11

    % Load each participant's data
    if Subj < 10
        Filename = ['Subject0' num2str(Subj) '.mat'];
    else
        Filename = ['Subject' num2str(Subj) '.mat'];
    end
    
    %----------------------------------------------------------------------
    %-------------- Insert Command to Load Participant's Data -------------
    %----------------------------------------------------------------------
    
    % Initialze variables to store joint angle trajectories for each
    % partcipant. Since we do not know how many trials of each task were
    % completed by each participant, we initialize these variables as empty
    % arrays that will grow as we loop through the participant's data.
    Joint_Angles_Walking = [];
    Joint_Angles_HeelWalking = [];
    Joint_Angles_ToeWalking = [];
    Joint_Angles_Ascend = [];
    Joint_Angles_Descend = [];

    %----------------------------------------------------------------------
    % Write a for loop to cycle through each trial for the current
    % participant. Make the name of the looping variable 'Trial_Num.'
    % Within your for loop, create a variable called 'Task' that stores the
    % name of task that the participant performed during the current trial.
    % This name can be extracted directly from the participant's data
    % structure.
    %----------------------------------------------------------------------
end

