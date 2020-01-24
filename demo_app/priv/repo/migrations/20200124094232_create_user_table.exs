defmodule DemoApp.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :age, :integer
    end

  end
end
