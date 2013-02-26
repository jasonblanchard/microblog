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

Given /^I fill in the "(.*?)" form with "(.*?)"$/ do |form, content|
    fill_in form, :with => content
end

Given /^I press "(.*?)"$/ do |arg1|
    click_button arg1
end

Given /^the following comments exist:$/ do |table|
    table.hashes.each do |comment|
        post = Post.find_by_body(comment['post'])
        comment = post.comments.new :body => comment['body']
        comment.save
    end
end
