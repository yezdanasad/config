with import <nixpkgs> { 
  config = { allowUnfree = true; };
};

mkShell {
  name = "asad-dev-shell";

  buildInputs = [
    neovim
    curl
    wget
    unzip
    zip
    tmux
    openjdk21
    maven
    docker
    iputils
    bind
    nmap
    nettools
    zoxide
    bat
    podman
    podman-compose
  ];

  shellHook = ''
    export EDITOR=nvim
    export JAVA_HOME=${openjdk21}/lib/openjdk
  '';
}

