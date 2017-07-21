defmodule Machinex.Complex do
  defstruct [:r, :i]

  @type t :: %__MODULE__{}
  @type real :: number
  @type imag :: number
end