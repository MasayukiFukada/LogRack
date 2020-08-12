defmodule LogLacWeb.InertialMeasurementUnitControllerTest do
  use LogLacWeb.ConnCase

  alias LogLac.Measurement

  @create_attrs %{date: "2010-04-17T14:00:00Z", pich: 42, roll: 42, x_acceleration: 42, y_acceleration: 42, yaw: 42, z_acceleration: 42}
  @update_attrs %{date: "2011-05-18T15:01:01Z", pich: 43, roll: 43, x_acceleration: 43, y_acceleration: 43, yaw: 43, z_acceleration: 43}
  @invalid_attrs %{date: nil, pich: nil, roll: nil, x_acceleration: nil, y_acceleration: nil, yaw: nil, z_acceleration: nil}

  def fixture(:inertial_measurement_unit) do
    {:ok, inertial_measurement_unit} = Measurement.create_inertial_measurement_unit(@create_attrs)
    inertial_measurement_unit
  end

  describe "index" do
    test "lists all inertial_measurement_units", %{conn: conn} do
      conn = get(conn, Routes.inertial_measurement_unit_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Inertial measurement units"
    end
  end

  describe "new inertial_measurement_unit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.inertial_measurement_unit_path(conn, :new))
      assert html_response(conn, 200) =~ "New Inertial measurement unit"
    end
  end

  describe "create inertial_measurement_unit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.inertial_measurement_unit_path(conn, :create), inertial_measurement_unit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.inertial_measurement_unit_path(conn, :show, id)

      conn = get(conn, Routes.inertial_measurement_unit_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Inertial measurement unit"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.inertial_measurement_unit_path(conn, :create), inertial_measurement_unit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Inertial measurement unit"
    end
  end

  describe "edit inertial_measurement_unit" do
    setup [:create_inertial_measurement_unit]

    test "renders form for editing chosen inertial_measurement_unit", %{conn: conn, inertial_measurement_unit: inertial_measurement_unit} do
      conn = get(conn, Routes.inertial_measurement_unit_path(conn, :edit, inertial_measurement_unit))
      assert html_response(conn, 200) =~ "Edit Inertial measurement unit"
    end
  end

  describe "update inertial_measurement_unit" do
    setup [:create_inertial_measurement_unit]

    test "redirects when data is valid", %{conn: conn, inertial_measurement_unit: inertial_measurement_unit} do
      conn = put(conn, Routes.inertial_measurement_unit_path(conn, :update, inertial_measurement_unit), inertial_measurement_unit: @update_attrs)
      assert redirected_to(conn) == Routes.inertial_measurement_unit_path(conn, :show, inertial_measurement_unit)

      conn = get(conn, Routes.inertial_measurement_unit_path(conn, :show, inertial_measurement_unit))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, inertial_measurement_unit: inertial_measurement_unit} do
      conn = put(conn, Routes.inertial_measurement_unit_path(conn, :update, inertial_measurement_unit), inertial_measurement_unit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Inertial measurement unit"
    end
  end

  describe "delete inertial_measurement_unit" do
    setup [:create_inertial_measurement_unit]

    test "deletes chosen inertial_measurement_unit", %{conn: conn, inertial_measurement_unit: inertial_measurement_unit} do
      conn = delete(conn, Routes.inertial_measurement_unit_path(conn, :delete, inertial_measurement_unit))
      assert redirected_to(conn) == Routes.inertial_measurement_unit_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.inertial_measurement_unit_path(conn, :show, inertial_measurement_unit))
      end
    end
  end

  defp create_inertial_measurement_unit(_) do
    inertial_measurement_unit = fixture(:inertial_measurement_unit)
    %{inertial_measurement_unit: inertial_measurement_unit}
  end
end
