function [support] = SUnGP(D, Y, param)
p = param.desiredIteraitons;
L = param.L;

support = [];
%n=pixels, m=bands
[m,n]=size(Y);
%Normalize columns of matrix
Dn = normc(D);
for j = 1:n
    y = Y(:,j);
    r = y;
    s = [];
    for jj = 1:p
        r0 = r;
        proj = Dn'*normc(r);
        [v indx] = sort(proj, 'descend');
        tt = indx(1:L)';
        temp_s = [tt s];
        a = lsqnonneg(D(:,temp_s),y);
        [val ind] = max(a(1:L,1)); 
        s = [s tt(ind(1,1))];
        %Least-squares solution in presence of known covariance
        a = lscov(D(:,s), y);
        r = y - D(:,s)*a;
        temp_s = [];
    end
    support = [support s'];
end
end