%initial value
y0 = [.1;.1];
%parameter
global u;
u = 0;
t_end = 20;

[x,y] = meshgrid(-10:1:10, -10:1:10);
xdot = u*x + y - x.^2;
ydot = -x + u*y + 2*x.^2;
figure(1)
quiver(x,y,xdot,ydot,'b')
hold on

options = odeset('RelTol',1e-8);
[t,Y] = ode45(@exp,[0 t_end],y0,'r-');

plot(Y(:,1),Y(:,2),'b-','LineWidth',2)
hold on
set(gca,'Fontsize',14,'LineWidth',1)
xlabel('x')
ylabel('y')

% x = -2:.2:2;
% y = -2:.2:2;
% x1 = y*0+sqrt(u);
% x2 = y*0-sqrt(u);
% y1 = x*0;
% plot(x,y1,'r--');
% plot(x1,y,'r--');
% plot(x2,y,'r--');
axis([-10.1 10.1 -10.1 10.1])

figure(2)
plot(t,Y(:,1),'b-','LineWidth',2)
set(gca,'Fontsize',14,'LineWidth',1)
ylabel('x')
xlabel('t')

function dydt = exp(t,y)
global u;
dydt = [u*y(1) + y(2)- y(1).^2; -y(1)+u*y(2)+2*y(1).^2];
end

