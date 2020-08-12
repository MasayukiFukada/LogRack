defmodule LogLacWeb.TemperatureController do
  use LogLacWeb, :controller

  alias LogLac.Measurement
  alias LogLac.Measurement.Temperature

  def index(conn, _params) do
    temperatures = Measurement.list_temperatures()
    render(conn, "index.html", temperatures: temperatures)
  end

  def new(conn, _params) do
    changeset = Measurement.change_temperature(%Temperature{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"temperature" => temperature_params}) do
    case Measurement.create_temperature(temperature_params) do
      {:ok, temperature} ->
        conn
        |> put_flash(:info, "Temperature created successfully.")
        |> redirect(to: Routes.temperature_path(conn, :show, temperature))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    temperature = Measurement.get_temperature!(id)
    render(conn, "show.html", temperature: temperature)
  end

  def edit(conn, %{"id" => id}) do
    temperature = Measurement.get_temperature!(id)
    changeset = Measurement.change_temperature(temperature)
    render(conn, "edit.html", temperature: temperature, changeset: changeset)
  end

  def update(conn, %{"id" => id, "temperature" => temperature_params}) do
    temperature = Measurement.get_temperature!(id)

    case Measurement.update_temperature(temperature, temperature_params) do
      {:ok, temperature} ->
        conn
        |> put_flash(:info, "Temperature updated successfully.")
        |> redirect(to: Routes.temperature_path(conn, :show, temperature))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", temperature: temperature, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    temperature = Measurement.get_temperature!(id)
    {:ok, _temperature} = Measurement.delete_temperature(temperature)

    conn
    |> put_flash(:info, "Temperature deleted successfully.")
    |> redirect(to: Routes.temperature_path(conn, :index))
  end
end
