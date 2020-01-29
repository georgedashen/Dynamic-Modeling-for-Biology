%stochastic implementation (Gillespie SSA) of constitutive gene expression
%and mRNA degradation

clear all

%set kinetic parameter values
global kr;
global gr;
kr=2;
gr=1.0;

%set initial condition
X=0;
j=1;
t=0;

while t < 300

    %calculate propensities
    a1=kr;
    a2=gr*X(j);
    asum=a1+a2;

    %update counter
    j=j+1;

    %update time
    t(j)=t(j-1)-log(rand(1))/asum;
    
    %state transition
    mu=rand(1);
    if mu < a1/asum
        X(j)=X(j-1)+5;
    else
        X(j)=max(X(j-1)-1,0);
    end

end

figure(1)
stairs(t, X, 'b', 'linewidth', 2)
ylabel('Number of mRNA molecules')
xlabel('Time (t.u.)')
set(gca,'fontsize',14)
% hold on

%kr_def = 1:1:10;
% gr_def = 1:1:5;
% kr = 10.0;
% for i=1:length(gr_def)
%    gr = gr_def(i);
%    [m, c(i)] = mRNA_determ(kr, gr);
%    means(i) = mean(m);
%    figure(i), histogram(m,'FaceAlpha',.4,'FaceColor','b')
%    xlabel('Number of mRNA molecules')
%    ylabel('Number of events')
%    set(gca,'fontsize',14)
%    axis([0 20 0 2000])
% end
% figure(11), plot(gr_def, means, 'bo-')
% xlabel('kr')
% ylabel('means of mRNA number')
% figure(12), plot(gr_def, c, 'bo-')
% xlabel('kr')
% ylabel('coefficient of variant')
figure(2), histogram(X(0.2*length(X):end),'FaceAlpha',.4,'FaceColor','b')
xlabel('Number of mRNA molecules')
ylabel('Number of events')
set(gca,'fontsize',14)
% hold on

% t_end = 300;
% options = odeset('RelTol',1e-8);
% [t2, x2] = ode45(@determ, [0 t_end], 0, options);
% figure(3)
% plot(t2,x2,'b-','LineWidth',2)
% ylabel('Number of mRNA molecules')
% xlabel('Time (t.u.)')

function dxdt = determ(t,x)
    global kr;
    global gr;
    dxdt = kr - gr * x;
end