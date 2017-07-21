defmodule Machinex.Backend.Complex do
  @moduledoc """
  Callbacks for implementing complex numbers.

  To implement a callback, it's quite *important* that the types 
  are **respected**. This allows easier interop between implementations.
  """
  defstruct [:r, :i]
  
  @type real :: number
  @type imag :: number
  @type t :: %__MODULE__{r: real, i: imag}
  
  @doc """
  Calculates the magnitude of the complex number.
  """
  @callback mag(complex :: t) :: number

  @doc """
  Calculates the argument of the complex number.
  """
  @callback arg(complex :: t) :: number

  @doc """
  Creates a new complex number.
  """
  @callback new(real :: real, imag :: imag) :: t

  @doc """
  Gets the real part of the complex number.
  """
  @callback get_real(complex :: t) :: real
  
  @doc """
  Gets the imaginary part of the complex number.
  """
  @callback get_imag(complex :: t) :: imag

  @doc """
  Sets the real part of the complex number, returning the modified complex number.
  """
  @callback set_real(complex :: t, real :: real) :: t

  @doc """
  Sets the imaginary part of the complex number, returning the modified complex number.
  """
  @callback set_imag(complex :: t, imag :: imag) :: t

  @doc """
  Calculates the conjugate of the complex number.
  """
  @callback conjugate(complex :: t) :: t

  @doc """
  Calculates the inverse of the complex number.
  """
  @callback inverse(complex :: t) :: t

  @doc """
  Calculates the negative of the complex number.
  """
  @callback negative(complex :: t) :: t

  @doc """
  Adds two complex numbers.
  """
  @callback add(complex :: t, complex :: t) :: t

  @doc """
  Adds a complex number to a real number.
  """
  @callback add_real(complex :: t, real :: real) :: t

  @doc """
  Adds a complex number to an imaginary number.
  """
  @callback add_imag(complex :: t, imag :: imag) :: t

  @doc """
  Subtracts two complex numbers.
  """
  @callback sub(complex :: t, complex :: t) :: t

  @doc """
  Subtracts a complex number to a real number.
  """
  @callback sub_real(complex :: t, real :: real) :: t

  @doc """
  Subtracts a complex number to an imaginary number.
  """
  @callback sub_imag(complex :: t, imag :: imag) :: t

  @doc """
  Multiplies two complex numbers.
  """
  @callback mul(complex :: t, complex :: t) :: t

  @doc """
  Multiplies the complex number and a real number.
  """
  @callback mul_real(complex :: t, real :: real) :: t

  @doc """
  Multiplies the complex number and an imaginary number.
  """
  @callback mul_imag(complex :: t, imag :: imag) :: t

  @doc """
  Division of two complex numbers.
  """
  @callback div(complex :: t, complex :: t) :: t

  @doc """
  Divides a complex number to a real number.
  """
  @callback div_real(complex :: t, real :: real) :: t

  @doc """
  Divides a complex number to an imaginary number.
  """
  @callback div_imag(complex :: t, imag :: imag) :: t



  ## Implementation of protocols.
  defimpl Inspect, for: Machinex.Backend.Complex do
    import Inspect.Algebra
    alias Machinex.Backend.Complex

    def inspect(%Complex{r: r, i: i}, opts) when r == 0 and i == 0 do
      concat ["#Complex(", to_doc(0, opts), ")"]
    end

    def inspect(%Complex{r: r, i: i}, opts) when r == 0 do
      concat ["#Complex(", to_doc(i, opts), "i)"]
    end

    def inspect(%Complex{r: r, i: i}, opts) when i == 0 do
      concat ["#Complex(", to_doc(r, opts), ")"]
    end

    def inspect(%Complex{r: r, i: i}, opts) do
      if i > 0 do
        concat ["#Complex(", to_doc(r, opts), " +", to_doc(i, opts), "i)"]
      else 
        concat ["#Complex(", to_doc(r, opts), " ", to_doc(i, opts), "i)"]
      end
    end
  end
end
