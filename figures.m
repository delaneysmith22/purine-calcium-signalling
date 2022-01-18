% Code for Final Report Figures

clc
clear all

%% Figure 3: Comparing Ca recordings to model simulations at various [ATP]

% Simulated Time Series:

IC0 = [110 0.75 0 0.06 1 0 0 0 0 0 0 0 0 0 0 0];
tspan0 = [0:0.1:4000];
[t,T] = ode15s(@(t,S) fullmodel(t,S,0), tspan0, IC0);

IC1 = T(end,:);
tspan1 = [15:0.05:200];

[t,S0] = ode15s(@(t,S) fullmodel(t,S,0.1),tspan1,IC1);
[t,S1] = ode15s(@(t,S) fullmodel(t,S,1),tspan1,IC1);
[t,S2] = ode15s(@(t,S) fullmodel(t,S,10),tspan1,IC1);
[t,S3] = ode15s(@(t,S) fullmodel(t,S,100),tspan1, IC1);
[t,S4] = ode15s(@(t,S) fullmodel(t,S,1000),tspan1, IC1);
[t,S5] = ode15s(@(t,S) fullmodel(t,S,10000),tspan1, IC1);

tspan2 = [0:0.05:14.95];
[t_,T_] = ode15s(@(t,S) fullmodel(t,S,0), tspan2, IC1);

newt = [t_;t];
Ca01uM = [T_(:,4);S0(:,4)];
Ca1uM = [T_(:,4);S1(:,4)];
Ca10uM = [T_(:,4);S2(:,4)];
Ca100uM = [T_(:,4);S3(:,4)];
Ca1mM = [T_(:,4);S4(:,4)];
Ca10mM = [T_(:,4);S5(:,4)];

% Time Series Data:

% 0.1 uM ATP
data01uM_2 = readmatrix('wt_e-7_exp2.xls');
data01uM_3 = readmatrix('wt_e-7_exp3.xls');
data01uM_1 = readmatrix('wt_10^-7.xls');

% 1 uM ATP
data1uM_2 = readmatrix('wt_e-6exp2.xls');
data1uM_3 = readmatrix('wt_e-6_exp3.xls');

% 10 uM ATP
data10uM_2 = readmatrix('wt_e-5exp2.xls');
data10uM_3 = readmatrix('wt_e-5_exp3.xls'); % probably wont use these (not normal)

% 100 uM ATP
data100uM_2 = readmatrix('wt_e-4exp2.xls');
data100uM_3 = readmatrix('wt_e-4_exp3.xls');
data100uM_1 = readmatrix('wt_10^-4.xls');

% 1mM
data1mM_2 = readmatrix('wt_e-3exp2.xls');
data1mM_3 = readmatrix('wt_e-3_exp3.xls');
data1mM_1 = readmatrix('wt_10^-3.xls');

figure(3)
subplot(2,5,1)
plot(data01uM_3(:,1),data01uM_3(:,5),'color','k','linewidth',0.8);
hold on
plot(data01uM_2(:,1),data01uM_2(:,4),'color',[0 0 0]+0.5,'linewidth',0.8);
plot(data01uM_2(:,1),data01uM_2(:,5),'color',[0 0 0]+0.2,'linewidth',0.8);
hold off
ylim([0.5,5]);
xlim([0,max(data01uM_3(:,1))]);
xlabel('Time (s)');
set(gca,'Yticklabel',[]);
set(gca,'Yminortick','on');
ylabel('Ca^2^+ Signal');
title('0.1\muM','FontWeight','normal');
set(gca,'Fontsize',13);
text(0.5,0.5,'A','Fontsize',20,'FontWeight','bold');

subplot(2,5,2)
plot(data1uM_2(:,1),data1uM_2(:,3),'color','k','linewidth',0.8);
hold on
plot(data1uM_2(:,1),data1uM_2(:,2),'color',[0 0 0]+0.5,'linewidth',0.8);
hold off
ylim([0.5,5]);
xlim([0,max(data1uM_2(:,1))]);
xlabel('Time (s)');
set(gca,'Yticklabel',[]);
set(gca,'Yminortick','on');
ylabel('Ca^2^+ Signal');
title('1\muM','FontWeight','normal');
set(gca,'Fontsize',13);

