require "rails_helper"

RSpec.feature "Showing an Article" do
  before do
    @article = Article.create(title:"Title of the article", body:"Body of the article")
  end

  scenario "Display individual article" do
    visit "/"   # visit root route

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eql(article_path(@article))
  end
end