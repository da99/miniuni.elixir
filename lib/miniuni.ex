
defmodule Miniuni do

  @moduledoc """
  Web app for miniuni.com
  """

@index_page """
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>miniuni.com</title>
  <meta name="description" content="A little info on da99">
  <meta name="author" content="da99">

  <style type="text/css">
    body {
      background:  #f7f7f7;
      font-family: Ubuntu, Segoe UI, Helvetica, sans-serif;
      padding:     20px;
    }

    a:link, a:visited {
      padding:  0 2px;
    }

    a:hover {
      background: #E43000;
      color:      #fff;
    }
  </style>
</head>

<body>
  <p>
      Stuff I like:
      <b>Ted Nelson</b> <a href="http://www.youtube.com/watch?v=KdnGPQaICjk">http://www.youtube.com/watch?v=KdnGPQaICjk</a>
        and
      <b>Alan Kay</b> <a href="http://www.youtube.com/watch?v=FvmTSpJU-Xc">http://www.youtube.com/watch?v=FvmTSpJU-Xc</a>.
  </p>
</body>
</html>
"""

  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  def start_link do
    IO.puts "Ready"
    Plug.Adapters.Cowboy.http(Plugger.Router, [])
  end

  get "/" do
    send_resp(conn, 200, @index_page)
  end

  match _ do
    send_resp(conn, 404, "not found")
  end

end # === defmodule Miniuni


