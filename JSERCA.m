function J = JSERCA(Ca)
 

k_SERCA = 0.105;
v_SERCA = 22.5;
n = 2;

J = v_SERCA*(Ca.^n./(Ca.^n+k_SERCA.^n));

end