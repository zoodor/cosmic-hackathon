class FeelingsRating

	include DataMapper::Resource

	property :id,			Serial
	property :patient_id,	String
	property :statement_id,	String
	property :rating,		String
end