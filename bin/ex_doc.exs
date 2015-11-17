#!/usr/bin/env elixir
mix_env = System.get_env["MIX_ENV"] || "dev"
Code.prepend_path Path.expand("../_build/#{mix_env}/lib/earmark/ebin", __DIR__)
Code.prepend_path Path.expand("../_build/#{mix_env}/lib/ex_doc/ebin", __DIR__)

if Code.ensure_loaded?(ExDoc.CLI) do
  ExDoc.CLI.run(System.argv)
else
  IO.puts :stderr, "Error: cannot generate docs because ExDoc.CLI module is not available. " <>
                   "Please run `mix compile` before or ensure ExDoc is available."
  exit(1)
end
