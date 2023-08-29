#' @title Count orders by department
#' 
#' @description Groups and counts orders of the dataset by their department, using zip codes.
#' 
#' @param df  A dataframe of Delivraide orders
#' @param zip The column for zip code (default: zip). Note: do not add quotes around the column name.
#'
#' @return A dataframe with the number of orders for each department.
#' @import dplyr
#'
#' @examples
#' #' # Load the sample orders data
#' data(sample_orders_data)
#'
#' # Group and count orders per department
#' dpt_orders <- count_orders_dpt(sample_orders_data)
count_orders_dpt <- function(df, zip = zip) {
  
  df |>
    filter(!is.na(zip), nchar(as.character(zip)) == 5) |> 
    mutate(departement = str_sub(as.character(zip), start = 1, end = 2)) |> 
    group_by(departement) |> 
    summarise(orders_dpt = n()) |> 
    filter(departement != "0.")
  
}

#' @title Count orders by city
#' 
#' @description Groups and counts orders of the dataset by their city
#' 
#' @param df  A dataframe of Delivraide orders
#' @param zip The column for zip code (default: zip). Note: do not add quotes around the column name.
#'
#' @return A dataframe with the number of orders for each department.
#' @import dplyr
#'
#' @examples
#' #' # Load the sample orders data
#' data(sample_orders_data)
#'
#' # Group and count orders per department
#' dpt_orders <- count_orders_dpt(sample_orders_data)
count_orders_dpt <- function(df, zip = zip) {
  
  df |>
    filter(!is.na(zip), nchar(as.character(zip)) == 5) |> 
    mutate(departement = str_sub(as.character(zip), start = 1, end = 2)) |> 
    group_by(departement) |> 
    summarise(orders_dpt = n()) |> 
    filter(departement != "0.")
  
}


