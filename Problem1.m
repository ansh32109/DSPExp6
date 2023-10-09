%Specify the parameters
alpha = 3;
sampling_rate=720;
Rp=-(alpha);
Wp=10/(sampling_rate/2);   %Edge frequencies are always normalized wrt sampling rate
Rs=40;
Ws=20/(sampling_rate/2);

%Find the butterworth filter order
[n,Wn]=buttord(Wp, Ws, Rp, Rs);

%Design the butterworth filter
[b,a]=butter(n, Wn,"low");

%Generate the transfer function
syms z
numer=poly2sym(b, z);
denom=poly2sym(a, z);
H=numer/denom

%Find the poles of the filter
[z,p,k]=tf2zpk(b,a);
p
if all(abs(p) < 1)
    fprintf('The system is stable.\n');
else
    fprintf('The system is unstable.\n');
end

% %Plot the pole zero plot
% sys=tf(b,a,1/sampling_rate);
% pzplot(sys)
% grid on;

% %Plot the impulse and step response
% impulse(sys, 1);
% hold on;
% step(sys, 1);
% hold off;
% grid on;
% legend("Impulse","Step");

%Plot the bode plot
freq_spec=linspace(0,50,1e3);
bode(sys, 2*pi*freq_spec);
title("Bode Plot (Magnitude and Phase)");
grid on;