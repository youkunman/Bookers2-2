class Book < ApplicationRecord
	 belongs_to :user
	 # has_many :books, dependent: :destroy
	 validates :title, presence: true, length: {maximum: 200}
	 validates :body,  presence: true, length: {maximum: 200}
end
