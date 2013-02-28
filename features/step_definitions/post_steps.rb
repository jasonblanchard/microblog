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
    if form == 'comment_body'
        find(:xpath, "(//textarea)[2]").set content
    else
        fill_in form, :with => content
    end
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

When /^I click on the "(.*?)" link$/ do |arg1|
    if arg1 == "Comment"
        find(:xpath, "(//a[contains(text(), 'Comment')])[1]").click
    end
end

When /^I fill in the non\-javascript\-ey "(.*?)" form with "(.*?)"$/ do |arg1, arg2|
    fill_in arg1, :with => arg2
end
