class CosmicQuestion

	include DataMapper::Resource

	property :id,			Serial
	property :title,		String
	property :answer,		String

end