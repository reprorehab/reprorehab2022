%% Verify scripts from Simulated Adaption Folder work

clear;
clc;

%% S1_Simulate_Adaptation_Data

try 
    S1_Simulate_Adaptation_Data(1)
catch 
    error('Unable to run S1_Simulate_Adaptation_Data')
end

close all;
