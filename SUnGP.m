pixels = 500;           % Number of pixels in the synthetic image
p = 3;                  % Cardinality or sparsity of the mixed pixel
c = 2;                  % band difference for the derivative
SNR = 50;               % SNR in dBs.


%Algorithm parameters
param.desiredIteraitons = p;    %maximum iterations for criterion (a)
param.L = 50;                   %atoms selected before pruning in each iteration


d = load('dictionary');
D = d.D;
%this containes m=200 bands reflectnace of k=425 endmembers
[m, k] = size(D);
%repmat-create repeated copies of an array
D = D./repmat(sum(D),m,1);
%divides D element-wise by the row vector sum(D) to normalize the
%reflectance