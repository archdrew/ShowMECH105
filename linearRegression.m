function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
if length(x) ~= length (y)
    error('inputs are different lengths'); 
end

fX=x; 
fY=y; 
[fY,i]= sort(fY); 
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
end