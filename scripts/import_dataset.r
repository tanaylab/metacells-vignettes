library("MCView")

args <- commandArgs(trailingOnly=TRUE)
stopifnot(length(args) == 3 || length(args) == 4)
prefix <- args[1]
name <- args[2]
title <- args[3]

if (length(args) == 4) {
    type <- args[4]
    import_dataset(
        sprintf("mcview/%s", name),                           # The directory to create
        sprintf("%s-%s", prefix, gsub("/", "-", name)),       # The name of the dataset
        sprintf("output/%s/%s.metacells.h5ad", name, prefix), # The metacells h5ad file
        metadata_fields = "all",                              # Ask to import all the metadata
        title = title,                                        # A title for the GUI
        cell_type_field = type,                               # The name of the type field
        cell_type_colors_file = "captured/type_colors.csv"    # The type colors CSV file
    )

} else {
    import_dataset(
        sprintf("mcview/%s", name),                           # The directory to create
        sprintf("%s-%s", prefix, gsub("/", "-", name)),       # The name of the dataset
        sprintf("output/%s/%s.metacells.h5ad", name, prefix), # The metacells h5ad file
        metadata_fields = "all",                              # Ask to import all the metadata
        title = title                                         # A title for the GUI
    )
}
