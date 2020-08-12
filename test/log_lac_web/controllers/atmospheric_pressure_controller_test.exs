defmodule LogLacWeb.AtmosphericPressureControllerTest do
  use LogLacWeb.ConnCase

  alias LogLac.Measurement

  @create_attrs %{date: "2010-04-17T14:00:00Z", value: 42}
  @update_attrs %{date: "2011-05-18T15:01:01Z", value: 43}
  @invalid_attrs %{date: nil, value: nil}

  def fixture(:atmospheric_pressure) do
    {:ok, atmospheric_pressure} = Measurement.create_atmospheric_pressure(@create_attrs)
    atmospheric_pressure
  end

  describe "index" do
    test "lists all atmospheric_pressures", %{conn: conn} do
      conn = get(conn, Routes.atmospheric_pressure_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Atmospheric pressures"
    end
  end

  describe "new atmospheric_pressure" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.atmospheric_pressure_path(conn, :new))
      assert html_response(conn, 200) =~ "New Atmospheric pressure"
    end
  end

  describe "create atmospheric_pressure" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.atmospheric_pressure_path(conn, :create), atmospheric_pressure: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.atmospheric_pressure_path(conn, :show, id)

      conn = get(conn, Routes.atmospheric_pressure_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Atmospheric pressure"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.atmospheric_pressure_path(conn, :create), atmospheric_pressure: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Atmospheric pressure"
    end
  end

  describe "edit atmospheric_pressure" do
    setup [:create_atmospheric_pressure]

    test "renders form for editing chosen atmospheric_pressure", %{conn: conn, atmospheric_pressure: atmospheric_pressure} do
      conn = get(conn, Routes.atmospheric_pressure_path(conn, :edit, atmospheric_pressure))
      assert html_response(conn, 200) =~ "Edit Atmospheric pressure"
    end
  end

  describe "update atmospheric_pressure" do
    setup [:create_atmospheric_pressure]

    test "redirects when data is valid", %{conn: conn, atmospheric_pressure: atmospheric_pressure} do
      conn = put(conn, Routes.atmospheric_pressure_path(conn, :update, atmospheric_pressure), atmospheric_pressure: @update_attrs)
      assert redirected_to(conn) == Routes.atmospheric_pressure_path(conn, :show, atmospheric_pressure)

      conn = get(conn, Routes.atmospheric_pressure_path(conn, :show, atmospheric_pressure))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, atmospheric_pressure: atmospheric_pressure} do
      conn = put(conn, Routes.atmospheric_pressure_path(conn, :update, atmospheric_pressure), atmospheric_pressure: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Atmospheric pressure"
    end
  end

  describe "delete atmospheric_pressure" do
    setup [:create_atmospheric_pressure]

    test "deletes chosen atmospheric_pressure", %{conn: conn, atmospheric_pressure: atmospheric_pressure} do
      conn = delete(conn, Routes.atmospheric_pressure_path(conn, :delete, atmospheric_pressure))
      assert redirected_to(conn) == Routes.atmospheric_pressure_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.atmospheric_pressure_path(conn, :show, atmospheric_pressure))
      end
    end
  end

  defp create_atmospheric_pressure(_) do
    atmospheric_pressure = fixture(:atmospheric_pressure)
    %{atmospheric_pressure: atmospheric_pressure}
  end
end
