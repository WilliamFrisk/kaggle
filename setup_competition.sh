#!/bin/zsh

if [[ -z "$1" ]]; then
    echo "Usage: $0 <competition_name>"
    exit 1
fi

COMPETITION_NAME="$1"

BASE_DIR="$PWD/competitions/$COMPETITION_NAME"
DATA_EXPLORATION_NOTEBOOK_PATH="$BASE_DIR/notebooks/01_data_exploration.ipynb"

create_structure() {
    mkdir -p "$BASE_DIR"/{data/{raw,processed},notebooks,output}
    touch "$DATA_EXPLORATION_NOTEBOOK_PATH"
    cat > "$DATA_EXPLORATION_NOTEBOOK_PATH" <<EOF
{
"cells": [
{
"cell_type": "code",
"execution_count": null,
"metadata": {},
"outputs": [],
"source": [
    "# Imports\\n",
    "import sys\\n",
    "sys.path.append('../../../utils')\\n",
    "\\n",
    "from default_imports import *"
]
}
],
"metadata": {
"kernelspec": {
"display_name": "Python 3",
"language": "python",
"name": "python3"
},
"language_info": {
"name": "python"
}
},
"nbformat": 4,
"nbformat_minor": 2
}
EOF
}

echo "Creating folder structure at: $BASE_DIR"
create_structure

echo "Done."