require 'sinatra'
require 'data_mapper'
# require './data_mapper_setup'


DataMapper.setup(:default, "postgres://localhost/hackathon")

require_relative 'cosmic_questions'

DataMapper.finalize
DataMapper.auto_upgrade!
# DataMapper.auto_migrate!

class Hackathon < Sinatra::Base

	set :views, File.join(File.dirname(__FILE__), '..', 'views')

	get '/' do
		erb :index
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

end