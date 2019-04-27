function [Y, A_ind, A_val] = createImage(D, p, pixels)
% Uses dirichlet distribution for the abundances
A = [];
ind =[];
for i = 1:pixels
    a = zeros(size(D,2),1);
    %p = randperm(n,k) returns a row vector containing k unique integers
    %selected randomly from 1 to n inclusive
    temp = randperm(size(D,2),p);
    x = dirichletSampling( p );
    ind = [ind temp'];
    for ii = 1:size(temp,2)
        a(temp(ii),1) = x(1,ii);
    end
    A = [A a];
end
A_val = A;
A_ind = ind;
Y = D * A;
end
