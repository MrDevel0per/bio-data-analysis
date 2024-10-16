# Analyzing Tree Data
## 🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳🌳
This is a lab performed by Owen Cruz-Abrams, Class of 2026 at Aspen High School. The lab aims to determine the effect of elevation on tree height, and uses a large enough dataset that control variables are largely unnecessary.
## Purpose
To determine the effect of elevation on tree height, and thus the effect of elevation on the ability of trees to grow.
The actual research question states:
> How does the elevation of a tree (2500-3100m) affect its average height (meters)?

## Data Collection
We collected data from the following source:
- [Tree Data](https://doi.org/10.5061/dryad.2jm63xsrf)
- [City Elevation Data](https://edits.nationalmap.gov/apps/gaz-domestic/public/search/names)
## Data Exploration
See `notebooks/eda.ipynb` for the code used to explore the data.
## Meaning of Data Columns
See the following table, taken directly from the dataset. We are specifically looking at the tree height in meters to average for each city, etc.
| column_name                      | definition                                                                                                |
|----------------------------------|-----------------------------------------------------------------------------------------------------------|
| city_ID                          | Unique identifier given to the tree by the city                                                           |
| tree_ID                          | our unique identifier for each tree                                                                       |
| planted_date                     | date tree was planted                                                                                     |
| most_recent_observation          | most recent observation date of tree (among dates such as condition_date, edit_date, inspect_date)        |
| retired_date                     | date tree was retired.                                                                                    |
| most_recent_observation_type     | what is the most recent observation? condition_date, edit_date, etc.                                      |
| common_name                      | plain english common name of the tree species                                                             |
| scientific_name                  | biological name of the tree species (Quercus rubrus)                                                      |
| greater_metro                    | greater metro area in which the city is found, which will match the city name in the filename             |
| city                             | city name, as it is properly spelled (Las Vegas)                                                          |
| state                            | state name (as it is properly spelled, not abbreviation)                                                  |
| longitude_coordinate             | exact location of tree species (longitude)                                                                |
| latitude_coordinate              | exact location of tree species (latitude)                                                                 |
| location_type                    | where the tree is located, whether in a park or an urban area (green_space, built_environment, no_info)   |
| zipcode                          | zipcode of the location                                                                                   |
| address                          | address where the data was collected                                                                      |
| neighborhood                     | neighborhood of the location of the tree                                                                  |
| location_name                    | If the location is named without being an address, such as Smith Cemetary or Route 11 Median              |
| ward                             | city ward                                                                                                 |
| district                         | the district tree is located                                                                              |
| overhead_utility                 | Is there an overhead utility (yes, no, conflicting)?                                                      |
| diameter_breast_height_CM        | trunk diameter in cm at breast height                                                                     |
| condition                        | tree condition as coded by the city-specific protocol converted to standardized conditions                |
| height_M                         | height of tree in meters                                                                                  |
| native                           | Is the tree native to the state (naturally_occurring), not native (introduced), or of unknown status      |
| height_binned_M                  | range of heights into which the tree falls, converted from feet.                                          |
| diameter_breast_height_binned_CM | range of diameters into which the tree falls, converted from inches often                                  |
## Analysis
1. We needed a dataset of all the city names. I produced this dataset (see `data/city_elevation.csv`) by using the National Map's API to search for all cities in the tree dataset. See `notebooks/get_city_elevation.ipynb` for the code used to generate this dataset.
2. We then used the `pandas` library to merge the tree dataset with the city dataset. This allowed us to calculate the average tree length for each city. See `scripts/analyze_tree_data.py` for the code used to merge the datasets and calculate the average tree length for each city.
3. We saved this new dataset, with elevation for each tree, to `data/tree_data_with_elevation.csv`.
4. From there, we analyzed the data in a massive spreadsheet, and calculated the average tree height for each elevation. We did not publish this spreadsheet, but we did publish the code used to analyze the data. See `notebooks/analyze_tree_data.ipynb` for the code used to analyze the data.
# Reproducibility
To reproduce the analysis, follow these steps:
1. Install necessary tools to clone and work with this repository.
    - `git` (see [git-scm.com](https://git-scm.com) for installation instructions)
    - `python` (see [python.org](https://www.python.org) for installation instructions)
    - `homebrew` (see [brew.sh](https://brew.sh) for installation instructions)
    - `git-lfs` (after installing `homebrew`, run `brew install git-lfs`)
2. Clone the repository and navigate to the repository directory.
    - Hit <kbd>Command</kbd> + <kbd>Space</kbd> and type `terminal` and hit <kbd>Enter</kbd>.
    - In the terminal, type `git clone https://github.com/MrDevel0per/bio-data-analysis.git` and hit <kbd>Enter</kbd>.
    - Then, type `cd bio-data-analysis` and hit <kbd>Enter</kbd>.
3. Install the necessary Python packages.
    - In the terminal, type `python3 -m venv venv` and hit <kbd>Enter</kbd>.
    - Then, type `source venv/bin/activate` and hit <kbd>Enter</kbd>.
    - Finally, type `pip install -r requirements.txt` and hit <kbd>Enter</kbd>.
4. Download the data from https://www.kaggle.com/datasets/mexwell/5m-trees-dataset
5. Run the following script in the terminal to properly format the data:
    - `sh scripts/data.sh`, and type in the path to the downloaded .zip file.
        - For example, if the file is in your Downloads folder, you would type `sh scripts/data.sh ~/Downloads/5m-trees-dataset.zip`.
6. Run the Jupyter Notebooks in `notebooks` to analyze your now-formatted data. Project Jupyter should have been installed in the `requirements.txt` step, but if not, see [Installing Jupyter](https://jupyter.org/install).
