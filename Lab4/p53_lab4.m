
lag = 0.9;
%lag = 0.45;
t_end = 120;
%t _end = 200(when trying betax = 0.3)

opts = ddeset('RelTol',1e-8,'AbsTol',1e-8);

sol = dde23(@p53de,lag,@p53hist,[0, t_end],opts);
figure(1);
subplot(311), plot(sol.x,sol.y(1,:),'b-','LineWidth',2)
hold on, ylabel('X')
set(gca,'Fontsize',14,'LineWidth',1)
subplot(312), plot(sol.x,sol.y(2,:),'b-','LineWidth',2)
hold on, ylabel('Y')
set(gca,'Fontsize',14,'LineWidth',1)
subplot(313), plot(sol.x,sol.y(3,:),'b-','LineWidth',2)
hold on, xlabel('Time (hours)'), ylabel('S');
set(gca,'Fontsize',14,'LineWidth',1)
% 
% figure(2);
% plot(sol.y(1,:),sol.y(2,:),'b-','LineWidth',2)
% xlabel('p53');
% ylabel('Mdm2');
% set(gca,'Fontsize',14,'LineWidth',1)
% hold on

% figure(3);
% plot3(sol.y(1,:),sol.y(2,:),sol.y(3,:),'b-','LineWidth',2)
% xlabel('p53');
% ylabel('Mdm2');
% zlabel('S');
% set(gca,'Fontsize',14,'LineWidth',1)
% hold on

% --------------------------------------------------------------------------

function s = p53hist(t)
% Const history function
s = [0; 0.0; 0.5];
end

% --------------------------------------------------------------------------

function dydt = p53de(t,y,Z)
% Differential equations function 
betay = 1.2;
%betay = 0.2;
alphay = 0.8;
%alphay = 3;
betax = 0.9;
%betax = 1.8;
alphaxy = 1.4;
%alphaxy = 10;
betas = 0.9;
%betas = 1.8;
%betas = 0.2;
alphas = 2.7;
%alphas = 20;
%n = 4;
n = 2;

ylag = Z(:,1);
dydt = [ betax*((y(3))^n)/(1+(y(3))^n) - alphaxy*y(2)*y(1);
         betay*ylag(1) - alphay*y(2);
         betas - alphas*y(2)*y(3)];

end