%%% Transmission lost
%   - Absorbation lost
%   - Spreading lost
%%% Ambient noise
%% Absorbation Lost
% Marsh and Schulkin formula
clear

S = 35; % 1/1000 from google
A = 2.64*10^(-6);
B = 3.38*10^(-6) ;
P30 = 3.00211 ; % kg/cm2  at 30M
P100 = 9.98359 ;% kg/cm2  at 100M
% ft = 21.9*10^(6 - (1520/ (T + 273) ) ) ;  T in C 
ft10c = 21.9*10^(6 - (1520/ (10 + 273) ) ) ; %khz at 0C
ft30c = 21.9*10^(6 - (1520/ (30 + 273) ) ) ; %khz at 30C

finsP30ft30c =[];
MSlossP30ft30clist = [];
for fin = 10:100
    finsP30ft30c =[finsP30ft30c fin]; %Khz 
    ft = ft30c; P = P30;
    MSlossP30ft30c = 8.68*10^3*( ( S*A*ft*fin^2 )/(ft^2+fin^2) + (B*fin^2)/ft ) * (1- 6.54*10^(-4) * P);
    MSlossP30ft30clist = [MSlossP30ft30clist MSlossP30ft30c ] ;
end 

finsP30ft10c =[];
MSlossP30ft10clist = [];
for fin = 10:100
    finsP30ft10c =[finsP30ft10c fin]; %Khz 
    ft = ft10c; P = P100;
    MSlossP30ft10c = 8.68*10^3*( ( S*A*ft*fin^2 )/(ft^2+fin^2) + (B*fin^2)/ft ) * (1- 6.54*10^(-4) * P);
    MSlossP30ft10clist = [MSlossP30ft10clist MSlossP30ft10c ] ;
end 

finsP100ft10c =[];
MSlossP100ft10clist = [];
for fin = 10:100
    finsP100ft10c =[finsP100ft10c fin]; %Khz 
    ft = ft10c; P = P100;
    MSlossP100ft10c = 8.68*10^3*( ( S*A*ft*fin^2 )/(ft^2+fin^2) + (B*fin^2)/ft ) * (1- 6.54*10^(-4) * P);
    MSlossP100ft10clist = [MSlossP100ft10clist MSlossP100ft10c ] ;
end 

finsP100ft30c =[];
MSlossP100ft30clist = [];
for fin = 10:100
    finsP100ft30c =[finsP100ft30c fin]; %Khz 
    ft = ft30c; P = P100;
    MSlossP100ft30c = 8.68*10^3*( ( S*A*ft*fin^2 )/(ft^2+fin^2) + (B*fin^2)/ft ) * (1- 6.54*10^(-4) * P);
    MSlossP100ft30clist = [MSlossP100ft30clist MSlossP100ft30c ] ;
end 
figure(1)
hold on 
p3030 = plot(finsP30ft30c , MSlossP30ft30clist , 'r');
p3010 = plot(finsP30ft10c , MSlossP30ft10clist , 'b' );
p10030 = plot(finsP100ft30c , MSlossP100ft30clist , '*' );
p10010 = plot(finsP100ft10c , MSlossP100ft10clist , 'o' );
title("Marsh and Schulkin formula with different depth and temperature")
legend([p3030 p3010 p10030 p10010 ],'30m 30C','30m 10c','100m 30c','100m 10c')
xlabel("f [Khz]")
ylabel("dB/km")
hold off 



%Thorp formula
fins =[];
thropLosses = [];
for fin = 0.5:0.5:20
    fins =[fins fin]; %Khz 
    thropLoss = (0.11 * fin^2) / (1+ fin^2) + (44 * fin^2) / (4100 + fin^2);
    thropLosses  = [ thropLosses thropLoss ];
end 
figure(2)
plot(fins,thropLosses);
title("Throp formula loss (should only valid up to 3Khz)")
xlabel("f [Khz]")
ylabel("dB/km")

%% Spreading Lost 

MaxDistance = 141; % max line of sight
beta = 2; % chossing spherical 
distances=[];
SpreadLosts=[];
for distance = 10:5:MaxDistance
    distances =[ distances distance];
    SpreadLosts =[SpreadLosts 10 * beta * log10(distance)];
end
figure(3)
plot(distances,SpreadLosts ,'-o');
title ("Spread losts ")
xlabel("distance [m]")
ylabel("dB")

%% ambient noise




