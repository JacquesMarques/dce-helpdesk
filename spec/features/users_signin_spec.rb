require 'rails_helper'

RSpec.feature 'Users SignIn Page', type: :feature do
  let!(:user) do
    create(:user)
  end

  context 'success' do
    def login
      visit '/users/sign_in'
      fill_in('Email', with: user.email)
      fill_in('Senha', with: user.password)
      click_on('Login')
      sleep(2)
    end

    it 'make login and access home page' do
      login
      expect(page).to have_content("Seja bem vindo: #{user.name}")
    end
  end

  context 'login error' do
    def login
      visit '/users/sign_in'
      fill_in('Email', with: user.email)
      fill_in('Senha', with: 'wrong_password')
      click_on('Login')
      sleep(2)
    end

    it 'should stay on the page and show an error message' do
      login
      expect(page).to have_content('Informe seu dados de acesso:')
      expect(page).to have_content('Email ou senha inválida.')
    end
  end
end
