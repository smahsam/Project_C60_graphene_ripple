clc, clear
load allT1s.mat
%1Step 2CPU 3PotEng 4KinEng 5Temp 6Lx 7Ly 8Press 
%9v_xc_x 10v_xc_y 11v_xc_z 12c_pe_c60 13c_lennard 14c_ke_c60 
%15v_vc_x 16v_vc_y 17v_vc_z

P=100e3;                        % lag length (time) should be up to N/4 (less than 50 K or =47.5 K)
dt = 1e-3;                      % 0.001 ps time between trajectory points
thermo=200;
tk=[1:P]'*dt*thermo/1000;            % ns
%T= [1,2,3,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21  ];
T= [1,5,10,20,30,35,50,60,75,100,150,200,250,300,400,500,600,700,800,900,1000];

Ti=2;
x(:,:)=imdata(10000:end,9,:);  % throw off 5% of initial data points
y(:,:)=imdata(10000:end,10,:);
N = length(x);                  % number of data points
% t = imdata(1:NT,1);
% r = sqrt(x.^2 + y.^2);
% % csvwrite('xvalue',x)
% acf_x=zeros(P,length(T));

% for k=1:length(T)
%     figure(1)
%     acf_x(:,k) = acf0(r(:,k),P);
% %     acf_x = acf(x(:,k),12);
% %     acf_y = acf(y(:,k),12);
% end
% 
% for k=1:15
% figure(2)
% hold on
% plot(acf_x(:,k))
% end
acf(:,Ti) = acf2(x(:,Ti),y(:,Ti),P);
%acf(:,Ti) = acf(r(:,Ti),P);
% figure(3)
% plot(acf(:,Ti),'.-','LineWidth',3,'MarkerSize',12) % for 30 K
% hold on
% xlabel('lag length','Interpreter','latex')
% ylabel('Position autocorrelation function','Interpreter','latex')
% set(gca,'FontName','Cambria','FontSize',14);
%legend('C60/mono-Gr','show','Location','Best')
figure(4)
plot(tk,acf(:,Ti),'.-','LineWidth',3,'MarkerSize',12) % for 30 K
hold on
xlabel('t(ns)','Interpreter','latex')
ylabel('Position autocorrelation function','Interpreter','latex')
set(gca,'FontName','Cambria','FontSize',14);




clearvars -except P tk Ti
load allT3c.mat
%T= [1,2,3,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21  ];
T= [1,5,10,20,30,35,50,60,75,100,150,200,250,300,400,500,600,700,800,900,1000];

x(:,:)=imdata(10000:end,9,:);   % throw off 5% of initial data points
y(:,:)=imdata(10000:end,10,:);
N = length(x);                 % number of data points
% r = sqrt(x.^2 + y.^2);
% csvwrite('xvalue',x)

% acf_x=zeros(P,length(T));
acf(:,Ti) = acf2(x(:,Ti),y(:,Ti),P);
% acf(:,Ti) = acf(r(:,Ti),P);
% figure(3)
% plot(acf(:,Ti),'.-','LineWidth',3,'MarkerSize',12) % for 30 K
% hold on
% xlabel('lag length','Interpreter','latex')
% ylabel('Position autocorrelation function','Interpreter','latex')
% set(gca,'FontName','Cambria','FontSize',14);
% %legend('C60/2layer-Gr','show','Location','Best')
figure(4)
plot(tk, acf(:,Ti),'.-','LineWidth',3,'MarkerSize',12) % for 30 K
hold on
xlabel('t(ns)','Interpreter','latex')
ylabel('Position autocorrelation function','Interpreter','latex')
set(gca,'FontName','Cambria','FontSize',14);


clearvars -except P tk Ti
load allT2s.mat
%T= [1,2,3,4 ,5 ,6 ,7 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,17 ,18 ,19 ,20 ,21  ];
T= [1,5,10,20,30,35,50,60,75,100,150,200,250,300,400,500,600,700,800,900,1000];

x(:,:)=imdata(10000:end,9,:);   % throw off 5% of initial data points
y(:,:)=imdata(10000:end,10,:);
N = length(x);                 % number of data points
% r = sqrt(x.^2 + y.^2);
% csvwrite('xvalue',x)

% acf_x=zeros(P,length(T));
acf(:,Ti) = acf2(x(:,Ti),y(:,Ti),P);
%acf(:,Ti) = acf(r(:,Ti),P);
% figure(3)
% plot(acf(:,Ti),'.-','LineWidth',3,'MarkerSize',12) % for 30 K
% hold on
% xlabel('lag length','Interpreter','latex')
% ylabel('Position autocorrelation function','Interpreter','latex')
% set(gca,'FontName','Cambria','FontSize',14);
% legend('C60/mono-Gr','C60/2layer-Gr','C60/fixed-Gr','Location','Best')

figure(4)
plot(tk,acf(:,Ti),'.-','LineWidth',3,'MarkerSize',12) % for 30 K
hold on
xlabel('t(ns)','Interpreter','latex')
ylabel('Position autocorrelation function','Interpreter','latex')
set(gca,'FontName','Cambria','FontSize',16);
legend('C60/mono-Gr','C60/2layer-Gr','C60/fixed-Gr','Location','Best')
line([0 20],[1/exp(1) 1/exp(1)],'Color','black','LineStyle','--')
line([0 20],[1 0],'Color','black','LineStyle','-')



