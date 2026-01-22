defmodule Crud.Content do 
  alias Crud.Repo
  alias Crud.Blog
  alias Crud.User
  import Ecto.Query

  def create_blogs(attr) do
    %Blog{}
    |> Blog.changeset(attr)
    |> Repo.insert()
  end

  def login(email) do
    Repo.get_by(User, email: email)
  end

  def list_my_blogs(user) do
    from(b in Blog,
      where: b.user_id == ^user.id,
      select: %{
        title: b.title,
        body: b.body
      }
    )

    |> Repo.all()
  end

  def delete_blogs(title) do
    query = from(b in Blog,
      where: b.title == ^title,
      select: b.id
    )
    title_id = Repo.one(query)
    Repo.get(Blog, title_id) |> Repo.delete()
    #Repo.delete()
  end
end