subplot(2,5,3)
plot(data10uM_2(:,1),data10uM_2(:,7),'color',[0 0 0]+0.5,'linewidth',0.8);
hold on
%8
plot(data10uM_3(:,1),data10uM_3(:,12),'color','k','linewidth',0.8);
plot(data10uM_2(:,1),data10uM_2(:,9),'color',[0 0 0]+0.2,'linewidth',0.8);
hold off
ylim([0.5,5]);
xlim([0,max(data10uM_3(:,1))]);
xlabel('Time (s)');
ylabel('Ca^2^+ Signal');
set(gca,'Yticklabel',[]);
set(gca,'Yminortick','on');
title('10\muM','FontWeight','normal');
set(gca,'Fontsize',13);

subplot(2,5,4)
plot(data100uM_2(:,1),data100uM_2(:,7),'color',[0 0 0]+0.2,'linewidth',0.8);
hold on
plot(data100uM_2(:,1),data100uM_2(:,3),'color',[0 0 0] + 0.2,'linewidth',0.8);
plot(data100uM_2(:,1),data100uM_2(:,4),'color',[0 0 0] + 0.5,'linewidth',0.8);
plot(data100uM_1(:,1),data100uM_1(:,2),'color','k','linewidth',0.8);
hold off
ylim([0.5,5]);
xlim([0,max(data100uM_2(:,1))]);
xlabel('Time (s)');
set(gca,'Yticklabel',[]);
set(gca,'Yminortick','on');
ylabel('Ca^2^+ Signal');
title('100\muM','FontWeight','normal');
set(gca,'Fontsize',13);

subplot(2,5,5)
plot(data1mM_3(:,1),data1mM_3(:,14),'color',[0 0 0] + 0.8,'linewidth',0.8);
hold on
plot(data1mM_2(:,1),data1mM_2(:,5),'color',[0 0 0]+0.5,'linewidth',0.8);
hold on
plot(data1mM_1(:,1),data1mM_1(:,3),'color','k','linewidth',0.8);
plot(data1mM_1(:,1),data1mM_1(:,7),'color',[0 0 0]+0.5,'linewidth',0.8);
plot(data1mM_1(:,1),data1mM_1(:,6),'color',[0 0 0]+0.2,'linewidth',0.8);
hold off
ylim([0.5,5]);
xlim([0,max(data1mM_3(:,1))]);
xlabel('Time (s)');
ylabel('Ca^2^+ Signal');
set(gca,'Yticklabel',[]);
set(gca,'YMinorTick','on');
title('1mM','FontWeight','normal');
set(gca,'Fontsize',13);

sgtitle('Data:');

subplot(2,5,6)
plot(newt,Ca01uM,'color','k','linewidth',1);
ylim([0,0.8]);
xlim([0,max(data01uM_3(:,1))]);
ylabel('[Ca^2^+] (\muM)');
xlabel('Time (s)');
title('0.1\muM','FontWeight','normal');
set(gca,'Fontsize',13);
text(0.5,0.5,'B','Fontsize',20,'FontWeight','bold');

subplot(2,5,7)
plot(newt,Ca1uM,'color','k','linewidth',1);
ylim([0,0.8]);
xlim([0,max(data1uM_2(:,1))]);
ylabel('[Ca^2^+] (\muM)');
xlabel('Time (s)');
title('1\muM','FontWeight','normal');
set(gca,'Fontsize',13);

subplot(2,5,8)
plot(newt,Ca10uM,'color','k','linewidth',1);
ylim([0,0.8]);
xlim([0,max(data10uM_3(:,1))]);
ylabel('[Ca^2^+] (\muM)');
xlabel('Time (s)');
title('10\muM','FontWeight','normal');
set(gca,'Fontsize',13);
text(100,0.8,'Simulations:','Fontsize',15);

subplot(2,5,9)
plot(newt,Ca100uM,'color','k','linewidth',1);
ylim([0,0.8]);
xlim([0,max(data100uM_3(:,1))]);
ylabel('[Ca^2^+] (\muM)');
xlabel('Time (s)');
title('100\muM','FontWeight','normal');
set(gca,'Fontsize',13);

subplot(2,5,10)
plot(newt,Ca1mM,'color','k','linewidth',1);
ylim([0,0.8]);
ylabel('[Ca^2^+] (\muM)');
xlabel('Time (s)');
xlim([0,max(data1mM_2(:,1))]);
title('1mM','FontWeight','normal');
set(gca,'Fontsize',13);

%% Figure 5: Effects of IP3R and P2X7R fluxes on maximum Ca dose response curves

% ATP vector
ATP0 = 0.01:0.01:0.09;
ATP1 = 0.1:0.05:9.91;
ATP2 = 10:1:1000;
ATP3 = 1010:10:10000;
ATP = [ATP0,ATP1,ATP2,ATP3];

