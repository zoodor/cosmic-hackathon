class CosmicAnswer

	include DataMapper::Resource

	property :id,			Serial
	property :question_id,	String
	property :answer,		String

end