defmodule LogLacWeb.InertialMeasurementUnitController do
  use LogLacWeb, :controller

  alias LogLac.Measurement
  alias LogLac.Measurement.InertialMeasurementUnit

  def index(conn, _params) do
    inertial_measurement_units = Measurement.list_inertial_measurement_units()
    render(conn, "index.html", inertial_measurement_units: inertial_measurement_units)
  end

  def new(conn, _params) do
    changeset = Measurement.change_inertial_measurement_unit(%InertialMeasurementUnit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"inertial_measurement_unit" => inertial_measurement_unit_params}) do
    case Measurement.create_inertial_measurement_unit(inertial_measurement_unit_params) do
      {:ok, inertial_measurement_unit} ->
        conn
        |> put_flash(:info, "Inertial measurement unit created successfully.")
        |> redirect(to: Routes.inertial_measurement_unit_path(conn, :show, inertial_measurement_unit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    inertial_measurement_unit = Measurement.get_inertial_measurement_unit!(id)
    render(conn, "show.html", inertial_measurement_unit: inertial_measurement_unit)
  end

  def edit(conn, %{"id" => id}) do
    inertial_measurement_unit = Measurement.get_inertial_measurement_unit!(id)
    changeset = Measurement.change_inertial_measurement_unit(inertial_measurement_unit)
    render(conn, "edit.html", inertial_measurement_unit: inertial_measurement_unit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "inertial_measurement_unit" => inertial_measurement_unit_params}) do
    inertial_measurement_unit = Measurement.get_inertial_measurement_unit!(id)

    case Measurement.update_inertial_measurement_unit(inertial_measurement_unit, inertial_measurement_unit_params) do
      {:ok, inertial_measurement_unit} ->
        conn
        |> put_flash(:info, "Inertial measurement unit updated successfully.")
        |> redirect(to: Routes.inertial_measurement_unit_path(conn, :show, inertial_measurement_unit))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", inertial_measurement_unit: inertial_measurement_unit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    inertial_measurement_unit = Measurement.get_inertial_measurement_unit!(id)
    {:ok, _inertial_measurement_unit} = Measurement.delete_inertial_measurement_unit(inertial_measurement_unit)

    conn
    |> put_flash(:info, "Inertial measurement unit deleted successfully.")
    |> redirect(to: Routes.inertial_measurement_unit_path(conn, :index))
  end
end
