# ---- Create a sample dataframe ----
df <- data.frame(
  createdAt = as.Date(c("2023-05-01", "2023-05-02", "2023-05-03")),
  updatedAt = as.Date(c("2023-05-04", "2023-05-06", "2023-05-08"))
)

# Call the function
result <- create_waiting_days_var(df)

# Check if the waiting_days column is added
expect_true("waiting_days" %in% colnames(result))

# Check if waiting_days is computed correctly
expect_equal(result$waiting_days, c(3, 4, 5))

# ---- Create a sample dataframe with different column names ----
df <- data.frame(
  order_created = as.Date(c("2023-05-01", "2023-05-02", "2023-05-03")),
  order_delivered = as.Date(c("2023-05-04", "2023-05-06", "2023-05-08"))
)

# Call the function with different column names
result <- create_waiting_days_var(df, creat_date = order_created, deliv_date = order_delivered)

# Check if the waiting_days column is added
expect_true("waiting_days" %in% colnames(result))

# Check if waiting_days is computed correctly
expect_equal(result$waiting_days, c(3, 4, 5))
