def coconuts(sailor_count, depth)
    (1..depth).each do |guess| 
        monkey_count = 1
        total_coconuts = guess
        (1..sailor_count + monkey_count).each do |coconut_lover|
            break if total_coconuts <= 0
            
            sailorShare = total_coconuts / sailor_count
            monkeyShare = total_coconuts % sailor_count

            isSailor = (coconut_lover <= sailor_count)
            isMonkey = (coconut_lover > sailor_count)

            break if sailorShare == 0             # sailors should always get a share
            break if isSailor && monkeyShare != 1 # should be 1 coconut for the monkey
            break if isMonkey && monkeyShare != 0 # should not be any remaining coconuts

            if (isSailor)
                total_coconuts -= (sailorShare + monkeyShare)    
            else
                # all conditions were met so the guess must be the total number of coconuts
                return guess
            end        
        end
    end
    return "Couldn't find solution, try increasing depth of search"
end

puts coconuts(5, 5000)
