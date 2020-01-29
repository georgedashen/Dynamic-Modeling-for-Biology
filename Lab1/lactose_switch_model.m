% initial condition
x0 = 1;
%x0 = 0.59;

%parameters
%t_end = 5;
t_end = 30;

options = odeset('RelTol', 1e-8);
[t,x] = ode45(@exp,[0 t_end],x0,options);

%plot
plot(t,x,'b.-')
hold on
xlabel('t'), ylabel('x')

%function definition
function dxdt = exp(t,x)
a = 0.05;
%k = 0.3;
k = 0.6;
dxdt = (a+x.^2)./(1+x.^2)-k*x;
end
