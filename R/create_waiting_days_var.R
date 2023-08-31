#' @title Create waiting days variable
#'
#' @description
#' Creates a "waiting days" variable by computing the difference between the date the order was created, and the date it was delivered.
#'
#' @param df A dataframe of Delivraide deliveries.
#' @param creat_date The name of the column representing the order creation date (default: createdAt). Must be in a date or date-time format, not string.
#' @param deliv_date The name of the column representing the order delivery date (default: updatedAt). Must be in a date or date-time format, not string.
#'
#' @return A dataframe with an additional column "waiting_days" representing the waiting time in days.
#'
#' @import dplyr
#' @import lubridate
#'
#' @export
#'
#' @examples
#'
#' # Load the sample orders data
#' data(sample_orders_data)
#'
#' # Filter delivered orders
#' delivered_orders <- filter_delivered(sample_orders_data)
#'
#' # Add waiting days variable
#' delivered_orders_new <- create_waiting_days_var(delivered_orders)
#'
#' # You can also use pipes:
#' delivered_orders_new2 <- delivered_orders |>
#'   create_waiting_days_var()
#'
create_waiting_days_var <- function(df, creat_date = createdAt, deliv_date = updatedAt) {
  df <- df |>
    mutate(waiting_days = round(as.numeric(difftime({{ deliv_date }}, {{ creat_date }}, units = "days")), 0))

  return(df)
}
