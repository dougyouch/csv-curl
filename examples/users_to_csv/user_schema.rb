class UserSchema
  include Schema::All
  schema_include Schema::Arrays

  has_one(:user) do
    attribute :id, :integer
    attribute :email, :string
    attribute :name, :string
  end
end
