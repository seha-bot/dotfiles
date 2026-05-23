{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;

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

    # TODO: Remove after the following gets merged:
    # https://github.com/sxyazi/yazi/issues/3914
    # https://github.com/jstkdng/ueberzugpp/issues/264
    settings = {
      mgr.linemode = "size";

      plugin.prepend_previewers = [
        {
          mime = "image/*";
          run = "noop";
        }
        {
          mime = "video/*";
          run = "noop";
        }
        {
          mime = "pdf/*";
          run = "noop";
        }
      ];
    };
  };
}
