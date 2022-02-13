test_that("sim_dag", {
  out <- sim_dag()
  
  target <- data.frame(
    `T` = as.integer(c(0, 0, 0, 0, 1, 1, 1, 1)),
    H = as.integer(c(0, 0, 1, 1, 0, 0, 1, 1)),
    Y = as.integer(c(0, 1, 0, 1, 0, 1, 0, 1)),
    prob = c(0.181, 0.230, 0.065, 0.014, 0.065, 0.132, 0.141, 0.172)
  )
  
  expect_identical(out, target)
  expect_identical(sum(out$prob), 1)
})
