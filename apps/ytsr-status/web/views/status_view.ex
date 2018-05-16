defmodule YtsrStatus.Web.StatusView do
  use YtsrStatus.Web, :view

  def render("index.json", %{distributions: distributions}) do
    %{
      distributions: distributions,
      total: total
    }
  end

  def render("400.json", %{errors: errors}) do
    %{errors: errors}
  end
end
