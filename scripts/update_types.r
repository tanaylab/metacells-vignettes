library("MCView")

args <- commandArgs(trailingOnly=TRUE)
stopifnot(length(args) == 2)
name <- args[1]
types <- args[2]

update_metacell_types(
    sprintf("mcview/%s", name),                  # The directory of the app
    sprintf("hca_bm-%s", gsub("/", "-", name)),  # The name of the dataset
    types                                        # The types CSV files
)
