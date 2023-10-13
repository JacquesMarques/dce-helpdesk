module Features
  module CapybaraHelpers
    def datepicker(selector, value)
      page.execute_script("$('#{selector}').val('#{value}')")
    end

    def sign_in(user, password)
      page.visit('/users/sign_in')
      page.fill_in('E-mail', with: user.email)
      page.fill_in('Senha', with: password)
      page.click_on('Login')
    end
  end
end
