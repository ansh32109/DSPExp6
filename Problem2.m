%Import the data
ECG_data=load("ECG_Data.txt");

%Apply the butterworth filter
fitlered_ecg=filtfilt(b,a,ECG_data);

% Create time vector for plotting
time=(0:length(ECG_data)-1)/sampling_rate;

%Plot the original and filtered signals
subplot(2,1,1)
plot(time, ECG_data);
title("Original ECG");
xlabel("Time(s)");
ylabel("Amplitude");
grid on;
subplot(2,1,2);
plot(time, fitlered_ecg);
title("Filtered ECG Signal");
xlabel("Time(s)");
ylabel("Amplitude");
grid on;