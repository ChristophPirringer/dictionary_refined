require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the dictionary path', {:type => :feature}) do

  it('goes to the index page, checks the "Add a new one" link.') do
    visit('/')
    click_link('Add a new one!')
    expect(page).to have_content('Can you spare a word?')
  end

  it('goes to the form to add a word, adds "BadWolf",
    continues to the words-page to check for it.') do
    visit('/')
    click_link('Add a new one!')
    fill_in('word', :with => 'BadWolf')
    click_button('Add The Word!')
    click_link('See all Them Words!')
    expect(page).to have_content('BadWolf')
  end

end
