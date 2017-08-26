defmodule Identicon do
  @moduledoc """
  Generates a 5x5 vertically symmetrical image corresponding to a specific
  input string
  """

  @doc """
  Hello world.

  ## Examples



  """
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

end
