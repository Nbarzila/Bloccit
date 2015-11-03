FactoryGirl.define do
  factory :comment do
    body "Post bodies must be pretty long."
    text "Post bodies must be pretty long."
    user
    post
  end
end
