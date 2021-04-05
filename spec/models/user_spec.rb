require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should save if all fields are present, email is unique and the passwords match' do
      @user = User.create(first_name: 'Connie', last_name: 'Ho', email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user.errors.any?).to eq(false)
    end

    it 'should not save if the password and password confirmation do not match' do
      @user = User.create(first_name: 'Connie', last_name: 'Ho', email: 'test@gmail.com', password: 'password', password_confirmation: '')
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not save if the password is less than the minimum length' do
      @user = User.create(first_name: 'Connie', last_name: 'Ho', email: 'test@gmail.com', password: 'pass', password_confirmation: 'pass')
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'should not save if the email is not unique' do
      @user1 = User.create(first_name: 'Connie', last_name: 'Ho', email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
      @user2 = User.create(first_name: 'Connie', last_name: 'Ho', email: 'TEST@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

     # validates :first_name, presence: true
    it 'should not save if the first name is not present' do
      @user = User.create(last_name: 'Ho', email: 'test@gmail.com')
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

     # validates :last_name, presence: true
    it 'should not save if the first name is not present' do
      @user = User.create(first_name: 'Connie', email: 'test@gmail.com')
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

     # validates :first_name, presence: true
    it 'should not save if the email is not present' do
      @user = User.create(first_name: 'Connie', last_name: 'Ho')
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

  end
  
  describe '.authenticate_with_credentials' do
    it 'should return the user if the password is correct' do
      @user = User.create(first_name: 'Connie', last_name: 'Ho', email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
      @logged_in_user = User.authenticate_with_credentials('test@gmail.com', 'password')
      expect(@logged_in_user).to eq(@user)
    end

    it 'should return nil if the password is incorrect' do
      @user = User.create(first_name: 'Connie', last_name: 'Ho', email: 'test@gmail.com', password: 'password', password_confirmation: 'password')
      @logged_in_user = User.authenticate_with_credentials('test@gmail.com', 'pass')
      expect(@logged_in_user).to eq(nil)
    end

    it 'should return the user even if there is white space' do
      @user = User.create(first_name: 'Connie', last_name: 'Ho', email: 'example@domain.com', password: 'password', password_confirmation: 'password')
      @logged_in_user = User.authenticate_with_credentials('   example@domain.com   ', 'password')
      expect(@logged_in_user).to eq(@user)
    end

    it 'should return the user if there is a mixture of capital letters' do
      @user = User.create(first_name: 'Connie', last_name: 'Ho', email: 'eXample@domain.COM', password: 'password', password_confirmation: 'password')
      @logged_in_user = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', 'password')
      expect(@logged_in_user).to eq(@user)
    end


  end
end
