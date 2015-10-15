require 'rails_helper'

describe Vote do

 include TestFactories

  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do

        vote_1 = Vote.new(value: 1)
        expect(vote_1.valid?).to eq(true)

        vote_2 = Vote.new(value: -1)
        expect(vote_2.valid?).to eq(true)
        
        vote_error = Vote.new(value: 0)
        expect(vote_error.valid?).to eq(false)

      end
    end
  end

  describe 'after_save' do
    it "calls `Post#update_rank` after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end
