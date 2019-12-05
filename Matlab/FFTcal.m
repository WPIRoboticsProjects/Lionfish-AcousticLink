clear

fs = 200000;                                % sample frequency (Hz)
timeLength = 2 ; % 5 second time span

%% generate origional X
t = 0:1/fs:timeLength-1/fs ;                      % 10 second span time vector
x =  0*t;
n = length(x);
for feq = 1000 : 500 : fs/2-100 % caution: don't exceed fs/2
    x =  x  + sin(2*pi*feq*t);
end 
  
ftX = fft(x);
ftX0 = fftshift(ftX);         % shift y values
ftX0 = abs(ftX0).^2/ n ;    % 0-centered power

f0 = (-n/2:n/2-1)*(fs/n); % 0-centered frequency range


figure(1)
xlabel('Frequency')
ylabel('Power')
% plot(f0,ftX0,'b')

% output this to file
xv = vec2mat(x,1);
tv =vec2mat(t,1);
csvwrite("output.csv",[tv xv]);

%% fir Fitler X

firOrder = 20 ;
highFeq = 30000 ;
lowFeq  = 20000;
b = fir1(firOrder,[ (lowFeq/(fs/2)) , (highFeq/(fs/2)) ]);
b2String = sprintf('%f,' , b);
b2String = b2String(1:end-1); % strip final comma
disp("string for b is :");
disp(b2String);

firX = x*0; % zeros can't be used (too big) and just leave the first few blank

n = length(x);

for ii = length(b):length(x)
    localY = 0;
    for jj = 0:length(b)-1
%         disp("inside")
%         disp(ii);
%         disp(jj);
        localY = localY + b(jj+1)*x(ii-jj);
    end
    firX(ii)=localY;
end

ftFirX = fft(firX);
ftFirX0 = fftshift(ftFirX);         % shift y values
ftFirX0 = abs(ftFirX0).^2/n;    % 0-centered power

f0 = (-n/2:n/2-1)*(fs/n); % 0-centered frequency range
figure(1)
hold on 
plot(f0,ftFirX0,'r')
hold off




% feqLow = 20000; 
% feqHigh = 30000;
% orderN =48;
% b = fir1(orderN,[feqLow*2*pi  feqHigh*2*pi]);
% freqz(b,1,512)
