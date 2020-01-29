%initial value
X0 = [2;2];

%paramters
a = 1;
t_end = 10;

options = odeset('RelTol',1e-8);
[t,X] = ode45(@exp,[0 t_end],X0,options);

%quiver
[x,y] = meshgrid(-2:0.2:2,-2:0.2:2);
xdot = a*x;
ydot = -y;

figure(1)
quiver(x,y,xdot,ydot,'blue');
hold on
plot(X(:,1),X(:,2),'r-')
xlabel('x'),ylabel('y')
title('2D graph')

% %plot
% hold off
% figure(2)
% plot(t,X(:,1))
% xlabel('t'),ylabel('x')
% title('x(t) graph')
% figure(3)
% plot(t,X(:,2))
% xlabel('t'),ylabel('y')
% title('y(t) graph')

%function definition
function dxdt = exp(t,x)
a=1;
dxdt = [a*x(1);-x(2)];
end