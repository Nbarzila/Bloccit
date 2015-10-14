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

    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    mount_uploader :image, ImageUploaderUploader
    belongs_to :user
    belongs_to :topic
    default_scope { order('rank DESC') }
    #scope :ordered_by_title, -> { reorder('title ASC')}
    #scope :ordered_by_reverse_created_at, -> { reorder('created_at DESC')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true

  after_create :create_vote
  # validates :topic, presence: true
  # validates :user, presence: true
  def up_votes
      votes.where(value: 1).count
  end

  def down_votes
      votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end



  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
    new_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end



   def markdown_title
     markdown_to_html(title)
   end

   def markdown_body
     markdown_to_html(body)
   end



  private

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def create_vote
   user.votes.create(value: 1, post: self)
  end
end
