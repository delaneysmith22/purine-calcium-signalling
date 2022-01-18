# purine-calcium-signalling
This code is the companion to the research article "High-affinity P2Y2 and low-affinity P2X7 receptor interaction modulates ATP-mediated calcium signalling in murine osteoblasts" published in PLOS Computational Biology here: https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1008872

figures.m

Generates Figures 4, 6 and 7 from the research article.

fullmodel.m

Coded model. Calls external functions corresponding to the calcium flux terms (J___.m), the IP3 receptor sub-model (IPRsubmodel.m), and the P2X7 receptor Markov model (P2X7_newParams.m). 

IPRsubmodel.m

Computes and returns the flux through IP3 receptors, as well as the ode's governing the inactivation variable (h) and IP3 dynamics. Calls helper functions such as 
O_IPR.m, m_inf.m, n_inf.m, h_inf.m, Q2.m, Tau_h.m

All .xls files contain experimental calcium time series data that are plotted alongside the model simulation in Figure 4.
