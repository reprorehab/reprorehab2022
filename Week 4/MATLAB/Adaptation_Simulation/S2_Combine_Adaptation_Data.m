%% Combine the data for all participants into a single data structure
%
% By storing the data for all participants in a single, well-organized
% data structure, you can easily share your data with other Matlab users in
% a self-explanatory format. 
 
cd('Simulated_Adaptation_Data')
Directory = dir('2022*');

% Create a new figure window to perform high-level quality control
figure

% Preallocate space for contents of data structure
Data = struct('SLA',cell(16,1),'Good_Data',[],'Age',[],'Weight',[]);

for Participant_Num = 1:numel(Directory)
    % Use the importdata function to import the step length asymmetry data
    % from the .csv files into Matlab
    % 
    % Note that we are storing the data within a structure. See the Matlab
    % help for structures if you are not familiar with this data type.
    
    Data(Participant_Num).SLA = importdata(fullfile(Directory(Participant_Num).name, ...
        [Directory(Participant_Num).name '_SLA.csv'])); 
    
    % Visualize the data and determine if the data for each participant
    % seems reasonable. This manual sanity check could be made more
    % quantitative, but our purpose is to demostrate how you can automate
    % _some_ quality control processes.
    
    plot(Data(Participant_Num).SLA,'o')
    xlabel('Stride Number'), ylabel('SLA')
    Data(Participant_Num).Good_Data = questdlg('Does This Data Seem Reasonable?');
    
    % Add some artificial demographic information to illustrate the
    % versatility of data structures.
    
    Data(Participant_Num).Age = randi([20 48],1,1);
    Data(Participant_Num).Weight = randi([50 90],1,1);
end
close 
% Save the data structure
save Data_All Data
