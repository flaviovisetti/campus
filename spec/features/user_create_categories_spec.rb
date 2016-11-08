require 'rails_helper'

feature 'User create category' do
  scenario 'successfully' do

    visit new_category_path

    fill_in('Nome' , with: 'DBA')
    click_on('Salvar Categoria')

    expect(page).to have_content('DBA')

  end

  scenario 'successfully' do

    visit new_category_path

    click_on('Salvar Categoria')

    expect(page).to have_content 'Não é possível cadastrar categoria'

  end

  scenario 'save two category with same name' do

    category = Category.create(name: 'DBA')

    visit new_category_path

    fill_in('Nome', with: 'DBA')
    click_on('Salvar Categoria')

    expect(page).to have_content 'Não é possível cadastrar categoria'
    expect(page).to have_content 'Name has already been taken'

  end
end
