function J = JP2X7_new(X7O1,X7O2,X7O3,X7O4,V)

V_osteo = 2.4*10^-12; % osteoblast volume
z = 2; % calcium valence
F = 96485; % Faraday's constant

Ca_flux_X7 = 0.046; % proportion of P2X7 flux that is calcium

g_X7 = 7.5*10^-9; 

G_X7 = g_X7*(X7O1+X7O2+X7O3+X7O4); 

Vss_X7 = 0; % reversal potential

I_X7 = G_X7.*(V-Vss_X7); % current

J = -(10^6)*Ca_flux_X7*I_X7/(z*F*V_osteo); % flux

end