function z=Costfcn(x,ProblemData)
    
    global NFE;
    if (isempty(NFE))
        NFE=0;
    end
    NFE=NFE+1;
    
    z=0;
    N=ProblemData.N;
    Graph=ProblemData.Graph;
    for i=1:N-1
        for j=i+1:N
            if Graph(i,j)==1
                if x(i)==x(j)
                    z=z+1;
                end
            end
        end
    end
  disp(z);

end