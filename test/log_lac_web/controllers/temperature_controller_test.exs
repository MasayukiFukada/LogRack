defmodule LogLacWeb.TemperatureControllerTest do
  use LogLacWeb.ConnCase

  alias LogLac.Measurement
  import LogLac.TestData

  @create_attrs %{
    date: "2010-04-17T14:00:00Z",
    value: 120.5,
    device_code: "d1",
    sensor_code: "s1"
  }
  @update_attrs %{
    date: "2011-05-18T15:01:01Z",
    value: 456.7,
    device_code: "d2",
    sensor_code: "s2"
  }
  @invalid_attrs %{date: nil, value: nil}

  def fixture(:temperature) do
    setup_fixture()
    {:ok, temperature} = Measurement.create_temperature(@create_attrs)
    temperature
  end

  describe "index" do
    test "lists all temperatures", %{conn: conn} do
      conn = get(conn, Routes.temperature_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Temperatures"
    end
  end

  describe "new temperature" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.temperature_path(conn, :new))
      assert html_response(conn, 200) =~ "New Temperature"
    end
  end

  describe "create temperature" do
    test "redirects to show when data is valid", %{conn: conn} do
      setup_fixture()
      conn = post(conn, Routes.temperature_path(conn, :create), temperature: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.temperature_path(conn, :show, id)

      conn = get(conn, Routes.temperature_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Temperature"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.temperature_path(conn, :create), temperature: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Temperature"
    end
  end

  describe "edit temperature" do
    setup [:create_temperature]

    test "renders form for editing chosen temperature", %{conn: conn, temperature: temperature} do
      conn = get(conn, Routes.temperature_path(conn, :edit, temperature))
      assert html_response(conn, 200) =~ "Edit Temperature"
    end
  end

  describe "update temperature" do
    setup [:create_temperature]

    test "redirects when data is valid", %{conn: conn, temperature: temperature} do
      conn =
        put(conn, Routes.temperature_path(conn, :update, temperature), temperature: @update_attrs)

      assert redirected_to(conn) == Routes.temperature_path(conn, :show, temperature)

      conn = get(conn, Routes.temperature_path(conn, :show, temperature))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, temperature: temperature} do
      conn =
        put(conn, Routes.temperature_path(conn, :update, temperature), temperature: @invalid_attrs)

      assert html_response(conn, 200) =~ "Edit Temperature"
    end
  end

  describe "delete temperature" do
    setup [:create_temperature]

    test "deletes chosen temperature", %{conn: conn, temperature: temperature} do
      conn = delete(conn, Routes.temperature_path(conn, :delete, temperature))
      assert redirected_to(conn) == Routes.temperature_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.temperature_path(conn, :show, temperature))
      end
    end
  end

  defp create_temperature(_) do
    temperature = fixture(:temperature)
    %{temperature: temperature}
  end
end
