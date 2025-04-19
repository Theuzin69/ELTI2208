clc

##Constantes (transitores)
Beta = 200;
alpha = Beta / (Beta+1);
VT = 0.026;
VA = 100;
VBE = 0.7;

##Constantes (circuito)
VCC = 20;
VEE = -20;
RL = 100000;
Vin = 0.01;
IEE = 0.002;

##polarização dos transistores npn
IE = IEE / 2
IC = alpha * IE
IB = IE / (Beta + 1)

####pnp
##IEpnp = IC;
##ICpnp = alpha * IEpnp
##IBpnp = IEpnp / (Beta + 1)

##Pequenos Sinais
gm = IC / VT
rpi = VT / IB
re = VT / IE

##ro
ro3 = VA / IC
ro4 = VA / IC
ro5 = VA / IC
ro6 = VA / IC

##calculo espelho de corrente
RI = (VCC - VEE + VBE) / (IEE * (1 + 2/Beta))

##ganho
ro4ro6 = 1 / (1/ro4 + 1/ro6)
Rout = 1 / (1/ro4ro6 + 1/RL)
RE = gm*Rout / (1028*gm) - 1/gm
AV = gm*Rout / (1 + gm*RE)


