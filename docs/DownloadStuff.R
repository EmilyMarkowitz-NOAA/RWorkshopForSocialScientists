

#Vinettes

download.file(url = "https://raw.githubusercontent.com/emilyhmarkowitz/BestScriptingPractices/master/rscripts/BestScriptingPractices.nb.html", destfile = "./docs/BestScriptingPractices.nb.html")


library("googledrive")

# https://googledrive.tidyverse.org/
# https://docs.google.com/spreadsheets/d/1NkG331BZW_Q9PuzdhEgW5rB6vkLe0K_Dd1K3iFrAFNw/edit?usp=sharing
drive_deauth()
drive_auth()
drive_download("R Workshop Video Links", type = "csv", overwrite = TRUE)
drive_download("R Workshop Detailed Schedule", type = "csv", overwrite = TRUE)


#### Download GitHub Icons
# library(imagefx)
library(webshot)
# library(OpenImageR)
members<-data.frame("Name" = c("Aaron Mamula", "Emily Markowitz", "Erin Steiner", 
                               "Rob Ames", "Ben Fissel", "Geret Depiper", 
                               "Allen Chen"), 
                    "First Name" = c("Aaron", "Emily", "Erin", "Rob", "Ben", "Geret", "Allen"),
                    "Last Name" = c("Mamula", "Markowitz", "Steiner", "Ames", "Fissel", "Depiper", "Chen"),
                    "github" = c("aaronmams", "emilyhmarkowitz", "erinsteiner-NOAA",
                                 "", "", "",  
                                 ""), 
                    "lat" = c(36.956806, 41.197558, 47.640816, 
                              45.510209, 47.640816, 41.526796, 
                              47.640816), 
                    "lon" = c(-122.021390, -73.897447, -122.336197, 
                              -122.669898, -122.3361978, -70.675144,  
                              -122.336197), 
                    "Institution" = c("Southwest Fisheries Science Center", 
                                      "Office of Science and Technology/Alaska Fisheries Science Center", 
                                      "Northwest Fisheries Science Center", 
                                      "Pacific States Marine Fisheries Commission", 
                                      "Alaska Fisheries Science Center", 
                                      "Northeast Fisheries Science Center", 
                                      "Northwest Fisheries Science Center"))
members$imagelink<-members$githublink<-NA                 
members$Status<-"Presenter"
for (i in 1:nrow(members)) {
  # if (!(members$github[i] %in% "")) {
    members$imagelink[i]<-paste0("./docs/images/", gsub(pattern = " ", replacement = "", 
                                                        x = members$Name[i]), 
                                 ".png")
    webshot(url = paste0("https://github.com/", members$github[i]),
            file = members$imagelink[i], 
            cliprect	 = "viewport", 
            vwidth = 300, vheight = 350)
  # } else {
  #   members$githublink[i]<-paste0("https://github.com/")
  #   members$imagelink[i]<-paste0("./docs/images/noaa_logo.gif")   
  #   webshot(url = paste0("https://github.com/", members$github[i]),
  #           file = members$imagelink[i], 
  #           cliprect	 = "viewport", 
  #           vwidth = 300, vheight = 500)
  # }
  # my_repos <- gh("GET /users/emilyhmarkowitz/repos")
  # vapply(my_repos, "[[", "", "name")
}

