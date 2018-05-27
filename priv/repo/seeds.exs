# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Todos.Repo.insert!(%Todos.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Todos.Repo
alias Todos.Tasks.Task

Repo.insert!(%Task{
  title: "Create some test entries",
  is_done: true,
  description: "Insert some test tasks for app testing",
  due_date: DateTime.utc_now()
})

Repo.insert!(%Task{
  title: "Write tests for the application",
  is_done: false,
  description: "",
  due_date: %DateTime{
    year: 2018,
    month: 5,
    day: 31,
    hour: 23,
    minute: 59,
    second: 59,
    microsecond: {0, 1},
    utc_offset: 3600,
    std_offset: 0,
    time_zone: "Etc/UTC",
    zone_abbr: "CET"
  }
})
