
function [lb,ub,dim,fobj] = Unimodal_Functions(F)
switch F
    case 'F1' %Sphere
        fobj = @F1;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'F2' %Schwefel's 2.22
        fobj = @F2;
        lb=-10;
        ub=10;
        dim=30;
        
    case 'F3' % Schwefel's 1.2
        fobj = @F3;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'F4' %%Schwefel's 2.21
        fobj = @F4;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'F5' % Generalized Rosenbrock
        fobj = @F5;
        lb=-30;
        ub=30;
        dim=30;
        
    case 'F6' % Step
        fobj = @F6;
        lb=-100;
        ub=100;
        dim=30;
        
    case 'F7' % Quartic
        fobj = @F7;
        lb=-1.28;
        ub=1.28;
        dim=30;
      
        
    case 'F8' %Powell Sum
        fobj = @F8;
        lb=-1;
        ub=1;
        dim=30;
        
    
    case 'F9' %Schwefel's 2.20
        fobj = @F9;
        lb=-100;
        ub=100;
        dim=30;
     
    case 'F10' %Schwefel's 2.23
        fobj = @F10;
        lb=-10;
        ub=10;
        dim=30;
        
    case 'F11' %Brown
        fobj = @F11;
        lb=-1;
        ub=4;
        dim=30;
        
    case 'F12' %Dixon and Price
        fobj = @F12;
        lb=-10;
        ub=10;
        dim=30;
        
     
    case 'F13' %%Powell Singular
        fobj = @F13;
        lb=-4;
        ub=5;
        dim=30;
     
      
    case 'F14'  %Xin-She Yang
        fobj = @F14;
        lb=-20;
        ub=20;
        dim=30;
        
     
    case 'F15' %Sum Squares
        fobj = @F15;
        lb=-10;
        ub=10;
        dim=30;
        
        
     %Unimodal Fixed Dimension Functions
     
     %Beale
    case 'F16'
        fobj = @F16;
        lb=-4.5;
        ub=4.5;
        dim=2;
        
     %Brent
    case 'F17'
        fobj = @F17;
        lb=-10;
        ub=10;
        dim=2;
        
     %Matyas
    case 'F18'
        fobj = @F18;
        lb=-10;
        ub=10;
        dim=2;  
        
     %Schaffer N. 4
    case 'F19'
        fobj = @F19;
        lb=-100;
        ub=100;
        dim=2;  
        
    %Wayburn Seader
    case 'F20'
        fobj = @F20;
        lb=-500;
        ub=500;
        dim=2; 
        
      %Leon
    case 'F21'
        fobj = @F21;
        lb=-1.2;
        ub=1.2;
        dim=2;
        
     %Cube
    case 'F22'
        fobj = @F22;
        lb=-10;
        ub=10;
        dim=2; 
        
     %Zettl
    case 'F23'
        fobj = @F23;
        lb=-5;
        ub=10;
        dim=2;     
        
 end
end

% F1
function o = F1(x)
o=sum(x.^2);
end
% F2
function o = F2(x)
o=sum(abs(x))+prod(abs(x));
end
% F3
function o = F3(x)
dim=size(x,2);
o=0;
for i=1:dim
    o=o+sum(x(1:i))^2;
end
end
% F4
function o = F4(x)
o=max(abs(x));
end
% F5
function o = F5(x)
dim=size(x,2);
o=sum(100*(x(2:dim)-(x(1:dim-1).^2)).^2+(x(1:dim-1)-1).^2);
end
% F6
function o = F6(x)
o=sum(abs((x+.5)).^2);
end
% F7
function o = F7(x)
dim=size(x,2);
o=sum([1:dim].*(x.^4))+rand;
end

% F8 - Powell Sum
function o = F8(x)
n = size(x, 2);
absx = abs(x);
    
o = 0;
for i = 1:n
	o = o + (absx(:, i) .^ (i + 1));
end
end

