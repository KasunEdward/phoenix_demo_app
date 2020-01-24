defmodule DemoApp.User.UserSchema do
  use Ecto.Schema

  schema "user" do
    field :name, :string
    field :age, :integer
  end

  def changeset(user, params \\ %{}) do
    user
    |> Ecto.Changeset.cast(params, [:name, :age])
    |> Ecto.Changeset.validate_required([:name, :age])
  end

end
