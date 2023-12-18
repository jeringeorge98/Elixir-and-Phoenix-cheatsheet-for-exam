defmodule ExampleProjectWeb.MyTodoHTML do
  use ExampleProjectWeb, :html

  embed_templates "my_todo_html/*"

  @doc """
  Renders a my_todo form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def my_todo_form(assigns)
end
