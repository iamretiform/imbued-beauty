class Portfolio < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
end
