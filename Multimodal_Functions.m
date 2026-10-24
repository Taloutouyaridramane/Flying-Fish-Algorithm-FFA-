function [lb,ub,dim,fobj] = Multimodal_Functions(F)
switch F
    
        
    case 'F1' % Generalized Schwefel
        fobj = @F1;
        lb=-500;
        ub=500;
        dim=30;
        
    case 'F2' %Rastrigin
        fobj = @F2;
        lb=-5.12;
        ub=5.12;
        dim=30;
        
    case 'F3' % Ackley
        fobj = @F3;
        lb=-32;
        ub=32;
        dim=30;
        
    case 'F4' %Griewank
        fobj = @F4;
        lb=-600;
        ub=600;
        dim=30;
        
    case 'F5' %Generalized Penalized
        fobj = @F5;
        lb=-50;
        ub=50;
        dim=30;
        
    case 'F6' %Generalized Penalized
        fobj = @F6;
        lb=-50;
        ub=50;
        dim=30;
     
    %Rastrigin
    case 'F7'
        fobj = @F7;
        lb=-5.12;
        ub=5.12;
        dim=30;
        
     %Periodic
    case 'F8'
        fobj = @F8;
        lb=-10;
        ub=10;
        dim=30;
    
    %Alpine N. 1
    case 'F9'
        fobj = @F9;
        lb=-10;
        ub=10;
        dim=30;
        
     %Xin-She Yang
    case 'F10'
        fobj = @F10;
        lb=-5;
        ub=5;
        dim=30;
        
     %Ackley
    case 'F11'
        fobj = @F11;
        lb=-32;
        ub=32;
        dim=30;
        
     %Salomon
    case 'F12'
        fobj = @F12;
        lb=-100;
        ub=100;
        dim=30;
        
     %Griewank
    case 'F13'
        fobj = @F13;
        lb=-100;
        ub=100;
        dim=30;
        
     %Xin-She Yang N. 2
    case 'F14'
        fobj = @F14;
        lb=-2*pi;
        ub=2*pi;
        dim=30;
        
     %Quartic Noise
    case 'F15'
        fobj = @F15;
        lb=-1.28;
        ub=1.28;
        dim=30;
        
        
%Multimodal Fixed Dimension Functions
        
    case 'F16' % Shekel's Foxholes
        fobj = @F16;
        lb=-65.536;
        ub=65.536;
        dim=2;
        
    case 'F17' % Kowalik's
        fobj = @F17;
        lb=-5;
        ub=5;
        dim=4;
        
    case 'F18' % Camel 6 Hump
        fobj = @F18;
        lb=-5;
        ub=5;
        dim=2;
         
    case 'F19' %Branin CROS
        fobj = @F19;
        lb=[-5,0];
        ub=[10,15];
        dim=2;
        
    case 'F20' %Goldstien Price
        fobj = @F20;
        lb=-2;
        ub=2;
        dim=2;
        
    case 'F21' %Hartman 3
        fobj = @F21;
        lb=0;
        ub=1;
        dim=3;
        
    case 'F22' %Hartman 6
        fobj = @F22;
        lb=0;
        ub=1;
        dim=6; 
        
    %Egg Crate
    case 'F23'
        fobj = @F23;
        lb=-5;
        ub=5;
        dim=2;
        
     %Ackley N.3
    case 'F24'
        fobj = @F24;
        lb=-32;
        ub=32;
        dim=2;
        
    %Adjiman 
    case 'F25'
        fobj = @F25;
        lb=-1;
        ub=2;
        dim=2;
     
    %Bird
    case 'F26'
        fobj = @F26;
        lb=-2*pi;
        ub=2*pi;
        dim=2;
       
      %Cross-in-tray
    case 'F27'
        fobj = @F27;
        lb=-10;
        ub=10;
        dim=2;
        
     %Bartels Conn
    case 'F28'
        fobj = @F28;
        lb=-500;
        ub=500;
        dim=2;
        
      %Bukin 6
    case 'F29'
        fobj = @F29;
        lb= [-15 -3] ;
        ub= [-5 -3] ;
        dim=2;
        
    %Cross function
    case 'F30'
        fobj = @F30;
        lb=-10;
        ub=10;
        dim=2;
        
    %Easom
    case 'F31'
        fobj = @F31;
        lb=-100;
        ub=100;
        dim=2;
        
    %Giunta
    case 'F32'
        fobj = @F32;
        lb=-1;
        ub=1;
        dim=2;
        
    %Heli Cal Valley
    case 'F33'
        fobj = @F33;
        lb=-10;
        ub=10;
        dim=3;
        
     %Himmelblau
    case 'F34'
        fobj = @F34;
        lb=-5;
        ub=5;
        dim=2;
        
     %Pen Holder
    case 'F35'
        fobj = @F35;
        lb=-11;
        ub=11;
        dim=2;
        
    %Test Tube Holder 
    case 'F36'
        fobj = @F36;
        lb=-10;
        ub=10;
        dim=2;
        
     %Shubert
    case 'F37'
        fobj = @F37;
        lb=-10;
        ub=10;
        dim=2;
        
    %Shekel
    case 'F38'
        fobj = @F38;
        lb=0;
        ub=10;
        dim=4;
        
    %Three-Hump Camel
    case 'F39'
        fobj = @F39;
        lb=-5;
        ub=5;
        dim = 2;
    
 end
