# Pokemon Stadium 2 (US)
A WIP decomp of Pokemon Stadium 2 (US).

It builds the following ROMs:

* pokestadiumgs.z64: `md5: 1561c75d11cedf356a8ddb1a4a5f9d5d`

Note: To use this repository, you must already have a rom for the game.

# Prerequisites

Under Debian / Ubuntu (which we recommend using), you can install them with the following commands:

```bash
sudo apt update
sudo apt install make git build-essential binutils-mips-linux-gnu python3 python3-pip python3-venv
```

**Please also ensure that the Python version installed is >3.7.**

The build process has a few python packages required that are located in `requirements.txt`.

To install them simply run in a terminal:

```bash
python3 -m pip install -r requirements.txt
```

# To use
1. Place the US Pokemon Stadium 2 (US) rom into the repository's "/baseroms/us/" folder as "baserom.z64".
2. Set up tools and extract the rom: `make init`
3. Re-assemble the rom: `make`

For contacts and other pret projects, see [pret.github.io](https://pret.github.io/).
