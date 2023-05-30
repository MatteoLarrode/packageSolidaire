test_that("create_waiting_days correctly computes waiting time", {
  # Create a sample dataframe
  df <- data.frame(
    createdAt = as.Date(c("2023-05-01", "2023-05-02", "2023-05-03")),
    updatedAt = as.Date(c("2023-05-04", "2023-05-06", "2023-05-08"))
  )

  # Call the function
  result <- create_waiting_days(df)

  # Check if the waiting_days column is added
  expect_true("waiting_days" %in% colnames(result))

  # Check if waiting_days is computed correctly
  expect_equal(result$waiting_days, c(3, 4, 5))
})

test_that("create_waiting_days cannot handle non-date inputs", {
  # Create a sample dataframe with non-date inputs
  df <- data.frame(
    createdAt = c("2023-05-01", "2023-05-02", "2023-05-03"),
    updatedAt = c("2023-05-04", "2023-05-06", "2023-05-08")
  )

  # throws error when function is called
  expect_error(create_waiting_days(df), info = "An error should be thrown for columns class being strings, not dates.")
})

test_that("create_waiting_days handles different column names", {
  # Create a sample dataframe with different column names
  df <- data.frame(
    order_created = as.Date(c("2023-05-01", "2023-05-02", "2023-05-03")),
    order_delivered = as.Date(c("2023-05-04", "2023-05-06", "2023-05-08"))
  )

  # Call the function with different column names
  result <- create_waiting_days(df, creat_date = order_created, deliv_date = order_delivered)

  # Check if the waiting_days column is added
  expect_true("waiting_days" %in% colnames(result))

  # Check if waiting_days is computed correctly
  expect_equal(result$waiting_days, c(3, 4, 5))
})
