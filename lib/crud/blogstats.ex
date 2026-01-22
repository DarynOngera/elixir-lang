defmodule Crud.BlogStats do 
  use Ecto.Schema
  import Ecto.Changeset

  schema "stats" do
    field :likes, :integer
    field :comments, :integer
    field :shares, :integer
    belongs_to :blog, Crud.Blog
  end

  def changeset(stats, attr) do
    stats
    |> cast(attr, [:likes, :comments, :shares])
  end
end
