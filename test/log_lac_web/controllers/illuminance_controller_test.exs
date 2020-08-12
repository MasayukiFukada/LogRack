defmodule LogLacWeb.IlluminanceControllerTest do
  use LogLacWeb.ConnCase

  alias LogLac.Measurement

  @create_attrs %{date: "2010-04-17T14:00:00Z", value: 42}
  @update_attrs %{date: "2011-05-18T15:01:01Z", value: 43}
  @invalid_attrs %{date: nil, value: nil}

  def fixture(:illuminance) do
    {:ok, illuminance} = Measurement.create_illuminance(@create_attrs)
    illuminance
  end

  describe "index" do
    test "lists all illuminances", %{conn: conn} do
      conn = get(conn, Routes.illuminance_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Illuminances"
    end
  end

  describe "new illuminance" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.illuminance_path(conn, :new))
      assert html_response(conn, 200) =~ "New Illuminance"
    end
  end

  describe "create illuminance" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.illuminance_path(conn, :create), illuminance: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.illuminance_path(conn, :show, id)

      conn = get(conn, Routes.illuminance_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Illuminance"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.illuminance_path(conn, :create), illuminance: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Illuminance"
    end
  end

  describe "edit illuminance" do
    setup [:create_illuminance]

    test "renders form for editing chosen illuminance", %{conn: conn, illuminance: illuminance} do
      conn = get(conn, Routes.illuminance_path(conn, :edit, illuminance))
      assert html_response(conn, 200) =~ "Edit Illuminance"
    end
  end

  describe "update illuminance" do
    setup [:create_illuminance]

    test "redirects when data is valid", %{conn: conn, illuminance: illuminance} do
      conn = put(conn, Routes.illuminance_path(conn, :update, illuminance), illuminance: @update_attrs)
      assert redirected_to(conn) == Routes.illuminance_path(conn, :show, illuminance)

      conn = get(conn, Routes.illuminance_path(conn, :show, illuminance))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, illuminance: illuminance} do
      conn = put(conn, Routes.illuminance_path(conn, :update, illuminance), illuminance: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Illuminance"
    end
  end

  describe "delete illuminance" do
    setup [:create_illuminance]

    test "deletes chosen illuminance", %{conn: conn, illuminance: illuminance} do
      conn = delete(conn, Routes.illuminance_path(conn, :delete, illuminance))
      assert redirected_to(conn) == Routes.illuminance_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.illuminance_path(conn, :show, illuminance))
      end
    end
  end

  defp create_illuminance(_) do
    illuminance = fixture(:illuminance)
    %{illuminance: illuminance}
  end
end
