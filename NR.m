function beta = NR(x,y,tol)
% Specific Newton Raphson function to find logit coefficients
beta_0 = zeros(size(x,2),1);
gradient_0 = Score(beta_0,x,y);
beta_1 = beta_0 - (Jacob(beta_0,x))\gradient_0;
gradient_1 = Score(beta_1,x,y);

while max(gradient_1) > tol
gradient_0 = gradient_1;
beta_0 = beta_1;
beta_1 = beta_0 - (Jacob(beta_0,x))\gradient_0;
gradient_1 = Score(beta_1,x,y);
disp(gradient_1')
end

beta = beta_1;

end

