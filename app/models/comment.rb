# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string
#  text       :string
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id   :interger

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, length: {minimum: 5}
  #validates :body, presence: true
  #validates :user, presence: true
  validates :user_id, presence: true
  after_create :send_favorite_emails
  default_scope { order('updated_at ASC') }

   private

   def send_favorite_emails
     post.favorites.each do |favorite|
       if should_receive_update_for?(favorite)
         FavoriteMailer.new_comment(favorite.user, self.post, self).deliver_now
       end
   end

   def should_receive_update_for?(favorite)
     user_id != favorite.user_id && favorite.user.email_favorites?
   end
end

end
