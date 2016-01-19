require "rails_helper"

RSpec.feature "Deleting an article" do

  before do
    @article = Article.create(title:"Title of the article", body: "Body of the article")
  end

  scenario "A user deletes an article" do
    visit "/"

    click_link @article.title
    click_link "Delete"

    expect(page).to have_content("Article deleted")
    expect(current_path).to eq(articles_path)
  end
end

