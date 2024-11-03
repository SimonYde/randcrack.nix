{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "randcrack";
  version = "0.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tna0y";
    repo = "Python-random-module-cracker";
    rev = version;
    hash = "sha256-DR6jq0deEqKn5titjzr+HYsZqLGYJcI0gcih32wsNlw=";
  };

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
