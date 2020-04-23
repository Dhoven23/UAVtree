global d Ix Iy
d = 1;
Ix = 1.5;
Iy = Ix;

A = [0 1 0 0; 
     0 0 0 0; 
     0 0 0 1; 
     0 0 0 0];

B = [0 0 0 0;
     0 d/Ix 0 -d/Ix;
     0 0 0 0;
     d/Iy 0 -d/Iy 0];

Q = [1 0 0 0;
     0 1 0 0;
     0 0 1 0
     0 0 0 1];
 
R = 0.001*eye(4);
 
K = lqr(A,B,Q,R);
 
C = [1 0 0 0;
     0 0 0 0;
     0 0 1 0;
     0 0 0 1];
 
D = zeros(size(C,1),size(B,2));

Vd = 0.01*eye(4);
Vn = .001*eye(4);

[L,P,E] = lqe(A,Vd,C,Vd,Vn);
Kf = (lqr(A',C',Vd,Vn))';
sysKF = ss(A-Kf*C,[B Kf],eye(4),0*[B Kf]);

