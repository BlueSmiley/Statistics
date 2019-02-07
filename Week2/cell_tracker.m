function resGrid = cell_tracker(locGrid, obsGivenLocGrid)
    [rowLen,colLen] = size(locGrid);
    if [rowLen,colLen] ~= size(obsGivenLocGrid)
        error("grid dimensions are different");
    end
    resGrid = zeros(rowLen,colLen);
    for i = 1:rowLen
        for j = 1:colLen
            % probability of observation is taken to be 100%
            % We assume no probability changes in time until observation
            resGrid(i,j) = calcCondLocProb(locGrid(i,j), ...
                obsGivenLocGrid(i,j),1);
        end
    end
end

function res = calcCondLocProb(locProb,obsGivenLocProb,obsProb)
    res = (obsGivenLocProb*locProb)/obsProb;
end