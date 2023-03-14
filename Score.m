function gradient = Score(beta, x, y)
% This is logit score function
    gradient = (1/size(x,1))*x.'*(y - Lotig(x*beta));
end

