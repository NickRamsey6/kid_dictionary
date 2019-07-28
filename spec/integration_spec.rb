require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word then goes to the words page') do
    visit('/')
    click_on('Add a Word')
    fill_in('term', :with => "Dog")
    click_on('Enter')
    expect(page).to have_content("Dog")
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word then a definition for the word') do
    word = Term::Word.new(:term => 'Dog')
    word.create
    visit("/terms/#{word.id}")
    fill_in('definition', :with => 'Mans best friend')
    click_on('Define!')
    expect(page).to have_content('Mans best friend')
  end
end
