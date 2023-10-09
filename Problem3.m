%Specify the parameters
alpha = 3;
[y, Fs]=audioread("instru3.wav");
window_size=1024;
overlap=window_size/2;

%Calculate the spectrogram
[S,F,T]=spectrogram(y, hamming(window_size), overlap, [], Fs);

%Design the butterworth band pass filter
f_cuttoff= 1500;
bandwidth=100;
[n, Wn]=buttord(bandwidth/(Fs/2), f_cuttoff/(Fs/2), Rp, Rs);
[b,a]=butter(1, [(f_cuttoff- bandwidth/2) (f_cuttoff+bandwidth/2)]/(Fs/2), "bandpass");

%Apply the filter to the signal
filtered_signal=filter(b,a,y);
[S_filtered, ~,~]=spectrogram(filtered_signal, hamming(window_size), overlap, [], Fs);

%Plot both the original and filtered signal
subplot(2,1,1)
imagesc(T,F, 10*log10(abs(S)))
axis xy
colormap jet;
title("Original Spectrogram")
xlabel("Time(s)");
ylabel("Frequency(Hz)");
colorbar;

subplot(2,1,2)
imagesc(T,F,10*log10(abs(S_filtered)))
axis xy
colormap jet;
title("Filtered Spectrogram");
xlabel("Time(s)");
ylabel("Frequency(Hz)");
colorbar;

%Save the file in WAV format
audiowrite("filtered_output.wav", filtered_signal, Fs);

%Listen to the file
%sound(y, Fs)
sound(filtered_signal, Fs)