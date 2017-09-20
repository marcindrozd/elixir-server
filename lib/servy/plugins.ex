require Logger

defmodule Servy.Plugins do
  def rewrite_path(%{ path: "/wildlife" } = conv) do
    %{ conv | path: "/wildthings" }
  end

  def rewrite_path(%{ path: "/bears?id=" <> id} = conv) do
    %{ conv | path: "/bears/" <> id }
  end

  def rewrite_path(conv), do: conv

  def log(conv) do
    if Mix.env == :dev do
      IO.inspect conv
    end
    conv
  end

  def track(%{ status: 404, path: path } = conv) do
    if Mix.env != :test do
      Logger.warn "#{path} on the loose"
    end
    conv
  end

  def track(conv), do: conv
end
