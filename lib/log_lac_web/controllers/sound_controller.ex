defmodule LogLacWeb.SoundController do
  use LogLacWeb, :controller

  alias LogLac.Measurement
  alias LogLac.Measurement.Sound

  def index(conn, _params) do
    sounds = Measurement.list_sounds()
    render(conn, "index.html", sounds: sounds)
  end

  def new(conn, _params) do
    changeset = Measurement.change_sound(%Sound{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sound" => sound_params}) do
    case Measurement.create_sound(sound_params) do
      {:ok, sound} ->
        conn
        |> put_flash(:info, "Sound created successfully.")
        |> redirect(to: Routes.sound_path(conn, :show, sound))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sound = Measurement.get_sound!(id)
    render(conn, "show.html", sound: sound)
  end

  def edit(conn, %{"id" => id}) do
    sound = Measurement.get_sound!(id)
    changeset = Measurement.change_sound(sound)
    render(conn, "edit.html", sound: sound, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sound" => sound_params}) do
    sound = Measurement.get_sound!(id)

    case Measurement.update_sound(sound, sound_params) do
      {:ok, sound} ->
        conn
        |> put_flash(:info, "Sound updated successfully.")
        |> redirect(to: Routes.sound_path(conn, :show, sound))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sound: sound, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sound = Measurement.get_sound!(id)
    {:ok, _sound} = Measurement.delete_sound(sound)

    conn
    |> put_flash(:info, "Sound deleted successfully.")
    |> redirect(to: Routes.sound_path(conn, :index))
  end
end
