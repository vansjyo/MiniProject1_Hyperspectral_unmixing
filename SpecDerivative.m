function [ Xx ] = specDerivative( X, c )
Xx = X;
%bandwodth
DelLambda = 0.0094;
for i = 1:size(X,1)-c
    Xx(i,:) = (X(i,:)-(X(i+c,:)))/(c*DelLambda);
end
end
