function Simulate_Adaptation_Data(N_Participants)

% Here, we will simulate data from a study of split-belt treadmill
% adaptation. Changes in performance during motor adaptation tasks are
% often modeled using a double-exponential function that can capture early,
% rapid changes in performance, as well as more gradual changes that impact
% performance during the latter portions of adaptation.
% 
% We will use this knowledge to generate artifial data from a
% double-exponential function that has the following form. 
%
% $$SLA = A_f*e^{-B_f*n} + B_f*e^{-B_s*n}$$
%
% To generate a realistic dataset, we simulate three sources of variability
% covered observed in this type of data. First, we simulate intersubject
% variability by randomly selecing coefficients (A_f and A_s) and rate
% terms (B_s and B_f) from normal distributions centered at values taken
% from the literature. Second, we simulate noisy measurements and
% stride-by-stride variability by adding noise to the simulated step length
% asymmetry values. Lastly, since typical adaptation studies use a fixed
% _duration_ of adaptation, each participant may take a different number of
% total strides (largely because of differences in leg length). We simulate
% this source of variability by having each participant take between 800
% and 1100 total strides.

% Set the random number generator to the default state so that the results
% are reproducible.
rng('default')      

% Make a new folder in the current directory to store the data
mkdir Simulated_Adaptation_Data
Home = cd;  % Remember the current directory so that we can return to it

% Allocate space to save the true parameter values.
True_Parameters = zeros(16,4);
ax = zeros(N_Participants,1);

% Create a figure to show all of the simulated data
figure

for Participant_Num = 1:N_Participants
    cd('Simulated_Adaptation_Data')
    
    % Create subdirectory for each participant. Note that the
    % sub-directories have a consistent naming convention with a two-digit
    % subject ID. If you were to simulate more than 99 participants, you
    % would want to modify the form of the participant ID numbers to
    % accomodate the largest number of participants you expect. 
    
    if Participant_Num < 10
        mkdir(strcat(['20220912_S0' num2str(Participant_Num)]))
        cd(strcat(['20220912_S0' num2str(Participant_Num)]))
    else
        mkdir(strcat(['20220912_S' num2str(Participant_Num)]))
        cd(strcat(['20220912_S' num2str(Participant_Num)]))
    end
    
    % Specify the number of strides for each participant as a random value
    % between 800 and 1100.
    Total_Strides = randi([800 1100],1,1);    
    
    % Create a "time" vector with units of strides
    Stride_Num = 1:Total_Strides;
    
    % Specify the fast and slow coefficients. The sum of A_Fast and A_Slow
    % are approximately equal to the initial step length asymmetry. 
    
    % Note that each coefficient has a nominal value of -0.05 and we
    % introduce between-subjects variability by taking a random value
    % between -0.5 and 0.5 and multiplying that number by 0.1. This results
    % in coefficients that range from -0.1 to 0.
    
    A_Fast = -0.05 + 0.1*(rand(1,1) - 0.5); 
    A_Slow = -0.05 + 0.1*(rand(1,1) - 0.5); 
    
    % B_Fast and B_Slow are the time constants of the fast and slow
    % components of adaptation. The fast time constant should be larger
    % than the slow time constant. Again, we add some random variability to
    % these parameters to introduce between-subjects variance. The nominal
    % values for these parameters were taken from Mawase et al., 2013,
    % Journal of Neurophysiology.
    
    B_Fast = 0.025 + 0.01*(rand(1,1) - 0.5); 
    B_Slow = 0.0011 + 0.0004*(randn(1,1) - 0.5);
    
    % Store the true values of the parameters for each participant. We will
    % use this as our ground truth to determine if we can accurately
    % estimate these parameters from our the simulated data. Generating
    % data from a model with known parameters and then estimating those
    % parameters is useful tool for validating your model fitting
    % procedure.
    True_Parameters(Participant_Num,:) = [A_Slow B_Slow A_Fast B_Fast];
    
    % Assume that each participant has normally distributed measurement
    % noise, and that the amplitude of this noise varies uniformly across
    % participants. The values used for noise amplitude were hand picked to
    % generate data sets that look fairly realistic. It would also be
    % possible to directly measure the variability of true experimental
    % data to obtain realistic values of noise.
   
    Noise_Amplitude = 0.02*rand(1,1) + 0.005;
    Measurement_Noise = Noise_Amplitude*randn(1,numel(Stride_Num));
    
    % Generate step length asymmetries (SLA) for each participant by adding
    % measurement noise to the step length asymmetries that would be
    % generated by the double exponential model.
    SLA = A_Fast*exp(-B_Fast*Stride_Num) + ...
        A_Slow*exp(-B_Slow*Stride_Num) +...
        Measurement_Noise;
    
    % Plot the raw step length asymmetry data for all participants
    ax(Participant_Num) = subplot(ceil(sqrt(N_Participants)), ...
        ceil(sqrt(N_Participants)),Participant_Num); plot(SLA,'o');
    xlabel('Stride Number'), ylabel('Step Len. Asym')
    
    % Save each participant's data in a csv file
    if Participant_Num < 10
        writematrix(SLA', ...
            strcat(['20220912_S0' num2str(Participant_Num) '_SLA.csv']))
    else
        writematrix(SLA', ...
            strcat(['20220912_S' num2str(Participant_Num) '_SLA.csv']))
    end
    cd(Home)
end
linkaxes(ax)

cd('Simulated_Adaptation_Data')
save('True_Parameters', 'True_Parameters')
cd(Home)