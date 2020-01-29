%Strogatz ex 5.1.2
a = 1;

[x,y] = meshgrid(-2:0.2:2,-2:0.2:2);
xdot = a*x;
ydot = -y;

figure(1)
quiver(x,y,xdot,ydot)
