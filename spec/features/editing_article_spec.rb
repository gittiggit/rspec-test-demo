require "rails_helper"

RSpec.feature "Editing an article" do

  before do
    @article = Article.create(title:"Title of the article", body:"Body of the article")
  end

  scenario "A user updates an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Updated title"
    fill_in "Body", with: "Updated body"
    click_button "Update article"

    expect(page).to have_content("Article updated")
    expect(current_path).to eq(article_path(@article))

  end

  scenario "A user fail to update an article" do
    visit "/"

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Updated body"
    click_button "Update article"

    expect(page).to have_content("Article not updated")
    expect(current_path).to eq(article_path(@article))

  end
end