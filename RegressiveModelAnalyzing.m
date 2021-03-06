X = [5.59
5.12
5.78
5.29
5.67
4.26
5.56
5.17
4.71
5.72
5.59
5.67
5.22
6.11
5.59
6.01
5.63
6.35
5.70
5.69
5.28
4.89
5.53
5.12
5.83
6.01
5.56
5.51
5.25
5.93
5.95
4.89
5.93
6.00
5.84
6.56
5.36
5.26
6.14
6.26
5.53
5.02
6.14
5.29
6.16
4.78
5.60
5.56
6.30
5.37 
]

Y = [4.66
4.56
4.88
4.10
4.74
4.07
5.22
4.49
4.26
5.34
5.11
5.21
5.53
4.59
5.17
5.53
5.33
5.48
5.48
5.19
5.09
4.79
5.50
4.58
5.78
5.50
4.43
4.90
4.52
4.65
5.18
4.16
5.63
5.53
5.61
6.01
4.76
4.69
5.64
6.10
5.30
3.97
5.57
4.67
5.77
4.19
5.50
4.93
5.08
5.39 ]

% Amount of elements
n = 50;




% Numerical characteristics
fprintf('Ungrouped sample:')
fprintf('Mean of X\n')
x = 1/n*sum(X)
fprintf('Mean of Y\n')
y = 1/n*sum(Y)
fprintf('Corrected dispersionfor ?\n')
S2X = 1/(n-1)*(sum(X.^2) - n*x^2)
fprintf('Corrected dispersionfor for Y\n')
S2Y = 1/(n-1)*(sum(Y.^2) - n*y^2)
fprintf('COV\n')
s = 0;
for i=1:50
  s=s+X(i)*Y(i);
end
COVXY = 1/(n-1)*(s-n*x*y)
fprintf('Selective correlation coefficient\n')
Po = COVXY/(sqrt(S2X)*sqrt(S2Y))



fprintf('Grouped sample:')
fprintf('Mean of X\n')
x_grouped = 5.62
fprintf('Mean of Y\n')
y_gruoped = 5.06
fprintf('Corrected dispersion for ?\n')
S2X_grouped = 0.243
fprintf('Corrected dispersion for Y\n')
S2Y_grouped = 0.3152
fprintf('COV\n')
COVXY_grouped = 0.506
fprintf('Selective correlation coefficient\n')
Po_grouped = 1.8283


plot(X,Y,'.r')
grid on;hold on;
xo = [4:0.01:7]
yo = 1.1305.*xo-1.2675+2.0106*sqrt(0.0126*(1/50+(xo-5.5856).^2/(49*0.2171)))
plot(xo,yo,'r')
yo = 1.1305.*xo-1.2675-2.0106*sqrt(0.0126*(1/50+(xo-5.5856).^2/(49*0.2171)))
plot(xo,yo,'r')

axis([4.5 6 2.5 6])


% Linear regression Y on X
xcord = [4.25:0.01:6.75];
ycord = 1.1305.*xcord-1.2675;
plot(xcord,ycord,'-b')
% Linear regression ? on ?
xcord = [4.25:0.01:6.75];
ycord = (xcord-1.311)/0.8496;
Qe = 0;
for i=1:50
  Qe = Qe+((1.1305*X(i)-1.2675)-Y(i))^2;
end
fprintf('Residual sum of squares\n')
Qe
fprintf('Qy\n')
Qy = sum(Y.^2)-y*5.0472
fprintf('Determination coefficient\n')
R = 1-Qe/Qy

summa = 0;
N=0;
for i=1:50
if X(i) > 5.5 && X(i) < 6
Y(i);
summa = summa+Y(i);
N = N+1;
end
end
summa;
N;
summa/N;



yimas = [4.07 4.2825 4.6958 5.17 5.4733 6.01];
nmas = [1 4 12 22 10 1];
ximas = [4.25 4.75 5.25 5.75 6.26 6.75];
summa = 0;
for i=1:6
    summa = summa+yimas(i)*nmas(i);
end
res = summa/50;

ximas = [4.25 4.75 5.25 5.75 6.26 6.75];
summa  =0;
for i=1:6
    summa = summa+ximas(i)*nmas(i);
end
res = summa/50;
sx2=0;
for i=1:6;
    sx2=sx2+ximas(i)^2*nmas(i);
end
result = 1/50*(sx2-50*5.64*5.64);

sy2=0;
for i=1:6;
    sy2=sy2+ximas(i)^2*nmas(i);
end
result=1/50*(sy2-50*5.04*5.04);
Kov = (4.25*2.07*1+4.75*4.2825*4+5.25*4.6958*12+5.75*22*5.17+6.25*10*5.4733+6.75*1*6.01-50*5.04*5.64)/50

yj = 0.1029.*ximas+4.4598
localsum = 0;
for i = 1:50
    if X(i) > 6.5 && X(i)<7
        localsum = localsum+(Y(i)-4.9486)^2;
    end
end
localsum;

localsum = 0;
for i = 1:50
    if X(i) > 6.5 && X(i)<7
        localsum = localsum+1*(Y(i)-4.9486)^2;
    end
end
localsum














