%% EE5812 Automotive Control Systems
%  Auto Grading: Project 6
%  4/8/2023

%% ----------------------------------------------------------------------------------- %%
%  ------ NOTE:  This script is for Project 6                                    ------  %
%  ----------------------------------------------------------------------------------- %%

% Pull data out of the structure.
    SSData = SuspensionSim.signals(1).values;
    SimTime = SuspensionSim.time;
    TDData = SuspensionSim.signals(2).values;
    PAData = SuspensionSim.signals(3).values;
    fData = SuspensionSim.signals(4).values;
    
%% Ramp input
if Profile == 1 
    
    ST_grade = 'Settling Time:              No Credit';
    OS_grade = 'Overshoot:                  No Credit';
    SS_grade = 'Suspension Stroke:          No Credit';
    TD_grade = 'Tire Deflection:            No Credit';
    PA_grade = 'Passenger Acceleration:     No Credit';
    F_grade =  'Applied Force:              No Credit';
    
    % 1. Settling Time
    
    [minSS,indexminSS] = min(SSData);
    t1 = SimTime(indexminSS);
    set = minSS*0.02;
    r = find(abs(SSData) >= abs(set));
    
    t2 = SimTime(r(end));
    Set_time = t2 - t1;
    check1 = 2.2 - Set_time; %% must be positive 
    check2 = 3.2 - Set_time; %% must be positive 
    
    if check1 >= 0 
        ST_grade = 'Settling Time:                   Full Credit';
    elseif check2 >= 0
        ST_grade = 'Settling Time:                   Half Credit';
    end 
    
    % 2. % Overshoot 
    start = max(-1*(SSData));
    os = 100*max(SSData)/start;
    
    check1 = 12 - os; % must be positive
    check2 = 16 - os; % must be positive
    if check1 >= 0
        OS_grade = 'Overshoot:                       Full Credit';
    elseif check2 >= 0
        OS_grade = 'Overshoot:                       Half Credit';
    end 
    
    %3. Max SS 
    ss_max = max(abs(SSData));
    check = 0.12 - ss_max; %% must be positive 
    if check >= 0 
        SS_grade = 'Suspension Stroke:         Full Credit';
    end 
    
    %4. Max Tire Deflection
    td_max = max(abs(TDData)); 
    check = 0.03 - td_max; %% must be positive
    if check >= 0 
        TD_grade = 'Tire Deflection:                Full Credit';
    end 
    
    %5. Max Passenger Acceleration
    pa_max = max(abs(PAData));
    check = 0.2 - pa_max ; %% must be positive
    if check >= 0
        PA_grade = 'Passenger Acceleration: Full Credit';
    end 
    
    %6.  Max Force
    f_max = max(abs(fData)) ;
    check = 5000 - f_max; %% must be positive
    if check >= 0 
        F_grade = 'Applied Force:                 Full Credit';
    end 
    
    % Display Comments
    MSGBOX = msgbox({'Ramp Comments:','',ST_grade,OS_grade,SS_grade,TD_grade,PA_grade,F_grade},'Comments');
    ah = get( MSGBOX, 'CurrentAxes');
    ch = get( ah, 'Children');

end

% Sinusoidal input.
if Profile == 2 
    SS_grade = 'Suspension Stroke:              No Credit';
    TD_grade = 'Tire Deflection:                No Credit';
    PA_grade = 'Passenger Acceleration:         No Credit';
    F_grade =  'Applied Force:                  No Credit';

    %1. Max SS
    ss_max = max(abs(SSData(5000:10001)));
    check = 0.12 - ss_max; %% must be positive
    if check >= 0
        SS_grade = 'Suspension Stroke:         Full Credit';
    end
        
    %2. Max Tire Deflection
    td_max = max(abs(TDData(5000:10001)));
    check = 0.03 - td_max; %% must be positive
    if check >= 0
        TD_grade = 'Tire Deflection:                Full Credit';
    end
        
    %3. Max Passenger Acceleration
    pa_max = max(abs(PAData(5000:10001)));
    check1 = 2 - pa_max ; %% must be positive
    check2 = 3 - pa_max ; %% must be positive
    if check1 >= 0
        PA_grade = 'Passenger Acceleration: Full Credit';
    elseif check2 >= 0
        PA_grade = 'Passenger Acceleration: Half Credit';
    end

    %4.  Max Force
    f_max = max(abs(fData(5000:10001))) ;
    check = 5000 - f_max; %% must be positive
    if check >= 0
       F_grade = 'Applied Force:                 Full Credit';
    end
    % Display Comments
    MSGBOX = msgbox({'Sinusoid Comments:','',SS_grade,TD_grade,PA_grade,F_grade},'Comments');
    ah = get( MSGBOX, 'CurrentAxes');
    ch = get( ah, 'Children');  
 end

