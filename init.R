Sys.setenv(CCACHE_DIR = "/app/cache")

print(getwd())
list.files(getwd(), all.files = T, full.names = T, include.dirs = T)
list.files("/usr/bin", all.files = T, full.names = T, include.dirs = T)

install.packages("Rcpp")
stop(0)

pkgs <- as.data.frame(read.dcf("/app/packrat/packrat.lock")[-1, , drop = FALSE])

for (i in 1:nrow(pkgs)) {
  pkg <- pkgs[i, ]

  message("Trying to install ", pkg$Package)

  if (pkg$Package %in% rownames(installed.packages())) {
    message(pkg$Package, " is already installed")
  } else if (pkg$Source == "CRAN") {
    f <- file.path("/app/packrat/src", pkg$Package, paste0(pkg$Package, "_", pkg$Version, ".tar.gz"))
    message("...from ", f)

    remotes::install_local(f, INSTALL_opts = "--no-docs --no-help --no-demo")
  } else if (pkg$Source == "github") {
    f <- file.path("/app/packrat/src", pkg$Package, paste0(pkg$GithubSha1, ".tar.gz"))
    message("...from ", f)

    remotes::install_local(f, INSTALL_opts = "--no-docs --no-help --no-demo")
  }
}
