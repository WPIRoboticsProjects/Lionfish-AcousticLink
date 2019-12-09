% M = csvread( "modulated_binary.csv" );
M = csvread( "processedSamples.csv" );
t = M(:,1);
y = M(:,2);
figure(1)
plot(t(1:300),y(1:300))

fs = 100000;
n = length(y);
ftY = fft(y);
ftY0 = fftshift(ftY);         % shift y values
ftY0 = abs(ftY0).^2/ n ;    % 0-centered power

figure(2)
f0 = (-n/2:n/2-1)*(fs/n); % 0-centered frequency range
plot(f0(n/2:n),ftY0(n/2:n),'b')