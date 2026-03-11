class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  enum :role, { user: "user", admin: "admin" }, default: "user"
end
