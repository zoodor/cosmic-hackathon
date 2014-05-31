require 'sinatra'
require 'data_mapper'
# require './data_mapper_setup'


DataMapper.setup(:default, "postgres://localhost/hackathon")

require_relative 'cosmic_questions'
require_relative 'patient'

DataMapper.finalize
DataMapper.auto_upgrade!
# DataMapper.auto_migrate!

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
		erb :cosmic_questions
	end

	post '/cosmic_questions' do
		title=params["title"]
		answer=params["yes_no"]

		CosmicQuestion.create(
			:title => title,
			:answer => answer)
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