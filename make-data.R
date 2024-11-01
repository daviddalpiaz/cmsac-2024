# download and save data
if (!file.exists("data-raw/statcast2024.rds")) {
    data_baseballsavant = sabRmetrics::download_baseballsavant(
        start_date = "2024-01-01",
        end_date = "2024-12-31",
    )
    saveRDS(statcast2024, file = "data-raw/statcast2024.rds")
}

# load data
statcast2024 = readRDS("data-raw/statcast2024.rds")

# filter to and save Cole data
if (!file.exists("data/cole2024.csv")) {
    cole2024 = dplyr::filter(data_baseballsavant, pitcher_id == 543037)
    readr::write_csv(cole2024, "data/cole2024.csv")
}
