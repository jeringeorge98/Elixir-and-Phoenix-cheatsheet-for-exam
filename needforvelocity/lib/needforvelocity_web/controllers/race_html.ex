defmodule NeedforvelocityWeb.RaceHTML do
  use NeedforvelocityWeb, :html

  embed_templates "race_html/*"

  @doc """
  Renders a race form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def race_form(assigns)
end
