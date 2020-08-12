defmodule LogLacWeb.IlluminanceController do
  use LogLacWeb, :controller

  alias LogLac.Measurement
  alias LogLac.Measurement.Illuminance

  def index(conn, _params) do
    illuminances = Measurement.list_illuminances()
    render(conn, "index.html", illuminances: illuminances)
  end

  def new(conn, _params) do
    changeset = Measurement.change_illuminance(%Illuminance{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"illuminance" => illuminance_params}) do
    case Measurement.create_illuminance(illuminance_params) do
      {:ok, illuminance} ->
        conn
        |> put_flash(:info, "Illuminance created successfully.")
        |> redirect(to: Routes.illuminance_path(conn, :show, illuminance))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    illuminance = Measurement.get_illuminance!(id)
    render(conn, "show.html", illuminance: illuminance)
  end

  def edit(conn, %{"id" => id}) do
    illuminance = Measurement.get_illuminance!(id)
    changeset = Measurement.change_illuminance(illuminance)
    render(conn, "edit.html", illuminance: illuminance, changeset: changeset)
  end

  def update(conn, %{"id" => id, "illuminance" => illuminance_params}) do
    illuminance = Measurement.get_illuminance!(id)

    case Measurement.update_illuminance(illuminance, illuminance_params) do
      {:ok, illuminance} ->
        conn
        |> put_flash(:info, "Illuminance updated successfully.")
        |> redirect(to: Routes.illuminance_path(conn, :show, illuminance))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", illuminance: illuminance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    illuminance = Measurement.get_illuminance!(id)
    {:ok, _illuminance} = Measurement.delete_illuminance(illuminance)

    conn
    |> put_flash(:info, "Illuminance deleted successfully.")
    |> redirect(to: Routes.illuminance_path(conn, :index))
  end
end