end


% F1
function o = F1(x)
o=sum(-x.*sin(sqrt(abs(x))));
end
% F2
function o = F2(x)
dim=size(x,2);
o=sum(x.^2-10*cos(2*pi.*x))+10*dim;
end
% F3
function o = F3(x)
dim=size(x,2);
o=-20*exp(-.2*sqrt(sum(x.^2)/dim))-exp(sum(cos(2*pi.*x))/dim)+20+exp(1);
end
% F4
function o = F4(x)
dim=size(x,2);
o=sum(x.^2)/4000-prod(cos(x./sqrt([1:dim])))+1;
end
% F5
function o = F5(x)
dim=size(x,2);
o=(pi/dim)*(10*((sin(pi*(1+(x(1)+1)/4)))^2)+sum((((x(1:dim-1)+1)./4).^2).*...
(1+10.*((sin(pi.*(1+(x(2:dim)+1)./4)))).^2))+((x(dim)+1)/4)^2)+sum(Ufun(x,10,100,4));
end
% F6
function o = F6(x)
dim=size(x,2);
o=.1*((sin(3*pi*x(1)))^2+sum((x(1:dim-1)-1).^2.*(1+(sin(3.*pi.*x(2:dim))).^2))+...
((x(dim)-1)^2)*(1+(sin(2*pi*x(dim)))^2))+sum(Ufun(x,5,100,4));
end

% F7 - Rastrigin
function o = F7(x)
dim=size(x,2);
o=sum(x.^2-10*cos(2*pi.*x))+10*dim;
end
% F8 - Periodic
function o = F8(x)
    sin2x = sin(x) .^ 2;
    sumx2 = sum(x .^2, 2);
    o = 1 + sum(sin2x, 2) -0.1 * exp(-sumx2);
end

% F9 - Alpine N. 1
function o = F9(x)
     o = sum(abs(x .* sin(x) + 0.1 * x), 2);
end
% F10 - Xin-She Yang
function o = F10(x)
    n = size(x, 2);
    o = 0;
    for i = 1:n
        o = o + rand * (abs(x(:, i)) .^ i);
    end
end
% F11 - Ackley
function o = F11(x)
    n = size(x, 2);
    ninverse = 1 / n;
    sum1 = sum(x .^ 2, 2);
	sum2 = sum(cos(2 * pi * x), 2);
    
    o = 20 + exp(1) - (20 * exp(-0.2 * sqrt( ninverse * sum1))) - exp( ninverse * sum2);
end

% F12 - Salomon
function o = F12(x)
    x2 = x .^ 2;
    sumx2 = sum(x2, 2);
    sqrtsx2 = sqrt(sumx2);
    
    o = 1 - cos(2 .* pi .* sqrtsx2) + (0.1 * sqrtsx2);
end

% F13 - Griewank
function o = F13(x)
dim=size(x,2);
o=sum(x.^2)/4000-prod(cos(x./sqrt([1:dim])))+1;
end

