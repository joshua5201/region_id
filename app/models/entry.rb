class Entry < ActiveRecord::Base
  belongs_to :problem
  mount_uploader :picture, PictureUploader
end
