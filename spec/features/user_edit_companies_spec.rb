require 'rails_helper'

feature 'user edit company' do

  scenario 'access edit page' do
    company = Company.create(name: "Google", location: "Dublin", mail: "sac@google.ie", phone: "+353 1234567")

    visit root_path
    click_on company.name

    click_link('editar')

    expect(page).to have_current_path(edit_company_path(company))
  end

  scenario 'editing fields' do
    company = Company.create(name: "Google", location: "Dublin", mail: "sac@google.ie", phone: "+353 1234567")

    visit edit_company_path(company)

    fill_in('Nome', with: 'Campus Code')
    fill_in('Local', with: 'São Paulo')
    find_field('E-mail').value
    find_field('Telefone').value


    click_on 'Atualizar'

    expect(page).to have_content('Campus Code')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content(company.mail)
    expect(page).to have_content(company.phone)

  end

end
