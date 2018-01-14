%
% This function plots the dispersion relation for a linear infinite one-sided compliant wall.  
%
%

%s = 1			% The first or second root of 'c'?
%k = 37; 		% The range of k values to plot
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

% Plot the wave motion
x = linspace(0,3*(2*pi/real(k)),200);
%t = linspace(0,abs(log(2)/(k*imag(cc))),30);
t = linspace(0,abs(pi./((k)*real(cc))),20);
fig3 = figure;hold on;
for tt=t;
w = exp(i*k*(x-(cc*tt)));
plot(x,real(w),'k-');
end
plot(x,real(w),'ko')
hold off;
title(['Tmax = ' num2str(max(max(t))) 's'])
axis tight