% F9 - Schwefel 2.20
function o = F9(x)
	o = sum(abs(x), 2);
end

% F10 - Schwefel's 2.23
function o = F10(x)
o=sum(x .^10, 2);
end

% F11 - Brown
function o = F11(x)
dim=size(x,2);
o = 0;
for i = 1:dim-1
    xi1 = x(i+1)^2+1;
    xi = x(i)^2+1;
    o = o + (x(i)^2)^xi1 + (x(i+1)^2)^xi;
end
end

% F12 - Dixon & Price
function o = F12(x)
x1 = x(1);
d = length(x);
term1 = (x1-1)^2;
sum = 0;
for ii = 2:d
	xi = x(ii);
	xold = x(ii-1);
	new = ii * (2*xi^2 - xold)^2;
	sum = sum + new;
end
o = term1 + sum;
end

% F13 - Powell Singular
function o = F13(x)
d = length(x);
sum = 0;
for ii = 1:(d/4)
	term1 = (x(4*ii-3) + 10*x(4*ii-2))^2;
	term2 = 5 * (x(4*ii-1) - x(4*ii))^2;
	term3 = (x(4*ii-2) - 2*x(4*ii-1))^4;
	term4 = 10 * (x(4*ii-3) - x(4*ii))^4;
	sum = sum + term1 + term2 + term3 + term4;
end
o = sum;
end

% F14 - Xin She Yang
function o = F14(x)
   if nargin < 2
       beta = 15;
   end
   if nargin < 3
       m = 5;
   end
   
   o = exp(-sum((x / beta).^(2*m), 2)) - (2 * exp(-sum(x .^ 2, 2)) .* prod(cos(x) .^ 2, 2));
end

% F15 - Sum Squares
function o = F15(x)
n = length(x);
s = 0;
for j = 1:n  
    s=s+j*x(j)^2; 
end
o = s;
end

%Unimodal Fixed Dimension Functions

% F16 - Beale
function o = F16(x)
    n = size(x, 2);
    assert(n == 2, 'Beale''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (1.5 - X + (X .* Y)).^2 + ...
             (2.25 - X + (X .* (Y.^2))).^2 + ...
             (2.625 - X + (X .* (Y.^3))).^2;
end

% F17 - Brent
function o = F17(x)
    n = size(x, 2);
    assert(n == 2, 'Brent''s function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
 
    o = (X+10)^2 + (Y+10)^2 + exp(-X^2 - Y^2);
end

% F18 - Matyas
function o = F18(x)
o=0.26*(x(1)^2+x(2)^2) - 0.48*x(1)*x(2);
end

% F19 - Schaffer N. 4
function o = F19(x)
    n = size(x, 2);
    assert(n == 2, 'Schaffer function N. 4 is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    numeratorcomp = (cos(sin(abs(X .^ 2 - Y .^ 2))) .^ 2) - 0.5; 
    denominatorcomp = (1 + 0.001 * (X .^2 + Y .^2)) .^2 ;
    o = 0.5 + numeratorcomp ./ denominatorcomp;
end

% F20 - Wayburn Seader 3
function o = F20(x) 
    o = 2/3*x(1)^3-8*x(1)^2+33*x(1)-x(1)*x(2)+5+((x(1)-4)^2+(x(2)-5)^2-4)^2;
end


% F21 - Leon
function o = F21(x) 
    n = size(x, 2);
    assert(n == 2, 'Leon function is defined only on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = 100 * ((Y - X.^3) .^2) + ((1 - X) .^2);
end

% F22 - Cube
function o = F22(X) 
        % split input vector X into X1, X2
        X1 = X(1:end-1, :);    X2 = X(2:end, :);
        % output columnsum
        o = sum(  100*(X2 - X1.^3).^2 + (1 - X1).^2);
        o = sum(o);
end

% F23 - Zettl
function o = F23(X) 
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        % output function value
        o = (x1.^2 + x2.^2 - 2*x1).^2 + x1/4;
end



