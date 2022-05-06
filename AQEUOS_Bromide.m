%AQUEOS BROMIDE DEGREDATION
%BY Andrew 
% Given experimental data
t_exp = 10:10:60;
c_exp = [3.4 2.6 1.6 1.3 1.0 0.5];
plot(t_exp,c_exp,'rd')
0:0.5:70
% Expected function
t = [0:0.5:70]
c_func = 4.84*exp(-.034*t)
plot(t,c_func,'g--')
hold on 
plot(t_exp,c_exp,'rd')
hold off
legend('concentration(t)','exp_concentration')
xlabel('time(min)')
ylabel('concentration(ppm)')