function [J_IPR,hdot,IP3dot] = IPRsubmodel(t,S,A)

% Parameters
alpha_ATP = 0.03;
k_ATP = 1;
n = 1;
k_deg = 0.01;

% Functions
h = h_inf(S(3),S(4)); 
Tau = Tau_h(S(3),S(4)); 
J_IPR = JIPR(S(2),S(4),S(1),S(3));

% inactivation gating variable (h) ODE 
hdot = (h - S(2))./Tau;

% IP3 ODE
IP3dot = (alpha_ATP*(A^n./(A^n + k_ATP^n)) -k_deg.*S(3));

end