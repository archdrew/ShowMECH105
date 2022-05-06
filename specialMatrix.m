function [A] = specialMatrix(n,m)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
A = zeros(n,m); 
for i =1:n;
for j =1:m;
    if i == 1 
        A(i,j) = j;
    elseif j == 1 
        A(i,j) = i;
    else 
        A(i,j) = A(i-1,j)+A(i,j-1);
    end 
    if nargin ~=2
        error("needs two input integers")
    end
end
end