defmodule CounterWeb.PageLive do
  use CounterWeb, :live_view
  use Phoenix.Component

  def button(assigns) do
    ~H"""
    <button phx-click={assigns.click} phx-window-keyup="increase" class="text-white text-4xl bg-indigo-600 px-6 py-4 rounded hover:bg-indigo-900">+</button>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket
    |> assign(number: 0)}
  end

  def handle_event("inc", _params, socket) do
    {:noreply,
    socket
    |> update(:number, &(&1+1))
    }
  end

  def handle_event("increase", %{"key" => " "}, socket) do
    {:noreply,
    socket
    |> update(:number, &(&1+1))
    |> IO.inspect
    }
  end

  def handle_event("increase", _, socket) do
    {:noreply,
    socket
    }
  end

  def handle_event("dec", _params, socket) do
    {:noreply,
    socket
    |> update(:number, &max(0, &1 - 1))
    }
  end

  def handle_event("clear", _params, socket) do
    {:noreply,
    socket
    |> assign(number: 0)
    }
  end


end
