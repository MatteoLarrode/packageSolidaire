#' @title Filter delivered kits
#'
#' @description This function filters from the dataset the orders that have been delivered, and removes those that have been cancelled.
#'  It does so by using the "tracking_status" variable that is present in Delivraide data.
#'
#' @param df A dataframe of Delivraide orders
#'
#' @return A dataframe
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
filter_delivered <- function(df) {

  stopifnot("Input must be a dataframe" = is.data.frame(df))

  df %>%
    dplyr::filter(tracking_status == 3)
}
