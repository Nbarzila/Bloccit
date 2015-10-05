# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  image      :references
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  has_many :comments
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  belongs_to :topic
  default_scope { order('created_at DESC') }
  scope :ordered_by_title, -> { reorder('title ASC')}
  scope :ordered_by_reverse_created_at, -> { reorder('created_at DESC')}

 validates :title, length: { minimum: 5 }, presence: true
 validates :body, length: { minimum: 20 }, presence: true
 validates :topic, presence: true
 validates :user, presence: true
 end

 def markdown_to_html(markdown)

   <%= post.markdown_title %>
   <%= post.markdown_body %>

 end
end
   private
   renderer = Redcarpet::Render::HTML.new
   extensions = {fenced_code_blocks: true}
   redcarpet = Redcarpet::Markdown.new(renderer, extensions)
   (redcarpet.render markdown).html_safe
 end
