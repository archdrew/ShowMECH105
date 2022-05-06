function [root,ea,iter] = ModSecant_Method(func,xi,d,es,maxiter)
% This function finds the root of a function using the secant method
% this open method of finding the root is beneficial because no derivative
% is reqiuired in the calculations
% Inputs: 
    % x0 = lower bound representing xn -1 
    % x1 = upper bound representing xn 
    % es = stopping criterion
    % maxiter = max # of iterations loop will take 
% Outputs:
    % root = where the funciton crosses the x axis 
    % ea = the approximate error percentage when root found
    % iter = the amount of iterations that were needed to find root 
% if nargin<3
%     error('at least 3 inputs required')
% end 


if nargin <= 4 
    es = .0001; end 
if nargin <= 5 
    maxiter = 50; end 
iter = 0; ea = 100; x2 = xi; 
while (ea > es || iter < maxiter) 
    x1old = x2; 
    x2 = xi - ((func(xi)*(d*xi))/((func(xi+d*xi))-func(xi)))
    xi = x2;
    ea = ((abs((x2 - x1old)))/x2)*100   
     iter = 1 + iter 
    if ea <= es || iter >= maxiter 
        break 
    end 
end