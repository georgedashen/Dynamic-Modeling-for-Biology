% initial condition
x0 = 1;

%parameters
t_end = 5;
options = odeset('RelTol',1e-8);
[t,x] = ode45(@exp_decay,[0 t_end],x0,options);
dt = t_end/(length(t)-1);
t_even = 0:dt:t_end;
[t1,x1] = ode45(@exp_decay,t_even,x0,options);
%plot numerical solution
plot(t,x,'b.-')
hold on
plot(t_even,x1,'r.-')
xlabel('t'), ylabel('x')
legend('modified', 'even spaced');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dxdt = exp_decay(t,x)

k = 2;

dxdt = -k*x;

end