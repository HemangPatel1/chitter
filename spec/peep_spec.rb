require 'peep'


describe Peep do

	let(:peep) { Peep.new }

	it 'can have a message' do
		expect(peep).to respond_to :message
	end

	it 'can set a message' do
		expect(peep).to respond_to :message=
	end

	it 'can have a name by which it was posted by' do
		expect(peep).to respond_to :posted_by_name
	end

	it 'can set a name by which it was posted by' do
		expect(peep).to respond_to :posted_by_name=
	end

	it 'can have a username by which it was posted by' do
		expect(peep).to respond_to :posted_by_username
	end

	it 'can set a username by which it was posted by' do
		expect(peep).to respond_to :posted_by_username=
	end

	it 'can have a date it was created' do
		expect(peep).to respond_to :created_at
	end

	it 'can set a date it was created' do
		expect(peep).to respond_to :created_at=
	end

	it 'is a data mapper resource' do
	  expect(Peep.included_modules).to include DataMapper::Resource
	end

end
