defmodule NAI.ProviderBehaviour do
  @moduledoc """
  Documentation for `Noizu AI Provider Behaviour`.
  """

  @callback credentials(subject :: any, action :: term) :: {:ok, term} | {:error, term}

end

defmodule NAI.Provider.NoImpl do
  defexception message: "Protocol for NAI.Provider not implemented."
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

  defstruct [
    trace: nil
  ]

  def chat(subject \\ nil)

  def chat(nil) do
    %NAI{}
  end

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


defimpl NAI.Provider, for: Any do
  defmacro __deriving__(module, struct, opts) do
    quote do
      defimpl NAI.Provider, for: unquote(module) do
        def credentials(subject, action) do
          {:ok, unquote(module).credentials(unquote(struct), action)}
        end
      end
    end
  end

  def credentials(_,_), do: raise NAI.Provider.NoImpl
end


defmodule NAI.Gemini do
  @behaviour NAI.ProviderBehaviour
  def credentials(_,_), do: []
end

defmodule NAI.HF do
  @behaviour NAI.ProviderBehaviour
  def credentials(_,_), do: []
end

defmodule NAI.Mistral do
  @behaviour NAI.ProviderBehaviour
  def credentials(_,_), do: []
end

defmodule NAI.OpenAI do
  @behaviour NAI.ProviderBehaviour
  def credentials(_,_), do: []
end

defmodule NAI.VLLM do
  @behaviour NAI.ProviderBehaviour
  def credentials(_,_), do: []
end


defmodule NAI.Chat do
  def message(subject \\ nil, options \\ nil)
  def message(nil, options) do
    NAI.chat()
    |> message(options)
  end
  def message(c = %NAI{},_) do
    c
  end

  def tag(subject \\ nil, name \\ nil, options \\ nil)
  def tag(nil, name, options) do
    NAI.chat()
    |> tag(name, options)
  end
  def tag(c = %NAI{},_,_) do
    c
  end

  def checkout(subject \\ nil, name \\ nil, options \\ nil)
  def checkout(nil, name, options) do
    NAI.chat()
    |> checkout(name, options)
  end
  def checkout(c = %NAI{},_,_) do
    c
  end

  def set_stream(subject \\ nil, value \\ true, options \\ nil)
  def set_stream(nil, value, options) do
    NAI.chat()
    |> set_stream(value, options)
  end
  def set_stream(c = %NAI{}, value, _) do
    c
  end

  def with_model(subject \\ nil, selector \\ nil, options \\ nil)
  def with_model(nil, selector, options) do
    NAI.chat()
    |> with_model(selector, options)
  end
  def with_model(c = %NAI{}, selector, _) do
    c
  end
end


defmodule  NAI.ChatResponse do
  def body(subject, options \\ nil) do
    :nyi
  end

  def done?(subject, options \\ nil) do
    :nyi
  end


  def stream(subject) do
    :nyi
  end
  def stream(subject, handler \\ nil, options \\ nil)
  def stream(subject, {m,f,a}, options) do
    :nyi
  end
  def stream(subject, h, options) when is_function(h,2) do
    :nyi
  end
  def stream(subject, h, options) when is_function(h,3) do
    :nyi
  end
  def stream(subject, nil, options) do
    :nyi
  end
end

defmodule NAI.Message do
  defstruct [
    role: nil,
    body: nil
  ]
end

defmodule NAI.Model do
  def cheapest(options \\ nil) do
    {:model_picker, :nyi}
  end
  def fastest(options \\ nil) do
    {:model_picker, :nyi}
  end
  def smartest(options \\ nil) do
    {:model_picker, :nyi}
  end
  def best(options \\ nil) do
    {:model_picker, :nyi}
  end
  def custom(provider, name, options \\ nil) do
    {:model_picker, :nyi}
  end
end
