defmodule DemoApp.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :name, :string
      add :age, :integer
      add :gender, :string
      add :city, :string
      timestamps([type: :utc_datetime_usec])
    end

  end
end