% F14 - Xin-She Yang N. 2
function o = F14(x)
    o = sum(abs(x), 2) .* exp(-sum(sin(x .^2), 2));
end

% F15 - Quartic Noise
function o = F15(x)
dim=size(x,2);
o=sum([1:dim].*(x.^4))+rand;
end


%Multimodal Fixed Dimension

% F16
function o = F16(x)
aS=[-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32;,...
-32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32];
for j=1:25
    bS(j)=sum((x'-aS(:,j)).^6);
end
o=(1/500+sum(1./([1:25]+bS))).^(-1);
end
% F17
function o = F17(x)
aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
bK=[.25 .5 1 2 4 6 8 10 12 14 16];bK=1./bK;
o=sum((aK-((x(1).*(bK.^2+x(2).*bK))./(bK.^2+x(3).*bK+x(4)))).^2);
end
% F18
function o = F18(x)
o=4*(x(1)^2)-2.1*(x(1)^4)+(x(1)^6)/3+x(1)*x(2)-4*(x(2)^2)+4*(x(2)^4);
end
% F19
function o = F19(x)
o=(x(2)-(x(1)^2)*5.1/(4*(pi^2))+5/pi*x(1)-6)^2+10*(1-1/(8*pi))*cos(x(1))+10;
end
% F20
function o = F20(x)
o=(1+(x(1)+x(2)+1)^2*(19-14*x(1)+3*(x(1)^2)-14*x(2)+6*x(1)*x(2)+3*x(2)^2))*...
    (30+(2*x(1)-3*x(2))^2*(18-32*x(1)+12*(x(1)^2)+48*x(2)-36*x(1)*x(2)+27*(x(2)^2)));
end
% F21
function o = F21(x)
aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end
% F22
function o = F22(x)
aH=[10 3 17 3.5 1.7 8;.05 10 17 .1 8 14;3 3.5 1.7 10 17 8;17 8 .05 10 .1 14];
cH=[1 1.2 3 3.2];
pH=[.1312 .1696 .5569 .0124 .8283 .5886;.2329 .4135 .8307 .3736 .1004 .9991;...
.2348 .1415 .3522 .2883 .3047 .6650;.4047 .8828 .8732 .5743 .1091 .0381];
o=0;
for i=1:4
    o=o-cH(i)*exp(-(sum(aH(i,:).*((x-pH(i,:)).^2))));
end
end

% F23 - Egg crate
function o = F23(x)
    n = size(x, 2);
    assert(n == 2, 'The Egg Crate function is defined only on the 2-D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = X.^2 + Y.^2 + (25 * (sin(X).^2 + sin(Y).^2));
end

% F24 - Ackley N.3
function o = F24(x)
    n = size(x, 2);
    assert(n == 2, 'Ackley N. 3 function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = -200 * exp(-0.02 * sqrt((X .^ 2) + (Y .^ 2))) + ...
             5 * exp(cos(3 * X) + sin(3 * Y));
end


% F25 - Adjiman
function o = F25(x)
    n = size(x, 2);
    assert(n == 2, 'Adjiman function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (cos(X) .* sin(Y)) - (X ./ ((Y .^ 2) + 1));
end

% F26 - Bird
function o = F26(x)
    n = size(x, 2);
    assert(n == 2, 'Bird function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = sin(X) .* exp((1 - cos(Y)).^2) + ... 
        cos(Y) .* exp((1 - sin(X)) .^ 2) + ...
        (X - Y) .^ 2;
end


% F27 - Cross in tray
function o = F27(x)
    n = size(x, 2);
    assert(n == 2, 'The Cross-in-tray function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    expcomponent = abs(100 - (sqrt(X .^2 + Y .^2) / pi));
    
    o = -0.0001 * ((abs(sin(X) .* sin(Y) .* exp(expcomponent)) + 1) .^ 0.1);
end

% F28 - Bartels Conn
function o = F28(x)
    n = size(x, 2);
    assert(n == 2, 'Bartels Conn function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = abs((X .^ 2) + (Y .^ 2) + (X .* Y)) + abs(sin(X)) + abs(cos(Y));
end

% F29 - Bukin 6
function o = F29(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        % output function value
        o = 100*sqrt(abs(x2 - 0.01*x1.^2)) + 0.01*abs(x1 + 10);
end

% F30 - Cross function
function o = F30(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        
        % output function value
        o= (abs(sin(x1).*sin(x2).*exp(abs(100 - sqrt(x1.^2 + x2.^2)/pi))) + 1).^(-0.1);
end

% F31 - Easom
function o = F31(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        
        % output function value
        o = -cos(x1).*cos(x2).*exp(-((x1-pi).^2 + (x2-pi).^2));
end

% F32 - Giunta
function o = F32(X)
        % compute sine argument
        arg = 16*X/15 - 1;
        % split input vector X into x1, x2
        if size(X, 1) == 2
            % output function value as rowsum
            o = 0.6 + sum(sin(arg) + sin(arg).^2 + sin(4*arg)/50, 1);
        else
            % output function value as columnsum
            o = 0.6 + sum(sin(arg) + sin(arg).^2 + sin(4*arg)/50, 2);
        end
end


% F33 - Helical Valley
function o = F33(X)
        % split input vector X into x1, x2, x3
        if size(X, 1) == 3
            x1 = X(1, :);  x2 = X(2, :);  x3 = X(3, :);
        else
            x1 = X(:, 1);  x2 = X(:, 2);  x3 = X(:, 3);
        end
        % output function value
        o = 100*((x3 - 10*atan2(x2, x1)/2/pi).^2 + (sqrt(x1.^2 + x2.^2) - 1).^2) + x3.^2;
end

% F34 - Himmelblau
function o = F34(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        % function output
        o = (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2;
end

% F35 - Pen Holder
function o = F35(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        % output function value
        o = -exp(-(abs(cos(x1).*cos(x2).*exp(abs(1 - sqrt(x1.^2 + x2.^2)/pi)))).^(-1));
end

% F36 - Test Tube Holder
function o = F36(X)
        % split input vector X into x1, x2
        if size(X, 1) == 2
            x1 = X(1, :);        x2 = X(2, :);
        else
            x1 = X(:, 1);        x2 = X(:, 2);
        end
        % output function value
        o = -4*abs(sin(x1).*cos(x2).*exp(abs(cos((x1.^2 + x2.^2)/200))));
end

% F37 - Shubert
function o = F37(x)
s1 = 0; 
s2 = 0;
for i = 1:5;   
    s1 = s1+i*cos((i+1)*x(1)+i);
    s2 = s2+i*cos((i+1)*x(2)+i);
end
o = s1*s2;
end

% F38 - Shekel
function o = F38(x)
m = 10;
a = ones(10,4);
a(1,:) = 4.0*a(1,:);
a(2,:) = 1.0*a(2,:);
a(3,:) = 8.0*a(3,:);
a(4,:) = 6.0*a(4,:);
for j = 1:2;
   a(5,2*j-1) = 3.0; a(5,2*j) = 7.0; 
   a(6,2*j-1) = 2.0; a(6,2*j) = 9.0; 
   a(7,j)     = 5.0; a(7,j+2) = 3.0;
   a(8,2*j-1) = 8.0; a(8,2*j) = 1.0;
   a(9,2*j-1) = 6.0; a(9,2*j) = 2.0;
   a(10,2*j-1)= 7.0; a(10,2*j)= 3.6;
end
c(1) = 0.1; c(2) = 0.2; c(3) = 0.2; c(4) = 0.4; c(5) = 0.4;
c(6) = 0.6; c(7) = 0.3; c(8) = 0.7; c(9) = 0.5; c(10)= 0.5;
s = 0;
for j = 1:m;
   p = 0;
   for i = 1:4
      p = p+(x(i)-a(j,i))^2;
   end
   s = s+1/(p+c(j));
end
o = -s;
end

% F39 - Three hump camel
function o = F39(x)
    n = size(x, 2);
    assert(n == 2, 'The Three-hump camel function is only defined on a 2D space.')
    X = x(:, 1);
    Y = x(:, 2);
    
    o = (2 * X .^ 2) - (1.05 * (X .^ 4)) + ((X .^ 6) / 6) + X .* Y + Y .^2;
end

function o=Ufun(x,a,k,m)
o=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end











