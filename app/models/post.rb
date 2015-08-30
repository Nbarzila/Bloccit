# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  topic_id   :integer
#

class Post < ActiveRecord::Base
  has_many :comments
  has_one :summary
  belongs_to :user
  belongs_to :topic
  default_scope { order('created_at DESC') }
  scope :ordered_by_title, -> { reorder('title ASC')}
  scope :ordered_by_reverse_created_at, -> { reorder('created_at DESC')}

end
