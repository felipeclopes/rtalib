module Indicators
	module Tendency
		def self.ma(values, period)
    	return nil if period > values.size

    	ma = []
    	result = []
    	sum = 0
    	values.each do |value|
    		leaving_value = ma.length == period ? ma.shift : 0
    		sum += value - leaving_value
    		ma << value
    		result << { :value => value, :ma => ma.length == period ? sum/period : 0 }
    	end
  	end
	end
end