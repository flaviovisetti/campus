require 'rails_helper'

feature 'editing category' do

  scenario 'sucessfuly' do
    category = Category.create(name: 'desenvolvedor')

    visit edit_category_path(category)

    fill_in('Nome', with: 'analista')

    click_on('Atualizar')

    expect(page).to have_content('analista')
  end

  scenario 'fill field in blank' do
    category = Category.create(name: 'desenvolvedor')

    visit edit_category_path(category)

    fill_in('Nome', with: "")
    click_on('Atualizar')

    expect(page).to have_content('Não é possível atualizar categoria')
  end

end
