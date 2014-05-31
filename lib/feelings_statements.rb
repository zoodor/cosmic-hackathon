class FeelingsStatement	

	attr_accessor :id
	attr_accessor :title	

	def initialize(id, title)
		@id = id
		@title = title
	end

	def self.statements
	 	[
	 		FeelingsStatement.new(1, "Cleanliness"), 
	 		FeelingsStatement.new(2, "Video game selection"), 
	 		FeelingsStatement.new(3, "The doctors and nurses"),
	 		FeelingsStatement.new(4, "The food"), 
	 		FeelingsStatement.new(5, "The bed"), 
	 		FeelingsStatement.new(6, "The temperature"), 
	 		FeelingsStatement.new(7, "Book selection"), 
	 		FeelingsStatement.new(8, "Video selection"), 
	 		FeelingsStatement.new(9, "Visiting hours"), 
	 		FeelingsStatement.new(10, "Privacy")
	 	]
	end

end