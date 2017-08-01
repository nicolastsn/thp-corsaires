class Corsair < ApplicationRecord
	validates :first_name, presence: true, length: {maximum: 20}
	validates :age, presence: true, :inclusion => 15..120
	validates :slack_handle, format: {without: /\s/}
	validates :github_handle, format: {without: /\s/}
end
