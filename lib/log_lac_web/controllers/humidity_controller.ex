defmodule LogLacWeb.HumidityController do
  use LogLacWeb, :controller

  alias LogLac.Measurement
  alias LogLac.Measurement.Humidity

  def index(conn, _params) do
    humidities = Measurement.list_humidities()
    render(conn, "index.html", humidities: humidities)
  end

  def new(conn, _params) do
    changeset = Measurement.change_humidity(%Humidity{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"humidity" => humidity_params}) do
    case Measurement.create_humidity(humidity_params) do
      {:ok, humidity} ->
        conn
        |> put_flash(:info, "Humidity created successfully.")
        |> redirect(to: Routes.humidity_path(conn, :show, humidity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    humidity = Measurement.get_humidity!(id)
    render(conn, "show.html", humidity: humidity)
  end

  def edit(conn, %{"id" => id}) do
    humidity = Measurement.get_humidity!(id)
    changeset = Measurement.change_humidity(humidity)
    render(conn, "edit.html", humidity: humidity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "humidity" => humidity_params}) do
    humidity = Measurement.get_humidity!(id)

    case Measurement.update_humidity(humidity, humidity_params) do
      {:ok, humidity} ->
        conn
        |> put_flash(:info, "Humidity updated successfully.")
        |> redirect(to: Routes.humidity_path(conn, :show, humidity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", humidity: humidity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    humidity = Measurement.get_humidity!(id)
    {:ok, _humidity} = Measurement.delete_humidity(humidity)

    conn
    |> put_flash(:info, "Humidity deleted successfully.")
    |> redirect(to: Routes.humidity_path(conn, :index))
  end
end
