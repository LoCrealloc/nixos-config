{ lib, ... }:
let
  settingsAttrs = {
    media.hardware-video-decoding.force-enabled = true; # wont use my nvidia card otherwise, sadly
    privacy = {
      fingerprintingProtection = true;
      "clearOnShutdown.history" = false;
      "trackingprotection.enabled" = true;
    };
    browser = {
      tabs.inTitlebar = 1;
      tabs.warnOnClose = true;
      translations.enable = false;
      policies.runOncePerModification = {
        removeSearchEngines = ''
          ["Google","Bing","Amazon.com","eBay","Twitter"]
        '';
        extensionsUninstall = ''
          ["google@search.mozilla.org","bing@search.mozilla.org","amazondotcom@search.mozilla.org","ebay@search.mozilla.org","twitter@search.mozilla.org"]
        '';
        setDefaultSearchEngine = "DuckDuckGo";
        extensionsInstall = ''
          ["https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"]
        '';
      };
      search = {
        suggest.enabled = true;
        suggest.searches = true;
      };
    };
    font.name = {
      monospace.x-western = "Hack Nerd Font Mono";
      sans-serif.x-western = "Hack Nerd Font";
      serif.x-western = "Hack Nerd Font";
    };
    middlemouse.paste = false;
  };
in

{
  programs.librewolf = {
    enable = true;
    settings =
      let
        flatten = (
          prev: attrs:
          if builtins.isAttrs attrs then
            (lib.attrsets.concatMapAttrs (
              name: value:
              let
                newname = if "${prev}" != "" then "${prev}.${name}" else "${name}";
              in
              {
                ${newname} = flatten newname value;
              }
            ) attrs)
          else
            attrs
        );
      in
      lib.attrsets.mergeAttrsList (
        lib.attrsets.collect (attr: builtins.all (x: !builtins.isAttrs x) (builtins.attrValues attr)) (
          flatten "" settingsAttrs
        )
      );
  };
}
