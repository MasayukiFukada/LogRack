defmodule LogLac.Member do
  @moduledoc """
  The Member context.
  """

  import Ecto.Query, warn: false
  alias LogLac.Repo

  alias LogLac.Member.DeviceType

  @doc """
  Returns the list of device_types.

  ## Examples

      iex> list_device_types()
      [%DeviceType{}, ...]

  """
  def list_device_types do
    Repo.all(DeviceType)
  end

  def find_device_types_by(code) do
    Repo.get_by(DeviceType, code: code)
  end

  @doc """
  Gets a single device_type.

  Raises `Ecto.NoResultsError` if the Device type does not exist.

  ## Examples

      iex> get_device_type!(123)
      %DeviceType{}

      iex> get_device_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device_type!(id), do: Repo.get!(DeviceType, id)

  @doc """
  Creates a device_type.

  ## Examples

      iex> create_device_type(%{field: value})
      {:ok, %DeviceType{}}

      iex> create_device_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device_type(attrs \\ %{}) do
    %DeviceType{}
    |> DeviceType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device_type.

  ## Examples

      iex> update_device_type(device_type, %{field: new_value})
      {:ok, %DeviceType{}}

      iex> update_device_type(device_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device_type(%DeviceType{} = device_type, attrs) do
    device_type
    |> DeviceType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a device_type.

  ## Examples

      iex> delete_device_type(device_type)
      {:ok, %DeviceType{}}

      iex> delete_device_type(device_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device_type(%DeviceType{} = device_type) do
    Repo.delete(device_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device_type changes.

  ## Examples

      iex> change_device_type(device_type)
      %Ecto.Changeset{data: %DeviceType{}}

  """
  def change_device_type(%DeviceType{} = device_type, attrs \\ %{}) do
    DeviceType.changeset(device_type, attrs)
  end

  alias LogLac.Member.Device

  @doc """
  Returns the list of devices.

  ## Examples

      iex> list_devices()
      [%Device{}, ...]

  """
  def list_devices do
    Repo.all(Device)
  end

  def list_devices_with_type do
    Repo.all(Device)
    |> Enum.map(fn(x) -> %{
      :code => x.code,
      :name => x.name,
      :remarks => x.remarks,
      :device_type => find_device_types_by(x.type_code)
      } end)
  end

  def find_device_by(code) do
    Repo.get_by(Device, code: code)
  end

  @doc """
  Gets a single device.

  Raises `Ecto.NoResultsError` if the Device does not exist.

  ## Examples

      iex> get_device!(123)
      %Device{}

      iex> get_device!(456)
      ** (Ecto.NoResultsError)

  """
  def get_device!(id), do: Repo.get!(Device, id)

  @doc """
  Creates a device.

  ## Examples

      iex> create_device(%{field: value})
      {:ok, %Device{}}

      iex> create_device(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_device(attrs \\ %{}) do
    %Device{}
    |> Device.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a device.

  ## Examples

      iex> update_device(device, %{field: new_value})
      {:ok, %Device{}}

      iex> update_device(device, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_device(%Device{} = device, attrs) do
    device
    |> Device.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a device.

  ## Examples

      iex> delete_device(device)
      {:ok, %Device{}}

      iex> delete_device(device)
      {:error, %Ecto.Changeset{}}

  """
  def delete_device(%Device{} = device) do
    Repo.delete(device)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking device changes.

  ## Examples

      iex> change_device(device)
      %Ecto.Changeset{data: %Device{}}

  """
  def change_device(%Device{} = device, attrs \\ %{}) do
    Device.changeset(device, attrs)
  end

  alias LogLac.Member.Sensor

  @doc """
  Returns the list of sensors.

  ## Examples

      iex> list_sensors()
      [%Sensor{}, ...]

  """
  def list_sensors do
    Repo.all(Sensor)
  end

  def find_sensor_by(code) do
    Repo.get_by(Sensor, code: code)
  end

  @doc """
  Gets a single sensor.

  Raises `Ecto.NoResultsError` if the Sensor does not exist.

  ## Examples

      iex> get_sensor!(123)
      %Sensor{}

      iex> get_sensor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sensor!(id), do: Repo.get!(Sensor, id)

  @doc """
  Creates a sensor.

  ## Examples

      iex> create_sensor(%{field: value})
      {:ok, %Sensor{}}

      iex> create_sensor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sensor(attrs \\ %{}) do
    %Sensor{}
    |> Sensor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sensor.

  ## Examples

      iex> update_sensor(sensor, %{field: new_value})
      {:ok, %Sensor{}}

      iex> update_sensor(sensor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sensor(%Sensor{} = sensor, attrs) do
    sensor
    |> Sensor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sensor.

  ## Examples

      iex> delete_sensor(sensor)
      {:ok, %Sensor{}}

      iex> delete_sensor(sensor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sensor(%Sensor{} = sensor) do
    Repo.delete(sensor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sensor changes.

  ## Examples

      iex> change_sensor(sensor)
      %Ecto.Changeset{data: %Sensor{}}

  """
  def change_sensor(%Sensor{} = sensor, attrs \\ %{}) do
    Sensor.changeset(sensor, attrs)
  end
end
