clc

##Constantes (transitores NPN)
Beta = 200;
alpha = Beta / (Beta+1);
VT = 0.026;
VA = 100;
VBE = 0.7;

##Constantes (transitores PNP)
Betapnp = 200;
alphapnp = Betapnp / (Betapnp+1);

##Constantes (circuito)
VCC = 20;
VEE = -20;
RL = 100000;
Vin = 0.01;
IEE = 0.002;

##polarização dos transistores NPN
IE = IEE / 2
IC = alpha * IE
IB = IE / (Beta + 1)

##polarização dos transistores PNP
ICpnp = IC
IEpnp = ICpnp * (1/alphapnp)
IBpnp = IEpnp / (Betapnp + 1)
printf("\n")

##Pequenos Sinais
gm = IC / VT
rpi = VT / IB
re = VT / IE
printf("\n")

##ro
ro1 = VA / IC
ro2 = VA / IC
ro3 = VA / IC
ro4 = VA / IC
printf("\n")

##ganho
ro = 1 / (1/ro2 + 1/ro4)
AV = gm*ro

printf("\n")

##capacitor (estágio 1)
C1 = 1 / (2*pi*100*ro)


