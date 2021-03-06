class Url < ActiveRecord::Base
  scope :popular, -> { order(popularity: :desc) }
  scope :newest, -> { order(:created_at) }

  before_save :generate_short_url

  def generate_short_url
    url.short = ('a'..'z').to_a.shuffle[0,5].join
    true
  end
end
