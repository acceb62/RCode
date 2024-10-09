if (!require("zip")) {
  install.packages("zip")
  library(zip)
}

directory <- "C:/Users/rrothbard/Downloads"
prefix_list <- c("AHS", "Cmgn", "GPQIN", "HQI", "HSAG", "IPRO", "MPQH", "Q_Ins", "SHQA", "TMF", "Telli")

all_files <- dir(directory, full.names = TRUE)

for (prefix in prefix_list) { 
  matching_files <- all_files[basename(all_files) %in% grep(paste0("^", prefix), basename(all_files), value = TRUE)]
  if (length(matching_files) > 0) {
    zip_file <- file.path(directory, paste0(prefix, "_QSEP.zip"))
    zip::zipr(zipfile = zip_file, files = matching_files)
    cat(paste0("Files with prefix '", prefix, "' zipped successfully into ", zip_file, "\n"))
  } 
  else {
    cat(paste0("No files found for prefix '", prefix, "'\n"))
  }
}
