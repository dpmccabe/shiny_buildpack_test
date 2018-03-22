install.packages("devtools")

pkgs <- as.data.frame(read.dcf("app/packrat/packrat.lock")[-1, , drop = FALSE])

for (i in 1:nrow(pkgs)) {
  pkg <- pkgs[i, ]

  if (pkg$Package %in% rownames(installed.packages())) {
    message(pkg$Package, " is already installed")
  } else if (pkg$Source == "CRAN") {
    install_local(
      file.path("packrat/src", pkg$Package, paste0(pkg$Package, "_", pkg$Version, ".tar.gz")),
      INSTALL_opts = "--no-docs --no-help --no-demo"
    )
  } else if (pkg$Source == "github") {
    install_github(
      file.path(pkg$GithubUsername, pkg$GithubRepo),
      ref = pkg$GithubRef
    )
  }
}
