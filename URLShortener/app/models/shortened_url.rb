# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true
  validates :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  def self.random_code
    code =  SecureRandom.urlsafe_base64
   while ShortenedUrl.exists?(short_url: code)
     code =  SecureRandom.urlsafe_base64
   end
   code
  end

  def self.create_short_url(user,long_url)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.create! short_url: short_url,
      long_url: long_url,
      user_id: user.id
  end

end
