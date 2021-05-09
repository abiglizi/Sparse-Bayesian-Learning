function [x] = sbl(y,Phi, sigma, eps)
%SBL Function to apply the sbl (EM) algorithm
%   y: measurements, Phi: measurement matrix, sigma: noise std. The
%   algorithm is executed till ||y - Phi x|| < eps. Returns x and gamma

gamma = ones(size(Phi, 2),1);
x = randn(size(Phi,2),1);

while norm(y-Phi*x) > eps
    s = inv(Phi'*Phi/sigma^2 + inv(diag(gamma)));
    x = s*(Phi'*y)/sigma^2;
    gamma = x.^2 + diag(s);
end
end