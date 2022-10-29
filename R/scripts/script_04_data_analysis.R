# title: statistical analysis of EEG data (example)
# author: Keith Lohse, PhD
# date: 2022-10-26

getwd()
setwd("~/GitHub/ReproRehab/")
getwd()
list.files()

library(tidyverse); library(car); library(ez)

list.files("./data/")
DATA <- read.csv("./data/data_PROCESSED_EEG.csv", header=TRUE,
                 stringsAsFactors = TRUE)
head(DATA)

DATA <- DATA %>% mutate(group = factor(str_sub(subID, start=1, end=2)))
summary(DATA$group)

# 1. Example plot illustrating Alpha difference -----
DATA_GRP_COND_AVG <- DATA %>% select(group, condition, Hz, frontal, 
                                 central, parietal, occipital) %>%
  group_by(group, condition, Hz) %>%
  summarize(frontal_avg = mean(frontal, na.rm=TRUE), 
            central_avg = mean(central, na.rm=TRUE), 
            parietal_avg = mean(parietal, na.rm=TRUE), 
            occipital_avg = mean(occipital, na.rm=TRUE)) %>%
  filter(Hz > 2.00)

ggplot(data=DATA_GRP_COND_AVG, aes(x=Hz, y=occipital_avg)) +
  geom_rect(aes(xmin=8, xmax=12, ymin=-Inf, ymax=Inf), fill="grey80")+
  geom_line(aes(group=condition, lty=condition)) +
  facet_wrap(~group) +
  scale_x_continuous(name = "Frequency (Hz)") +
  scale_y_continuous(name = "Power (uV^2)") +
  theme_bw()+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "bottom")


# 2. Calculating Mean Alpha ----
head(DATA)

X <- c(seq(1:20))
X
c(ifelse(X < 8, "not alpha", ifelse(X <= 12, "alpha", "not alpha")))

DATA$freq_bin <- factor(ifelse(DATA$Hz < 8, 
                        "below alpha", 
                        ifelse(DATA$Hz <= 12, 
                               "alpha", 
                               "above alpha")))
plot(y=DATA$Hz, x=DATA$freq_bin)


DATA_POWER_BINNED <- DATA %>% select(subID, freq_bin, group, condition, Hz, frontal, 
                central, parietal, occipital) %>%
  group_by(subID, condition, freq_bin) %>%
  summarize(group = group[1],
            frontal = mean(frontal, na.rm=TRUE), 
            central = mean(central, na.rm=TRUE), 
            parietal = mean(parietal, na.rm=TRUE), 
            occipital = mean(occipital, na.rm=TRUE))


DATA_ALPHA_POWER <- DATA_POWER_BINNED %>% filter(freq_bin=="alpha")


# 3. Mixed-Factorial ANOVA of alpha power
summary(DATA_ALPHA_POWER$occipital)
xtabs(~DATA_ALPHA_POWER$condition+DATA_ALPHA_POWER$subID)

ALPHA <- DATA_ALPHA_POWER %>% filter(subID != "oa22" && subID != "oa24")
xtabs(~ALPHA$condition+ALPHA$subID)
xtabs(~ALPHA$condition+ALPHA$group)

?ezANOVA()


ALPHA$ln_occipital <- log(ALPHA$occipital+1)

ezANOVA(
  data = ALPHA
  , dv = ln_occipital
  , wid = subID
  , within = condition
  , between = group 
  , type = 3
  , detailed = TRUE
)


# 4. Plot of Occipital Alpha power by Group
head(ALPHA)

ggplot(data=ALPHA, aes(x=condition, y=log(occipital+1))) +
  geom_line(aes(group = subID, col=group)) +
  geom_point(aes( group = subID, col=group), shape=16)+
  facet_wrap(~group)+
  scale_x_discrete(name = "Condition") +
  scale_y_continuous(name = "Alpha Power (uV^2)") +
  theme_bw()+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "bottom")



ALPHA %>% group_by(group, condition) %>%
  summarize(average = mean(occipital),
            std = sd(occipital),
            med = median(occipital),
            ln_average = mean(ln_occipital),
            ln_std = sd(ln_occipital),
            ln_med = median(ln_occipital),
            count = length(occipital))







