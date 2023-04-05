function [ i ] = RouletteWheelSelection( P )
%   Roulette Wheel Selection

    r = rand;
    c = cumsum(P);        % Cumulative sum
    
    i = find(r<=c, 1, 'first');     % returns at most the first k indices corresponding to the nonzero entries of X.
    
end

