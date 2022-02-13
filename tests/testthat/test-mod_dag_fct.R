
test_that("Create a dag with ggdag", {
  dag <- ggdag::dagify(
    Y ~ `T` + H,
    `T` ~ H,
    exposure = "T",
    latent = "H",
    outcome = "Y")
  out <- ggp_dag(dag)
  expect_s3_class(out, class = "ggplot")
})
