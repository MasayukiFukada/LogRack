defmodule LogLacWeb.SoundControllerTest do
  use LogLacWeb.ConnCase

  alias LogLac.Measurement
  import LogLac.TestData

  @create_attrs %{date: "2010-04-17T14:00:00Z", value: 42, device_code: "d1", sensor_code: "s1"}
  @update_attrs %{date: "2011-05-18T15:01:01Z", value: 43, device_code: "d2", sensor_code: "s2"}
  @invalid_attrs %{date: nil, value: nil}

  def fixture(:sound) do
    setup_fixture()
    {:ok, sound} = Measurement.create_sound(@create_attrs)
    sound
  end

  describe "index" do
    test "lists all sounds", %{conn: conn} do
      conn = get(conn, Routes.sound_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sounds"
    end
  end

  describe "new sound" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sound_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sound"
    end
  end

  describe "create sound" do
    test "redirects to show when data is valid", %{conn: conn} do
      setup_fixture()
      conn = post(conn, Routes.sound_path(conn, :create), sound: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sound_path(conn, :show, id)

      conn = get(conn, Routes.sound_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sound"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sound_path(conn, :create), sound: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sound"
    end
  end

  describe "edit sound" do
    setup [:create_sound]

    test "renders form for editing chosen sound", %{conn: conn, sound: sound} do
      conn = get(conn, Routes.sound_path(conn, :edit, sound))
      assert html_response(conn, 200) =~ "Edit Sound"
    end
  end

  describe "update sound" do
    setup [:create_sound]

    test "redirects when data is valid", %{conn: conn, sound: sound} do
      conn = put(conn, Routes.sound_path(conn, :update, sound), sound: @update_attrs)
      assert redirected_to(conn) == Routes.sound_path(conn, :show, sound)

      conn = get(conn, Routes.sound_path(conn, :show, sound))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, sound: sound} do
      conn = put(conn, Routes.sound_path(conn, :update, sound), sound: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sound"
    end
  end

  describe "delete sound" do
    setup [:create_sound]

    test "deletes chosen sound", %{conn: conn, sound: sound} do
      conn = delete(conn, Routes.sound_path(conn, :delete, sound))
      assert redirected_to(conn) == Routes.sound_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.sound_path(conn, :show, sound))
      end
    end
  end

  defp create_sound(_) do
    sound = fixture(:sound)
    %{sound: sound}
  end
end
