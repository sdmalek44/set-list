class Song < ActiveRecord::Base
  belongs_to :playlist
  # validates :title, presence: true      # another way to write it
  validates_presence_of :title, :length
  # this attribute cant be nil
  # can still be ""

  def self.average_play_count
    average(:play_count)
  end

  def self.total_play_count
    sum(:play_count)
  end
end
