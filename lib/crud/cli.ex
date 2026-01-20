defmodule Crud.Cli do
  alias Crud.Accounts
  alias Crud.Repo
  alias Crud.User 

  def start do
    menu()
    |> handle_choice()
  end

  def menu do
    IO.puts("""
    --- USER CRUD ---
    1. LIST USERS 
    2. CREATE USER
    3. UPDATE USER
    4. DELETE USER
    5. EXIT
    """)

    IO.gets("Choose: ") |> String.trim()
  end

  defp handle_choice("1"), do: list_users()
  defp handle_choice("2"), do: create_user()
  defp handle_choice("3"), do: update_user()
  defp handle_choice("4"), do: delete_user()
  defp handle_choice("5"), do: :ok
  defp handle_choice(_), do: start()

  def list_users() do
    users = Accounts.list_users()
    Enum.each(users, fn user ->
    IO.puts("#{user.id}: #{user.name} (#{user.email})") end)
    start()
  end

  def create_user() do
    name = IO.gets("Enter name: ") |> String.trim()
    email = IO.gets("Enter email: ") |> String.trim()
    age = IO.gets("Enter age: ") |> String.trim() |> String.to_integer()

    case Accounts.create_user(%{name: name, email: email, age: age}) do
      {:ok, _user} -> IO.puts("User Created")
      {:error, changeset} -> IO.inspect(changeset.errors)
    end
    
    start()
  end

  def update_user() do
    id = 
      IO.gets("User ID: ")
      |> String.trim()
      |> String.to_integer()

    user = Repo.get(User, id)
    name = IO.gets("New name: ") |> String.trim()

    case Accounts.update_user(user, %{name: name}) do 
      {:ok, _} -> IO.puts("Updated")
      {:error, changeset} -> IO.inspect(changeset.errors)
    end

    start()
  end

  def delete_user() do
    id = 
      IO.gets("User ID: ")
      |> String.trim()
      |> String.to_integer()

    user = Repo.get(User, id)
    {:ok, _} = Accounts.delete_user(user)

    IO.puts("Deleted")
    start()
  end
end
