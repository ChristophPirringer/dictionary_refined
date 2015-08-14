require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the dictionary path', {:type => :feature}) do

  before() do
    Word.clear()
  end

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

  it('goes to the word-page of the word it created,
    adds a definition and checks for it in the word-page.') do
    visit('/')
    click_link('Add a new one!')
    fill_in('word', :with => 'BadWolf')
    click_button('Add The Word!')
    click_link('See all Them Words!')
    click_link('BadWolf')
    click_link('Add to the list of definitions!')
    fill_in('definition', :with => 'Rose')
    click_button('Add the definition!')
    expect(page).to have_content('Rose')
  end

end
