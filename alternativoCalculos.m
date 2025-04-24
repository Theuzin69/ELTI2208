clc

##Constantes
Beta = 100;
alpha = Beta / (Beta + 1);
VT = 0.026;

##Estágio 1:
printf("Estágio 1:\n");
##Espelho de Corrente (1)
RI1 = (VCC - VEE + 0.7) / (0.0005 * (1 + 2/Beta))
IEE1 = (VCC - VEE + 0.7) / (RI1 * (1 + 2/Beta))
printf("\n");

##Polarização Q1 e Q2


IE = IEE1 / 2
IC = alpha * IE
IB = IE - IC
printf("\n");

##Pequenos Sinais Q1 e Q2

RC = 2000; ##R1 e R2
gm = IC / VT
rpi = VT / IB
re = VT / IE

AV = -alpha * RC/re
printf("\n");

##Estágio 2:
printf("Estágio 2:\n");
IEE2 = 4*IEE1

##Polarização Q3 e Q4


IE = IEE2 / 2
IC = alpha * IE
IB = IE - IC
printf("\n");

##Pequenos Sinais Q3 e Q4

R3 = 300;
gm = IC / VT
rpi = VT / IB
re = VT / IE

AV = R3 / (2*re)
printf("\n");

