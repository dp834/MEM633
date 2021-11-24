% filename: HW6_InvP_cntrl_1_wFriction.m
% BC Chang, Drexel University, on 11/23/2020
%Program running sequence:  MATLAB R2015a or later versions
% 1. HW6_InvP_cntrl_1_wFriction.m
% 2. HW6_Inv_sim_2_wFriction.slx
% 3. HW6_Inv_plot_3.m

%Part 1:  Choose initial conditions and mofify the feedback controller
%Initial Conditions
x1_0_deg =15   %in degrees
x1_0=x1_0_deg*3.1416/180  % in radians
x3_0=0.2    % in meters

%Control input saturation limits
u_sat=80   %in Newtons

% Choose a state feedback controller F
%Consider at least the following seven choices of F
F=[120  22 20 28]   % desired design
%F=[120  22 20 28]*0.5   % half of the desired control effort
%F=[120 22 0 28]   % no feedback of x3
%F=[90 22 20 28]   % Less feedback of x1
%F=[60 22 20 28]   % unstable
%F=[0 22 20 28]   % unstable
%F=[0 0 0 0]    % no feedback control

%Part 2: 
% Linearized inverted pendulum system
A = [0           1              0           0;
     25.15       0              0           0;
     0           0              0           1;
     -0.42094    0              0           0];

 A_wFriction = [0           1              0           0;
                25.15       -1.6188        0    0.338680;
                0           0              0           1;
                -0.42094    0.027094       0     -0.1376];

B = [     0; 
     -1.3547;
           0;
      0.5504];


%Check the stability of the uncompensated inverted system
eig(A)
eig(A_wFriction)

%Compute the eigenvalues of the closed-loop system
eig(A+B*F)
eig(A_wFriction + B*F)


%Part 3 Simulation
% Using the the following script to run the simulink and plot the
% simulation results
%sim_time=3,
sim_time=10,
sim_options = simset('SrcWorkspace ', 'current',...
    'DstWorkspace ', 'current');
%open('CSDInvP_sim_2_wFriction') % 
%sim('CSDInvP_sim_2_wFriction', [0, sim_time], sim_options); 
open('HW6_Inv_sim_2_wFriction') % 
sim('HW6_Inv_sim_2_wFriction', [0, sim_time], sim_options); 
run('HW6_Inv_plot_3')




      
     



