library("MCView")

args <- commandArgs(trailingOnly=TRUE)

if (length(args) == 6) {
    prefix <- args[1]
    name <- args[2]
    title <- args[3]
    type <- args[4]
    atlas_prefix <- args[5]
    atlas_name <- args[6]
    import_dataset(
        sprintf("../mcview/%s", name),                           # The directory to create
        sprintf("%s-%s", prefix, gsub("/", "-", name)),          # The name of the dataset
        sprintf("../output/%s/%s.metacells.h5ad", name, prefix), # The metacells h5ad file
        metadata_fields = "all",                                 # Ask to import all the metadata
        title = title,                                           # A title for the GUI
        cell_type_field = type,                                  # The name of the type field
        cell_type_colors_file = "../captured/type_colors.csv",   # The type colors CSV file
        projection_weights_file = sprintf("../output/%s/%s.atlas_weights.csv", name, prefix),
        atlas_project = sprintf("../mcview/%s", atlas_name),
        atlas_dataset = sprintf("%s-%s", atlas_prefix, gsub("/", "-", atlas_name)),
    )

} else if (length(args) == 4) {
    prefix <- args[1]
    name <- args[2]
    title <- args[3]
    type <- args[4]
    import_dataset(
        sprintf("../mcview/%s", name),                           # The directory to create
        sprintf("%s-%s", prefix, gsub("/", "-", name)),          # The name of the dataset
        sprintf("../output/%s/%s.metacells.h5ad", name, prefix), # The metacells h5ad file
        metadata_fields = "all",                                 # Ask to import all the metadata
        title = title,                                           # A title for the GUI
        cell_type_field = type,                                  # The name of the type field
        cell_type_colors_file = "../captured/type_colors.csv"    # The type colors CSV file
    )

} else if (length(args) == 3) {
    prefix <- args[1]
    name <- args[2]
    title <- args[3]
    import_dataset(
        sprintf("../mcview/%s", name),                           # The directory to create
        sprintf("%s-%s", prefix, gsub("/", "-", name)),          # The name of the dataset
        sprintf("../output/%s/%s.metacells.h5ad", name, prefix), # The metacells h5ad file
        metadata_fields = "all",                                 # Ask to import all the metadata
        title = title                                            # A title for the GUI
    )

} else {
    stopifnot(FALSE)
}
