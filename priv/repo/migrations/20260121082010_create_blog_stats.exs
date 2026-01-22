defmodule Crud.Repo.Migrations.CreateBlogStats do
  use Ecto.Migration

  def change do
    create table(:stats) do
      add :likes, :integer, default: 0
      add :comments, :integer, default: 0
      add :shares, :integer, default: 0
      add :blog_id, references(:blogs)
    end
  end
end
