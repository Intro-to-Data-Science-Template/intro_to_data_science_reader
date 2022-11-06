# create data sets for worksheet

library(stringr)

# load data
raw_names = read.csv("./content/class_worksheets/26_data_cleaning/data/raw_names.csv", header = FALSE, col.names = "name")

# to lower
raw_names$low = tolower(raw_names$name)

# get first initials
raw_names$finit = substr(raw_names$low, 1, 1)

# splits first last
raw_names$first = sapply(str_split(raw_names$name, pattern = " ", n = 2), `[`, 1)
raw_names$last = sapply(str_split(raw_names$name, pattern = " ", n = 2), `[`, 2)

# make email
raw_names$email = tolower(paste0(raw_names$finit, raw_names$last, "@smith.edu"))

# add nums to some
raw_names$nums = sample(11:99, nrow(raw_names))
raw_names$email_n = tolower(paste0(raw_names$finit, raw_names$last, raw_names$nums, "@smith.edu"))

# sample emails with num or no num
final_email = vector(mode = "character", length = nrow(raw_names))
for(i in 1:nrow(raw_names)){
  
  final_email[i] = raw_names[i, sample(c("email", "email", "email_n"), 1)]
  
}

# add to df
raw_names$final_email = final_email

# make name df
name_df = data.frame("name" = rep.int(NA, 50))

# make some use initials
for(i in 1:nrow(raw_names)){
  
  name_df[i, "name"] = str_to_title(paste0(raw_names[i, sample(c("finit", "first", "first", "first"), 1)], " ", raw_names[i, "last"]))
  
}

# make email df
email_df = data.frame("email" = final_email)

# add attendance
name_df$meet_1 = sample(c(TRUE, FALSE), size = nrow(name_df), replace = TRUE)
name_df$meet_2 = sample(c(TRUE, FALSE), size = nrow(name_df), replace = TRUE, prob = c(.4, .6))
name_df$meet_3 = sample(c(TRUE, FALSE), size = nrow(name_df), replace = TRUE, prob = c(.3, .7))
name_df$meet_4 = sample(c(TRUE, FALSE), size = nrow(name_df), replace = TRUE, prob = c(.2, .8))

email_df$meet_5 = sample(c(TRUE, FALSE), size = nrow(name_df), replace = TRUE)
email_df$meet_6 = sample(c(TRUE, FALSE), size = nrow(name_df), replace = TRUE, prob = c(.4, .6))
email_df$meet_7 = sample(c(TRUE, FALSE), size = nrow(name_df), replace = TRUE, prob = c(.3, .7))
email_df$meet_8 = sample(c(TRUE, FALSE), size = nrow(name_df), replace = TRUE, prob = c(.2, .8))

# randomize order
name_df = name_df[sample(1:nrow(name_df), 50),]

# save
write.csv(name_df, "./content/class_worksheets/26_data_cleaning/data/name_df.csv", row.names = FALSE)
write.csv(email_df, "./content/class_worksheets/26_data_cleaning/data/email_df.csv", row.names = FALSE) 

