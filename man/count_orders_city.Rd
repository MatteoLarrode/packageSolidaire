% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/group_orders.R
\name{count_orders_city}
\alias{count_orders_city}
\title{Count orders by city}
\usage{
count_orders_city(df, city = city)
}
\arguments{
\item{df}{A dataframe of Delivraide orders}

\item{city}{The column for city name (default: city). Note: do not add quotes around the column name.}
}
\value{
A dataframe with the number of orders for each department.
}
\description{
Groups and counts orders of the dataset by their city
}
\examples{
#' # Load the sample orders data
data(sample_orders_data)

# Group and count orders per department
dpt_orders <- count_orders_city(sample_orders_data)
}
