let
pkgs = import <nixos> {};
in

with pkgs;

stdenv.mkDerivation {
  name = "bibliography";
  src = ./.;

  TEXMFVAR = "/tmp/texmf";

  preBuild = ''
    mkdir -p $TEXMFVAR
  '';

  installPhase = ''
    mkdir -p $out
    cp paper.pdf $out
  '';

  buildInputs = [
    lmodern
    (texlive.combine {
      inherit (texlive) scheme-small luatex biblatex latexmk biber lualatex-math rmpage;
    })
  ];
}
