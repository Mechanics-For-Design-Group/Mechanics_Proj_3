syms theta t

thetadot=diff(theta,t);
JG=jacobian(theta);
VG=JG*thetadot;