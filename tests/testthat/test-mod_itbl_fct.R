test_that("create_dtbl", {
  df <- sim_binom()
  out <- create_itbl(df)
  expect_s3_class(out, class = "reactable")
})
