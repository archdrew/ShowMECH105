%function [L,U,P] = LUfactorizationcode(A)

% This function produces a upper,lower and pivot matrix from coefficient matrix A.
%   The function searchers for the row with largest first column element.
%   It then creates an upper materix using factors to preform forward
%   elimination. During this process, it stores the factors in a lower
%   matrix. 
% inputs: A
% outputs: 
% L= lower matrix 
% U = upper matrix 
% P = pivot matrix 

n = length(A); 
L = zeros(n,n);
U = A; 
P = eye(n,n);

for i = 1:(n-1)
    % This code finds the row with the max element in the ith column 
    [tmp, j] = max(abs(U(i:n,i))); 
    j = j+ (i - 1);
    if (tmp==0)
        error('the matrix is singular');
    end 

    %swap rows 'i' and 'j'
    U([i,j],:)= U ([j,i],:);
    P([i,j],:)= P ([j,i],:);
    L([i,j],:)= L([j,i],:);

    for j = (i+1):n 
        s= -U(j,i)/U(i,i);%factor 
        U(j,:)=U(j,:)+ s*U(i,:); %add factor every column in the ith row 
        L(j,i)= -s; %This stores the factor in a lower matrix 
    end 
end 

L = L + eye(n,n); %add on the identity matrix 
disp(U)
%end 



    
