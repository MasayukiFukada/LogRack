defmodule LogLacWeb.DeviceTypeController do
  use LogLacWeb, :controller

  alias LogLac.Member
  alias LogLac.Member.DeviceType

  def index(conn, _params) do
    device_types = Member.list_device_types()
    render(conn, "index.html", device_types: device_types)
  end

  def new(conn, _params) do
    changeset = Member.change_device_type(%DeviceType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"device_type" => device_type_params}) do
    case Member.create_device_type(device_type_params) do
      {:ok, device_type} ->
        conn
        |> put_flash(:info, "Device type created successfully.")
        |> redirect(to: Routes.device_type_path(conn, :show, device_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    device_type = Member.get_device_type!(id)
    render(conn, "show.html", device_type: device_type)
  end

  def edit(conn, %{"id" => id}) do
    device_type = Member.get_device_type!(id)
    changeset = Member.change_device_type(device_type)
    render(conn, "edit.html", device_type: device_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "device_type" => device_type_params}) do
    device_type = Member.get_device_type!(id)

    case Member.update_device_type(device_type, device_type_params) do
      {:ok, device_type} ->
        conn
        |> put_flash(:info, "Device type updated successfully.")
        |> redirect(to: Routes.device_type_path(conn, :show, device_type))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", device_type: device_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    device_type = Member.get_device_type!(id)
    {:ok, _device_type} = Member.delete_device_type(device_type)

    conn
    |> put_flash(:info, "Device type deleted successfully.")
    |> redirect(to: Routes.device_type_path(conn, :index))
  end
end
