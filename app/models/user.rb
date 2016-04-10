class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :favorites
  has_many :entries, through: :favorites

  def favorite_entry(entry)
    favorite.create(entry_id: entry.id)
  end

  def unfavorite(entry)
    favorite.find_by(entry_id: entry.id).destroy
  end

end
