function [theta] = ista(y,Phi, lambda, Nmax)
%ISTA function to execute the ista algorithm
%   y = Measurements, Phi = measurement matrix, lambda = regulariser, Nmax
%   = number of times to iterate. Returns the sparse vector

theta =  zeros(size(Phi,2)); %random initialization
alpha = eigs(A'*A,1); %since alpha>eigenvalue of A'A, we can take alpha = max eigenvalue of A'A
for k = 1:Nmax  
    soft_input = theta + Phi'*(y - Phi*theta)/alpha;
    theta = sign(soft_input) .* max(0, abs(soft_input)- lambda/(2*alpha));
end
end

