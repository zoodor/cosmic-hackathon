class CosmicAnswer

	include DataMapper::Resource

	property :id,			Serial
	property :patient_id,	String
	property :question_id,	String
	property :answer,		String

end