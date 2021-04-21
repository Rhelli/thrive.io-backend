require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:bob) { User.create(name: 'Bob', email: 'bob@mail.com', password: 'password1', dob: '1979-01-01', user_type: 'Looking') }

  context 'user model validations of required fields' do
    it 'allows the creation of a valid user' do
      steve = User.new(name: 'Steve', email: 'steve@email.com', password: 'password1', dob: '1990-01-01', user_type: 'Looking')
      expect(steve).to be_valid
    end

    it 'rejects the creation of a user without a name' do
      steve = User.new(name: '', email: 'steve@email.com', password: 'password1', dob: '1990-01-01', user_type: 'Looking')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a user without a validly formatted name' do
      steve = User.new(name: 'Steve2353254', email: 'steve@email.com', password: 'password1', dob: '1990-01-01', user_type: 'Looking')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a user with a name exceeding 50 characters' do
      steve = User.new(name: 'steeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeve', email: 'steve@email.com', password: 'password1', dob: '1990-01-01', user_type: 'Looking')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a user without an email' do
      steve = User.new(name: 'Steve', email: '', password: 'password1', dob: '1990-01-01', user_type: 'Looking')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a user wihtout a validly formatted email' do
      steve = User.new(name: 'Steve', email: 'steve@email', password: 'password1', dob: '1990-01-01', user_type: 'Looking')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a user with an email exceeding 255 characters' do
      steve = User.new(
        name: 'Steve',
        email: "#{'a' * 256}@email.com",
        password: 'password1',
        dob: '1990-01-01',
        user_type: 'Looking'
      )
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a user with an email that already exists in the database' do
      steven = User.new(name: 'Steve', email: 'bob@mail.com', password: 'password1', dob: '1990-01-01', user_type: 'Looking')
      expect(steven).to_not be_valid
    end

    it 'rejects the creation of a new user without a password' do
      steve = User.new(name: 'Steve', email: 'steve@email.com', password: '', dob: '1990-01-01', user_type: 'Looking')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a new user without a validly formatted password' do
      steve = User.new(name: 'Steve', email: 'steve@email.com', password: 'password', dob: '1990-01-01', user_type: 'Looking')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a new user without a date of birth' do
      steve = User.new(name: 'Steve', email: 'steve@email.com', password: 'password1', user_type: 'Looking')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a new user if they are less than 18 years old' do
      steve = User.new(name: 'Steve', email: 'steve@email.com', password: 'password1', dob: '2015-01-01', user_type: 'Looking')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a new user if there is no user_type present' do
      steve = User.new(name: 'Steve', email: 'steve@email.com', password: 'password1', dob: '1990-01-01', user_type: '')
      expect(steve).to_not be_valid
    end

    it 'rejects the creation of a new user if the user type is not included in the allowed list' do
      steve = User.new(name: 'Steve', email: 'steve@email.com', password: 'password1', dob: '1990-01-01', user_type: 'Awesome')
      expect(steve).to_not be_valid
    end
  end

  context 'User model Occupation validations' do
    it 'rejects setting a user occupation to anything other that the allowed list' do
      expect(bob.update(occupation: 'Rockstar')).to be_falsey
    end

    it 'allows the updating of a user to a different occupation' do
      expect(bob.update(occupation: 'Professional')).to be_truthy
    end

    it 'allows the updating of a user from a non-nil value to a nil value' do
      bob.update(occupation: 'Professional')
      expect(bob.update(occupation: '')).to be_truthy
    end
  end

  context 'User model gender validations' do
    it 'allows a user to update their gender' do
      expect(bob.update(gender: 'Female')).to be_truthy
    end

    it 'rejects a user updating their gender to an unlisted gender' do
      expect(bob.update(gender: 'Lizard')).to be_falsey
    end

    it 'allows a user to update their gender from a non-nil to a nil value' do
      bob.update(gender: 'Male')
      expect(bob.update(gender: '')).to be_truthy
    end
  end

  context 'User model couple validations' do
    it 'allows a user to change its couple status' do
      expect(bob.update(couple: 'Couple')).to be_truthy
    end

    it 'rejects a user updating their couple status to an unlisted status' do
      expect(bob.update(couple: 'Couple Of Big Boiz')).to be_falsey
    end

    it 'allows a user to update from a non-nil to a nil value' do
      bob.update(couple: 'Couple')
      expect(bob.update(couple: '')).to be_truthy
    end
  end

  context 'User model pets validations' do
    it 'allows users to add pets to their account' do
      expect(bob.update(pets: ['Dogs'])).to be_truthy
    end

    it 'does not allow users to add pets not listed' do
      expect(bob.update(pets: ['Turnips'])).to be_falsey
    end
  end

  context 'User model smoking validations' do
    it 'allows a user to change their smoking status' do
      expect(bob.update(smoking: 'Smoking')).to be_truthy
    end

    it 'does not allow a user to update their smoking status an un unlisted status' do
      expect(bob.update(smoking: 'Why thankyou, so are you.')).to be_falsey
    end
  end

  context 'User model min budget validations' do
    it 'allows a user to update their minimum budget' do
      expect(bob.update(min_budget: 1200)).to be_truthy
    end

    it 'does not allow a user to enter anything less than zero' do
      expect(bob.update(min_budget: -500)).to be_falsey
    end

    it 'does not allow a user to enter anything other than an interger' do
      expect(bob.update(min_budget: 'One hundred')).to be_falsey
    end
  end

  context 'User model max budget validations' do
    it 'allows a user to update their maximum budget' do
      expect(bob.update(max_budget: 2000)).to be_truthy
    end

    it 'does not allow a user to enter a negative number' do
      expect(bob.update(max_budget: -2000)).to be_falsey
    end

    it 'does not allow a user to enter anything other than an integer' do
      expect(bob.update(max_budget: 'I am very rich')).to be_falsey
    end
  end

  context 'User model areas looking validations' do
    it 'allows a user to add and update the areas they are interested in' do
      expect(bob.update(areas_looking: ['Belgravia'])).to be_truthy
    end

    it 'does not allow a user to have a list of more that 5 areas' do
      expect(bob.update(areas_looking: ['Camden', 'Belgravia', 'Hammersmith', 'Shad Thames', 'Tower Hamlets', 'Pimlico'])).to be_falsey
    end

    it 'does not allow a user to enter an incorrectly formatted area' do
      expect(bob.update(areas_looking: ['@MyHoUsE'])).to be_falsey
    end
  end

  context 'User model advertiser type validations' do
    it 'allows a user to update their advertiser type' do
      bob.update(user_type: 'Advertising')
      expect(bob.update(advertiser_type: 'Flatmate')).to be_truthy
    end

    it "does not allow a user to update their advertising type if they are a 'Looking' user" do
      expect(bob.update(advertiser_type: 'Flatmate')).to be_falsey
    end
  end

  context 'The User Authenticate method' do
    it 'will correctly authenticate a user when the correct password is provided' do
      expect(User.authenticate('bob@mail.com', 'password1')).to be_truthy
    end

    it 'will reject user authentication if incorrect email is given' do
      expect(User.authenticate('bob@emaily.com', 'password1')).to be_falsey
    end

    it 'will reject user authentication if an incorrect password is given' do
      expect(User.authenticate('bob@mail.com', 'passwrd1')).to be_falsey
    end
  end
end
