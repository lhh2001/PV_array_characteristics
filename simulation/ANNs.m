function Vref = ANNs(Ir,T)
temp=[T;Ir];
n = load('net.mat');
input=mapminmax('apply',temp,n.inputps);
output=n.net(input);
tempv=mapminmax('reverse',output,n.outputps);
Vref=tempv;