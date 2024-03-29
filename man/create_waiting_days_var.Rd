% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_waiting_days_var.R
\name{create_waiting_days_var}
\alias{create_waiting_days_var}
\title{Create waiting days variable}
\usage{
create_waiting_days_var(df, creat_date = createdAt, deliv_date = updatedAt)
}
\arguments{
\item{df}{A dataframe of Delivraide deliveries.}

\item{creat_date}{The name of the column representing the order creation date (default: createdAt). Must be in a date or date-time format, not string.}

\item{deliv_date}{The name of the column representing the order delivery date (default: updatedAt). Must be in a date or date-time format, not string.}
}
\value{
A dataframe with an additional column "waiting_days" representing the waiting time in days.
}
\description{
Creates a "waiting days" variable by computing the difference between the date the order was created, and the date it was delivered.
}
\examples{

# Load the sample orders data
data(sample_orders_data)

# Filter delivered orders
delivered_orders <- filter_delivered(sample_orders_data)

# Add waiting days variable
delivered_orders_new <- create_waiting_days_var(delivered_orders)

# You can also use pipes:
delivered_orders_new2 <- delivered_orders |>
  create_waiting_days_var()

}
