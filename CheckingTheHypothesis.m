mas=[8.73 10.93 5.37 2.61 6.11 -3.48 5.32 17.78 3.55 8.34 9.09 8.53 6.84 3.12 8.31 7.74 7.33 9.63 5.57 0.33 2.49 10.09 11.82 3.18 -0.47];
mas1=[1.15 11.72 11.24 10.55 11.52 6.29 7.26 10.20 11.26 19.77 1.40 7.03 8.47 0.39 -1.32 7.29 2.75 6.44 1.45 5.93 6.97 -5.16 10.41 -4.10 7.77];
%variational series
mass=sort([mas mas1]);
%Numerical characteristics
fprintf('Numerical characteristics of ungrouped sample \n')
w=max(mass)-min(mass);
fprintf('Spang= %.1f\n',w)
fprintf('Selective mode does not exist \n')
hx=median(mass);
fprintf('Median= %.1f\n',hx)
mx=mean(mass);
fprintf('Mean= %.1f\n', mx)
Dx=std(mass);
fprintf('Dispersion= %.1f\n',Dx)
S=var(mass);
fprintf('Mixed dispersion= %.1f\n', S)
fprintf(' \n')
[m,sigma,m_int,sigma_int]=normfit(mass,0.07)
[m,sigma,m_int,sigma_int]=normfit(mass,0.05)
[m,sigma,m_int,sigma_int]=normfit(mass,0.03)
[m,sigma,m_int,sigma_int]=normfit(mass,0.01)
