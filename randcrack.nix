{
  lib,
  python3,
  randcrack-src,
}:

python3.pkgs.buildPythonPackage rec {
  pname = "randcrack";
  version = "0.2.0";
  pyproject = true;

  src = randcrack-src;

  build-system = [
    python3.pkgs.setuptools
    python3.pkgs.wheel
  ];

  pythonImportsCheck = [
    "randcrack"
  ];

  meta = {
    description = "Predict python's random module generated values";
    homepage = "https://github.com/tna0y/Python-random-module-cracker";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "randcrack";
  };
}
