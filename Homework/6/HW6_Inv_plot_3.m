% filename: HW7_InvP_plot_3.m
% BC Chang, Drexel University, on 7/20/2018

% Program running sequence:  MATLAB R2015a or later versions
% 1. HW7_InvP_linear_sf_companion_0.m
% 2. HW7_Inv_sim_2.slx
% 3. HW7_Inv_plot_3.m


figure(1)
subplot(2,2,1)
plot(t,x1,'b-',t,x3,'r-')
xlabel('t'), 
ylabel('x1 and x3')
legend ('x1','x3')
grid on
grid minor

subplot(2,2,2)
plot(t,x2,'b-',t,x4,'r-')
xlabel('t'), 
ylabel('x2 and x4')
legend ('x2','x4')
grid on 
grid minor

subplot(2,2,3)
plot(t,cntrl,'b-')
xlabel('t'), 
ylabel('cntrl')
grid on
grid minor

subplot(2,2,4)
plot(x1,x2)       % plot phase plane trajectory
xlabel('x1'), 
ylabel('x2')
title('Phase trajectory')  % put a title
grid on
grid minor