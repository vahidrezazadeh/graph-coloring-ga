function [ child ] = Mutation( par )
%   Mutation
    
    % Case 1: Using Equal Probabilities
    % METHOD=randi([1 3]);
    
    % Case 2: Using Inequal Proabilities
    pSwap = 0.25;
    pReversion = 0.4;
    pInsertion = 1-pSwap-pReversion;
    METHOD = RouletteWheelSelection([pSwap pReversion pInsertion]);

        switch METHOD
        case 1
            child = DoSwap(par);
        
        case 2
            child = DoReversion(par);
            
        case 3
            child = DoInsertion(par);
        end
    
end

function y = DoSwap(x)

    n = numel(x);
    i = randsample(n,2);    %  returns a k-by-1 vector y of values sampled uniformly at random, without replacement, from the integers 1 to n.
    
    y = x;
    y([i(1) i(2)]) = x([i(2) i(1)]);

end

function y = DoReversion(x)

    n = numel(x);
    i = randsample(n,2);
    
    i1 = min(i);
    i2 = max(i);
    
    y = x;
    y(i1:i2) = x(i2:-1:i1);
    
end

function y = DoInsertion(x)

    n = numel(x);
    i = randsample(n,2);

    if i(1) < i(2)
        %   Actual: 1 ... i1-1 i1 i1+1 ..... i2-1 i2 i2+1 ..... n
        % Modified: 1 ... i1-1 i1+1 ..... i2-1 i2 i1 i2+1 ..... n
        
        y = x([1:i(1)-1 i(1)+1:i(2) i(1) i(2)+1:end]);
    else
        %   Actual: 1 ... i2-1 i2 i2+1 ..... i1-1 i1 i1+1 ..... n
        % Modified: 1 ... i2-1 i2 i1 i2+1 ..... i1-1 i1+1 ..... n
        
        y=x([1:i(2) i(1) i(2)+1:i(1)-1 i(1)+1:end]);
    end

end
