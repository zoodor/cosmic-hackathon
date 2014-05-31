class CosmicQuestion

	attr_accessor :id
	attr_accessor :title	

	def initialize(id, title)
		@id = id
		@title = title
	end

	def self.questions
	 	[
	 		CosmicQuestion.new(1, "Did you meet a member of the COSMIC Team?"), 
	 		CosmicQuestion.new(2, "Would you refer your friends and family to us?"), 
	 		CosmicQuestion.new(3, "Did you like the ward?"), 
	 		CosmicQuestion.new(4, "Was it colourful enough?"), 
	 		CosmicQuestion.new(5, "Did you feel comfy?"), 
	 		CosmicQuestion.new(6, "Were there enough things to play with?"), 
	 		CosmicQuestion.new(7, "Was there enough to read?"), 
	 		CosmicQuestion.new(8, "Could you watch a video?"), 
	 		CosmicQuestion.new(9, "Could you play on a computer game?"), 
	 		CosmicQuestion.new(10, "Were the nurses and doctors nice?"), 
	 		CosmicQuestion.new(11, "Did the nurses and doctors talk to you?"), 
	 		CosmicQuestion.new(12, "Did you read the COSMIC Charity board?")
	 	]
	end

end