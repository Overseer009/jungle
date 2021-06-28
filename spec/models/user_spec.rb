require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @new_user = User.new(first_name: "Tim", last_name: "Thomson" email: "tim@tim.com", password: "password", password_confirmation: "password")
    end

    
  end
end
