class MedicalProfessional

	attr_reader :id
	attr_reader :name
	attr_reader :image_url

	def initialize(id, name, image_url)
		@image_url = image_url
		@name = name
		@id = id
	end

	def self.professionals
		[
			MedicalProfessional.new(1, "Dr John", "john.jpg"),
		 	MedicalProfessional.new(2, "Dr Cathy", "cathy.jpeg"),
		 	MedicalProfessional.new(3, "Dr Eric", "eric.png")
		]
	end
end