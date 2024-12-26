clear all;
format long
Ms = 2900; % Sprung Mass (kgs)
Mus = 300; % Unsprung Mass (kgs)
Ks = 40000; % Sprung Mass spring constant (N/m) 
Kus = 100000; % Unsprung Mass spring constant (N/m)
Cs = 350; % Damping Coefficient of sprung mass suspension system (N*s/M)
Cus = 7020; % Damping Coefficient of unsprung mass suspension system (N*s/M)
q1 = 1.5e6;
q2 = 7e4;

% q1 = 1.5e5;
% q2 = 7e4;


rho = Ms/Mus;
r = 0;
w1 = sqrt(Kus/Mus);
w2 = sqrt(Ks/Ms);
eta1 = Cus/(2*Mus*w1);
eta2 = Cs/(2*Ms*w2);
A = [0, 1, 0, 0;
    -w1^2, -2*(rho*eta2*w2+eta1*w1), rho*w2*w2, 2*rho*eta2*w2;
    0, -1, 0, 1; 
    0, 2*eta2*w2, -w2^2, -2*eta2*w2];
B = [0;
    1/Mus;
    0;
    -1/Ms];
Q = [q1, 0, 0, 0;
    0, (2*eta2*w2)^2, -2*eta2*w2^3, -(2*eta2*w2)^2;
    0, -2*eta2*w2^3, (q2+w2^4), 2*eta2*w2^3;
    0, -(2*eta2*w2)^2, 2*eta2*w2^3 , (2*eta2*w2)^2];
R = r+1/Ms^2;
N = [0; 
    Cs/Ms^2; 
    -Ks/Ms^2;
    -Cs/Ms^2];
K = lqr(A,B,Q,R,N);
feedback_poles = eig(A-B*K);
C = [0, 0, 1, 0;
    0, Cs/Ms, -w2^2, -Cs/Ms];
G = place(A', C', 4*feedback_poles)';
A_observer = A-G*C;
B_observer = [G B];

    