require "spec_helper"

describe "Topics" do
  it "should be able to add topic", :js => true do
    visit topics_path
    click_link "Create New Topic"
    fill_in "Title",  :with => "Topic title"
    fill_in "Body",   :with => "Topic body"
    click_on "Save changes"

    page.should have_content("Topic title")
    page.should have_content("Topic body")
  end
end