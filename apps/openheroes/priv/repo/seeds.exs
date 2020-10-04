# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Openheroes.Repo.insert!(%Openheroes.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Openheroes.Repo
alias Openheroes.Boons
alias Openheroes.Banes
alias Openheroes.Weapons.WeaponProperty

boons_json = "#{__DIR__}/seed_data/boons.json"
banes_json = "#{__DIR__}/seed_data/banes.json"
weapon_props_json = "#{__DIR__}/seed_data/weapon_properties.json"

with {:ok, body} <- File.read(boons_json),
     {:ok, boons} <- Jason.decode(body, keys: :atoms) do
  Enum.map(boons, fn boon ->
    Repo.insert!(%Boons.Boon{
      name: boon.name,
      tags: boon.tags,
      power: boon.power,
      attribute: boon.attribute,
      invocation_time: boon.invocationTime,
      duration: boon.duration,
      description: boon.description,
      effect: boon.effect
    })
  end)
else
  err -> IO.inspect(err)
end

with {:ok, body} <- File.read(banes_json),
     {:ok, banes} <- Jason.decode(body, keys: :atoms) do
  Enum.map(banes, fn bane ->
    Repo.insert!(%Banes.Bane{
      name: bane.name,
      tags: bane.tags,
      power: bane.power,
      attack_attributes: bane.attackAttributes,
      attack: bane.attack,
      invocation_time: bane.invocationTime,
      duration: bane.duration,
      description: bane.description,
      effect: bane.effect
    })
  end)
else
  err -> IO.inspect(err)
end

with {:ok, body} <- File.read(weapon_props_json),
     {:ok, weapon_props} <- Jason.decode(body, keys: :atoms) do
  Enum.map(weapon_props, fn weapon_prop ->
    nil

    Repo.insert!(%WeaponProperty{
      name: weapon_prop.name,
      description: weapon_prop.desc
    })
  end)
else
  err -> IO.inspect(err)
end
