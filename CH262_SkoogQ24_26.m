% some housekeeping stuff
register_graphics_toolkit("gnuplot");
available_graphics_toolkits();
graphics_toolkit("gnuplot")
clear; figure(1); clf; figure(2); clf; figure(3); clf
% end of housekeeping

%plot -s 600,500 -f 'svg'
conc=[0.5 1.5 2.5 3.5 4.5];
A=[0.24 0.36 0.44 0.59 0.70];
figure(1)
plot(conc, A,'ko','markersize',4,'markerfacecolor','b')
set(gca,'linewidth',2,'fontsize',11)
xlabel('conc (ppm)'); ylabel('Abs')

%plot -s 600,500 -f 'svg'
[param]=polyfit(conc,A,1); 
slope=param(1)
intercept=param(2)

concforfit=[0:1:5];
bestfit=slope.*concforfit+intercept;

figure(2)
plot(conc, A,'ko','markersize',4,'markerfacecolor','b')
set(gca,'linewidth',2,'fontsize',11)
xlabel('conc (ppm)'); ylabel('Abs')
hold on
plot(concforfit,bestfit,'k','linewidth',2)

%plot -s 600,500 -f 'svg'
Aunknown=0.55;
concunknown=(Aunknown-intercept)/slope
figure(3)
plot(conc, A,'ko','markersize',4,'markerfacecolor','b')
set(gca,'linewidth',2,'fontsize',11)
xlabel('conc (ppm)'); ylabel('Abs')
hold on
plot(concforfit,bestfit,'k','linewidth',2)
plot([0 concunknown],[Aunknown Aunknown],'k--','linewidth',2)
plot([concunknown concunknown],[0 Aunknown],'k--','linewidth',2)