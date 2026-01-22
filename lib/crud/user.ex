defmodule Crud.User do
  use Ecto.Schema 
  import Ecto.Changeset

  schema "users" do  
    field :name, :string
    field :email, :string
    field :age, :integer
    has_many :blogs, Crud.Blog

    #timestamps()
  end

  def changeset(user, attr) do
    user
    |> cast(attr, [:name, :email, :age])
    |> validate_required([:name, :age])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:age, 18..100)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> unique_constraint(:email)
  end
end
