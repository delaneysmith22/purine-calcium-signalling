function dS = fullmodel(t,S,ATP)
%% Plasma Membrane Fluxes

J_PMCA = JPMCA(S(4)); % flux through PMCA pumps
J_P2X7 = JP2X7_new(S(7),S(8),S(9),S(10),-0.06); % flux through P2X7Rs
J_leakin = 0.15; % constant inward lead flux
J_in = J_leakin + J_P2X7; % net inward flux across the plasma membrane

%% ER Fluxes

% Parameters
gamma = 9; % cytosol/ER volume ratio

% Fluxes
J_SERCA = JSERCA(S(4)); % flux through SERCA pumps
J_ERleak = JERLEAK(S(4),S(1)); % leak through the ER
[J_IPR,hdot,IP3dot] = IPRsubmodel(t,S(1:4),ATP);
%% Model

fi = 0.01; % proportion of free calcium in the cytosol
fer = 0.025; % proportion of free calcium in the ER

dS = zeros(size(S));

% ER Ca++
dS(1) = fer*gamma*(J_SERCA - J_IPR - J_ERleak);

% h 
dS(2) = hdot;

% IP3
dS(3) = IP3dot;

% Cytosolic Ca
dS(4) =  fi*(J_IPR - J_SERCA + J_ERleak + J_in - J_PMCA);

% P2X7 Markov Models
dS(5:16) = P2X7_newParams(t,S(5:16),ATP);

end
