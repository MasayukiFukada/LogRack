defmodule LogLacWeb.HumidityControllerTest do
  use LogLacWeb.ConnCase

  alias LogLac.Measurement

  @create_attrs %{date: "2010-04-17T14:00:00Z", value: 42}
  @update_attrs %{date: "2011-05-18T15:01:01Z", value: 43}
  @invalid_attrs %{date: nil, value: nil}

  def fixture(:humidity) do
    {:ok, humidity} = Measurement.create_humidity(@create_attrs)
    humidity
  end

  describe "index" do
    test "lists all humidities", %{conn: conn} do
      conn = get(conn, Routes.humidity_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Humidities"
    end
  end

  describe "new humidity" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.humidity_path(conn, :new))
      assert html_response(conn, 200) =~ "New Humidity"
    end
  end

  describe "create humidity" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.humidity_path(conn, :create), humidity: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.humidity_path(conn, :show, id)

      conn = get(conn, Routes.humidity_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Humidity"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.humidity_path(conn, :create), humidity: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Humidity"
    end
  end

  describe "edit humidity" do
    setup [:create_humidity]

    test "renders form for editing chosen humidity", %{conn: conn, humidity: humidity} do
      conn = get(conn, Routes.humidity_path(conn, :edit, humidity))
      assert html_response(conn, 200) =~ "Edit Humidity"
    end
  end

  describe "update humidity" do
    setup [:create_humidity]

    test "redirects when data is valid", %{conn: conn, humidity: humidity} do
      conn = put(conn, Routes.humidity_path(conn, :update, humidity), humidity: @update_attrs)
      assert redirected_to(conn) == Routes.humidity_path(conn, :show, humidity)

      conn = get(conn, Routes.humidity_path(conn, :show, humidity))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, humidity: humidity} do
      conn = put(conn, Routes.humidity_path(conn, :update, humidity), humidity: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Humidity"
    end
  end

  describe "delete humidity" do
    setup [:create_humidity]

    test "deletes chosen humidity", %{conn: conn, humidity: humidity} do
      conn = delete(conn, Routes.humidity_path(conn, :delete, humidity))
      assert redirected_to(conn) == Routes.humidity_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.humidity_path(conn, :show, humidity))
      end
    end
  end

  defp create_humidity(_) do
    humidity = fixture(:humidity)
    %{humidity: humidity}
  end
end
