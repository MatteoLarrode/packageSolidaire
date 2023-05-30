#' @title Filter delivered kits
#'
#' @description Filters from the dataset the orders that have been delivered, and removes those that have been cancelled.
#'   It does so by using the specified tracking variable, defaulting to "tracking_status", that is present in Delivraide data.
#'
#' @param df A dataframe of Delivraide orders
#' @param col_name The column to use for filtering (default: tracking_status). Note: do not add quotes around the column name.
#'
#' @return The input dataframe filtered to only include orders that have been delivered.
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' # Load the sample orders data
#' data(sample_orders_data)
#'
#' # Filter the delivered orders
#' delivered_orders <- filter_delivered(sample_orders_data)
#'

filter_delivered <- function(df, col_name = tracking_status) {

  stopifnot("Input must be a dataframe" = is.data.frame(df))
  stopifnot("col_name must be an unquoted column name" = !is.character(substitute(col_name)))

  df %>%
    dplyr::filter({{col_name}} == 3)
}
