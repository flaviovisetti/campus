require 'rails_helper'

feature 'user edit company' do

  scenario 'editing' do
    company = Company.create(name: "Google", location: "Dublin", mail: "sac@google.ie", phone: "+353 1234567")

    visit root_path
    click_on company.name

    click_link('editar')

    expect(page).to have_current_path(edit_company)

    fill_in(company.name, with: 'Campus Code')
    fill_in(company.location, with: 'São Paulo')

    click_on 'Atualizar'

    expect(page).to have_content('Campus Code')
    expect(page).to have_content('São Paulo')


  end


end
