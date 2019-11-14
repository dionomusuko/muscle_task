require 'rails_helper'

RSpec.describe "Sign up", type: :system do
  let(:user) { FactoryBot.create(:user, name: 'user_a', email: 'user_a@example.com') }
