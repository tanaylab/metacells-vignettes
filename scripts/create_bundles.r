library(MCView)

for (name in c(
#   "one-pass/preliminary.auto",
#   "one-pass/preliminary.manual",
#   "one-pass/final",
    "projection/preliminary",
    "projection/corrected"
#   "iterative/iteration-1",
#   "iterative/iteration-2.manual",
#   "iterative/iteration-3.auto",
#   "iterative/iteration-3.manual",
#   "iterative/iteration-4.auto",
#   "iterative/iteration-4.manual",
#   "iterative/final"
)) {
    cat(sprintf("# %s\n", name))
    create_bundle(
        project=sprintf("mcview/%s", name),
        name=name,
        path="/home/aviezerl/tanaywiz/apps/mc2.vignettes",
        overwrite=TRUE,
        restart=TRUE,
        permissions="777"
    )
}
