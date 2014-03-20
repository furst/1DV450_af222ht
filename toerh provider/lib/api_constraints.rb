class ApiConstraints
  	def initialize(options)
    	@version = options[:version]
    	@default = options[:default]
  	end

  	def matches?(req)
  		# Ändra från example.com
    	@default || req.headers['Accept'].include?("application/vnd.example.v#{@version}")
  	end
end