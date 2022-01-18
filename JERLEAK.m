function J = JERLEAK(Ca,Cer)

x = 15;
y = 0.3;
y = 1;
v_ERleak = x*y*0.002;


J = v_ERleak*(Cer-Ca);

end