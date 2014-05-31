class CosmicQuestion

	attr_accessor :id
	attr_accessor :title	

	def initialize(id, title)
		@id = id
		@title = title
	end

	def self.questions
	 	[CosmicQuestion.new(1, "Did they meet a member of the COSMIC Team?"), CosmicQuestion.new(2, "question 2"), CosmicQuestion.new(3, "question 3")]
	end

end