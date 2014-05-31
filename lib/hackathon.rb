require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/hackathon")

require_relative 'cosmic_questions'
require_relative 'cosmic_answer'
require_relative 'patient'

DataMapper.finalize
DataMapper.auto_upgrade!

class Hackathon < Sinatra::Base
	enable :sessions

	set :views, File.join(File.dirname(__FILE__), '..', 'views')

	get '/' do

		erb :index

	end

	get '/patient_details' do
		erb :patient_details
	end

	get '/cosmic_questions' do
		@questions = CosmicQuestion.questions
		erb :cosmic_questions
	end

	post '/cosmic_questions' do
		@questions = CosmicQuestion.questions

		@questions.each do |question|
			question_id = question.id
			answer=params["yes_no_#{question_id}"]

			CosmicAnswer.create(
				:question_id => question_id,
				:answer => answer)
		end

		redirect to('/')
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
		id = params[:id]
		@patient = Patient.get(id)
		erb :start
	end

end