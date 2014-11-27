class AddColumnsToTerms < ActiveRecord::Migration
  def change
  	add_column :terms, :term_name, :string
  	add_column :terms, :term_part_of_speech, :string
  	add_column :terms, :term_language, :string
  	add_column :terms, :term_definition, :text
  	add_column :terms, :term_gender, :string
  end
end
