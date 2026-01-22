defmodule Crud.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :title, :string
    field :body, :string
    belongs_to :user, Crud.User
    has_one :stats, Crud.BlogStats
  end

  def changeset(blog, attr) do
    blog
    |> cast(attr, [:title, :body, :user_id])
    |> validate_required([:title, :body])
    |> validate_length(:title, min: 3, max: 100)

  end
end
