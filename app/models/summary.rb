# == Schema Information
#
# Table name: summaries
#
#  id      :integer          not null, primary key
#  body    :string
#  text    :string
#  post_id :integer
#

class Summary < ActiveRecord::Base
  belongs_to :post
end
