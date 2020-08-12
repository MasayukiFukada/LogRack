defmodule LogLacWeb.DeviceStatusControllerTest do
  use LogLacWeb.ConnCase

  alias LogLac.Measurement

  @create_attrs %{cpu_use_rate: 42, memory_use_rate: 42, storage: 42, temperature: 120.5, wake_on_at: "2010-04-17T14:00:00Z"}
  @update_attrs %{cpu_use_rate: 43, memory_use_rate: 43, storage: 43, temperature: 456.7, wake_on_at: "2011-05-18T15:01:01Z"}
  @invalid_attrs %{cpu_use_rate: nil, memory_use_rate: nil, storage: nil, temperature: nil, wake_on_at: nil}

  def fixture(:device_status) do
    {:ok, device_status} = Measurement.create_device_status(@create_attrs)
    device_status
  end

  describe "index" do
    test "lists all device_statuses", %{conn: conn} do
      conn = get(conn, Routes.device_status_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Device statuses"
    end
  end

  describe "new device_status" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.device_status_path(conn, :new))
      assert html_response(conn, 200) =~ "New Device status"
    end
  end

  describe "create device_status" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.device_status_path(conn, :create), device_status: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.device_status_path(conn, :show, id)

      conn = get(conn, Routes.device_status_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Device status"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.device_status_path(conn, :create), device_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Device status"
    end
  end

  describe "edit device_status" do
    setup [:create_device_status]

    test "renders form for editing chosen device_status", %{conn: conn, device_status: device_status} do
      conn = get(conn, Routes.device_status_path(conn, :edit, device_status))
      assert html_response(conn, 200) =~ "Edit Device status"
    end
  end

  describe "update device_status" do
    setup [:create_device_status]

    test "redirects when data is valid", %{conn: conn, device_status: device_status} do
      conn = put(conn, Routes.device_status_path(conn, :update, device_status), device_status: @update_attrs)
      assert redirected_to(conn) == Routes.device_status_path(conn, :show, device_status)

      conn = get(conn, Routes.device_status_path(conn, :show, device_status))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, device_status: device_status} do
      conn = put(conn, Routes.device_status_path(conn, :update, device_status), device_status: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Device status"
    end
  end

  describe "delete device_status" do
    setup [:create_device_status]

    test "deletes chosen device_status", %{conn: conn, device_status: device_status} do
      conn = delete(conn, Routes.device_status_path(conn, :delete, device_status))
      assert redirected_to(conn) == Routes.device_status_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.device_status_path(conn, :show, device_status))
      end
    end
  end

  defp create_device_status(_) do
    device_status = fixture(:device_status)
    %{device_status: device_status}
  end
end
