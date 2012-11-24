require "spec_helper"

describe "Posts" do
  it "should be able to add post in topic", :js => true do
    Topic.create(:title => "Discussion", :body => "Discuss here")

    visit root_path
    click_link "Discussion"
    fill_in "new_post_body", :with => "First!!!"
    click_button "Add post"

    page.should have_content "Discuss here"
    page.should have_content "First!!!"
  end
end