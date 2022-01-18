function T = Tau_h(IP3,Ca)
a2 = 0.2;

Q = Q2(IP3);
T = 1./(a2*(Q+Ca));
end