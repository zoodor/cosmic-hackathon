require 'sinatra'
require 'data_mapper'
require 'json'

DataMapper.setup(:default, "postgres://localhost/hackathon")

require_relative 'cosmic_questions'
require_relative 'cosmic_answer'
require_relative 'patient'
require_relative 'feelings_statements'
require_relative 'feelings_ratings'
require_relative 'medical_professional'
require_relative 'medical_professional_rating'

DataMapper.finalize
DataMapper.auto_upgrade!

class Hackathon < Sinatra::Base
	enable :sessions

	set :views, File.join(File.dirname(__FILE__), '..', 'views')
	set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')

	get '/' do

		erb :index

	end

	get '/patient_details' do
		erb :patient_details
	end

	get '/:id/cosmic_questions' do
		@questions = CosmicQuestion.questions
		@patient_id = params[:id]
		erb :cosmic_questions
	end

	post '/:id/cosmic_questions' do
		@questions = CosmicQuestion.questions
		@patient_id = params[:id]

		@questions.each do |question|
			question_id = question.id
			answer=params["yes_no_#{question_id}"]

			CosmicAnswer.create(
				:patient_id => @patient_id,
				:question_id => question_id,
				:answer => answer)
		end

		redirect to("#{@patient_id}/start")
	end

	get '/:patient_id/rate_medical_team' do
		@patient_id = params[:patient_id]
		@professionals = MedicalProfessional.professionals
		erb :rate_medical_team
	end

	post '/:patient_id/rate_medical_team' do
		patient_id = params[:patient_id]
		post_data = JSON.parse(request.body.read)

		post_data.each do |key, value|
			MedicalProfessionalRating.create(
				:patient_id => patient_id,
				:medical_professional_id => key,
				:rating => value
			)
	 	end
		@professionals = MedicalProfessional.professionals
		erb :rate_medical_team
	end

	post '/patient_details' do
		name = params[:name]
		redirect '/patient_details' unless name and not name.empty?

		@patient = Patient.create(
			:name => name
		)
		session[:user_id] = @patient.id
		redirect to("#{@patient.id}/start")
	end

	get '/:id/start' do
		@patient_id = params[:id]
		@patient = Patient.get(@patient_id)
		
		erb :start
	end

	get '/:id/feelings' do
		@patient_id = params[:id]
		@statements = FeelingsStatement.statements
		erb :feelings
	end

	post '/:id/feelings' do
		@patient_id = params[:id]
		@statements = FeelingsStatement.statements

		@statements.each do |statement|
			statement_id = statement.id
			rating = params["statement_#{statement_id}"]

			FeelingsRating.create(
				:patient_id => @patient_id,
				:statement_id => statement_id,
				:rating => rating)
		end
		redirect to("#{@patient_id}/start")
	end

	get "/thank_you" do
		erb :thank_you
	end

end