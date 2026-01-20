defmodule Crud.Accounts do
  alias Crud.Repo
  alias Crud.User

  def list_users() do
    Repo.all(User)
  end

  def create_user(attr) do 
    %User{}
    |> User.changeset(attr)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attr) do 
    user
    |> User.changeset(attr)
    |> Repo.update()
  end

  def delete_user(user) do
    Repo.delete(user)
  end
end
