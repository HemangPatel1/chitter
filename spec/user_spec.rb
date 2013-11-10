require 'user'


describe User do

	let(:user) { User.new }

	it 'can have a name' do
		expect(user).to respond_to :name
	end

	it 'can set a name' do
		expect(user).to respond_to :name=
	end

	it 'can have an email' do
		expect(user).to respond_to :email
	end

	it 'can set an email' do
		expect(user).to respond_to :email=
	end

	it 'can have a password' do
		expect(user).to respond_to :password_digest
	end

	it 'can set a password' do
		expect(user).to respond_to :password_digest=
	end

	it 'can have a username' do
		expect(user).to respond_to :username
	end

	it 'can set a username' do
		expect(user).to respond_to :username=
	end	

	it 'is a data mapper resource' do
	  expect(User.included_modules).to include DataMapper::Resource
	end

end
