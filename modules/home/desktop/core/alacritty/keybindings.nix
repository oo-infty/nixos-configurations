{ config, lib, pkgs, ... }:

[
  { key = "J"; mode = "Vi|~Search"; action = "Left"; }

  { key = "L"; mode = "Vi|~Search"; action = "Right"; }

  { key = "K"; mode = "Vi|~Search"; action = "Down"; }

  { key = "I"; mode = "Vi|~Search"; action = "Up"; }

  { key = "J"; mods = "Shift"; mode = "Vi|~Search"; action = "SemanticLeft"; }

  { key = "L"; mods = "Shift"; mode = "Vi|~Search"; action = "SemanticRightEnd"; }

  { key = "K"; mods = "Shift"; mode = "Vi|~Search"; action = "Down"; }
  { key = "K"; mods = "Shift"; mode = "Vi|~Search"; action = "Down"; }
  { key = "K"; mods = "Shift"; mode = "Vi|~Search"; action = "Down"; }
  { key = "K"; mods = "Shift"; mode = "Vi|~Search"; action = "Down"; }
  { key = "K"; mods = "Shift"; mode = "Vi|~Search"; action = "Down"; }

  { key = "I"; mods = "Shift"; mode = "Vi|~Search"; action = "Up"; }
  { key = "I"; mods = "Shift"; mode = "Vi|~Search"; action = "Up"; }
  { key = "I"; mods = "Shift"; mode = "Vi|~Search"; action = "Up"; }
  { key = "I"; mods = "Shift"; mode = "Vi|~Search"; action = "Up"; }
  { key = "I"; mods = "Shift"; mode = "Vi|~Search"; action = "Up"; }

  { key = "H"; mode = "Vi|~Search"; action = "ToggleViMode"; }
  { key = "H"; mode = "Vi|~Search"; action = "ScrollToBottom"; }

  { key = ";"; mode = "Vi|~Search"; action = "ClearSelection"; }

  { key = "P"; mode = "Vi|~Search"; action = "ToggleViMode"; }
  { key = "P"; mode = "Vi|~Search"; action = "Paste"; }
  { key = "P"; mode = "Vi|~Search"; action = "ScrollToBottom"; }

  { key = "Escape"; mode = "Vi|~Search"; action = "ToggleViMode"; }
]
