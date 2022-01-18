function J = JPMCA(Ca)

k_PMCA = 0.45;
v_PMCA = 30;

J = v_PMCA*(Ca.^2./(Ca.^2+k_PMCA^2));

end