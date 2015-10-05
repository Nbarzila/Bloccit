require 'rails_helper'

describe Post do
  describe "vote methods" do

    before do
      @post = Post.create(title: 'post title', body: 'post body')
      3.times { @post.votes.create(value: 1)}
      2.times { @post.votes.create(value:-1)}
      1.times { @post.votes.create(value: 0)}

    end



describe Vote do

  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        expect(@votes.value).to eq(1)
        expect(@votes.value).to eq(-1)

      end
    end
  end
end
