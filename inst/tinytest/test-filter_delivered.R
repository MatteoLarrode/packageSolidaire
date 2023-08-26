# ---- Create a sample dataframe for testing ----
df <- data.frame(
  tracking_status = c(1, 2, 3, 3, 1, 3, 2),
  other_column = c("A", "B", "C", "D", "E", "F", "G")
)

# Call the function under test
filtered_df <- filter_delivered(df)

# Check if the returned object is a dataframe
expect_true(is.data.frame(filtered_df), info = "Returned object is not a dataframe.")

# Check if the returned dataframe only contains rows with tracking_status equal to 3
expect_equal(filtered_df$tracking_status, c(3, 3, 3), info = "Incorrect filtering of tracking_status.")

# Check if the other_column remains intact
expect_equal(filtered_df$other_column, c("C", "D", "F"), info = "Incorrect filtering of other_column.")

# ---- Create a sample dataframe for testing ----
df <- data.frame(
  custom_status = c(1, 2, 3, 3, 1, 3, 2),
  other_column = c("A", "B", "C", "D", "E", "F", "G")
)

# Call the function under test with custom column name
filtered_df <- filter_delivered(df, col_name = custom_status)

# Check if the returned dataframe only contains rows with custom_status equal to 3
expect_equal(filtered_df$custom_status, c(3, 3, 3), info = "Incorrect filtering of custom_status.")

# Check if the other_column remains intact
expect_equal(filtered_df$other_column, c("C", "D", "F"), info = "Incorrect filtering of other_column.")


# ---- Create a sample dataframe for testing ----
df <- data.frame(
  tracking_status = c(1, 2, 3, 3, 1, 3, 2),
  other_column = c("A", "B", "C", "D", "E", "F", "G")
)

# Check if an error is thrown when col_name is a character string
expect_error(filter_delivered(df, col_name = "tracking_status"),
  info = "An error should be thrown for col_name as a string."
)
