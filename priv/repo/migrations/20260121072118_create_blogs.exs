defmodule Crud.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do 
      add :title, :string
      add :body, :string
      add :user_id, references(:users)
    end
  end
end
