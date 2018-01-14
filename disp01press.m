%
% This function plots the pressure distribution (and scalled wall position and velocity)
% for a specific point on the dispersion relation for a linear infinite one-sided compliant wall.  
%
%

s = 1;			% The first or second root of 'c'?
k = 120; 		% The range of k values to plot
dispsolv

% Select which value of 'c' to use
cc = c(s);

% Plot the wave phase speed (c) against wavenumber (k)
figure(fig1);
subplot(2,1,1);hold on;
plot(k,real(cc),'ko');hold off;
subplot(2,1,2);hold on;
plot(k,imag(cc),'kx');hold off;
xlabel(['k = ' num2str(k) ' , c = ' num2str(cc)])

% Plot the pressure distributions and wave position and velocity (scaled)
x = linspace(0,3*(2*pi/real(k)),200);
t = 0;

w = exp(i*k*(x-(cc*t)));                % Wall position
wd = (-1*i*k*cc)*w;                     % Wall velocity
wdd = ((k^2)*(cc^2))*w;                 % Wall acceleration

p1 = (-1*rho)*U*(-1*k*cc)*w;
p1w = (-1*rho)*U*(wd./i);

p2 = (-1*rho)*(k*(cc^2))*w;
p2w = (-1*rho)*(wdd./k);

p3 = (-1*rho*U)*(k*U)*w;
p3w = (-1*rho*U)*(k*U)*w;

p4 = (-1*rho*U)*(-1*k*cc)*w;
p4w = (-1*rho*U)*(wd./i);

mv = max(max(abs([p1;p2;p3;p4])));
w = (w./max(max(abs(w))))*mv;
wd = (wd./max(max(abs(wd))))*mv;

fig3 = figure;hold on;
plot(x,real(w),'k-');
plot(x,real(wd),'k--');

plot(x,real(p1),'kx');
plot(x,real(p1w),'bx');

plot(x,real(p2),'ko');
plot(x,real(p2w),'bo');

plot(x,real(p3),'k+');
plot(x,real(p3w),'b+');

plot(x,real(p4),'ks');
plot(x,real(p4w),'bs');
hold off;
title(['Tmax = ' num2str(max(max(t))) 's'])
axis tight



