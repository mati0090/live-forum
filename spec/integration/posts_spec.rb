require "spec_helper"

describe "Posts" do

  it "should be able to add post in topic" do
    topic = Topic.create(:title => "Discussion", :body => "Discuss here")

    visit topic_path(topic)
    fill_in "Body", :with => "First!!!"
    click_button "Create Post"

    page.should have_content "Discuss here"
    page.should have_content "First!!!"
  end
end