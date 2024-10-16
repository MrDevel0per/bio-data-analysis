# Usage: data.sh ARCHIVE_PATH
# Steps:
# 1. Download data from https://www.kaggle.com/datasets/mexwell/5m-trees-dataset
# 2. Run this script
if [ "$#" -ne 1 ]; then
    echo "Usage: data.sh ARCHIVE_PATH"
    exit 1
fi
ARCHIVE_PATH=$1
# Unzip the data
unzip $ARCHIVE_PATH -d dataset
# Remove the archive
rm $ARCHIVE_PATH
# Move the data to the data directory
mkdir -p data/trees
mv dataset/* data/trees/
# Remove the dataset directory
rm -r dataset
cd data/trees
# Remove all non csv files
find . -type f ! -name "*.csv" -delete
# Remove the csv titled Column_Headers_Dryad.csv
rm Column_Headers_Dryad.csv
# Tell the user all done
echo "Data has been and cleaned and formatted for the project."