%% WT DR Curve

% Experimental Data
x = [10^-8,10^-7,10^-6,10^-5,10^-4,10^-3,10^-2]; % ATP vector
C = [0.02127, 0.20929, 0.570036, 0.785443, 0.825199, 1, 0.77348]; % Ca vector
SD = [0.011421, 0.12, 0.113972, 0.069766, 0.04,0,0.067284]; % Standard deviation

% Simulation
Ca_new = zeros(1,length(ATP)); % Ca vector

tspan0 = 0:1:2000;
IC0 = [110 0.75 0 0.06 1 0 0 0 0 0 0 0 0 0 0 0];

[t,F] = ode15s(@(t,S) fullmodel(t,S,0),tspan0,IC0);
IC = F(end,:);
tspan = 0:0.5:120;

for i = 1:length(ATP)
    [t,new] = ode15s(@(t,S) fullmodel(t,S,ATP(i)),tspan,IC);
    Ca_new(i) = max(new(:,4));
    i
    i = i+1;
end

M = max(Ca_new);
m = min(Ca_new);

% Normalize WT Data
WT_norm = (Ca_new - m)./(M-m);

%% X7-KO: Set JP2X7 to 0 before running

Ca_X7 = zeros(1,length(ATP));

tspan0 = 0:1:2000;
IC0 = [110 0.75 0 0.06 1 0 0 0 0 0 0 0 0 0 0 0];

[t,F] = ode15s(@(t,S) fullmodel(t,S,0),tspan0,IC0);
IC = F(end,:);
tspan = 0:0.5:120;

for i = 1:length(ATP)
    [t,new] = ode15s(@(t,S) fullmodel(t,S,ATP(i)),tspan,IC);
    Ca_X7(i) = max(new(:,4));
    i
    i = i+1;
end

M_X7 = max(Ca_X7);
m_X7 = min(Ca_X7);

% Normalize to WT Data
X7_norm = (Ca_X7 - m)./(M-m);

%% Max Fluxes
% ATP vector
P1 = 0.1:0.1:10.9; 
P2 = 20:1:999;
P3 = 1000:10:10000;
P = [P1,P2,P3];

area_X7 = zeros(1,length(P)); % area under P2X7 Flux Curve
maxX7 = zeros(1,length(P)); % maximum P2X7 flux
maxIPR = zeros(1,length(P)); % maximum IP3R flux
maxIPR_noX7 = zeros(1,length(P)); % maximum IP3R flux (X7-KO)

%% Max X7 Flux, X7 Area under Curve, IP3R FLux

IC0 = [110 0.75 0 0.06 1 0 0 0 0 0 0 0 0 0 0 0 0];
tspan0 = [0:0.1:4000];
[t,T] = ode15s(@(t,S) fullmodel(t,S,0), tspan0, IC0);

IC1 = T(end,:);
tspan1 = 0:0.1:10;

for i = 1:length(P)
    [t,c] = ode15s(@(t,S) fullmodel(t,S,P(i)),tspan1,IC1);
    JX = JP2X7_new(c(:,7),c(:,8),c(:,9),c(:,10),-0.06);
    JI = JIPR(c(:,2),c(:,4),c(:,1),c(:,3));
    ax = trapz(t,JX);
    area_X7(i) = ax;
    maxX7(i) = max(JX);
    maxIPR(i) = max(JI);
    i
end

%% Max IP3R Flux (No P2X7): Set JP2X7 to 0 before running

IC0 = [110 0.75 0 0.06 1 0 0 0 0 0 0 0 0 0 0 0 0];
tspan0 = [0:0.1:4000];
[t,T] = ode15s(@(t,S) fullmodel(t,S,0), tspan0, IC0);

IC1 = T(end,:);
tspan1 = 0:0.1:10;

for i = 1:length(P)
    [t,c] = ode15s(@(t,S) fullmodel(t,S,P(i)),tspan1,IC1);
    JI = JIPR(c(:,2),c(:,4),c(:,1),c(:,3));
    maxIPR_noX7(i) = max(JI);
    i
end

%% Rate of P2X7 Decay

%% Rate of P2X7 Desensitization: Make sure J_P2X7 is not 0

IC0 = [110 0.75 0 0.06 1 0 0 0 0 0 0 0 0 0 0 0 0];
tspan0 = [0:0.1:4000];
[t,T] = ode15s(@(t,S) fullmodel(t,S,0), tspan0, IC0);

IC1 = T(end,:);
tspan1 = 0:0.1:200;

