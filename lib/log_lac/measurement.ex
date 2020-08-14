defmodule LogLac.Measurement do
  @moduledoc """
  The Measurement context.
  """

  import Ecto.Query, warn: false
  import LogLac.Member
  alias LogLac.Repo

  alias LogLac.Measurement.DeviceStatus

  @doc """
  Returns the list of device_statuses.

  ## Examples

      iex> list_device_statuses()
      [%DeviceStatus{}, ...]

  """
  def list_device_statuses do
    Repo.all(DeviceStatus)
  end

  @doc """
  Gets a single device_status.

  Raises `Ecto.NoResultsError` if the Device status does not exist.

  ## Examples

      iex> get_device_status!(123)
      %DeviceStatus{}

      iex> get_device_status!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device_status!(id), do: Repo.get!(DeviceStatus, id)

  @doc """
  Creates a device_status.

  ## Examples

      iex> create_device_status(%{field: value})
      {:ok, %DeviceStatus{}}

      iex> create_device_status(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device_status(attrs \\ %{}) do
    %DeviceStatus{}
    |> DeviceStatus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device_status.

  ## Examples

      iex> update_device_status(device_status, %{field: new_value})
      {:ok, %DeviceStatus{}}

      iex> update_device_status(device_status, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device_status(%DeviceStatus{} = device_status, attrs) do
    device_status
    |> DeviceStatus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a device_status.

  ## Examples

      iex> delete_device_status(device_status)
      {:ok, %DeviceStatus{}}

      iex> delete_device_status(device_status)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device_status(%DeviceStatus{} = device_status) do
    Repo.delete(device_status)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device_status changes.

  ## Examples

      iex> change_device_status(device_status)
      %Ecto.Changeset{data: %DeviceStatus{}}

  """
  def change_device_status(%DeviceStatus{} = device_status, attrs \\ %{}) do
    DeviceStatus.changeset(device_status, attrs)
  end

  alias LogLac.Measurement.Temperature

  @doc """
  Returns the list of temperatures.

  ## Examples

      iex> list_temperatures()
      [%Temperature{}, ...]

  """
  def list_temperatures do
    Repo.all(Temperature)
  end

  def list_temperatures_filtered do
    Repo.all(Temperature)
    |> Enum.map(fn(x) -> %{
      :date => x.date,
      :value => x.value,
      :device => find_device_by(x.device_code),
      :sensor => find_sensor_by(x.sensor_code)
      } end)
  end

  @doc """
  Gets a single temperature.

  Raises `Ecto.NoResultsError` if the Temperature does not exist.

  ## Examples

      iex> get_temperature!(123)
      %Temperature{}

      iex> get_temperature!(456)
      ** (Ecto.NoResultsError)

  """
  def get_temperature!(id), do: Repo.get!(Temperature, id)

  @doc """
  Creates a temperature.

  ## Examples

      iex> create_temperature(%{field: value})
      {:ok, %Temperature{}}

      iex> create_temperature(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_temperature(attrs \\ %{}) do
    %Temperature{}
    |> Temperature.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a temperature.

  ## Examples

      iex> update_temperature(temperature, %{field: new_value})
      {:ok, %Temperature{}}

      iex> update_temperature(temperature, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_temperature(%Temperature{} = temperature, attrs) do
    temperature
    |> Temperature.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a temperature.

  ## Examples

      iex> delete_temperature(temperature)
      {:ok, %Temperature{}}

      iex> delete_temperature(temperature)
      {:error, %Ecto.Changeset{}}

  """
  def delete_temperature(%Temperature{} = temperature) do
    Repo.delete(temperature)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking temperature changes.

  ## Examples

      iex> change_temperature(temperature)
      %Ecto.Changeset{data: %Temperature{}}

  """
  def change_temperature(%Temperature{} = temperature, attrs \\ %{}) do
    Temperature.changeset(temperature, attrs)
  end

  alias LogLac.Measurement.Humidity

  @doc """
  Returns the list of humidities.

  ## Examples

      iex> list_humidities()
      [%Humidity{}, ...]

  """
  def list_humidities do
    Repo.all(Humidity)
  end

  @doc """
  Gets a single humidity.

  Raises `Ecto.NoResultsError` if the Humidity does not exist.

  ## Examples

      iex> get_humidity!(123)
      %Humidity{}

      iex> get_humidity!(456)
      ** (Ecto.NoResultsError)

  """
  def get_humidity!(id), do: Repo.get!(Humidity, id)

  @doc """
  Creates a humidity.

  ## Examples

      iex> create_humidity(%{field: value})
      {:ok, %Humidity{}}

      iex> create_humidity(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_humidity(attrs \\ %{}) do
    %Humidity{}
    |> Humidity.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a humidity.

  ## Examples

      iex> update_humidity(humidity, %{field: new_value})
      {:ok, %Humidity{}}

      iex> update_humidity(humidity, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_humidity(%Humidity{} = humidity, attrs) do
    humidity
    |> Humidity.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a humidity.

  ## Examples

      iex> delete_humidity(humidity)
      {:ok, %Humidity{}}

      iex> delete_humidity(humidity)
      {:error, %Ecto.Changeset{}}

  """
  def delete_humidity(%Humidity{} = humidity) do
    Repo.delete(humidity)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking humidity changes.

  ## Examples

      iex> change_humidity(humidity)
      %Ecto.Changeset{data: %Humidity{}}

  """
  def change_humidity(%Humidity{} = humidity, attrs \\ %{}) do
    Humidity.changeset(humidity, attrs)
  end

  alias LogLac.Measurement.Illuminance

  @doc """
  Returns the list of illuminances.

  ## Examples

      iex> list_illuminances()
      [%Illuminance{}, ...]

  """
  def list_illuminances do
    Repo.all(Illuminance)
  end

  @doc """
  Gets a single illuminance.

  Raises `Ecto.NoResultsError` if the Illuminance does not exist.

  ## Examples

      iex> get_illuminance!(123)
      %Illuminance{}

      iex> get_illuminance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_illuminance!(id), do: Repo.get!(Illuminance, id)

  @doc """
  Creates a illuminance.

  ## Examples

      iex> create_illuminance(%{field: value})
      {:ok, %Illuminance{}}

      iex> create_illuminance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_illuminance(attrs \\ %{}) do
    %Illuminance{}
    |> Illuminance.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a illuminance.

  ## Examples

      iex> update_illuminance(illuminance, %{field: new_value})
      {:ok, %Illuminance{}}

      iex> update_illuminance(illuminance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_illuminance(%Illuminance{} = illuminance, attrs) do
    illuminance
    |> Illuminance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a illuminance.

  ## Examples

      iex> delete_illuminance(illuminance)
      {:ok, %Illuminance{}}

      iex> delete_illuminance(illuminance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_illuminance(%Illuminance{} = illuminance) do
    Repo.delete(illuminance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking illuminance changes.

  ## Examples

      iex> change_illuminance(illuminance)
      %Ecto.Changeset{data: %Illuminance{}}

  """
  def change_illuminance(%Illuminance{} = illuminance, attrs \\ %{}) do
    Illuminance.changeset(illuminance, attrs)
  end

  alias LogLac.Measurement.AtmosphericPressure

  @doc """
  Returns the list of atmospheric_pressures.

  ## Examples

      iex> list_atmospheric_pressures()
      [%AtmosphericPressure{}, ...]

  """
  def list_atmospheric_pressures do
    Repo.all(AtmosphericPressure)
  end

  @doc """
  Gets a single atmospheric_pressure.

  Raises `Ecto.NoResultsError` if the Atmospheric pressure does not exist.

  ## Examples

      iex> get_atmospheric_pressure!(123)
      %AtmosphericPressure{}

      iex> get_atmospheric_pressure!(456)
      ** (Ecto.NoResultsError)

  """
  def get_atmospheric_pressure!(id), do: Repo.get!(AtmosphericPressure, id)

  @doc """
  Creates a atmospheric_pressure.

  ## Examples

      iex> create_atmospheric_pressure(%{field: value})
      {:ok, %AtmosphericPressure{}}

      iex> create_atmospheric_pressure(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_atmospheric_pressure(attrs \\ %{}) do
    %AtmosphericPressure{}
    |> AtmosphericPressure.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a atmospheric_pressure.

  ## Examples

      iex> update_atmospheric_pressure(atmospheric_pressure, %{field: new_value})
      {:ok, %AtmosphericPressure{}}

      iex> update_atmospheric_pressure(atmospheric_pressure, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_atmospheric_pressure(%AtmosphericPressure{} = atmospheric_pressure, attrs) do
    atmospheric_pressure
    |> AtmosphericPressure.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a atmospheric_pressure.

  ## Examples

      iex> delete_atmospheric_pressure(atmospheric_pressure)
      {:ok, %AtmosphericPressure{}}

      iex> delete_atmospheric_pressure(atmospheric_pressure)
      {:error, %Ecto.Changeset{}}

  """
  def delete_atmospheric_pressure(%AtmosphericPressure{} = atmospheric_pressure) do
    Repo.delete(atmospheric_pressure)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking atmospheric_pressure changes.

  ## Examples

      iex> change_atmospheric_pressure(atmospheric_pressure)
      %Ecto.Changeset{data: %AtmosphericPressure{}}

  """
  def change_atmospheric_pressure(%AtmosphericPressure{} = atmospheric_pressure, attrs \\ %{}) do
    AtmosphericPressure.changeset(atmospheric_pressure, attrs)
  end

  alias LogLac.Measurement.InertialMeasurementUnit

  @doc """
  Returns the list of inertial_measurement_units.

  ## Examples

      iex> list_inertial_measurement_units()
      [%InertialMeasurementUnit{}, ...]

  """
  def list_inertial_measurement_units do
    Repo.all(InertialMeasurementUnit)
  end

  @doc """
  Gets a single inertial_measurement_unit.

  Raises `Ecto.NoResultsError` if the Inertial measurement unit does not exist.

  ## Examples

      iex> get_inertial_measurement_unit!(123)
      %InertialMeasurementUnit{}

      iex> get_inertial_measurement_unit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inertial_measurement_unit!(id), do: Repo.get!(InertialMeasurementUnit, id)

  @doc """
  Creates a inertial_measurement_unit.

  ## Examples

      iex> create_inertial_measurement_unit(%{field: value})
      {:ok, %InertialMeasurementUnit{}}

      iex> create_inertial_measurement_unit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inertial_measurement_unit(attrs \\ %{}) do
    %InertialMeasurementUnit{}
    |> InertialMeasurementUnit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inertial_measurement_unit.

  ## Examples

      iex> update_inertial_measurement_unit(inertial_measurement_unit, %{field: new_value})
      {:ok, %InertialMeasurementUnit{}}

      iex> update_inertial_measurement_unit(inertial_measurement_unit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inertial_measurement_unit(%InertialMeasurementUnit{} = inertial_measurement_unit, attrs) do
    inertial_measurement_unit
    |> InertialMeasurementUnit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inertial_measurement_unit.

  ## Examples

      iex> delete_inertial_measurement_unit(inertial_measurement_unit)
      {:ok, %InertialMeasurementUnit{}}

      iex> delete_inertial_measurement_unit(inertial_measurement_unit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inertial_measurement_unit(%InertialMeasurementUnit{} = inertial_measurement_unit) do
    Repo.delete(inertial_measurement_unit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inertial_measurement_unit changes.

  ## Examples

      iex> change_inertial_measurement_unit(inertial_measurement_unit)
      %Ecto.Changeset{data: %InertialMeasurementUnit{}}

  """
  def change_inertial_measurement_unit(%InertialMeasurementUnit{} = inertial_measurement_unit, attrs \\ %{}) do
    InertialMeasurementUnit.changeset(inertial_measurement_unit, attrs)
  end

  alias LogLac.Measurement.Sound

  @doc """
  Returns the list of sounds.

  ## Examples

      iex> list_sounds()
      [%Sound{}, ...]

  """
  def list_sounds do
    Repo.all(Sound)
  end

  @doc """
  Gets a single sound.

  Raises `Ecto.NoResultsError` if the Sound does not exist.

  ## Examples

      iex> get_sound!(123)
      %Sound{}

      iex> get_sound!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sound!(id), do: Repo.get!(Sound, id)

  @doc """
  Creates a sound.

  ## Examples

      iex> create_sound(%{field: value})
      {:ok, %Sound{}}

      iex> create_sound(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sound(attrs \\ %{}) do
    %Sound{}
    |> Sound.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sound.

  ## Examples

      iex> update_sound(sound, %{field: new_value})
      {:ok, %Sound{}}

      iex> update_sound(sound, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sound(%Sound{} = sound, attrs) do
    sound
    |> Sound.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sound.

  ## Examples

      iex> delete_sound(sound)
      {:ok, %Sound{}}

      iex> delete_sound(sound)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sound(%Sound{} = sound) do
    Repo.delete(sound)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sound changes.

  ## Examples

      iex> change_sound(sound)
      %Ecto.Changeset{data: %Sound{}}

  """
  def change_sound(%Sound{} = sound, attrs \\ %{}) do
    Sound.changeset(sound, attrs)
  end
end
