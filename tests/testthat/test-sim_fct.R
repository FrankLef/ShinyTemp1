test_that("sim_binom", {
  out <- ShinyTemp1::sim_binom()
  
  target <- data.frame(
    `T` = as.integer(c(0, 0, 0, 0, 1, 1, 1, 1)),
    H = as.integer(c(0, 0, 1, 1, 0, 0, 1, 1)),
    Y = as.integer(c(0, 1, 0, 1, 0, 1, 0, 1)),
    prob = c(0.181, 0.230, 0.065, 0.014, 0.065, 0.132, 0.141, 0.172)
    )
  
  expect_identical(out, target)
  expect_identical(sum(out$prob), 1)
})

test_that("sim_norm", {
  out <- ShinyTemp1::sim_norm()
  # str(out)
  
  target <- c(c(0.051, 1.014, 0.988), c(0.001, 1.010, 0.514, 0.244))
  
  expect_identical(round(out$Estimate, 3), target)
})
