%
% This function plots the dispersion relation for a linear infinite one-sided compliant wall.  
%
%

% Enter some variables:
rhom = 852;         % Density of the wall material
h = 0.01;           % Thickness of the wall material
d = 3000;           % Damping coefficient
K = 1.8399e7;       % Spring constant

E = 53.331e4;
v = 0;
b = E*(h^3)./(12*(1-(v^2)));

rho = 1000;
U = 50;             % Mean flow speed

A = rhom*h*(k^2) + rho*k;
B = (i*k*d) - (2*rho*k*U);
C = rho*k*(U^2) - ((b*(k^4)) + K);

c = roots([A B C]);

