#' Simulate data having spurious associations using \code{rbinom}  
#'
#' @param n Sample size
#' @param probH probability of latent variable \code{H}
#' @param seed Seed. Default is 222
#' 
#' @importFrom stats rbinom
#' @importFrom rlang .data
#'
#' @return Data.frame with probabilities
#' @export
#'
#' @examples
#' sim_binom()
sim_binom <- function(n = 1000, probH = 0.4, seed = 222) {
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
#' @importFrom stats rnorm sd
#' @importFrom rlang .data
#'
#' @return Data.frame with probabilities
#' @export
#'
#' @examples
#' sim_norm()
sim_norm <- function(n = 1000, meanH = 0.4, sdH = 0.1, seed = 222) {
  stopifnot(sdH > 0)
  set.seed(seed)
  # generate the confounder first
  H <- rnorm(n, mean = meanH, sd = sdH)
  meanA <- H * 0.8 + (1 - H) * 0.3
  `T` <- rnorm(n, mean = meanA, sd = abs(0.2 * meanA))
  meanY <- `T` * (H * 0.5 + (1 - H) * 0.7) + (1 - `T`) * (H * 0.3 + (1 - H) * 0.5)
  Y <- rnorm(n, mean = meanY, sd = abs(0.2 * meanY))
  out <- data.frame(cbind(H, `T`, Y))
  out %>%
    group_by(`T`, H) %>%
    summarize(nb = n(), avg = mean(Y), sd = sd(Y))
}
