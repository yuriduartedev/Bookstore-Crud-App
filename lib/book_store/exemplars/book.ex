defmodule BookStore.Exemplars.Book do
  use Ecto.Schema
  import Ecto.Changeset


  schema "books" do
    field :author, :string
    field :category, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name, :author, :category])
    |> validate_required([:name, :author, :category])
  end
end
