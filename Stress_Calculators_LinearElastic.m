%% Stress calculations (min and max horizontal stresses; Pore compressibility)


%%%% Arian Velayati, Ph.D.

          
% Nomenclature 
...  v: Poisson ratio; Sv: Vertical Stress; SHmax : Max horizontal stress
...  eff subscript: Effective;  Shmin: Min horizontal stress; 
...  Ep = Plane strain modulus

clc; close; clear;

%%  1-  Assuming linear elasticity and no lateral strains (zero tectonic strain); Determining SHmax and Shmin
% Input
v = input('enter a value for poisson ratio:');
Sveff = input('enter a value for effective stress (MPa):');
Pp = input('enter a value for pore pressure (MPa):');

% Calculations
Shmineff = (v/(1-v)) * Sveff; %MPa
Shmin = Shmineff + Pp; %MPa

%%  2-  Assuming linear elasticity and existing tectonic strains; Determining SHmax and Shmin
% Inputs
v = 0.22; Sveff = 16.74; % MPa
eHmax = 0.002; % Strain in max horizontal stress-direction
ehmin = 0; E = 34482.75 ; % MPa;
Pp = 39.05; %MPa

% Calculations
Ep = E/(1-v^2); %MPa; Denoted as E' in the texts
SHmaxeff = (v/(1-v))*Sveff + Ep*eHmax + v*Ep*ehmin  %MPa
Shmineff = (v/(1-v))*Sveff + v*Ep*eHmax + Ep*ehmin  %MPa
SHmax = SHmaxeff + Pp
Shmin = Shmineff + Pp

%%  3-  Assuming linear elasticity; Determining Pore compressibility
% Inputs
v = 0.2; E = 10; %GPa
phi = 0.2;

E = E*(1000*145); %psi

%Calculations
M = ((1-v)*E)/((1+v)*(1-2*v)) % Bulk contrained modulus (1/psi)
Cbp = 1/M % Bulk volume compressibility (1/psi)
Cpp = Cbp/phi % Pore compressibility (1/psi)