defmodule Crud.Blogging do
  alias Crud.Content
  # alias Crud.Blog
  # alias Crud.Repo

  def login() do
    email = IO.gets("Enter email: ") |> String.trim()
    Content.login(email)
  end


  def create_blog() do
    IO.puts("Share your knowledge with the world!!")
    title = IO.gets("Title: ") |> String.trim()
    body = IO.gets("Body: ") |> String.trim()
    current_user = login()
    
    attr = %{title: title, body: body, user_id: current_user.id}

    case Content.create_blogs(attr) do 
      {:ok, _} -> IO.puts("Successfully posted!")
      {:error, changeset} -> IO.inspect(changeset.errors)
    end
  end

  def list_my_blogs() do
    current_user = login()
    
    list = Content.list_my_blogs(current_user)
    Enum.each(list, fn x ->
      IO.puts("Title:#{x.title}\nBody:#{x.body}")
    end)
  end

  def delete_blogs() do
    title = 
      IO.gets("Title: ")
      |> String.trim()

    Content.delete_blogs(title)
  end
end


