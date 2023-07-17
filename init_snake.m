clc 
clear all
%%
select = 0; % 0 for lateral undulation, 1 for eel-like motion

%% Snake Parameters

l = 0.0625;     % Half length of the link
m = 0.55;       % Mass of each link
n = 7;          % Number of link (if change, change also c param in HydroDynamic simullink block)
j = 1/3*m*l^2;  % Inertia moment of each link
a = 0.0375;     % Radius of the larger section of the cylinder
b = a;          % Radius of the smaller section of the cylinder
P0 = [0 ;0];
t0 = zeros(n,1);

%% Utility

A = fill(n,1);
D = fill(n,-1);
e = ones(n,1);
E = [e zeros(n,1) ; zeros(n,1) e];
In = eye(n);
J = j*In;
L = l*In;
M = m*In;
K = A'*inv(D*D')*D;
H = inv(In-e*e'/n)*K';
V = A'*inv(D*D')*A;

%% Hydrodynamic Parameters
    
rho = 10^3;                                     % Density of the water
Re = 10^5;                                      % Reynolds number for slow motion
Cf = 0.01;                                      % Drag coefficients in x direction of motinon
Cd = 1;                                         % Drag coefficients in y direction of motinon
Ca = 1;                                         % Added mass coefficent in y direction  
Cm = 1;                                         % Added inertia coefficient
ct = 0.5*rho*pi*Cf*(b+a)*l;                     % Drag coefficients in x direction of motinon
cn = 0.5*rho*Cd*4*a*l;                          % Drag coefficients in y direction of motinon
mu_t = 0;                                       % Added mass coefficent in x direction
mu_n = rho*pi*Ca*a^2*2*l;                       % Added mass coefficent in y direction
lmbd1 = (1/12)*rho*pi*Cm*(a^2-b^2)^2*l^3;       % Fluid force parameters
lmbd2 = (1/6)*rho*pi*Cf*(a+b)*l^3;              % Fluid force parameters
lmbd3 = (1/8)*rho*pi*Cf*(a+b)*l^4;              % Fluid force parameters
Vx = ones(n,1)*0.1;                             % Current effect on x
Vy = ones(n,1)*0.1;                             % Current effect on y

%% Functions

function A = fill(n,k)
A = zeros(n-1,n);
    x = 1;
    for i = 1 : n-1
       A(i,x) = 1;
       A(i,x+1) = k;
       x = x+1;
   end
end









