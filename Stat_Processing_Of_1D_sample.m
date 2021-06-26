mas=[8.73 10.93 5.37 2.61 6.11 -3.48 5.32 17.78 3.55 8.34 9.09 8.53 6.84 3.12 8.31 7.74 7.33 9.63 5.57 0.33 2.49 10.09 11.82 3.18 -0.47];
mas1=[1.15 11.72 11.24 10.55 11.52 6.29 7.26 10.20 11.26 19.77 1.40 7.03 8.47 0.39 -1.32 7.29 2.75 6.44 1.45 5.93 6.97 -5.16 10.41 -4.10 7.77];
%Вариационный ряд
mass=sort([mas mas1]);
%длина интервала группировки
delta=4;
%Количество элементов ряда
n=50;
%количество интервалов группировки
m=7;


%Середины отрезков группировки
Z=[-4 0 4 8 12 16 20];
%частоты элементов негруппированного ряда(все равны 1/50)
Ungrouped_Freqs=[1/50];
for i=1:n
    Ungrouped_Freqs(i)=1/50;
end
Freqs=hist(mass,sort(Z));


%Высоты столбцов гистограммы частот
Hist_Heigh=hist(mass,sort(Z))/delta;

%Построение графических окон

%Построение окна для гистограммы
subplot(2,2,2); 
grid on; title('Histogram');hold on; 
bar(Z,Hist_Heigh,delta/4,'red');

%Построение окна для полигона
subplot(2,2,1)
Polygon_Heigh=hist(mass,sort(Z))/(delta*n);
bar(Z,Polygon_Heigh,delta/4,'red');
grid on; title('Polygon');hold on;
plot(Z,Polygon_Heigh,'-b');

%Построение окна для сгруппированной эмпирической функции 
subplot(2,2,3)
grid on; title('Empirical spreading fun(grouped)');hold on;
Spread_Fun_Args=[0];
for i=1:m
    Spread_Fun_Args(i)=0;
end
%Заполнение массива высоты ступенек
for i=1:m
    for j=1:i
    Spread_Fun_Args(i)=Spread_Fun_Args(i)+Freqs(j);
    end
end
stairs(Z,Spread_Fun_Args/50)

%Построение окна для несгруппированной эмпирической функции 
subplot(2,2,4)
grid on; title('Empirical spreading fun(ungrouped)');hold on;
UnSpread_Fun_Args=[0];
for i=1:n
    UnSpread_Fun_Args(i)=0;
end
%Заполнение массива высоты ступенек
for i=1:n
    for j=1:i
      UnSpread_Fun_Args(i)=UnSpread_Fun_Args(i)+Ungrouped_Freqs(j);
    end
end
stairs(mass,UnSpread_Fun_Args)


%Вывод на экран числовых характеристик
fprintf('Числовые характеристики нсегруппированной выборки \n')
w=max(mass)-min(mass);
fprintf('Размах= %.1f\n',w)
fprintf('Выборочной моды не существует \n')
hx=median(mass);
fprintf('Медиана= %.1f\n',hx)
mx=mean(mass);
fprintf('Выборочное среднее= %.1f\n', mx)
Dx=std(mass);
fprintf('Дисперсия= %.1f\n',Dx)
S=var(mass);
fprintf('Смещенная дисперсия= %.1f\n', S)
fprintf(' \n')

fprintf('Числовые характеристики сгруппированной выборки \n')
w=max(Z)-min(Z);
fprintf('Размах= %.1f\n',w)
dx=mode(Z);
fprintf('Выборочная мода %.1f\n',8)
hx=median(Z);
fprintf('Медиана= %.1f\n',7.11)
mx=mean(Z);
fprintf('Выборочное среднее= %.1f\n', 6.56)
Dx=std(Z);
fprintf('Дисперсия= %.1f\n',5.16)
S=var(Z);
fprintf('Смещенная дисперсия= %.1f\n', 26.09)
fprintf(' \n')













