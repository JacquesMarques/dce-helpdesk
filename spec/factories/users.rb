# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'john@example.com' }
    password { 'password' }
    name { 'John' }
    role { :user }
    status { :active }
  end
end
