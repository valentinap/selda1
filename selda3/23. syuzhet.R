install.packages("syuzhet")
library(syuzhet)

sent <- rbind(c("You are awesome and I love you so much"),
             c("This book is simply terrible, I am horrified"),
             c("I love traveling, this place is so beautiful"),
             c("Bad acting, bad music and especially bad taste"),
             c("This is the best movie created so far"),
             c("It's a waste of time"),
             c("Well directed, well produced, I like it"),
             c("I liked this movie so much"),
             c("Your pet is adorable"),
             c("This book is amazing"),
             c("This is my favourite movie"),
             c("The director is really experienced"),
             c("I cannot tell you how much I enjoyed during this traveling"),
             c("I hate and hate and hate. So angry. Die!"),
             c("Impressed and amazed: you are peerless in your achievement of unparalleled mediocrity"),
             c("This is possibly the worst movie even made"),
             c("He is undoubtedly a great actor"),
             c("Wonderful movie, is really incredible"),
             c("I don t like it, is boring"),
             c("Don t waste your time and money"),
             c("Very bad acting, very boring, I am so disappointed!"),
             c("It is garbage, it is so trash"),
             c("So many thing are so idiotic that it pissed me off"),
             c("I thought the film was totally awful, bad script and acting"),
             c("It was a great experience"),
             c("I love the photography and the script is amazing"),
             c("Truly disappointed from this product"),
             c("All the characters are beautifully executed"),
             c("Unfortunately I didn't like it at all"),
             c("Horrid acting and mediocre script, I'm unhappy"))

get_nrc_sentiment(sent)

get_sentiment(sent, method = "nrc")
get_sentiment(sent, method = "syuzhet")

get_sent_values(sent, method = "nrc")
get_sent_values(sent, method = "bing")

tokens <- get_tokens(sent, pattern = "\\W")
head(tokens)

# get_sentences(text)

raw_values <- get_sentiment(sent)

raw <- get_transformed_values(raw_values, low_pass_size = 2, x_reverse_len = 100, padding_factor = 2, scale_vals = FALSE, scale_range = FALSE)

simple_plot(raw_values, title = "Syuzhet Plot", legend_pos = "top")

simple_plot(raw, title = "Syuzhet Plot", legend_pos = "top")

