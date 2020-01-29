
lag = 6.3;
t_end = 120;

opts = ddeset('RelTol',1e-8,'AbsTol',1e-8);

sol = dde23(@p53de,lag,@p53hist,[0, t_end],opts);
figure(1);
subplot(211), plot(sol.x,sol.y(1,:),'b-','LineWidth',2)
hold on, ylabel('X')
set(gca,'Fontsize',14,'LineWidth',1)
subplot(212), plot(sol.x,sol.y(2,:),'b-','LineWidth',2)
hold on, xlabel('Time (hours)'), ylabel('Y')
set(gca,'Fontsize',14,'LineWidth',1)

figure(2);
plot(sol.y(1,:),sol.y(2,:),'b-','LineWidth',2)
xlabel('p53');
ylabel('Mdm2');
set(gca,'Fontsize',14,'LineWidth',1)
hold on
% --------------------------------------------------------------------------

function s = p53hist(t)
% Const history function
s = [0.5; 0];
end

% --------------------------------------------------------------------------

function dydt = p53de(t,y,Z)
% Differential equations function 
betay = 24;
alphay = 24;
%betax = 2.3;
betax = 4.6;
alphaxy = 120;

ylag = Z(:,1);
dydt = [ betax - alphaxy*y(1)*y(2);
         betay*ylag(1) - alphay*y(2)];
         
end