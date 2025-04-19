clc

##Contantes (circuito)
VCC = 12;
VEE = -12;
IEE = 0.002;
RC = 4700;

Vina = 0.010;
Vinb = 0;


##Contantes (transistores)
Beta = 200;
alpha = Beta / (Beta+1);
VT = 0.026;

##polarização (transistores)
IE = IEE / 2
IC = IE * alpha
IB = IE / (Beta + 1)


##pequenos sinais
gm = IC / VT
rpi = VT / IB
re = VT / IE

##ganho
AV2 = -alpha * RC / re

##calculo espelho de corrente
VBE = 0.7;
VCE = VBE;
Rx = (VCC - VEE + VBE) / (IEE * (1 + 2/Beta))

##calculo de ganho com ro
VA = 100;
ro = VA / IC

VAro = RC/re * ( alpha - (RC*alpha + re)/(RC + ro) )







