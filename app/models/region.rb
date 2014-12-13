class Region < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  accepts_nested_attributes_for :entries, :allow_destroy => true, :reject_if => :all_blank
  belongs_to :user
  validates_uniqueness_of :ssid
  validates_presence_of :ssid
  extend FriendlyId
  friendly_id :ssid
end
