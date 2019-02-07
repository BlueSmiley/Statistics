function out = tripleDieRoll(reps)
    out = simulation(reps);
end

function out = dieRoll(sides,reps)
    out  = randi([1 sides],1,reps);
end


function prob = simulation(reps)
    count = 0;
    for index = 1:reps
        currentRolls = dieRoll(6,3);
        for throwno = 1:3
            if currentRolls(throwno) == 2
                count = count + 1;
                break;
            end
        end
    end
    prob = (count/reps)*100;
end