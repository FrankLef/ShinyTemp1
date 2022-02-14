test_that("ply_norm", {
  data <- ShinyTemp1::sim_norm()
  out <- ply_norm(data)
  expect_s3_class(out, class = "plotly")
})
