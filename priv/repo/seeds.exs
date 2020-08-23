# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LogLac.Repo.insert!(%LogLac.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LogLac.DeviceType
alias LogLac.Device

# DeviceType
LogLac.Repo.insert!(%DeviceType{code: "RP_1_BP", name: "Raspberry Pi 1 B+"})
LogLac.Repo.insert!(%DeviceType{code: "RP_2_B", name: "Raspberry Pi 2 B"})
LogLac.Repo.insert!(%DeviceType{code: "RP_3_BP", name: "Raspberry Pi 3 B+"})
LogLac.Repo.insert!(%DeviceType{code: "RP_4_B", name: "Raspberry Pi 4 B"})
LogLac.Repo.insert!(%DeviceType{code: "M5_SCK", name: "M5Stack"})
LogLac.Repo.insert!(%DeviceType{code: "M5_SCC", name: "M5StickC"})
LogLac.Repo.insert!(%DeviceType{code: "M5_CAM", name: "M5Camera"})

# Device
LogLac.Repo.insert!(%Device{code: "RP1", name: "a", remarks: "測定マシン", type_code: "RP_1_BP"})
LogLac.Repo.insert!(%Device{code: "RP2", name: "b", remarks: "Web サーバー", type_code: "RP_2_B"})
LogLac.Repo.insert!(%Device{code: "RP3", name: "c", remarks: "", type_code: "RP_3_BP"})
LogLac.Repo.insert!(%Device{code: "RP4", name: "d", remarks: "", type_code: "RP_4_B"})

# Sensors
LogLac.Repo.insert!(%Sensor{code: "S1", name: "M5StickC Yun Hat", remarks: "気圧、気温、湿度、照度"})
