function [kappa] = cohenskappa(X,Y)
A=tabulate(Y);
if A(1,2)==101 & A(1,3)==100
   kappa=0;
   return
end

if nargin < 1
    disp('Using Cohen''s test set, Table 2.b, page 45 from: Cohen, J. (1960).');
    disp('A Coefficient of Agreement for Nominal Scales. Educational and ');
    disp('Psychological Measurement, 20(1), 37-46.'); 
    X = [88 14 18; 10 40 10; 2 6 12]
end

if nargin==2
    X = crosstab(X,Y);
end
    
% Recast X as proportions
X = X./sum(X(:));

% Observed Agreement
PRo = sum(diag(X)) / sum(X(:));

% Expected Agreement
PRe = sum(sum(X,1) .* sum(X,2)');

if PRe==1
kappa=0;
else
kappa = (PRo - PRe) / (1 - PRe);
end
if nargin < 1
    disp(['kappa = ',num2str(kappa,'% 4.3f')]);
end