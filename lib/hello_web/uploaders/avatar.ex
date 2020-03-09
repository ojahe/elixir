defmodule Hello.Avatar do
  # Include ecto support (requires package arc_ecto installed):
  use Arc.Definition
  use Arc.Ecto.Definition

  # To add a thumbnail version:
  @versions [:original, :thumb]

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 100x100^ -gravity center -extent 100x100"}
  end

  # Override the persisted filenames:
  def filename(version, _) do
    version
  end
  defp images_dir(user) do
    times = user.inserted_at
    "#{times.year}/#{times.month}/#{times.day}"
  end

  # Override the storage directory:
  def storage_dir(version, { _, scope }) do
    "users/avatars/#{images_dir(scope)}"
  end

  # Provide a default URL if there hasn't been a file uploaded
  def default_url() do
    "users/avatars/default.png"
  end

end
