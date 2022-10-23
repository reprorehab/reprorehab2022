%% Estimate adaptation model parameters and store results in a table

cd('Simulated_Adaptation_Data')

% Load the group data
load Data_All

% Here, we use nonlinear regression to estimate the coefficients and rate
% parameters for each participant. We will then compare these estimates to
% the true values to validate our analysis procedure.

% Define the model's structure. See the help for 'fitnlm' for a more
% descriptive example of how model structure is defined for the 'fitnlm'
% function.
Double_Exp_Model = @(Coeff,x)Coeff(1)*exp(-Coeff(2)*x(:,1)) + ...
    Coeff(3)*exp(-Coeff(4)*x(:,1));

% Specify initial guess for model parameters. These initial guess are
% purposefully set to be equal to the nominal values defined in the first
% script. However, you should vary these values to see if the fitting
% procedure is sensitive to the initial guess.
Coeff_Init = [-0.05 0.025 -0.05 0.011]';

% We will store the parameter estimates in a table. Tables allow you to
% store different data types in a spreadsheet format as you might do in
% Excel. Here, we are simply creating a table with the correct column
% names.
Coefficients_All = array2table(zeros(1,4),'VariableNames', ...
    {'A_Slow' 'B_Slow' 'A_Fast' 'B_Fast'});

% In this block of code, we estimate the dual-rate model parameters using
% the _fitnlm_ function. Note that we include a conditional statement so
% that we only fit data that passed our earlier screening.

for Participant_Num = 1:numel(Data)
    
    % Restrict Processing to "Good" Data
    if strcmp(Data(Participant_Num).Good_Data,'Yes')
        
        % Use the 'fitnlm' function to estimate the model parameters. The
        % first and second inputs to fitnlm are the independent variable
        % (stride number) and dependent variable (SLA), respectively. The
        % third input is the model that we will fit to the data and the
        % fourth input is the initial guess for the model coefficients.

        Data(Participant_Num).Model = fitnlm((1:numel(Data(Participant_Num).SLA))',Data(Participant_Num).SLA',...
            Double_Exp_Model,Coeff_Init);
        
        % Make sure that the parameters are stored in the proper order
        if Data(Participant_Num).Model.Coefficients.Estimate(2) > ...
                Data(Participant_Num).Model.Coefficients.Estimate(4)
            Coefficients_All(Participant_Num,:) = ...
                array2table(Data(Participant_Num).Model.Coefficients.Estimate([3 4 1 2])');
        else
            Coefficients_All(Participant_Num,:) = ...
                array2table(Data(Participant_Num).Model.Coefficients.Estimate');
        end

    else
        % Store NaN values for data that did not pass our screening
        Coefficients_All(Participant_Num,:) = array2table(NaN(1,4));
    end
end

save Group_Data Coefficients_All