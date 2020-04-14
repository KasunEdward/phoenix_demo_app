defmodule DemoApp.User.UserSchema do
  use Ecto.Schema

  schema "user" do
    field :name, :string
    field :age, :integer
    field :gender, :string
    field :city, :string
    timestamps([type: :utc_datetime_usec])
  end

  def changeset(user, params \\ %{}) do
    user
    |> Ecto.Changeset.cast(params, [:name, :age])
    |> Ecto.Changeset.validate_required([:name, :age])
  end

end
