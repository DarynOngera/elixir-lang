defmodule Crud.User do
  use Ecto.Schema 
  import Ecto.Changeset

  schema "users" do  
    field :name, :string
    field :email, :string
    field :age, :integer

    #timestamps()
  end

  def changeset(user, attr) do
    user
    |> cast(attr, [:name, :email, :age])
    |> validate_required([:name, :age])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:age, 18..100)
    |> unique_constraint(:email)
  end
end
