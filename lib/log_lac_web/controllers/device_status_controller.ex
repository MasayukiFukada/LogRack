defmodule LogLacWeb.DeviceStatusController do
  use LogLacWeb, :controller

  alias LogLac.Measurement
  alias LogLac.Measurement.DeviceStatus

  def index(conn, _params) do
    device_statuses = Measurement.list_device_statuses()
    render(conn, "index.html", device_statuses: device_statuses)
  end

  def new(conn, _params) do
    changeset = Measurement.change_device_status(%DeviceStatus{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"device_status" => device_status_params}) do
    case Measurement.create_device_status(device_status_params) do
      {:ok, device_status} ->
        conn
        |> put_flash(:info, "Device status created successfully.")
        |> redirect(to: Routes.device_status_path(conn, :show, device_status))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    device_status = Measurement.get_device_status!(id)
    render(conn, "show.html", device_status: device_status)
  end

  def edit(conn, %{"id" => id}) do
    device_status = Measurement.get_device_status!(id)
    changeset = Measurement.change_device_status(device_status)
    render(conn, "edit.html", device_status: device_status, changeset: changeset)
  end

  def update(conn, %{"id" => id, "device_status" => device_status_params}) do
    device_status = Measurement.get_device_status!(id)

    case Measurement.update_device_status(device_status, device_status_params) do
      {:ok, device_status} ->
        conn
        |> put_flash(:info, "Device status updated successfully.")
        |> redirect(to: Routes.device_status_path(conn, :show, device_status))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", device_status: device_status, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    device_status = Measurement.get_device_status!(id)
    {:ok, _device_status} = Measurement.delete_device_status(device_status)

    conn
    |> put_flash(:info, "Device status deleted successfully.")
    |> redirect(to: Routes.device_status_path(conn, :index))
  end
end
