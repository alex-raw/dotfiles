# Set CRAN mirror:
grDevices::X11.options(width = 4.5, height = 4, ypos = 0,
                          xpos = 1000, pointsize = 10)

local({
  r <- getOption("repos")
  r["CRAN"] <- "https://ftp.fau.de/cran/"
  options(repos = r)
})

# Set browser (e.g. plotly)
options(browser = "usr/bin/brave")
options(stringsAsFactors = FALSE)
