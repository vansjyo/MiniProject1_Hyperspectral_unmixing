%% load data set  Rcuprite

load  '..\..\datasets\Rcuprite'
[B,n] = size(Y);

[w Rw] = estNoise(Y);
Rx = (Y-w)*(Y-w)'/n ;

[U,S] = svd(Rx);
S = max(0,diag(S));

SNR_SD3 = S./diag(U'*Rw*U);



