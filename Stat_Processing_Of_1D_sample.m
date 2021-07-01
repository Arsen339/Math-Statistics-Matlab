mas = [8.73 10.93 5.37 2.61 6.11 -3.48 5.32 17.78 3.55 8.34 9.09 8.53 6.84 3.12 8.31 7.74 7.33 9.63 5.57 0.33 2.49 10.09 11.82 3.18 -0.47];
mas1 = [1.15 11.72 11.24 10.55 11.52 6.29 7.26 10.20 11.26 19.77 1.40 7.03 8.47 0.39 -1.32 7.29 2.75 6.44 1.45 5.93 6.97 -5.16 10.41 -4.10 7.77];
% Variational series
mass = sort([mas mas1]);
% Length of grouping interval
delta = 4;
% Amount of elements
n = 50;
% Amount of grouping intervals
m=7;


% Centers of grouping intervals
Z = [-4 0 4 8 12 16 20];
% Frequencies of ngrouped elements(all equal to 1/50)
Ungrouped_Freqs=[1/50];
for i=1:n
    Ungrouped_Freqs(i)=1/50;
end
Freqs=hist(mass, sort(Z));


% Hights of Hists
Hist_Heigh=hist(mass, sort(Z))/delta;

% Creating the graphical windows

% Hist window
subplot(2, 2, 2); 
grid on; title('Histogram'); hold on; 
bar(Z, Hist_Heigh, delta/4, 'red');

%Polygon window
subplot(2, 2, 1)
Polygon_Heigh=hist(mass, sort(Z))/(delta*n);
bar(Z, Polygon_Heigh,delta/4, 'red');
grid on; title('Polygon');hold on;
plot(Z, Polygon_Heigh, '-b');

%Grouped empiric sample
subplot(2, 2, 3)
grid on; title('Empirical spreading fun(grouped)');hold on;
Spread_Fun_Args=[0];
for i=1:m
    Spread_Fun_Args(i)=0;
end
%Filling the array of stairs
for i=1:m
    for j=1:i
    Spread_Fun_Args(i)=Spread_Fun_Args(i)+Freqs(j);
    end
end
stairs(Z,Spread_Fun_Args/50)

%Ungrouped empiric function
subplot(2,2,4)
grid on; title('Empirical spreading fun(ungrouped)');hold on;
UnSpread_Fun_Args = [0];
for i=1:n
    UnSpread_Fun_Args(i) = 0;
end
% Filling the array of stairs
for i=1:n
    for j=1:i
      UnSpread_Fun_Args(i) = UnSpread_Fun_Args(i) + Ungrouped_Freqs(j);
    end
end
stairs(mass,UnSpread_Fun_Args)


% Nnumerical characteristics
fprintf('Nnumerical characteristics of ungrouped sample \n')
w = max(mass)-min(mass);
fprintf('Spang= %.1f\n',w)
fprintf('Mode does not exist \n')
hx = median(mass);
fprintf('Median= %.1f\n',hx)
mx = mean(mass);
fprintf('Mean= %.1f\n', mx)
Dx = std(mass);
fprintf('Dispersion= %.1f\n',Dx)
S  = var(mass);
fprintf('Displaced dispersion= %.1f\n', S)
fprintf(' \n')

fprintf('Nnumerical characteristics of grouped sample \n')
w = max(Z) - min(Z);
fprintf('Spang= %.1f\n',w)
dx = mode(Z);
fprintf('Sample mode %.1f\n',8)
hx = median(Z);
fprintf('Median= %.1f\n',7.11)
mx = mean(Z);
fprintf('Mean= %.1f\n', 6.56)
Dx = std(Z);
fprintf('Dispersion= %.1f\n',5.16)
S = var(Z);
fprintf('Displaced dispersion= %.1f\n', 26.09)
fprintf(' \n')













