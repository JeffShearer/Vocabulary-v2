class Term < ActiveRecord::Base
	belongs_to :user
	validates :term_name, presence: true
	validates :term_definition, presence: true
	validates :term_language, presence: true
end
