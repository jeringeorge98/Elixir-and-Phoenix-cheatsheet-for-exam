defmodule NeedforvelocityWeb.RacerHTML do
  use NeedforvelocityWeb, :html

  embed_templates "racer_html/*"

  @doc """
  Renders a racer form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def racer_form(assigns)
end
