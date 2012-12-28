module Indicators
	def ma(values, options={})
		opts = {:period => 5}.merge(options)

  	return nil if opts[:period] > values.size

  	ma = []
  	result = []
  	sum = 0
  	values.each do |value|
  		leaving_value = ma.length == opts[:period] ? ma.shift : 0
  		sum += value - leaving_value
  		ma << value
  		result << { :value => value, :ma => ma.length == opts[:period] ? sum/opts[:period] : 0 }
  	end

    result
	end
end