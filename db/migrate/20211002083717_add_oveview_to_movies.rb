class AddOveviewToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :overview, :string
  end
end
