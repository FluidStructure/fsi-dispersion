%
% This function plots the dispersion relation for a linear infinite one-sided compliant wall.  
%
%

km = [0.1:0.1:300]'; % The range of k values to plot
cmat = [];          % Initialise the matrix 'cmat' to record values of 'c'
for k = km';
dispsolv
cmat = [cmat;c(1) c(2)];
end

% Plot the wave phase speed (c) against wavenumber (k)
fig1 = figure;
subplot(2,1,1)
plot(km,real(cmat),'k-')
axis([0 300 -50 50])
grid;title('real(c)')
xlabel('k');ylabel('real(c)')
subplot(2,1,2)
plot(km,imag(cmat),'k--')
%axis([0 300 -6 5])
grid;title('imag(c)')
xlabel('k');ylabel('imag(c)')

% Plot the wave group speed (omega = c*k) against wavenumber (k)
fig2 = figure;
subplot(2,1,1)
plot(km,real([km km].*cmat),'k-')
axis([0 300 -5000 5000])
grid;title('k*real(c)')
xlabel('k');ylabel('k*real(c)')
subplot(2,1,2)
plot(km,imag([km km].*cmat),'k--')
%axis([0 300 -700 500])
grid;title('k*imag(c)')
xlabel('k');ylabel('k*imag(c)')
