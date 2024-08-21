{ config, ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      NoDefaultBookmarks = true;
      FirefoxHome = {
        Search = true;
        Pocket = false;
        Snippets = false;
        TopSites = false;
        Highlights = false;
      };
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
    };
    profiles.${config.home.username} = {
      name = config.home.username;
      isDefault = true;
      search = {
        force = true;
        default = "DuckDuckGo";
      };
      extensions = with config.nur.repos.rycee.firefox-addons; [
        ublock-origin
        vimium
        adaptive-tab-bar-colour
      ];
      settings = {
        "browser.sessionstore.resume_session" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "ui.key.menuAccessKeyFocuses" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
      };
      userChrome = ''
        /* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/window_control_placeholder_support.css made available under Mozilla Public License v. 2.0
        See the above repository for updates as well as full license text. */

        /*
        Creates placeholders for window controls.
        This is a supporting file used by other stylesheets and is mostly
        unnecessary if window titlebar is enabled.

        Should preferably be imported before other stylesheets, because some values in this style are deliberately overridden by other styles.
        */

        /* Modify these values to match your preferences
        These reserve extra space on both sides of the nav-bar to be able to drag the window */
        :root:is([tabsintitlebar], [sizemode="fullscreen"]) {
          --uc-window-drag-space-pre: 30px; /* left side*/
          --uc-window-drag-space-post: 30px; /* right side*/
        }

        :root:is([tabsintitlebar][sizemode="maximized"], [sizemode="fullscreen"]) {
          --uc-window-drag-space-pre: 0px; /* Remove pre space */
        }

        /* Default width - used on Windows10+ */
        :root:is([tabsintitlebar], [sizemode="fullscreen"]) {
          --uc-window-control-width: 138px;
        }

        @media  (-moz-platform: windows-win7),
                (-moz-platform: windows-win8){
          :root:is([tabsintitlebar], [sizemode="fullscreen"]) {
            --uc-window-control-width: 105px;
          }
        }
        /* On linux set width based on number of caption buttons.
        One button */
        @media (-moz-gtk-csd-minimize-button), (-moz-gtk-csd-maximize-button), (-moz-gtk-csd-close-button) {
          :root:is([tabsintitlebar],[sizemode="fullscreen"]) {
            --uc-window-control-width: 28px;
          }
        }
        /* Two buttons */
        @media (-moz-gtk-csd-minimize-button) and (-moz-gtk-csd-maximize-button),
               (-moz-gtk-csd-minimize-button) and (-moz-gtk-csd-close-button),
               (-moz-gtk-csd-maximize-button) and (-moz-gtk-csd-close-button) {
          :root:is([tabsintitlebar],[sizemode="fullscreen"]) {
            --uc-window-control-width: 56px;
          }
        }
        /* Three buttons */
        @media (-moz-gtk-csd-minimize-button) and (-moz-gtk-csd-maximize-button) and (-moz-gtk-csd-close-button) {
          :root:is([tabsintitlebar],[sizemode="fullscreen"]) {
            --uc-window-control-width: 84px;
          }
        }

        @media (-moz-platform: macos){
          :root:is([tabsintitlebar]) {
            --uc-window-control-width: 72px;
          }
          :root:is([tabsintitlebar][sizemode="fullscreen"]) {
            --uc-window-control-width: 0;
          }
        }

        .titlebar-buttonbox{ color: var(--toolbar-color) }
        :root[sizemode="fullscreen"] .titlebar-buttonbox-container{ display: none }

        :root[sizemode="fullscreen"] #TabsToolbar > .titlebar-buttonbox-container:last-child{
          position: absolute;
          display: flex;
          top: 0;
          right:0;
          height: 40px;
        }

        :root[sizemode="fullscreen"] #TabsToolbar > .titlebar-buttonbox-container:last-child{ height: 32px }

        #nav-bar{
          border-inline: var(--uc-window-drag-space-pre,0px) solid transparent;
          border-inline-style: solid !important;
          border-right-width: calc(var(--uc-window-control-width,0px) + var(--uc-window-drag-space-post,0px));
          background-clip: border-box !important;
        }

        /* Rules for window controls on left layout */
        @media (-moz-bool-pref: "userchrome.force-window-controls-on-left.enabled"),
               (-moz-gtk-csd-reversed-placement),
               (-moz-platform: macos){
          :root[tabsintitlebar="true"] #nav-bar{
            border-inline-width: calc(var(--uc-window-control-width,0px) + var(--uc-window-drag-space-post,0px)) var(--uc-window-drag-space-pre,0px)
          }
          :root[sizemode="fullscreen"] #TabsToolbar > .titlebar-buttonbox-container:last-child{ right: unset }
        }
        @media (-moz-bool-pref: "userchrome.force-window-controls-on-left.enabled"){
          .titlebar-buttonbox-container{
            order: -1 !important;
          }
          .titlebar-buttonbox{
            flex-direction: row-reverse;
          }
        }

        /* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/navbar_tabs_oneliner_menu_buttons_on_right.css made available under Mozilla Public License v. 2.0
        See the above repository for updates as well as full license text. */

        /* Variation of oneliner where menubutton and overflow button are next to window controls (if window controls are on right side) */

        /* IMPORTANT */
        /*
        Get window_control_placeholder_support.css
        Window controls will be all wrong without it
        */

        :root[uidensity="compact"]{
          --tab-block-margin: 2px !important;
        }

        /* Modify these to change relative widths or default height */
        #navigator-toolbox{
          --uc-navigationbar-width: 50vw;
          --uc-toolbar-height: 40px;
        }

        #scrollbutton-up,
        #scrollbutton-down{ border-block-width: 2px !important; }

        /* reserved space for overflow + menu buttons */
        #navigator-toolbox{
          --uc-buttons-width: calc(64px + 5 * var(--toolbarbutton-outer-padding) + var(--uc-menubutton-padding,6px))
        }
        #nav-bar:not([nonemptyoverflow]) > #nav-bar-customization-target{ 
          --uc-buttons-width: calc(32px + 4 * var(--toolbarbutton-outer-padding) + 6px)
        }
        /* Override for other densities */
        :root[uidensity="compact"] #navigator-toolbox{
          --uc-toolbar-height: 34px;
          --uc-menubutton-padding: 0px;
        }
        :root[uidensity="touch"] #navigator-toolbox{
          --uc-toolbar-height: 44px;
        }

        :root[uidensity="compact"] #urlbar-container{
          --urlbar-container-height: var(--uc-toolbar-height) !important;
          padding-block: 0 !important;
        }
        :root[uidensity="compact"] #urlbar{
          --urlbar-container-height: var(--uc-toolbar-height) !important;
        }

        /* prevent urlbar overflow on narrow windows */
        /* Dependent on how many items are in navigation toolbar ADJUST AS NEEDED */
        @media screen and (max-width: 1000px){
          #urlbar-container{
            min-width: 300px !important;
            flex-shrink: 1 !important;
          }
        }

        #TabsToolbar{
          margin-left: var(--uc-navigationbar-width);
          --tabs-navbar-shadow-size: 0px;
          color: var(--toolbar-color);
        }

        #tabbrowser-tabs{
          --tab-min-height: calc(var(--uc-toolbar-height) - 2 * var(--tab-block-margin,0px)) !important;
        }
        /* Need to set background color for selected tab so it can be distinguished from background */
        #TabsToolbar .tab-background[selected]{
          background: var(--lwt-selected-tab-background-color,rgba(0,0,0,0.2)) !important;
        }

        #TabsToolbar[brighttext] .tab-background[selected]{
          background: var(--lwt-selected-tab-background-color,rgba(255,255,255,0.2)) !important;
        }

        /* This isn't useful when tabs start in the middle of the window */
        .titlebar-spacer[type="pre-tabs"]{ width:8px !important}
        #nav-bar{ margin-top: calc(0px - var(--uc-toolbar-height)); }

        #nav-bar-customization-target{ padding-right: calc(100vw - (var(--uc-navigationbar-width)) - var(--uc-window-control-width) - var(--uc-buttons-width) - var(--uc-window-drag-space-post)) }

        /* Rules specific to window controls on left layout */
        @media (-moz-bool-pref: "userchrome.force-window-controls-on-left.enabled"),
               (-moz-platform: macos),
               (-moz-gtk-csd-reversed-placement){
          .titlebar-buttonbox-container{ position: fixed; display: block; left: 0px; z-index: 3; }
          #nav-bar-customization-target{
            padding-right: calc(100vw - (var(--uc-navigationbar-width)) - var(--uc-buttons-width) - var(--uc-window-drag-space-pre))
          }
        }

        #titlebar{
          opacity: 1 !important;
          will-change: unset !important;
          transition: none !important;
        }

        :root[sizemode="fullscreen"] #TabsToolbar > .titlebar-buttonbox-container,
        #TabsToolbar > .toolbar-items{
          position: relative !important;
          z-index: 2
        }

        :root[sizemode="fullscreen"] #TabsToolbar > .titlebar-spacer[type="post-tabs"]{
          display: flex !important;
        }

        .titlebar-spacer[type="post-tabs"]{
          width: calc(var(--uc-buttons-width) + var(--uc-window-drag-space-post)) !important;
        }
        :root[privatebrowsingmode="temporary"] .titlebar-spacer[type="post-tabs"]{
          width: var(--uc-buttons-width) !important
        }

        #PanelUI-button,#nav-bar-overflow-button{
          margin: 0px !important;
          border: 0px !important;
          position: relative;
          z-index: 3;
        }
        /* 1px margin on touch density causes tabs to be too high */
        .tab-close-button{ margin-top: 0 !important }

        /* Hide dropdown placeholder */
        #urlbar-container:not(:hover) .urlbar-history-dropmarker{ margin-inline-start: -28px; }
      '';
      userContent = ''
        @-moz-document url-prefix("about:newtab"),
            url-prefix("about:home") {
                /*Hides the cog button to customize the new tab*/
                [data-l10n-id="newtab-personalize-icon-label"] {
        display: none !important;
                }
      '';
    };
  };
}
