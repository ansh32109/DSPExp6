%Design the Chebyshev filter
[N,W]=cheb1ord(Wp, Ws, Rp, Rs);
[zero, pole]=cheby1(N, -Rp, Wp);
fprintf("Butterworth Order: %d", n);
fprintf("Chebyshev Order: %d", N);
% 
% %Plot the bode plots of both the figures
% bode(sys);
% hold on;
% bode(tf(zero, pole, 1/sampling_rate));
% hold off;
% grid on;
% title("Bode Comparison of the two filters");
% legend("Butterworth", "Chebyshev");

%Plot the impulse and step response of the two filters
subplot(2,1,1);
impulse(sys, 1);
hold on;
impulse(tf(zero, pole, 1/sampling_rate), 1);
hold off;
grid on;
legend("Butterworth","Chebyshev");

subplot(2,1,2);
step(sys, 1);
hold on;
step(tf(zero, pole, 1/sampling_rate), 1);
hold off;
grid on;
legend("Butterworth", "Chebyshev");