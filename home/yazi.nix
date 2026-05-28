{
  programs.yazi = {
    enable = true;

    # Show filesize or the number of items in a folder.
    settings.mgr.linemode = "size";

    # These keymaps disable wrapping around in the file list.
    keymap.mgr.prepend_keymap = [
      {
        on = "k";
        run = "arrow -1";
      }
      {
        on = "j";
        run = "arrow 1";
      }
    ];
  };
}
