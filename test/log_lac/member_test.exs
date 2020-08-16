defmodule LogLac.MemberTest do
  use LogLac.DataCase

  alias LogLac.Member

  describe "device_types" do
    alias LogLac.Member.DeviceType

    @valid_attrs %{code: "t1", name: "some name"}
    @update_attrs %{code: "t2", name: "some updated name"}
    @invalid_attrs %{code: nil, name: nil}

    def device_type_fixture(attrs \\ %{}) do
      {:ok, device_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Member.create_device_type()

      device_type
    end

    # 既存データ用の追加
    def device_type_fixture_appendix(attrs \\ %{}) do
      attrs
      |> Enum.into(@update_attrs)
      |> Member.create_device_type()
    end

    test "list_device_types/0 returns all device_types" do
      device_type = device_type_fixture()
      assert Member.list_device_types() == [device_type]
    end

    test "get_device_type!/1 returns the device_type with given id" do
      device_type = device_type_fixture()
      assert Member.get_device_type!(device_type.id) == device_type
    end

    test "create_device_type/1 with valid data creates a device_type" do
      assert {:ok, %DeviceType{} = device_type} = Member.create_device_type(@valid_attrs)
      assert device_type.code == "t1"
      assert device_type.name == "some name"
    end

    test "create_device_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Member.create_device_type(@invalid_attrs)
    end

    test "update_device_type/2 with valid data updates the device_type" do
      device_type = device_type_fixture()

      assert {:ok, %DeviceType{} = device_type} =
               Member.update_device_type(device_type, @update_attrs)

      assert device_type.code == "t2"
      assert device_type.name == "some updated name"
    end

    test "update_device_type/2 with invalid data returns error changeset" do
      device_type = device_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Member.update_device_type(device_type, @invalid_attrs)
      assert device_type == Member.get_device_type!(device_type.id)
    end

    test "delete_device_type/1 deletes the device_type" do
      device_type = device_type_fixture()
      assert {:ok, %DeviceType{}} = Member.delete_device_type(device_type)
      assert_raise Ecto.NoResultsError, fn -> Member.get_device_type!(device_type.id) end
    end

    test "change_device_type/1 returns a device_type changeset" do
      device_type = device_type_fixture()
      assert %Ecto.Changeset{} = Member.change_device_type(device_type)
    end
  end

  describe "devices" do
    alias LogLac.Member.Device

    @valid_attrs %{code: "some code", name: "some name", remarks: "some remarks", type_code: "t1"}
    @update_attrs %{
      code: "some updated code",
      name: "some updated name",
      remarks: "some updated remarks",
      type_code: "t2"
    }
    @invalid_attrs %{code: nil, name: nil, remarks: nil, type_code: nil}

    def device_fixture(attrs \\ %{}) do
      {:ok, device} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Member.create_device()

      device
    end

    test "list_devices/0 returns all devices" do
      device_type_fixture()
      device = device_fixture()
      assert Member.list_devices() == [device]
    end

    test "get_device!/1 returns the device with given id" do
      device_type_fixture()
      device = device_fixture()
      assert Member.get_device!(device.id) == device
    end

    test "create_device/1 with valid data creates a device" do
      device_type_fixture()
      device_type_fixture_appendix()
      assert {:ok, %Device{} = device} = Member.create_device(@valid_attrs)
      assert device.code == "some code"
      assert device.name == "some name"
      assert device.remarks == "some remarks"
    end

    test "create_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Member.create_device(@invalid_attrs)
    end

    test "update_device/2 with valid data updates the device" do
      device_type_fixture()
      device_type_fixture_appendix()
      device = device_fixture()
      assert {:ok, %Device{} = device} = Member.update_device(device, @update_attrs)
      assert device.code == "some updated code"
      assert device.name == "some updated name"
      assert device.remarks == "some updated remarks"
    end

    test "update_device/2 with invalid data returns error changeset" do
      device_type_fixture()
      device = device_fixture()
      assert {:error, %Ecto.Changeset{}} = Member.update_device(device, @invalid_attrs)
      assert device == Member.get_device!(device.id)
    end

    test "delete_device/1 deletes the device" do
      device_type_fixture()
      device = device_fixture()
      assert {:ok, %Device{}} = Member.delete_device(device)
      assert_raise Ecto.NoResultsError, fn -> Member.get_device!(device.id) end
    end

    test "change_device/1 returns a device changeset" do
      device_type_fixture()
      device = device_fixture()
      assert %Ecto.Changeset{} = Member.change_device(device)
    end
  end

  describe "sensors" do
    alias LogLac.Member.Sensor

    @valid_attrs %{code: "some code", name: "some name", remarks: "some remarks"}
    @update_attrs %{
      code: "some updated code",
      name: "some updated name",
      remarks: "some updated remarks"
    }
    @invalid_attrs %{code: nil, name: nil, remarks: nil}

    def sensor_fixture(attrs \\ %{}) do
      {:ok, sensor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Member.create_sensor()

      sensor
    end

    test "list_sensors/0 returns all sensors" do
      sensor = sensor_fixture()
      assert Member.list_sensors() == [sensor]
    end

    test "get_sensor!/1 returns the sensor with given id" do
      sensor = sensor_fixture()
      assert Member.get_sensor!(sensor.id) == sensor
    end

    test "create_sensor/1 with valid data creates a sensor" do
      assert {:ok, %Sensor{} = sensor} = Member.create_sensor(@valid_attrs)
      assert sensor.code == "some code"
      assert sensor.name == "some name"
      assert sensor.remarks == "some remarks"
    end

    test "create_sensor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Member.create_sensor(@invalid_attrs)
    end

    test "update_sensor/2 with valid data updates the sensor" do
      sensor = sensor_fixture()
      assert {:ok, %Sensor{} = sensor} = Member.update_sensor(sensor, @update_attrs)
      assert sensor.code == "some updated code"
      assert sensor.name == "some updated name"
      assert sensor.remarks == "some updated remarks"
    end

    test "update_sensor/2 with invalid data returns error changeset" do
      sensor = sensor_fixture()
      assert {:error, %Ecto.Changeset{}} = Member.update_sensor(sensor, @invalid_attrs)
      assert sensor == Member.get_sensor!(sensor.id)
    end

    test "delete_sensor/1 deletes the sensor" do
      sensor = sensor_fixture()
      assert {:ok, %Sensor{}} = Member.delete_sensor(sensor)
      assert_raise Ecto.NoResultsError, fn -> Member.get_sensor!(sensor.id) end
    end

    test "change_sensor/1 returns a sensor changeset" do
      sensor = sensor_fixture()
      assert %Ecto.Changeset{} = Member.change_sensor(sensor)
    end
  end
end
