class Space < ActiveRecord::Base
  belongs_to :store, counter_cache: true
end