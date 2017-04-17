require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should save if all required fields are present' do
      @user = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: "test@test.com",
        password: "test1234",
        password_confirmation: "test1234"
      )
      expect(@user).to be_persisted
    end

    it 'should not save if first name is not present' do
      @user = User.create(
        first_name: nil,
        last_name: "Test_lastName",
        email: "test@test.com",
        password: "test1234",
        password_confirmation: "test1234"
      )
      expect(@user).to_not be_persisted
    end

    it 'should not save if last name is not present' do
      @user = User.create(
        first_name: "Test_firstName",
        last_name: nil,
        email: "test@test.com",
        password: "test1234",
        password_confirmation: "test1234"
      )
      expect(@user).to_not be_persisted
    end

    it 'should not save if email is not present' do
      @user = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: nil,
        password: "test1234",
        password_confirmation: "test1234"
      )
      expect(@user).to_not be_persisted
    end

    it 'should not save if password is not present' do
      @user = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: "test@test.com",
        password: nil,
        password_confirmation: "test1234"
      )
      expect(@user).to_not be_persisted
    end

    it 'should not save if password confirmation is not present' do
      @user = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: "test@test.com",
        password: "test1234",
        password_confirmation: nil
      )
      expect(@user).to_not be_persisted
    end

    it 'should not save if password confirmation does not match password' do
      @user = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: "test@test.com",
        password: "test1234",
        password_confirmation: "test2"
      )
      expect(@user).to_not be_persisted
    end

    it 'should not save if email is already taken' do
      @user_test = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: "test@test.com",
        password: "test1234",
        password_confirmation: "test1234"
      )

      @user = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: "test@test.com",
        password: "test1234",
        password_confirmation: "test1234"
      )
      expect(@user).to_not be_persisted
    end

    it 'should not save if email is already taken (case insensitive)' do
      @user_test = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: "test@test.COM",
        password: "test1234",
        password_confirmation: "test1234"
      )

      @user = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: "TEST@TEST.com",
        password: "test1234",
        password_confirmation: "test1234"
      )
      expect(@user).to_not be_persisted
    end

    it 'should not save if password is shorter than 5 characters' do
      @user = User.create(
        first_name: "Test_firstName",
        last_name: "Test_lastName",
        email: "test@test.com",
        password: "test",
        password_confirmation: "test"
      )
      expect(@user).to_not be_persisted
    end

  end
  
end
