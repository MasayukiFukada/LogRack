defmodule LogLac.MeasurementTest do
  use LogLac.DataCase

  alias LogLac.Measurement

  describe "device_statuses" do
    alias LogLac.Measurement.DeviceStatus

    @valid_attrs %{cpu_use_rate: 42, memory_use_rate: 42, storage: 42, temperature: 120.5, wake_on_at: "2010-04-17T14:00:00Z"}
    @update_attrs %{cpu_use_rate: 43, memory_use_rate: 43, storage: 43, temperature: 456.7, wake_on_at: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{cpu_use_rate: nil, memory_use_rate: nil, storage: nil, temperature: nil, wake_on_at: nil}

    def device_status_fixture(attrs \\ %{}) do
      {:ok, device_status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Measurement.create_device_status()

      device_status
    end

    test "list_device_statuses/0 returns all device_statuses" do
      device_status = device_status_fixture()
      assert Measurement.list_device_statuses() == [device_status]
    end

    test "get_device_status!/1 returns the device_status with given id" do
      device_status = device_status_fixture()
      assert Measurement.get_device_status!(device_status.id) == device_status
    end

    test "create_device_status/1 with valid data creates a device_status" do
      assert {:ok, %DeviceStatus{} = device_status} = Measurement.create_device_status(@valid_attrs)
      assert device_status.cpu_use_rate == 42
      assert device_status.memory_use_rate == 42
      assert device_status.storage == 42
      assert device_status.temperature == 120.5
      assert device_status.wake_on_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_device_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Measurement.create_device_status(@invalid_attrs)
    end

    test "update_device_status/2 with valid data updates the device_status" do
      device_status = device_status_fixture()
      assert {:ok, %DeviceStatus{} = device_status} = Measurement.update_device_status(device_status, @update_attrs)
      assert device_status.cpu_use_rate == 43
      assert device_status.memory_use_rate == 43
      assert device_status.storage == 43
      assert device_status.temperature == 456.7
      assert device_status.wake_on_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_device_status/2 with invalid data returns error changeset" do
      device_status = device_status_fixture()
      assert {:error, %Ecto.Changeset{}} = Measurement.update_device_status(device_status, @invalid_attrs)
      assert device_status == Measurement.get_device_status!(device_status.id)
    end

    test "delete_device_status/1 deletes the device_status" do
      device_status = device_status_fixture()
      assert {:ok, %DeviceStatus{}} = Measurement.delete_device_status(device_status)
      assert_raise Ecto.NoResultsError, fn -> Measurement.get_device_status!(device_status.id) end
    end

    test "change_device_status/1 returns a device_status changeset" do
      device_status = device_status_fixture()
      assert %Ecto.Changeset{} = Measurement.change_device_status(device_status)
    end
  end

  describe "temperatures" do
    alias LogLac.Measurement.Temperature

    @valid_attrs %{date: "2010-04-17T14:00:00Z", value: 120.5}
    @update_attrs %{date: "2011-05-18T15:01:01Z", value: 456.7}
    @invalid_attrs %{date: nil, value: nil}

    def temperature_fixture(attrs \\ %{}) do
      {:ok, temperature} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Measurement.create_temperature()

      temperature
    end

    test "list_temperatures/0 returns all temperatures" do
      temperature = temperature_fixture()
      assert Measurement.list_temperatures() == [temperature]
    end

    test "get_temperature!/1 returns the temperature with given id" do
      temperature = temperature_fixture()
      assert Measurement.get_temperature!(temperature.id) == temperature
    end

    test "create_temperature/1 with valid data creates a temperature" do
      assert {:ok, %Temperature{} = temperature} = Measurement.create_temperature(@valid_attrs)
      assert temperature.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert temperature.value == 120.5
    end

    test "create_temperature/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Measurement.create_temperature(@invalid_attrs)
    end

    test "update_temperature/2 with valid data updates the temperature" do
      temperature = temperature_fixture()
      assert {:ok, %Temperature{} = temperature} = Measurement.update_temperature(temperature, @update_attrs)
      assert temperature.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert temperature.value == 456.7
    end

    test "update_temperature/2 with invalid data returns error changeset" do
      temperature = temperature_fixture()
      assert {:error, %Ecto.Changeset{}} = Measurement.update_temperature(temperature, @invalid_attrs)
      assert temperature == Measurement.get_temperature!(temperature.id)
    end

    test "delete_temperature/1 deletes the temperature" do
      temperature = temperature_fixture()
      assert {:ok, %Temperature{}} = Measurement.delete_temperature(temperature)
      assert_raise Ecto.NoResultsError, fn -> Measurement.get_temperature!(temperature.id) end
    end

    test "change_temperature/1 returns a temperature changeset" do
      temperature = temperature_fixture()
      assert %Ecto.Changeset{} = Measurement.change_temperature(temperature)
    end
  end

  describe "humidities" do
    alias LogLac.Measurement.Humidity

    @valid_attrs %{date: "2010-04-17T14:00:00Z", value: 42}
    @update_attrs %{date: "2011-05-18T15:01:01Z", value: 43}
    @invalid_attrs %{date: nil, value: nil}

    def humidity_fixture(attrs \\ %{}) do
      {:ok, humidity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Measurement.create_humidity()

      humidity
    end

    test "list_humidities/0 returns all humidities" do
      humidity = humidity_fixture()
      assert Measurement.list_humidities() == [humidity]
    end

    test "get_humidity!/1 returns the humidity with given id" do
      humidity = humidity_fixture()
      assert Measurement.get_humidity!(humidity.id) == humidity
    end

    test "create_humidity/1 with valid data creates a humidity" do
      assert {:ok, %Humidity{} = humidity} = Measurement.create_humidity(@valid_attrs)
      assert humidity.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert humidity.value == 42
    end

    test "create_humidity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Measurement.create_humidity(@invalid_attrs)
    end

    test "update_humidity/2 with valid data updates the humidity" do
      humidity = humidity_fixture()
      assert {:ok, %Humidity{} = humidity} = Measurement.update_humidity(humidity, @update_attrs)
      assert humidity.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert humidity.value == 43
    end

    test "update_humidity/2 with invalid data returns error changeset" do
      humidity = humidity_fixture()
      assert {:error, %Ecto.Changeset{}} = Measurement.update_humidity(humidity, @invalid_attrs)
      assert humidity == Measurement.get_humidity!(humidity.id)
    end

    test "delete_humidity/1 deletes the humidity" do
      humidity = humidity_fixture()
      assert {:ok, %Humidity{}} = Measurement.delete_humidity(humidity)
      assert_raise Ecto.NoResultsError, fn -> Measurement.get_humidity!(humidity.id) end
    end

    test "change_humidity/1 returns a humidity changeset" do
      humidity = humidity_fixture()
      assert %Ecto.Changeset{} = Measurement.change_humidity(humidity)
    end
  end

  describe "illuminances" do
    alias LogLac.Measurement.Illuminance

    @valid_attrs %{date: "2010-04-17T14:00:00Z", value: 42}
    @update_attrs %{date: "2011-05-18T15:01:01Z", value: 43}
    @invalid_attrs %{date: nil, value: nil}

    def illuminance_fixture(attrs \\ %{}) do
      {:ok, illuminance} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Measurement.create_illuminance()

      illuminance
    end

    test "list_illuminances/0 returns all illuminances" do
      illuminance = illuminance_fixture()
      assert Measurement.list_illuminances() == [illuminance]
    end

    test "get_illuminance!/1 returns the illuminance with given id" do
      illuminance = illuminance_fixture()
      assert Measurement.get_illuminance!(illuminance.id) == illuminance
    end

    test "create_illuminance/1 with valid data creates a illuminance" do
      assert {:ok, %Illuminance{} = illuminance} = Measurement.create_illuminance(@valid_attrs)
      assert illuminance.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert illuminance.value == 42
    end

    test "create_illuminance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Measurement.create_illuminance(@invalid_attrs)
    end

    test "update_illuminance/2 with valid data updates the illuminance" do
      illuminance = illuminance_fixture()
      assert {:ok, %Illuminance{} = illuminance} = Measurement.update_illuminance(illuminance, @update_attrs)
      assert illuminance.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert illuminance.value == 43
    end

    test "update_illuminance/2 with invalid data returns error changeset" do
      illuminance = illuminance_fixture()
      assert {:error, %Ecto.Changeset{}} = Measurement.update_illuminance(illuminance, @invalid_attrs)
      assert illuminance == Measurement.get_illuminance!(illuminance.id)
    end

    test "delete_illuminance/1 deletes the illuminance" do
      illuminance = illuminance_fixture()
      assert {:ok, %Illuminance{}} = Measurement.delete_illuminance(illuminance)
      assert_raise Ecto.NoResultsError, fn -> Measurement.get_illuminance!(illuminance.id) end
    end

    test "change_illuminance/1 returns a illuminance changeset" do
      illuminance = illuminance_fixture()
      assert %Ecto.Changeset{} = Measurement.change_illuminance(illuminance)
    end
  end

  describe "atmospheric_pressures" do
    alias LogLac.Measurement.AtmosphericPressure

    @valid_attrs %{date: "2010-04-17T14:00:00Z", value: 42}
    @update_attrs %{date: "2011-05-18T15:01:01Z", value: 43}
    @invalid_attrs %{date: nil, value: nil}

    def atmospheric_pressure_fixture(attrs \\ %{}) do
      {:ok, atmospheric_pressure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Measurement.create_atmospheric_pressure()

      atmospheric_pressure
    end

    test "list_atmospheric_pressures/0 returns all atmospheric_pressures" do
      atmospheric_pressure = atmospheric_pressure_fixture()
      assert Measurement.list_atmospheric_pressures() == [atmospheric_pressure]
    end

    test "get_atmospheric_pressure!/1 returns the atmospheric_pressure with given id" do
      atmospheric_pressure = atmospheric_pressure_fixture()
      assert Measurement.get_atmospheric_pressure!(atmospheric_pressure.id) == atmospheric_pressure
    end

    test "create_atmospheric_pressure/1 with valid data creates a atmospheric_pressure" do
      assert {:ok, %AtmosphericPressure{} = atmospheric_pressure} = Measurement.create_atmospheric_pressure(@valid_attrs)
      assert atmospheric_pressure.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert atmospheric_pressure.value == 42
    end

    test "create_atmospheric_pressure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Measurement.create_atmospheric_pressure(@invalid_attrs)
    end

    test "update_atmospheric_pressure/2 with valid data updates the atmospheric_pressure" do
      atmospheric_pressure = atmospheric_pressure_fixture()
      assert {:ok, %AtmosphericPressure{} = atmospheric_pressure} = Measurement.update_atmospheric_pressure(atmospheric_pressure, @update_attrs)
      assert atmospheric_pressure.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert atmospheric_pressure.value == 43
    end

    test "update_atmospheric_pressure/2 with invalid data returns error changeset" do
      atmospheric_pressure = atmospheric_pressure_fixture()
      assert {:error, %Ecto.Changeset{}} = Measurement.update_atmospheric_pressure(atmospheric_pressure, @invalid_attrs)
      assert atmospheric_pressure == Measurement.get_atmospheric_pressure!(atmospheric_pressure.id)
    end

    test "delete_atmospheric_pressure/1 deletes the atmospheric_pressure" do
      atmospheric_pressure = atmospheric_pressure_fixture()
      assert {:ok, %AtmosphericPressure{}} = Measurement.delete_atmospheric_pressure(atmospheric_pressure)
      assert_raise Ecto.NoResultsError, fn -> Measurement.get_atmospheric_pressure!(atmospheric_pressure.id) end
    end

    test "change_atmospheric_pressure/1 returns a atmospheric_pressure changeset" do
      atmospheric_pressure = atmospheric_pressure_fixture()
      assert %Ecto.Changeset{} = Measurement.change_atmospheric_pressure(atmospheric_pressure)
    end
  end

  describe "inertial_measurement_units" do
    alias LogLac.Measurement.InertialMeasurementUnit

    @valid_attrs %{date: "2010-04-17T14:00:00Z", pich: 42, roll: 42, x_acceleration: 42, y_acceleration: 42, yaw: 42, z_acceleration: 42}
    @update_attrs %{date: "2011-05-18T15:01:01Z", pich: 43, roll: 43, x_acceleration: 43, y_acceleration: 43, yaw: 43, z_acceleration: 43}
    @invalid_attrs %{date: nil, pich: nil, roll: nil, x_acceleration: nil, y_acceleration: nil, yaw: nil, z_acceleration: nil}

    def inertial_measurement_unit_fixture(attrs \\ %{}) do
      {:ok, inertial_measurement_unit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Measurement.create_inertial_measurement_unit()

      inertial_measurement_unit
    end

    test "list_inertial_measurement_units/0 returns all inertial_measurement_units" do
      inertial_measurement_unit = inertial_measurement_unit_fixture()
      assert Measurement.list_inertial_measurement_units() == [inertial_measurement_unit]
    end

    test "get_inertial_measurement_unit!/1 returns the inertial_measurement_unit with given id" do
      inertial_measurement_unit = inertial_measurement_unit_fixture()
      assert Measurement.get_inertial_measurement_unit!(inertial_measurement_unit.id) == inertial_measurement_unit
    end

    test "create_inertial_measurement_unit/1 with valid data creates a inertial_measurement_unit" do
      assert {:ok, %InertialMeasurementUnit{} = inertial_measurement_unit} = Measurement.create_inertial_measurement_unit(@valid_attrs)
      assert inertial_measurement_unit.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert inertial_measurement_unit.pich == 42
      assert inertial_measurement_unit.roll == 42
      assert inertial_measurement_unit.x_acceleration == 42
      assert inertial_measurement_unit.y_acceleration == 42
      assert inertial_measurement_unit.yaw == 42
      assert inertial_measurement_unit.z_acceleration == 42
    end

    test "create_inertial_measurement_unit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Measurement.create_inertial_measurement_unit(@invalid_attrs)
    end

    test "update_inertial_measurement_unit/2 with valid data updates the inertial_measurement_unit" do
      inertial_measurement_unit = inertial_measurement_unit_fixture()
      assert {:ok, %InertialMeasurementUnit{} = inertial_measurement_unit} = Measurement.update_inertial_measurement_unit(inertial_measurement_unit, @update_attrs)
      assert inertial_measurement_unit.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert inertial_measurement_unit.pich == 43
      assert inertial_measurement_unit.roll == 43
      assert inertial_measurement_unit.x_acceleration == 43
      assert inertial_measurement_unit.y_acceleration == 43
      assert inertial_measurement_unit.yaw == 43
      assert inertial_measurement_unit.z_acceleration == 43
    end

    test "update_inertial_measurement_unit/2 with invalid data returns error changeset" do
      inertial_measurement_unit = inertial_measurement_unit_fixture()
      assert {:error, %Ecto.Changeset{}} = Measurement.update_inertial_measurement_unit(inertial_measurement_unit, @invalid_attrs)
      assert inertial_measurement_unit == Measurement.get_inertial_measurement_unit!(inertial_measurement_unit.id)
    end

    test "delete_inertial_measurement_unit/1 deletes the inertial_measurement_unit" do
      inertial_measurement_unit = inertial_measurement_unit_fixture()
      assert {:ok, %InertialMeasurementUnit{}} = Measurement.delete_inertial_measurement_unit(inertial_measurement_unit)
      assert_raise Ecto.NoResultsError, fn -> Measurement.get_inertial_measurement_unit!(inertial_measurement_unit.id) end
    end

    test "change_inertial_measurement_unit/1 returns a inertial_measurement_unit changeset" do
      inertial_measurement_unit = inertial_measurement_unit_fixture()
      assert %Ecto.Changeset{} = Measurement.change_inertial_measurement_unit(inertial_measurement_unit)
    end
  end

  describe "sounds" do
    alias LogLac.Measurement.Sound

    @valid_attrs %{date: "2010-04-17T14:00:00Z", value: 42}
    @update_attrs %{date: "2011-05-18T15:01:01Z", value: 43}
    @invalid_attrs %{date: nil, value: nil}

    def sound_fixture(attrs \\ %{}) do
      {:ok, sound} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Measurement.create_sound()

      sound
    end

    test "list_sounds/0 returns all sounds" do
      sound = sound_fixture()
      assert Measurement.list_sounds() == [sound]
    end

    test "get_sound!/1 returns the sound with given id" do
      sound = sound_fixture()
      assert Measurement.get_sound!(sound.id) == sound
    end

    test "create_sound/1 with valid data creates a sound" do
      assert {:ok, %Sound{} = sound} = Measurement.create_sound(@valid_attrs)
      assert sound.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert sound.value == 42
    end

    test "create_sound/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Measurement.create_sound(@invalid_attrs)
    end

    test "update_sound/2 with valid data updates the sound" do
      sound = sound_fixture()
      assert {:ok, %Sound{} = sound} = Measurement.update_sound(sound, @update_attrs)
      assert sound.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert sound.value == 43
    end

    test "update_sound/2 with invalid data returns error changeset" do
      sound = sound_fixture()
      assert {:error, %Ecto.Changeset{}} = Measurement.update_sound(sound, @invalid_attrs)
      assert sound == Measurement.get_sound!(sound.id)
    end

    test "delete_sound/1 deletes the sound" do
      sound = sound_fixture()
      assert {:ok, %Sound{}} = Measurement.delete_sound(sound)
      assert_raise Ecto.NoResultsError, fn -> Measurement.get_sound!(sound.id) end
    end

    test "change_sound/1 returns a sound changeset" do
      sound = sound_fixture()
      assert %Ecto.Changeset{} = Measurement.change_sound(sound)
    end
  end
end
