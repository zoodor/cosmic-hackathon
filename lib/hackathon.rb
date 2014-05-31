require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/hackathon")

DataMapper.finalize
DataMapper.auto_upgrade!

class Hackathon < Sinatra::Base

	set :views, File.join(File.dirname(__FILE__), '..', 'views')
	# set :partial_template_engine, :erb

	get '/' do
		erb :index
	end

end