A1 = 100:1:999;
A2 = 1000:10:10000;
A= [A1,A2];
t_half_vec = zeros(1,length(A));
for i = 1:length(A)
    [t,c] = ode15s(@(t,S) fullmodel(t,S,A(i)),tspan1,IC1);
    JX = JP2X7_new(c(:,7),c(:,8),c(:,9),c(:,10),-0.06);
    max_JX = max(JX);
    max_index = find(JX == max_JX);
    exact_half_max = max_JX/2;
    diff = abs(JX-exact_half_max);
    closest = min(diff);
    half_max_index = find(diff == closest);
    t_half_vec(i) = t(half_max_index)-t(max_index);
    i
end

A_new = [];
t_half_new = [];
for i = 1:length(A)
    if t_half_vec(i) > 0
        t_half_new = [t_half_new,t_half_vec(i)];
        A_new = [A_new,A(i)];
    end
    i
end
        

%%

% Shading in dips
XData = [ATP(207)/10^6 ATP(207)/10^6 ATP(422)/10^6 ATP(422)/10^6 ]; % First Dip X Values 
XData2 = [ATP(1358)/10^6 ATP(1358)/10^6 ATP(end)/10^6 ATP(end)/10^6]; % Second Dip X Values
YData = [0 1 1 0]; %  Y Values for DR Curve (panel A)
YData2 = [0 60 60 0]; % Y Values for P2X7 flux curve (panel C)
YData3 = [0 300 300 0]; % Y Values P2X7 area curve (panel B)

figure(5)

%DR CURVE (A)
subplot(2,4,[1,2,5,6])
plot(ATP/10^6,WT_norm,'color','k','linewidth',0.8);
hold on
plot(ATP/10^6,X7_norm,'--','color','r','linewidth',0.8);
scatter(x,C,'filled','markerfacecolor','k');
p = patch(XData,YData,'k');
p2 = patch(XData2,YData,'k');
set(p,'facealpha',0.05);
set(p2,'facealpha',0.2);
errorbar(x,C,SD,'vertical','linestyle','none','color','k','linewidth',0.8);
hold off
set(gca,'Xscale','log','Fontsize',15);
%set(legend,'Fontsize',14);
xlabel('ATP (M)');
ylabel('Normalized Calcium Response');
%legend('WT Simulation','X7-KO Simulation','WT Data');
ylim([0,1]);
title('A','fontweight','bold','fontsize',20);

% P2X7 Area under Curve (B)
subplot(2,4,3)
plot(P/10^6,area_X7,'color','k','linewidth',0.8);
ylabel('Area (\muM)');
p = patch(XData,YData3,'k');
set(p,'facealpha',0.05);
p2 = patch(XData2,YData3,'k');
set(p2,'facealpha',0.2);
xlabel('ATP (M)');
set(gca,'Xscale','log','Fontsize',15);
title('B','fontweight','bold','fontsize',20);
xlim([10^-8,10^-2]);

% Max P2X7 Flux (C)
subplot(2,4,4) 
plot(P/10^6,maxX7,'color','k','linewidth',0.8);
ylabel('Max J_P_2_X_7 (\mu/s)');
xlabel('ATP (M)');
p = patch(XData,YData2,'k');
set(p,'facealpha',0.05);
p2 = patch(XData2,YData2,'k');
set(p2,'facealpha',0.2);
set(gca,'Xscale','log','Fontsize',15);
title('C','fontweight','bold','fontsize',20);
xlim([10^-8,10^-2]);
ylim([0,50]);

% JIPR max (D)
subplot(2,4,7)
plot(P/10^6,maxIPR,'color','k','linewidth',0.8)
hold on
plot(P/10^6,maxIPR_noX7,'--','color','r','linewidth',0.8);
p = patch(XData,YData2,'k');
set(p,'facealpha',0.05);
p2 = patch(XData2,YData2,'k');
set(p2,'facealpha',0.2);
hold off
set(gca,'Xscale','log','Fontsize',15);
ylabel('J_I_P_3_R (\muM) max');
xlabel('ATP (M)');
title('D','fontweight','bold','fontsize',20);
xlim([10^-8,10^-2]);

% time constant decay
subplot(2,4,8)
plot(A_new/10^6,t_half_new,'linewidth',1.2,'color','k');
set(gca,'Xscale','log');
xlabel('ATP (M)');
set(gca,'Fontsize',15);
p2 = patch(XData2,YData3,'k');
set(p2,'facealpha',0.2);
ylabel('t_1_/_2 (s)');
ylim([0,120]);
title('E','fontweight','bold','fontsize',20);


