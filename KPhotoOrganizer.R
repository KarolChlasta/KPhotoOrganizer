install.packages("dplyr")

library(dplyr)

TuSaZdjecia = "D:\\Photos\\In\\Nowe"

setwd(TuSaZdjecia)

Zdjecia <- list.files(pattern = "*.jpg")
ZdjeciaInfo <- file.info(Zdjecia)
ListaFolderow <- gsub("-", "_", unique(substring(ZdjeciaInfo$mtime, 6, 10)))

l <- 0

for(w in ListaFolderow) {
  dir.create(paste(TuSaZdjecia, ListaFolderow[l], sep="\\"))
  l <- l + 1
}

ZdjeciaInfo$folder <- gsub("-", "_", substring(ZdjeciaInfo$mtime, 6, 10))

l <- 0
w <- 0

for(w in Zdjecia) {
  file.copy(paste(TuSaZdjecia, Zdjecia[l], sep="\\"), paste(TuSaZdjecia, ZdjeciaInfo[l, 8], sep="\\"))
  file.remove(paste(TuSaZdjecia, Zdjecia[l], sep="\\"))
  l <- l + 1
}

ListaPodfolderow <- list.dirs(path = TuSaZdjecia, full.names = TRUE, recursive = TRUE)

for(Folder in ListaPodfolderow) {
  ListaPlikow <- list.files(path = w, pattern = NULL, all.files = FALSE,
             full.names = FALSE, recursive = FALSE,
             ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
  setwd(Folder)
  file.rename(paste0(ListaPlikow), paste0(1:length(ListaPlikow), ".jpg") )
}