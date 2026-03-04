{
  flake.modules.nixos.core = {
    xdg = {
      mime = {
        enable = true;
        defaultApplications =
          let
            nvim = "nvim.desktop";
            thunar = "thunar.desktop";
            librewolf = "lebrewolf.desktop";
            mpv = "mpv.desktop";
            zathura = "org.pwmt.zathura.desktop";
            fileroller = "org.gnome.FileRoller.desktop";
            pqiv = "pqiv.desktop";
          in
          {
            "text/csv" = [ nvim ];
            "text/markdown" = [ nvim ];
            "text/plain" = [ nvim ];
            "text/x-c++src" = [ nvim ];
            "text/yaml" = [ nvim ];

            "application/xhtml+xml" = [ librewolf ];
            "text/html" = [ librewolf ];
            "text/xml" = [ librewolf ];
            "x-scheme-handler/http" = [ librewolf ];
            "x-scheme-handler/https" = [ librewolf ];
            "x-scheme-handler/ftp" = [ librewolf ];

            "inode/directory" = [ thunar ];
            "x-scheme-handler/trash" = [ thunar ];

            "application/zip" = [ fileroller ];
            "application/vnd.rar" = [ fileroller ];
            "application/x-7z-compressed" = [ fileroller ];
            "application/x-tar" = [ fileroller ];
            "application/gzip" = [ fileroller ];
            "application/x-bzip" = [ fileroller ];
            "application/x-bzip2" = [ fileroller ];
            "application/x-xz" = [ fileroller ];
            "application/x-rar-compressed" = [ fileroller ];

            "application/pdf" = [ zathura ];
            "application/epub+zip" = [ zathura ];

            "video/x-matroska" = [ mpv ];
            "audio/mp3" = [ mpv ];
            "audio/vsnd_c" = [ mpv ];
            "audio/mp4" = [ mpv ];
            "audio/flac" = [ mpv ];
            "video/x-msvideo" = [ mpv ];
            "audio/mpeg" = [ mpv ];
            "audio/x-vorbis+ogg" = [ mpv ];
            "audio/x-wav" = [ mpv ];
            "video/quicktime" = [ mpv ];

            "image/jpeg" = [ pqiv ];
            "image/gif" = [ pqiv ];
            "image/webp" = [ pqiv ];
            "image/png" = [ pqiv ];
          };
      };
    };
  };
}
