defmodule LogLacWeb.DeviceTypeControllerTest do
  use LogLacWeb.ConnCase

  alias LogLac.Member

  @create_attrs %{code: "some code", name: "some name"}
  @update_attrs %{code: "some updated code", name: "some updated name"}
  @invalid_attrs %{code: nil, name: nil}

  def fixture(:device_type) do
    {:ok, device_type} = Member.create_device_type(@create_attrs)
    device_type
  end

  describe "index" do
    test "lists all device_types", %{conn: conn} do
      conn = get(conn, Routes.device_type_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Device types"
    end
  end

  describe "new device_type" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.device_type_path(conn, :new))
      assert html_response(conn, 200) =~ "New Device type"
    end
  end

  describe "create device_type" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.device_type_path(conn, :create), device_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.device_type_path(conn, :show, id)

      conn = get(conn, Routes.device_type_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Device type"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.device_type_path(conn, :create), device_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Device type"
    end
  end

  describe "edit device_type" do
    setup [:create_device_type]

    test "renders form for editing chosen device_type", %{conn: conn, device_type: device_type} do
      conn = get(conn, Routes.device_type_path(conn, :edit, device_type))
      assert html_response(conn, 200) =~ "Edit Device type"
    end
  end

  describe "update device_type" do
    setup [:create_device_type]

    test "redirects when data is valid", %{conn: conn, device_type: device_type} do
      conn = put(conn, Routes.device_type_path(conn, :update, device_type), device_type: @update_attrs)
      assert redirected_to(conn) == Routes.device_type_path(conn, :show, device_type)

      conn = get(conn, Routes.device_type_path(conn, :show, device_type))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, device_type: device_type} do
      conn = put(conn, Routes.device_type_path(conn, :update, device_type), device_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Device type"
    end
  end

  describe "delete device_type" do
    setup [:create_device_type]

    test "deletes chosen device_type", %{conn: conn, device_type: device_type} do
      conn = delete(conn, Routes.device_type_path(conn, :delete, device_type))
      assert redirected_to(conn) == Routes.device_type_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.device_type_path(conn, :show, device_type))
      end
    end
  end

  defp create_device_type(_) do
    device_type = fixture(:device_type)
    %{device_type: device_type}
  end
end
