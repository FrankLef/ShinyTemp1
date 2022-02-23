#' Simulate data having spurious associations using \code{rbinom}  
#'
#' @param n Sample size
#' @param probH probability of latent variable \code{H}
#' @param seed Seed. Default is 222
#' 
#' @importFrom stats rbinom
#' @importFrom rlang .data
#'
#' @return Dataframe, summary of binomial disribution probabilities 
#'
#' @examples
#' sim_binom()
#' @export
sim_binom <- function(n = 1000, probH = 0.4, seed = NULL) {
  stopifnot(probH > 0, probH < 1)
  set.seed(seed)
  # generate the confounder first
  H <- rbinom(n, size = 1, prob = probH)
  probA <- H * 0.8 + (1 - H) * 0.3
  `T` <- rbinom(n, size = 1, prob = probA)
  probY <- `T` * (H * 0.5 + (1 - H) * 0.7) + (1 - `T`) * (H * 0.3 + (1 - H) * 0.5)
  Y <- rbinom(n, size = 1, prob = probY)
  out <- data.frame(cbind(H, `T`, Y))
  out %>%
    group_by(`T`, H, Y) %>%
    count(name = "prob") %>%
    ungroup() %>%
    mutate(prob = round(.data[["prob"]] / sum(.data[["prob"]]), 3)) %>%
    as.data.frame()  # specify data.frame to pass expect_identical()
}


#' Simulate data having spurious associations using \code{rnorm}  
#'
#' @param n Sample size
#' @param meanH mean of latent variable \code{H}
#' @param sdH sd of latent variable \code{H}
#' @param seed Seed. Default is 222
#' 
#' @importFrom stats rnorm sd coef lm
#' @importFrom rlang .data
#'
#' @return Dataframe with lm coefficients.
#'
#' @examples
#' sim_norm()
#' @export
sim_norm <- function(n = 1000, meanH = 0.4, sdH = 0.25 * meanH, seed = NULL) {
  stopifnot(meanH > 0, meanH < 1, sdH > 0)
  set.seed(seed)
  # generate the confounder first
  H <- rnorm(n, mean = meanH, sd = sdH)
  meanT <- 0.25 * H
  `T` <- rnorm(n, mean = meanT, sd = abs(0.25 * meanT))
  meanY <- 0.25 * H + 0.5 * `T`
  a <- rnorm(n, mean = 0, sd = sdH)
  Y <-  a + rnorm(n, mean = meanY, sd = abs(0.25 * meanY))
  out <- data.frame(cbind(H, `T`, Y))
  lmod0 <- coef(summary(lm(Y ~ a + `T`)))
  lmod0 <- data.frame(model = "lmod0", var = row.names(lmod0), lmod0)
  lmod1 <- coef(summary(lm(Y ~ a + `T` + H)))
  lmod1 <- data.frame(model = "lmod1", var = row.names(lmod1), lmod1)
  rbind(lmod0, lmod1)
}
