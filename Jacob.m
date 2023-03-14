function J = Jacob(beta, x)
%JACOB is the Jacobian 

f = Lotig(x*beta).*(1 - Lotig(x*beta));

J = -1*(1/size(x,1))*(x'.*f')*x;

end

