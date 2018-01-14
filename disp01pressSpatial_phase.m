%
% This function plots the pressure distribution (and scalled wall position and velocity)
% for a specific point on the dispersion relation for a linear infinite one-sided compliant wall.
%
%

nk = 100;
%-------------
cntr = 1;

PUMAT = zeros(nk,6);PDMAT = PUMAT;
kmm = linspace(min(km),max(km),nk);
for k = kmm;  % The range of k values to plot
    for s = [1 2];  % The first or second root of 'c'?

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

        %w = exp(i*k*(x-(cc*t)));             % Wall position
        wd = (-1*i*k*cc);                     % Wall velocity
        wdd = ((k^2)*(cc^2));                 % Wall acceleration

        p1 = (-1*rho)*U*(-1*k*cc);
        p2 = (-1*rho)*(k*(cc^2));
        p3 = (-1*rho*U)*(k*U);
        p4 = (-1*rho*U)*(-1*k*cc);

        
        if s == 1;so = 2;elseif s == 2;so = 1;end
        
        if real(c(s)) > real(c(so))
            PUMAT(cntr,:) = [wd p1 p2 p3 p4 (p1+p2+p3+p4)];
        elseif real(c(s)) < real(c(so))
            PDMAT(cntr,:) = [wd p1 p2 p3 p4 (p1+p2+p3+p4)];
        elseif imag(c(s)) > imag(c(so))
            PUMAT(cntr,:) = [wd p1 p2 p3 p4 (p1+p2+p3+p4)];
        elseif imag(c(s)) < imag(c(so))
            PDMAT(cntr,:) = [wd p1 p2 p3 p4 (p1+p2+p3+p4)];
        end
 
    end
    cntr = cntr + 1;
end

ANGMAT = angle(PUMAT);
%ANGMAT = unwrap(ANGMAT,pi,1);
%ANGMAT = ANGMAT - (2*pi).*(ANGMAT>(pi/2));
%ANGMAT = ANGMAT + (2*pi).*(ANGMAT<(-1*pi/2));

fig3 = figure;
subplot(2,1,1);hold on;
plot(kmm,ANGMAT(:,1),'k--')
plot(kmm,ANGMAT(:,2),'b')
plot(kmm,ANGMAT(:,3),'g')
plot(kmm,ANGMAT(:,4),'m')
plot(kmm,ANGMAT(:,5),'y')
plot(kmm,ANGMAT(:,6),'ro')
hold off
grid
axis([min(km) max(km) -1*pi pi])
title('Phase shift WRT wall position (spatial), -- = wall velocity, UPPER BRANCH')

ANGMAT = angle(PDMAT);

subplot(2,1,2);hold on;
plot(kmm,ANGMAT(:,1),'k--')
plot(kmm,ANGMAT(:,2),'b')
plot(kmm,ANGMAT(:,3),'g')
plot(kmm,ANGMAT(:,4),'m')
plot(kmm,ANGMAT(:,5),'y')
plot(kmm,ANGMAT(:,6),'ro')
hold off
grid
axis([min(km) max(km) -1*pi pi])
title('Phase shift WRT wall position (spatial), -- = wall velocity, LOWER BRANCH')

fig4 = figure;
subplot(2,1,1);hold on;
plot(kmm,-1*angle(PUMAT(:,1)),'k--')
plot(kmm,angle(PUMAT(:,2)) - angle(PUMAT(:,1)),'b')
plot(kmm,angle(PUMAT(:,3)) - angle(PUMAT(:,1)),'g')
plot(kmm,angle(PUMAT(:,4)) - angle(PUMAT(:,1)),'m')
plot(kmm,angle(PUMAT(:,5)) - angle(PUMAT(:,1)),'y')
plot(kmm,angle(PUMAT(:,6)) - angle(PUMAT(:,1)),'ro')
hold off
grid
axis([min(km) max(km) -2*pi 2*pi])

subplot(2,1,2);hold on;
plot(kmm,-1*angle(PDMAT(:,1)),'k--')
plot(kmm,angle(PDMAT(:,2)) - angle(PDMAT(:,1)),'b')
plot(kmm,angle(PDMAT(:,3)) - angle(PDMAT(:,1)),'g')
plot(kmm,angle(PDMAT(:,4)) - angle(PDMAT(:,1)),'m')
plot(kmm,angle(PDMAT(:,5)) - angle(PDMAT(:,1)),'y')
plot(kmm,angle(PDMAT(:,6)) - angle(PDMAT(:,1)),'ro')
hold off
grid
axis([min(km) max(km) -2*pi 2*pi])
title('Phase shift WRT wall position (spatial), -- = wall position')

%print(fig1,'-zbuffer','-depsc','figs/DISP_U22p5.eps')
%print(fig2,'-zbuffer','-depsc','figs/DISP_U22p5_ck.eps')
