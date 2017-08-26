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
    |> build_rows
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def build_rows(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1)
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end

end
