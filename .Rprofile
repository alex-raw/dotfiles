# Set CRAN mirror:
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://ftp.fau.de/cran/"
  options(repos = r)
})

# Set browser (e.g. plotly)
options(browser = "usr/bin/brave")

# History
.First <- function() {
  if (interactive()) {
    library(utils)
    timestamp(, prefix = paste("##------ [", getwd(), "] ", sep = ""))

  }
}

.Last <- function() {
  if (interactive()) {
    hist_file <- Sys.getenv("R_HISTFILE")
    if (hist_file == "") hist_file <- "~/.RHistory"
    savehistory(hist_file)
  }
}
