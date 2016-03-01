E=X(2);I=X(3);
infect_r=1-(1-infect_pr)^(I/N0*n_meet);
proj=[1-infect_r,0,0,0;
    infect_r,1-1/sigma,0,0;
    0,1/sigma,1-1/gamma,0;
    0,0,1/gamma,1];
%test