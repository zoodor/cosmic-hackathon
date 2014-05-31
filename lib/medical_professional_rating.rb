class MedicalProfessionalRating

	include DataMapper::Resource

	property :id,						Serial
	property :patient_id,				String
	property :medical_professional_id,	String
	property :rating,					String

end