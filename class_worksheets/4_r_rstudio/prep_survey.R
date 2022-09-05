# prepare survey data for worksheet

library(googlesheets4)
survey = read_sheet("https://docs.google.com/spreadsheets/d/1oXejacr0gSA5LCj3lvzmZ4vYPPjnG6T-gek7k_Iklik/edit?resourcekey#gid=1096931693")
survey = survey[ ,3:ncol(survey)]

# rename columns
colnames(survey) = c("fav_char", "major", "fav_color", "fav_num", "other_classes", "b_month", "car", "pineapple_pizza", "mint_choc", "nerd", "hours_sleep", "pets", "fav_art", "coffee_days", "tea_days", "soda/pop_days", "juice_days", "none_days", "lt_location", "fict", "recreation", "hotdog")

# give unique keys
survey$key = paste0(survey$fav_char, "_", row.names(survey))

# turn yes/no into logical
survey[survey == "Yes"] = "TRUE"
survey[survey == "No"] = "FALSE"

survey$car = as.logical(survey$car)
survey$pineapple_pizza = as.logical(survey$pineapple_pizza)
survey$nerd = as.logical(survey$nerd)
survey$hotdog = as.logical(survey$hotdog)


write.csv(survey, "./content/class_worksheets/4_r_rstudio/data/survey_data.csv", row.names = FALSE)
