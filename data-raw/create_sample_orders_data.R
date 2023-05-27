library(dplyr)
library(lubridate)

# Set the number of rows in sample dataset
num_rows <- 20
set.seed(123)  # Set seed for reproducibility


sample_orders_data <- tibble(
  city = c(
    "Paris", "Paris", "Paris", "Montpellier", "Paris",
    "Grenoble", "Grenoble", "Paris", "Paris", "Paris",
    "Paris", "Toulouse", "Grenoble", "Grenoble", "Toulouse",
    "Paris", "Strasbourg", "Le Havre", "Paris", "Lyon"
  ),
  zip = c(
    91300, 75015, 75005, 34090, 75018,
    38000, 38000, 78510, 94260, 75012,
    94230, 31000, 38400, 38000, 31000,
    75016, 67000, 76600, 77000, 69002
  ),
  meat =  sample(0:1, num_rows, replace = TRUE),
  fish = sample(0:1, num_rows, replace = TRUE),
  porc = sample(0:1, num_rows, replace = TRUE),
  is_completed = c(0, 0, 1, 1, 0, 0, 1, 0, 0, 0,
                   1, 0, 0, 1, 1, 0, 1, 1, 0, 1),
  tracking_status = c(0, 0, 2, 3, 0, 0, 3, 0, 0, 0,
                      3, 2, 1, 3, 3, 0, 3, 3, 1, 3),
  createdAt = ymd_hms(c(
    "2023-02-23 11:19:04", "2023-02-24 20:37:35",
    "2022-11-20 12:19:33", "2023-01-16 08:30:49",
    "2022-12-02 16:03:20", "2023-02-28 17:03:40",
    "2022-12-02 10:10:42", "2023-03-02 14:57:50",
    "2022-11-07 20:55:16", "2023-01-03 17:12:40",
    "2022-12-19 11:20:09", "2023-04-09 15:25:49",
    "2023-02-19 16:41:34", "2023-02-21 17:56:09",
    "2023-01-25 14:26:58", "2023-01-16 13:41:41",
    "2023-02-14 17:05:41", "2022-11-23 10:28:47",
    "2023-01-15 13:40:37", "2023-01-29 20:52:39"
  )),
  updatedAt = ymd_hms(c(
    "2023-02-23 11:19:04", "2023-02-24 20:37:35",
    "2023-01-28 21:12:30", "2023-05-04 17:19:43",
    "2022-12-02 16:03:20", "2023-02-28 17:03:40",
    "2023-04-08 11:58:39", "2023-03-02 14:57:50",
    "2022-11-07 20:55:16", "2023-01-03 17:12:40",
    "2023-04-15 17:47:25", "2023-05-06 16:51:25",
    "2023-05-12 21:45:51", "2023-05-14 11:39:28",
    "2023-02-07 17:29:21", "2023-01-16 13:41:41",
    "2023-03-30 16:22:12", "2023-04-01 09:47:04",
    "2023-02-08 17:10:04", "2023-04-25 17:16:21"
  )),
  date_accepted = c(
    "0", "0", "0", "1", "0",
    "0", "1", "0", "0", "0",
    "1", "1", "0", "1", "1",
    "0", "1", "1", "0", "1"
  ),
  date_request = c(
    "NULL", "NULL", "2023-01-29 10:00:00.000",
    "2023-05-04 11:42:36.000", "NULL", "NULL",
    "2023-04-08 00:34:26.000", "NULL", "NULL",
    "NULL", "2023-04-14 21:36:44.000",
    "2023-05-07 15:14:00.000", "NULL",
    "2023-05-14 19:43:12.000",
    "2023-02-05 13:59:07.000", "NULL",
    "2023-03-23 20:54:00.000",
    "2023-04-01 19:39:00.000", "NULL",
    "2023-04-25 17:17:00.000"
  ),
  is_alone = sample(0:1, num_rows, replace = TRUE),
  is_apl = sample(0:1, num_rows, replace = TRUE),
  is_boursier = sample(0:1, num_rows, replace = TRUE),
  is_handicap = sample(0:1, num_rows, replace = TRUE),
  is_winning = sample(0:1, num_rows, replace = TRUE),
  priority_score = ifelse(is_alone == 1, 2, 0) + ifelse(is_boursier == 1, 5, 0) +
    ifelse(is_apl == 1, 2, 0) + ifelse(is_winning == 1, -1, 0) +
    ifelse(is_handicap == 1, 100, 0))


usethis::use_data(sample_orders_data, overwrite = TRUE)
