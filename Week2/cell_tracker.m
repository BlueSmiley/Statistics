function resGrid = cell_tracker(locGrid, obsGivenLocGrid)
    [rowLen,colLen] = size(locGrid);
    if [rowLen,colLen] ~= size(obsGivenLocGrid)
        error("grid dimensions are different");
    end
    %Calculate P(observation)
    obs = calcObs(locGrid,obsGivenLocGrid);
    resGrid = zeros(rowLen,colLen);
    for i = 1:rowLen
        for j = 1:colLen
            resGrid(i,j) = calcCondLocProb(locGrid(i,j), ...
                obsGivenLocGrid(i,j),obs);
        end
    end
end

function res = calcCondLocProb(locProb,obsGivenLocProb,obsProb)
    res = (obsGivenLocProb*locProb)/obsProb;
end

function res = calcObs(locGrid,obsGivenLocGrid)
    [rowLen,colLen] = size(locGrid);
    res = 0;
    if [rowLen,colLen] ~= size(obsGivenLocGrid)
        error("grid dimensions are different");
    end
    for i = 1:rowLen
        for j = 1:colLen
            res = res + locGrid(i,j)*obsGivenLocGrid(i,j);
        end
    end
end