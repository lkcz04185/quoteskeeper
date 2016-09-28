class Quote < ActiveRecord::Base
  validates :saying, presence: true, length: {maximum: 140, minimum: 10}, uniqueness: {case_sensitive: false}
  validates :author, presence: true, length: {maximum: 50, minimum: 6}
end
