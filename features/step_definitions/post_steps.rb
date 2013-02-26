Given /^the following posts exist:$/ do |table|
    table.hashes.each do |post|
        Post.create( :body => post[:body] )
    end
end

When /^I go to the home page$/ do
    visit "/"
end

Then /^I should see "(.*?)"$/ do |arg1|
    page.should have_content arg1
end

When /^I am on the show page for "(.*?)"$/ do |arg1|
    post = Post.find_by_body(arg1)
    visit post_path(post)
end

Given /^I fill in the new post form with "(.*?)"$/ do |arg1|
    fill_in 'post_body', :with => arg1
end

Given /^I press "(.*?)"$/ do |arg1|
    click_button arg1
end