% Rectified sinusoidal input
if Profile == 3
    SS_grade = 'Suspension Stroke:              No Credit';
    TD_grade = 'Tire Deflection:                No Credit';
    PA_grade = 'Passenger Acceleration:         No Credit';
    F_grade =  'Applied Force:                  No Credit';
    
    %1. Max SS
    ss_max = max(abs(SSData));
    check = 0.12 - ss_max; %% must be positive
    if check >= 0
        SS_grade = 'Suspension Stroke:         Full Credit';
    end
    
    %2. Max Tire Deflection
    td_max = max(abs(TDData));
    check = 0.03 - td_max; %% must be positive
    if check >= 0
        TD_grade = 'Tire Deflection:                Full Credit';
    end
    
    %3. Max Passenger Acceleration
    pa_max = max(abs(PAData));
    check1 = 2 - pa_max ; %% must be positive
    check2 = 3 - pa_max ; %% must be positive
    if check1 >= 0
        PA_grade = 'Passenger Acceleration: Full Credit';
    elseif check2 >= 0
        PA_grade = 'Passenger Acceleration: Half Credit';
    end
    
    %4.  Max Force
    f_max = max(abs(fData));
    check = 5000 - f_max; %% must be positive
    if check >= 0
        F_grade = 'Applied Force:                 Full Credit';
    end
    
    % Display Comments
    MSGBOX = msgbox({'Rectified Sinusoid Comments:','',SS_grade,TD_grade,PA_grade,F_grade},'Comments');
    ah = get( MSGBOX, 'CurrentAxes');
    ch = get( ah, 'Children');
end

% Random input.
if Profile == 4
    SS_grade = 'Suspension Stroke:         No Credit';
    TD_grade = 'Tire Deflection:                 No Credit';
    PA_grade = 'Passenger Acceleration:  No Credit';
    F_grade =  'Applied Force:                  No Credit';
    
    %1. Max SS
    ss_max = max(abs(SSData));
    check = 0.13 - ss_max; %% must be positive
    if check >= 0
        SS_grade = 'Suspension Stroke:         Full Credit';
    end
    
    %2. Max Tire Deflection
    td_max = max(abs(TDData));
    check = 0.03 - td_max; %% must be positive
    if check >= 0
        TD_grade = 'Tire Deflection:                Full Credit';
    end
    
    %3. Max Passenger Acceleration
    pa_max = max(abs(PAData));
    check1 = 2 - pa_max ; %% must be positive
    check2 = 3 - pa_max ; %% must be positive
    if check1 >= 0
        PA_grade = 'Passenger Acceleration: Full Credit';
    elseif check2 >= 0
        PA_grade = 'Passenger Acceleration: Half Credit';
    end
    
    %4.  Max Force
    f_max = max(abs(fData));
    check = 5000 - f_max; %% must be positive
    if check >= 0
        F_grade = 'Applied Force:                 Full Credit';
    end
    
    % Display Comments
    MSGBOX = msgbox({'Random Comments:','',SS_grade,TD_grade,PA_grade,F_grade},'Comments');
    ah = get( MSGBOX, 'CurrentAxes');
    ch = get( ah, 'Children');
end
