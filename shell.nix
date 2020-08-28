{ avr ? true, arm ? true, teensy ? true, nrf5 ? true }:

let
  nixpkgs = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/9ed4ff16ac9f1d94f5d9efc40f2f737835b950c1.tar.gz";
    sha256 = "1zhf51wsw1saazirrg2p2gbjm6ybyd616apbsp16k8a8028k1y32";
  };

  pkgs = import nixpkgs { };

  hjson = with pkgs.python3Packages; buildPythonPackage rec {
    pname = "hjson";
    version = "3.0.1";

    src = fetchPypi {
      inherit pname version;
      sha256 = "1yaimcgz8w0ps1wk28wk9g9zdidp79d14xqqj9rjkvxalvx2f5qx";
    };
    doCheck = false;
  };

  pythonEnv = pkgs.python3.withPackages (p: with p; [
    # requirements.txt
    appdirs
    argcomplete
    colorama
    hjson
    # requirements-dev.txt
    nose2
    flake8
    pep8-naming
    yapf
  ]);

  nrf5-sdk = pkgs.stdenv.mkDerivation {
    name = "nrf5-sdk";
    src = pkgs.fetchurl {
      url = https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v15.x.x/nRF5_SDK_15.0.0_a53641a.zip;
      sha256 = "1dv5gq7p86s6xbyr07bmf9b9nd6wpqsijjc6jz3c5kpxbf71753m";
    };
    buildInputs = [pkgs.unzip];
    installPhase = ''
      mkdir -p $out
      cp -r * $out/
    '';
  };

  adafruit-nrfutil = with pkgs.python3Packages; buildPythonApplication rec {
    pname = "adafruit-nrfutil";
    version =  "474a584a97590f0fe928f1633596f809b4ab1297";

    src = pkgs.fetchFromGitHub {
      owner = "adafruit";
      repo = "Adafruit_nRF52_nrfutil";
      rev = version;
      sha256 = "0p3fn36s189q4xqakq4cwk5943ga23w7fw3p5k5nnv6d0if1mv2b";
    };

    propagatedBuildInputs = [
      ecdsa
      pyserial
      click
    ];

    checkInputs = [
      behave
      nose
    ];

    doCheck = false;
  };
in

with pkgs;
let
  avrlibc = pkgsCross.avr.libcCross;

  avr_incflags = [
    "-isystem ${avrlibc}/avr/include"
    "-B${avrlibc}/avr/lib/avr5"
    "-L${avrlibc}/avr/lib/avr5"
    "-B${avrlibc}/avr/lib/avr35"
    "-L${avrlibc}/avr/lib/avr35"
    "-B${avrlibc}/avr/lib/avr51"
    "-L${avrlibc}/avr/lib/avr51"
  ];
in
mkShell ({
  name = "qmk-firmware";

  buildInputs = [ dfu-programmer dfu-util diffutils git pythonEnv ]
    ++ lib.optional avr [
      pkgsCross.avr.buildPackages.binutils
      pkgsCross.avr.buildPackages.gcc8
      avrlibc
      avrdude
    ]
    ++ lib.optional arm [ gcc-arm-embedded ]
    ++ lib.optional teensy [ teensy-loader-cli ]
    ++ lib.optional nrf5 [ nrfutil adafruit-nrfutil ];

  AVR_CFLAGS = lib.optional avr avr_incflags;
  AVR_ASFLAGS = lib.optional avr avr_incflags;
  shellHook = ''
    # Prevent the avr-gcc wrapper from picking up host GCC flags
    # like -iframework, which is problematic on Darwin
    unset NIX_TARGET_CFLAGS_COMPILE
  '';
}
//
lib.optionalAttrs nrf5 {
  NRFSDK15_ROOT = nrf5-sdk;
})
