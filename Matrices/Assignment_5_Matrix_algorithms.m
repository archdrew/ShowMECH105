function [A] = specialMatrix(n,m)
A = zeros(n,m); 
for n =1:n;
for m =1:m;
    if n == 1 
        A(n,m) = j;
    elseif m == 1 
        A(n,m) = i;
    else 
        A(n,m) == A((i-1),j)+A(i,(j-1));
    end 
end 
end 

    
   