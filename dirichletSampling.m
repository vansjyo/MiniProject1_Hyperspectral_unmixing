function [ a ] = dirichletSampling( p )
%Input: p = cardinality of the pixel
%Output: a = values of abundances (according to cardinality)
%This funciton is only for one pixel. Loop for the whole image
b = randi([3 10],1,p);
l = length(b);
n = 1;
a = gamrnd(repmat(b,n,1),1,n,p);
a = a./repmat(sum(a,2),1,p);

end

