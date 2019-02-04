# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  commenter  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint(8)
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#

class Comment < ApplicationRecord
  belongs_to :article
end
