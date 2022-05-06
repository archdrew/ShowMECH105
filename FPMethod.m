function [root,fx,ea,iter] = FPMethod(func,xl,xu,es,maxit,varargin)
% This function finds the root of a function using false position method
% Inputs: 
    % func: the function being evaluated
    % xl: upper bounds
    % xu: lower bounds
    % es: stoping criterion (desired approximate relative error %) 
    % maxit: the maximum number of iterations 

% outputs: 
    % outputs: root
    % fx = function value at root 
    % ea = approximate relatvie error
    % iter= number of iterations that the code has gone through 


%   In order to find the root or where a functions input produces an
%   output of zero, I have written a code for a false position method. This
%   method takes a user's inputs: anonymous function equation, starting
%   bounds,stopping criterion, and an input for the maximum iterations
%   program will do. If max iterations is not inputed, it will default to
%   50 iterations. If there is no stopping criterion(es) specified, es will
%   default to .0001
if nargin<3 
 error('at least 3 input arguments required'); 
end
if nargin<=4, es = 0.0001; end
if nargin<5, maxit = 50; end 
iter = -1; ea = 100; 
xr = xl;
while (ea > es || iter<maxit) 
   xrold = xr;
   xr = xu - (func(xu)*(xl - xu))/(func(xl)-func(xu)) 
   iter = iter +1
   test = func(xu) * func(xr) 
   
   if test > 0 
 error('no sign change');
    end

  if test < 0   
    xl = xr
    ea = ((abs((xr - xrold)))/xr)*100
       
  else  
   xu = xr
   ea = ((abs((xr - xrold)))/xr)*100
  end

  if ea <= es || iter>=maxit 
      break
  end 
   
root = xr 
fx = func(xr)

end 
end
 if length(x) ~= length (y)
    error('inputs are different lengths'); 
end

fX=x; 
fY=y; 
[fY,i]= sort(gY); 
fX= fX(i); 

n = length(fY); 
i = 1; 
Q1 =fY(round((n+1)/4)); 
Q3 =fY(round((3*n+3)/4)); 
IQR = Q3 - Q1;
lb= Q1-1.5*IQR;
ub= Q3+1.5*IQR
while i<n+1
    if fY(i)>ub || fY(i)<lb
        fY(i) = [];
        fX(i) = [];
        n=n-1; 
    else 
        i = i+1; 
    end
end
avgy = sum(fY)/n; 
avgx= sum(fX)/n; 

sumxy = 0; 
sumx2 = 0; 
sumy2 = 0; 
%Accumalate intermediate sums 
for i = 1:n 
    sumxy = sumxy + fX(i)*fY(i); 
    sumx2 = sumx2 + fX(i)^2; 
    sumy2 = sumy2 + fY(i)^2; 
end 

%compute coefficients 
slope = (n*sumxy-sum(fX)*sum(fY))/(n*sumx2-(sum(fX))^2)
intercept = avgy-slope*avgx
Rsquared =(n*sumxy-sum(fX)*sum(fY))/(sqrt(n*sumx2-(sum(fX))^2)*sqrt(n*sumy2-(sum(fY))^2))
Rsquared = Rsquared^2