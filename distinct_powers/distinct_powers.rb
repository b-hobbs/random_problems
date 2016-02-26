
def distinct_powers(min, max)
	powers = []
	(min..max).each do |base| 
		(min..max).each { |exponent| powers << base**exponent } 
	end
	powers.uniq.length
end

puts distinct_powers(2, 5)