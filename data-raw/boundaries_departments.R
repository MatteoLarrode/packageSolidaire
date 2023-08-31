library(tidyverse)
library(httr)
library(sf)
library(devtools)
library(rmapshaper)
library(lobstr)

# Load package
load_all(".")

# URL
query_url <- "https://www.data.gouv.fr/fr/datasets/r/eb36371a-761d-44a8-93ec-3d728bec17ce"

# GET and unzip shapefiles
GET(
  query_url,
  write_disk(
    zip_folder <- tempfile(fileext = ".zip")
  )
)

unzip(zip_folder, exdir = tempdir())

shp <- file.path(tempdir(), "departements-20180101.shp")

# Projection actuelle est WGS84
dpt18 <-
  read_sf(shp) |>
  st_transform(crs = 4326)

# Select and rename vars
dpt18 <-
  dpt18 |>
  select(
    dpt18_name = nom,
    dpt18_code = code_insee,
    dpt18_nuts3 = nuts3,
    geometry
  )

# Make sure geometries are valid
dpt18 <- st_make_valid(dpt18)

# Simplify shape to reduce file size
dpt18 <- ms_simplify(dpt18)

# Cast geometries to multipolyon
dpt18 <- dpt18 |>
  st_cast("MULTIPOLYGON")

# Check geometry types are homogenous
if (dpt18 |>
  st_geometry_type() |>
  unique() |>
  length() > 1) {
  stop("Incorrect geometry types")
}


# Check object is below 50Mb GitHub warning limit
if (obj_size(dpt18) > 50000000) {
  stop("File is too large")
}

# Rename
boundaries_dpt18 <- dpt18

# Save output to data/ folder
usethis::use_data(boundaries_dpt18, overwrite = TRUE)
