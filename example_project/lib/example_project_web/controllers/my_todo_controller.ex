defmodule ExampleProjectWeb.MyTodoController do
  use ExampleProjectWeb, :controller

  alias ExampleProject.Data
  alias ExampleProject.Data.MyTodo

  def index(conn, _params) do
    my_todos = Data.list_my_todos()
    render(conn, :index, my_todos: my_todos)
  end

  def new(conn, _params) do
    changeset = Data.change_my_todo(%MyTodo{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"my_todo" => my_todo_params}) do
    case Data.create_my_todo(my_todo_params) do
      {:ok, my_todo} ->
        conn
        |> put_flash(:info, "My todo created successfully.")
        |> redirect(to: ~p"/my_todos/#{my_todo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    my_todo = Data.get_my_todo!(id)
    render(conn, :show, my_todo: my_todo)
  end

  def edit(conn, %{"id" => id}) do
    my_todo = Data.get_my_todo!(id)
    changeset = Data.change_my_todo(my_todo)
    render(conn, :edit, my_todo: my_todo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "my_todo" => my_todo_params}) do
    my_todo = Data.get_my_todo!(id)

    case Data.update_my_todo(my_todo, my_todo_params) do
      {:ok, my_todo} ->
        conn
        |> put_flash(:info, "My todo updated successfully.")
        |> redirect(to: ~p"/my_todos/#{my_todo}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, my_todo: my_todo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    my_todo = Data.get_my_todo!(id)
    {:ok, _my_todo} = Data.delete_my_todo(my_todo)

    conn
    |> put_flash(:info, "My todo deleted successfully.")
    |> redirect(to: ~p"/my_todos")
  end
end
