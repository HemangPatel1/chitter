require 'data_mapper'

class Peep

	include DataMapper::Resource

	property :id, Serial
	property :message, String
	property :posted_by_name, String
	property :posted_by_username, String
end