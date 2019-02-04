require 'rails_helper'

describe 'Articles', type: :system do
  fixtures :articles
  before { visit articles_path }
  it '#index' do
    expect(page).to have_content 'ですよね。'
  end
end
