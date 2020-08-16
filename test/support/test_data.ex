defmodule LogLac.TestData do
  alias LogLac.Member

  # 機器を登録するために必要最低限の情報を登録
  def setup_type_fixture(attrs \\ %{}) do
    attrs
    |> Enum.into(%{code: "t1", name: "some name"})
    |> Member.create_device_type()
  end

  # 測定結果を登録するための必要最低限の情報を登録
  def setup_fixture(attrs \\ %{}) do
    attrs
    |> Enum.into(%{code: "t1", name: "some name"})
    |> Member.create_device_type()

    attrs
    |> Enum.into(%{code: "d1", name: "some name", remarks: "some remarks", type_code: "t1"})
    |> Member.create_device()

    attrs
    |> Enum.into(%{code: "d2", name: "some name2", remarks: "some remarks2", type_code: "t1"})
    |> Member.create_device()

    attrs
    |> Enum.into(%{code: "s1", name: "some name", remarks: "some remarks"})
    |> Member.create_sensor()

    attrs
    |> Enum.into(%{code: "s2", name: "some name2", remarks: "some remarks2"})
    |> Member.create_sensor()
  end
end
