{ pkgs, ... }:

{
  programs.ranger = {
    enable = true;
    # TODO: https://github.com/jstkdng/ueberzugpp/issues/264
    extraPackages = [ pkgs.ueberzugpp ];
    settings.preview_images_method = "ueberzug";
  };
}
