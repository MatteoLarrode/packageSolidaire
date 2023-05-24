#' @title Filter delivered kits
#'
#' @description This function filters only the orders that have been delivered, and removes from a dataframe the orders that have been cancelled.
#'     It does so by using the "tracking_status" variable that is present in Delivraide data.
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
  df %>%
    dplyr::filter(tracking_status == 3)
}
