defmodule LogLacWeb.AtmosphericPressureController do
  use LogLacWeb, :controller

  alias LogLac.Measurement
  alias LogLac.Measurement.AtmosphericPressure

  def index(conn, _params) do
    atmospheric_pressures = Measurement.list_atmospheric_pressures()
    render(conn, "index.html", atmospheric_pressures: atmospheric_pressures)
  end

  def new(conn, _params) do
    changeset = Measurement.change_atmospheric_pressure(%AtmosphericPressure{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"atmospheric_pressure" => atmospheric_pressure_params}) do
    case Measurement.create_atmospheric_pressure(atmospheric_pressure_params) do
      {:ok, atmospheric_pressure} ->
        conn
        |> put_flash(:info, "Atmospheric pressure created successfully.")
        |> redirect(to: Routes.atmospheric_pressure_path(conn, :show, atmospheric_pressure))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    atmospheric_pressure = Measurement.get_atmospheric_pressure!(id)
    render(conn, "show.html", atmospheric_pressure: atmospheric_pressure)
  end

  def edit(conn, %{"id" => id}) do
    atmospheric_pressure = Measurement.get_atmospheric_pressure!(id)
    changeset = Measurement.change_atmospheric_pressure(atmospheric_pressure)
    render(conn, "edit.html", atmospheric_pressure: atmospheric_pressure, changeset: changeset)
  end

  def update(conn, %{"id" => id, "atmospheric_pressure" => atmospheric_pressure_params}) do
    atmospheric_pressure = Measurement.get_atmospheric_pressure!(id)

    case Measurement.update_atmospheric_pressure(atmospheric_pressure, atmospheric_pressure_params) do
      {:ok, atmospheric_pressure} ->
        conn
        |> put_flash(:info, "Atmospheric pressure updated successfully.")
        |> redirect(to: Routes.atmospheric_pressure_path(conn, :show, atmospheric_pressure))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", atmospheric_pressure: atmospheric_pressure, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    atmospheric_pressure = Measurement.get_atmospheric_pressure!(id)
    {:ok, _atmospheric_pressure} = Measurement.delete_atmospheric_pressure(atmospheric_pressure)

    conn
    |> put_flash(:info, "Atmospheric pressure deleted successfully.")
    |> redirect(to: Routes.atmospheric_pressure_path(conn, :index))
  end
end
