defmodule Machinex.Complex do
  @moduledoc """
  Complex number operations.

  All functions of this module are delegated to the backend of choice.
  """
  alias Machinex.Backend.Complex, as: Cplx
  @behaviour Cplx
  @backend Application.get_env(:machinex, :backend, Machinex.Backends.Native)
  @to_delegate Module.concat(@backend, Complex)

  @doc """
  Creates a new complex number.
  """
  @spec new(Cplx.real, Cplx.imag) :: Cplx.t
  defdelegate new(real, imag), to: @to_delegate

  @doc """
  Gets the real part of the complex number.
  """
  @spec get_real(Cplx.t) :: Cplx.real
  defdelegate get_real(complex), to: @to_delegate

  @doc """
  Gets the imaginary part of the complex number.
  """
  @spec get_imag(Cplx.t) :: Cplx.imag
  defdelegate get_imag(complex), to: @to_delegate

  @doc """
  Sets the real part of the complex number, returning the modified complex number.
  """
  @spec set_real(Cplx.t, Cplx.real) :: Cplx.t
  defdelegate set_real(complex, real), to: @to_delegate

  @doc """
  Sets the imaginary part of the complex number, returning the modified complex number.
  """
  @spec set_imag(Cplx.t, Cplx.imag) :: Cplx.t
  defdelegate set_imag(complex, imag), to: @to_delegate


  @doc """
  Calculates the conjugate of the complex number.
  """
  @spec conjugate(Cplx.t) :: number
  defdelegate conjugate(complex), to: @to_delegate


  @doc """
  Calculates the negative of the complex number.
  """
  @spec negative(Cplx.t) :: number
  defdelegate negative(complex), to: @to_delegate


  @doc """
  Calculates the inverse of the complex number.
  """
  @spec inverse(Cplx.t) :: number
  defdelegate inverse(complex), to: @to_delegate


  @doc """
  Calculates the magnitude of the complex number.
  """
  @spec mag(Cplx.t) :: number
  defdelegate mag(complex), to: @to_delegate

  @doc """
  Calculates the argument of the complex number.
  """
  @spec arg(Cplx.t) :: number
  defdelegate arg(complex), to: @to_delegate

  @doc """
  Adds two complex numbers.
  """
  @spec add(Cplx.t, Cplx.t) :: Cplx.t
  defdelegate add(left, right), to: @to_delegate

  @doc """
  Adds a complex number to a real number.
  """
  @spec add_real(Cplx.t, Cplx.real) :: Cplx.t
  defdelegate add_real(complex, real), to: @to_delegate

  @doc """
  Adds a complex number to an imaginary number.
  """
  @spec add_imag(Cplx.t, Cplx.imag) :: Cplx.t
  defdelegate add_imag(complex, imag), to: @to_delegate

  @doc """
  Subtracts two complex numbers.
  """
  @spec sub(Cplx.t, Cplx.t) :: Cplx.t
  defdelegate sub(left, right), to: @to_delegate

  @doc """
  Subtracts a complex number to a real number.
  """
  @spec sub_real(Cplx.t, Cplx.real) :: Cplx.t
  defdelegate sub_real(complex, real), to: @to_delegate

  @doc """
  Subtracts a complex number to an imaginary number.
  """
  @spec sub_imag(Cplx.t, Cplx.imag) :: Cplx.t
  defdelegate sub_imag(complex, imag), to: @to_delegate

  @doc """
  Multiplies two complex numbers.
  """
  @spec mul(Cplx.t, Cplx.t) :: Cplx.t
  defdelegate mul(left, right), to: @to_delegate

  @doc """
  Multiplies the complex number and a real number.
  """
  @spec mul_real(Cplx.t, Cplx.real) :: Cplx.t
  defdelegate mul_real(complex, real), to: @to_delegate

  @doc """
  Multiplies the complex number and an imaginary number.
  """
  @spec mul_imag(Cplx.t, Cplx.imag) :: Cplx.t
  defdelegate mul_imag(complex, imag), to: @to_delegate
  
  @doc """
  Division of two complex numbers.
  """
  @spec div(Cplx.t, Cplx.t) :: Cplx.t
  defdelegate div(left, right), to: @to_delegate

  @doc """
  Divides a complex number to a real number.
  """
  @spec div_real(Cplx.t, Cplx.real) :: Cplx.t
  defdelegate div_real(complex, real), to: @to_delegate

  @doc """
  Divides a complex number to an imaginary number.
  """
  @spec div_imag(Cplx.t, Cplx.imag) :: Cplx.t
  defdelegate div_imag(complex, imag), to: @to_delegate
end