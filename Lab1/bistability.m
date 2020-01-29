x = 0:.01:5;
g = func1(x);
h = func2(x);

plot(x,g,'r-')
hold on
plot(x,h,'g-')
xlabel('x');

%functions definition
function g = func1(x)
a = 0.05;
g = (a+x.^2)./(1+x.^2);
end

function h = func2(x)
k = 0.42;
h = k*x;
end

