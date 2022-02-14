test_that("gt_probs", {
  df <- sim_binom()
  out <- gt_probs(df, title = "Title", subtitle = "Subtitle")
  expect_s3_class(out, class = "gt_tbl")
})
