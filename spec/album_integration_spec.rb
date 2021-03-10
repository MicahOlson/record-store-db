require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create an album path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    visit('/albums')
    click_on('Add a new album')
    fill_in('album_name', :with => 'The Resistance')
    click_on('Add album')
    expect(page).to have_content('The Resistance')
  end
end

describe('create a song path', {:type => :feature}) do
  it('creates an album and then goes to the album page') do
    album = Album.new({:name => "The Resistance", :id => nil})
    album.save
    visit("/albums/#{album.id}")
    fill_in('song_track', :with => '1')
    fill_in('song_name', :with => 'Uprising')
    click_on('Add song')
    expect(page).to have_content('Uprising')
  end
end
