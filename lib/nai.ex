defmodule NAI.ProviderBehaviour do
  @moduledoc """
  Documentation for `Noizu AI Provider Behaviour`.
  """

  @callback credentials(subject, action) :: {:ok, term} | {:error, term}

end

defprotocol NAI.Provider do
  @moduledoc """
  Documentation for `Noizu AI Provider Protocol`.
  """

  def credentials(subject, action)
end

defmodule NAI do
  @moduledoc """
  Documentation for `Noizu AI`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> NAI.hello()
      :world

  """
  def hello do
    :world
  end
end
