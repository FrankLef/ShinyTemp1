test_that("test tableau with gt", {
  df <- sim_binom()
  out <- gt_probs(df, title = "Title", subtitle = "Subtitle")
  expect_s3_class(out, class = "gt_tbl")
})
