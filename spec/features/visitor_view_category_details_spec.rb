require 'rails_helper'

feature 'Visitor view category detail' do
  scenario 'list all categories' do

    category = Category.create(name: 'dbm')

    visit category_path(category)

    expect(page).to have_content(category.name)
    find_link('Voltar').visible?

  end
end
