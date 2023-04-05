function [ child1, child2 ] = Crossover( par1, par2 )
%   Single Point CrossOver

    point = randi([1 length(par1)-2]);    % Uniformly distributed pseudorandom integers
    
    child1 = [par1(1:point) par2(point+1:end)];
    child2 = [par2(1:point) par1(point+1:end)];

 
    
end

