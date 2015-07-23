# == Schema Information
#
# Table name: answers
#
#  id           :integer          not null, primary key
#  bodyrails    :string
#  g            :string
#  model        :string
#  Answer       :string
#  body         :text
#  questions_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Answer < ActiveRecord::Base
  belongs_to :questions
end
