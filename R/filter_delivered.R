#' Filter delivered kits
#'
#' @param df A dataframe of orders with a "tracking_status" variable
#'
#' @return A dataframe
#' @export
#'
#' @examples
filter_delivered <- function(df) {
  df %>% filter(tracking_status == 3)
}
