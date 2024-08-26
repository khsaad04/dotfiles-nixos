{ lib, config, ... }:
{
  programs.yazi = {
    settings = {
      manager = {
        show_hidden = true;
        show_symlink = false;
        sort_by = "natural";
      };
    };
  };
  xdg.configFile = lib.mkIf config.programs.yazi.enable {
    "yazi/init.lua".text = ''
      local type = opts and opts.type or ui.Border.ROUNDED
      local old_build = Tab.build

      Tab.build = function(self, ...)
      	local bar = function(c, x, y)
      		if x <= 0 or x == self._area.w - 1 then
      			return ui.Bar(ui.Rect.default, ui.Bar.TOP)
      		end

      		return ui.Bar(
      			ui.Rect { x = x, y = math.max(0, y), w = ya.clamp(0, self._area.w - x, 1), h = math.min(1, self._area.h) },
      			ui.Bar.TOP
      		):symbol(c)
      	end

      	local c = self._chunks
      	self._chunks = {
      		c[1]:padding(ui.Padding.y(1)),
      		c[2]:padding(ui.Padding(c[1].w > 0 and 0 or 1, c[3].w > 0 and 0 or 1, 1, 1)),
      		c[3]:padding(ui.Padding.y(1)),
      	}

      	local style = THEME.manager.border_style
      	self._base = ya.list_merge(self._base or {}, {
      		ui.Border(self._area, ui.Border.ALL):type(type):style(style),
      		ui.Bar(self._chunks[1], ui.Bar.RIGHT):style(style),
      		ui.Bar(self._chunks[3], ui.Bar.LEFT):style(style),

      		bar("┬", c[1].right - 1, c[1].y),
      		bar("┴", c[1].right - 1, c[1].bottom - 1),
      		bar("┬", c[2].right, c[2].y),
      		bar("┴", c[2].right, c[2].bottom - 1),
      	})

      	old_build(self, ...)
      end

      function Status:name()
          local h = self._tab.current.hovered
          if not h then
              return ui.Line {}
          end

          local linked = ""
          if h.link_to ~= nil then
              linked = " -> " .. tostring(h.link_to)
          end
          return ui.Line(" " .. h.name .. linked)
      end

      Header:children_add(function()
          if ya.target_family() ~= "unix" then
              return ui.Line {}
          end
          return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
      end, 500, Header.LEFT)
    '';
    "yazi/theme.toml".text = ''
      [manager]
      cwd = { fg = "#83a598" }

      # Hovered
      hovered         = { fg = "#282828", bg = "#83a598" }
      preview_hovered = { underline = true }

      # Find
      find_keyword  = { fg = "#b8bb26", italic = true }
      find_position = { fg = "#fe8019", bg = "reset", italic = true }

      # Marker
      marker_selected = { fg = "#b8bb26", bg = "#b8bb26" }
      marker_copied   = { fg = "#b8bb26", bg = "#b8bb26" }
      marker_cut      = { fg = "#fb4934", bg = "#fb4934" }

      # Tab
      tab_active   = { fg = "#282828", bg = "#504945" }
      tab_inactive = { fg = "#a89984", bg = "#3c3836" }
      tab_width    = 1

      # Border
      border_symbol = "│"
      border_style  = { fg = "#665c54" }

      [status]
      separator_open  = ""
      separator_close = ""
      separator_style = { fg = "#3c3836", bg = "#3c3836" }

      # Mode
      mode_normal = { fg = "#282828", bg = "#A89984", bold = true }
      mode_select = { fg = "#282828", bg = "#b8bb26", bold = true }
      mode_unset  = { fg = "#282828", bg = "#d3869b", bold = true }

      # Progress
      progress_label  = { fg = "#ebdbb2", bold = true }
      progress_normal = { fg = "#504945", bg = "#3c3836" }
      progress_error  = { fg = "#fb4934", bg = "#3c3836" }

      # Permissions
      permissions_t = { fg = "#504945" }
      permissions_r = { fg = "#b8bb26" }
      permissions_w = { fg = "#fb4934" }
      permissions_x = { fg = "#b8bb26" }
      permissions_s = { fg = "#665c54" }

      [input]
      border   = { fg = "#bdae93" }
      title    = {}
      value    = {}
      selected = { reversed = true }

      [select]
      border   = { fg = "#504945" }
      active   = { fg = "#fe8019" }
      inactive = {}

      [tasks]
      border  = { fg = "#504945" }
      title   = {}
      hovered = { underline = true }

      [which]
      mask            = { bg = "#3c3836" }
      cand            = { fg = "#83a598" }
      rest            = { fg = "#928374" }
      desc            = { fg = "#fe8019" }
      separator       = "  "
      separator_style = { fg = "#504945" }

      [help]
      on      = { fg = "#fe8019" }
      exec    = { fg = "#83a598" }
      desc    = { fg = "#928374" }
      hovered = { bg = "#504945", bold = true }
      footer  = { fg = "#3c3836", bg = "#a89984" }

      [filetype]
      rules = [
          # Images
          { mime = "image/*", fg = "#83a598" },

          # Videos
          { mime = "video/*", fg = "#b8bb26" },
          { mime = "audio/*", fg = "#b8bb26" },

          # Archives
          { mime = "application/zip",             fg = "#fe8019" },
          { mime = "application/gzip",            fg = "#fe8019" },
          { mime = "application/x-tar",           fg = "#fe8019" },
          { mime = "application/x-bzip",          fg = "#fe8019" },
          { mime = "application/x-bzip2",         fg = "#fe8019" },
          { mime = "application/x-7z-compressed", fg = "#fe8019" },
          { mime = "application/x-rar",           fg = "#fe8019" },

          # Fallback
          { name = "*", fg = "#a89984" },
          { name = "*/", fg = "#83a598" }
      ]
    '';
  };
}
