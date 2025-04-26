clc;
clear;

disp('Estágio 1 - Par Diferencial com Carga Ativa')
%% Constantes - Transistores NPN
Beta = 200;
alpha = Beta / (Beta + 1);
VT = 0.026;   % Tensão térmica (V)
VA = 100;     % Tensão Early (V)
Vbe = 0.7;

%% Constantes - Transistores PNP
Betapnp = 200;
alphapnp = Betapnp / (Betapnp + 1);

%% Constantes - Circuito
VCC = 20;     % Fonte positiva (V)
VEE = -20;    % Fonte negativa (V)
RL = 50.25e3;   % Resistência de carga (Ohms)
Vin = 1e-3;   % Sinal de entrada (V)
IEE = 2.5e-3;   % Corrente de referência (A)

%% Polarização dos transistores NPN
IE = IEE / 2;
IC = alpha * IE;
IB = IE / (Beta + 1);

disp('Polarização NPN:')
fprintf('IE = %.4f A\n', IE);
fprintf('IC = %.4f A\n', IC);
fprintf('IB = %.4f A\n\n', IB);

%% Polarização dos transistores PNP
ICpnp = IC;
IEpnp = ICpnp / alphapnp;
IBpnp = IEpnp / (Betapnp + 1);

disp('Polarização PNP:')
fprintf('IEpnp = %.4f A\n', IEpnp);
fprintf('ICpnp = %.4f A\n', ICpnp);
fprintf('IBpnp = %.4f A\n\n', IBpnp);

%% Pequenos sinais
gm = IC / VT;
rpi = VT / IB;
re = VT / IE;

disp('Parâmetros de Pequenos Sinais:')
fprintf('gm = %.4f S\n', gm);
fprintf('rpi = %.2f Ohms\n', rpi);
fprintf('re = %.2f Ohms\n\n', re);

%% Resistência de saída ro para cada transistor
ro1 = VA / IC;
ro2 = VA / IC;
ro3 = VA / IC;
ro4 = VA / IC;

disp('Resistências de saída (ro):')
fprintf('ro1 = %.2f Ohms\n', ro1);
fprintf('ro2 = %.2f Ohms\n', ro2);
fprintf('ro3 = %.2f Ohms\n', ro3);
fprintf('ro4 = %.2f Ohms\n\n', ro4);

%% Ganho
ro = paralelo(ro2, ro4);
Rout = paralelo(ro,RL);
AV = gm * Rout;

disp('Ganho:')
fprintf('ro equivalente = %.2f Ohms\n', ro);
fprintf('AV = %.2f V/V\n\n', AV);

%% Cálculo do capacitor (estágio 1)
f_corte = 100;  % Frequência de corte desejada (Hz)
C1 = 1 / (2 * pi * f_corte * (ro + RL));

disp('Capacitor de acoplamento (C1):')
fprintf('C1 = %.2e F\n\n', C1);

disp('Estágio 2 - Seguidor de Emissor')
%% Constantes - Transistor NPN
Beta = 200;
alpha = Beta / (Beta + 1);
VT = 0.026;   % Tensão térmica (V)
VA = 100;     % Tensão Early (V)
Vbe = 0.7;

%% Constantes - Circuito
VCC = 20;     % Fonte positiva (V)
RB = 61.75e3;
RE = 5e3;   % Resistência de carga (Ohms)
Vin = 1.028;   % Sinal de entrada (V)

%% Polarização do transistor NPN
IB = (VCC - 0.7) / (RB + Beta + 1);
IB = 18.12e-6;
IE = IB * (Beta + 1);
IC = IB * Beta;

disp('Polarização NPN:')
fprintf('IE = %.4f A\n', IE);
fprintf('IC = %.4f A\n', IC);
fprintf('IB = %.4f A\n\n', IB);

%% Pequenos sinais
gm = IC / VT;
rpi = VT / IB;
re = VT / IE;

disp('Parâmetros de Pequenos Sinais:')
fprintf('gm = %.4f S\n', gm);
fprintf('rpi = %.2f Ohms\n', rpi);
fprintf('re = %.2f Ohms\n\n', re);

%% ro
ro = VA / IC;

disp('ro:')
fprintf('ro = %.2f Ohms\n\n', ro);

%% Impedância de Entrada
REo = paralelo(RE,ro);
Zb = rpi + (Beta + 1) * REo;
Zin = paralelo(RB,Zb);


disp('Impedância de entrada (Zin):')
fprintf('Zin = %.2f Ohms\n\n', Zin);

%% Impedância de Saída
Zo = paralelo((1/gm),REo);


disp('Impedância de saída (Zo):')
fprintf('Zo = %.2f Ohms\n\n', Zo);

%% Ganho
AV = REo / (1/gm + REo);


disp('Ganho:')
fprintf('AV = %.2f V/V\n', AV);







