pkgs <- as.data.frame(read.dcf("/app/packrat/packrat.lock")[-1, , drop = FALSE])

for (i in 1:nrow(pkgs)) {
  pkg <- pkgs[i, ]

  message("Trying to install ", pkg$Package)

  if (pkg$Package %in% rownames(installed.packages())) {
    message(pkg$Package, " is already installed")
  } else if (pkg$Source == "CRAN") {
    f <- file.path("/app/packrat/src", pkg$Package, paste0(pkg$Package, "_", pkg$Version, ".tar.gz"))
    message("...from ", f)

    install.packages(
      f,
      type = "source",
      INSTALL_opts = "--no-docs --no-help --no-demo"
    )
  } else if (pkg$Source == "github") {
    f <- file.path("/app/packrat/src", pkg$Package, paste0(pkg$GithubSha1, ".tar.gz"))
    message("...from ", f)

    install.packages(
      f,
      type = "source",
      INSTALL_opts = "--no-docs --no-help --no-demo"
    )
  }
}
