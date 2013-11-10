require 'data_mapper'
require 'dm-timestamps'

class Peep

	include DataMapper::Resource

	property :id, Serial
	property :message, String
	property :posted_by_name, String
	property :posted_by_username, String
	property :created_at, DateTime
end