load tumor_growth_data.txt
tdata = tumor_growth_data(:,1);
xdata = tumor_growth_data(:,2);

% fitting and plotting
fun = @(x) x(1)./(x(2)+exp(-tdata*x(3))) - xdata;
x0 = [.5,1,1];   %initital guess
options = optimoptions('lsqnonlin','Display','iter');
options.Algorithm = 'levenberg-marquardt';
xf = lsqnonlin(fun,x0,[],[],options)

subplot(3,1,1)
plot(tdata,xdata,'ko')
hold on
xvals = linspace(min(tdata),max(tdata),100);
plot(xvals,xf(1)./(xf(2)+exp(-xvals*xf(3))),'b-','LineWidth',2)
set(gca,'Fontsize',12,'LineWidth',1)
title('Data and fit')
xlabel('time')
ylabel('population')

% residuals
r = xdata - xf(1)./(xf(2)+exp(-tdata*xf(3)));
subplot(3,1,2)
plot(tdata,r,'o')
set(gca,'Fontsize',12,'LineWidth',1)
title('Residuals')
xlabel('Prey density')
ylabel('Residuals')

subplot(3,2,5)
histogram(r)
set(gca,'Fontsize',12,'LineWidth',1)
title('Residuals histogram')
xlabel('Residuals')
ylabel('Number')

% qqplot
subplot(3,2,6)
qqplot(r)
set(gca,'Fontsize',12,'LineWidth',1)
title('QQ plot'), box on
xlabel('Theoretical quantiles')
ylabel('Observed quantiles')

global k1;
global k2;
k1 = xf(3)
k2 = xf(2)*xf(3)/xf(1)

y0 = 2.04;
t_end = 365;
option = odeset("RelTol",1e-8);
[t,y] = ode45(@diffeq,[1 t_end],y0,option);

figure(2)
plot(tdata,xdata,'ko')
hold on
plot(xvals,xf(1)./(xf(2)+exp(-xvals*xf(3))),'b-','LineWidth',2)
plot(t,y,'r--','LineWidth',2)
xlabel('time')
ylabel('population')
legend("data set","analytic solution","ode45 simulation",'Location','southeast')

function dydt = diffeq(t,y)
global k1;
global k2;
dydt = k1*y-k2*y.^2;
end
