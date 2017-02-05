function dict = seleme_huffmandict(indices, probs)

codewords = num2cell(ones(length(indices),1)*2);

cells = num2cell(indices);
while length(cells) > 1

    prob1 = 0;
    while prob1 == 0
        [prob1, index1] = min(probs);
        symbol1 = cells{index1};
        
        cells(index1) = [];
        probs(index1) = [];
    end

    [prob2, index2] = min(probs);
    symbol2 = cells{index2};
    
    cells(index2) = [];
    probs(index2) = [];
    
    cells{length(cells)+1} = [symbol1, symbol2];
    probs(length(probs)+1) = prob1 + prob2;
    
    for symbol = symbol1
        if codewords{indices==symbol} == 2
            codewords{indices==symbol} = 0;
        else
            codewords{indices==symbol} = [0 codewords{indices==symbol}];
        end
    end
    
    for symbol = symbol2
        if codewords{indices==symbol} == 2
            codewords{indices==symbol} = 1;
        else
            codewords{indices==symbol} = [1 codewords{indices==symbol}];
        end
    end
end

dict = cell(0,2);
for i = 1:length(codewords)
   if codewords{i} ~= 2
      dict{size(dict,1)+1,1} = indices(i);
      dict{size(dict,1),2} = codewords{i};
   end
end
    

end

