defmodule BookStore.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string
      add :author, :string
      add :category, :string

      timestamps()
    end

  end
end
