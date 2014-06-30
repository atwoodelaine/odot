require 'spec_helper'

describe User do
	let (:valid_attributes) {
		{
		first_name: "Becky",
		last_name: "Atwood",
		email: "becky.e.atwood@gmail.com",
		password: "becky1234",
		password_confirmation: "becky1234"
		}
	}
	  context "validations" do
	  	let(:user) {User.new(valid_attributes)}

	  	before do
	  		User.create(valid_attributes)
	  	end

	  	it "requires an email" do 
	  		expect(user).to validate_presence_of(:email)
	  	end

	  	it "requires a unique email" do
	  		expect(user).to validate_uniqueness_of(:email)
	  	end

	  	it "requires a unique email (case insensitive)" do
	  		user.email = "BECKY.E.ATWOOD@GMAIL.COM"
	  		expect(user).to validate_uniqueness_of(:email)
	  	end

	  	it "requires the email address to look like an email" do 
	  		user.email = "becky"
	  		expect(user).to_not be_valid 

	  	end

	end

	describe "#downcase_email" do
		it "makes the email attribute lower case" do
			user = User.new(valid_attributes.merge(email: "BECKY.E.ATWOOD@GMAIL.COM"))
			#user.downcase_email
			#expect(user.email).to eq("becky.e.atwood@gmail.com")
			expect{ user.downcase_email}.to change{user.email}.
				from("BECKY.E.ATWOOD@GMAIL.COM").
				to("becky.e.atwood@gmail.com")
		end
	end

		it "downcases an email before saving" do
	  		user = User.new(valid_attributes)
	  		user.email = "BECKY.E.ATWOOD@GMAIL.COM"
	  		expect(user.save).to be_true
	  		expect(user.email).to eq("becky.e.atwood@gmail.com")
	  	end




end
