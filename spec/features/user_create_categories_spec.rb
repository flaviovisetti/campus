require 'rails_helper'

feature 'User create category' do
  scenario 'successfully' do

    visit new_category_path

    fill_in('Nome' , with: 'DBA')
    click_on('Salvar Categoria')

    visit category_path

    expect(page).to have_content('DBA')

  end
end
