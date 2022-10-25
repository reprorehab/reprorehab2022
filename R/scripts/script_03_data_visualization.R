library(tidyverse) # data formatting and graphing tools


# 3.0. Data Visualization 
setwd("~/GitHub/ReproRehab/")
list.files()
list.files("./data/")

DATA <- read.csv("./data/data_PROCESSED_EEG.csv",
                    header=TRUE, 
                    stringsAsFactors = TRUE)
head(DATA)

# Aggregating the data across all participants:
?dplyr::group_by
DATA %>% select(-X) %>%
  group_by(Hz) %>%
  summarise(frontal_mean=mean(frontal, na.rm = TRUE))


?summarise_at
DAT_GRAND_AVE <- DATA %>% select(-X) %>%
  group_by(Hz) %>%
  summarise_at(vars(frontal:ln_occipital), mean, na.rm = TRUE)

head(DAT_GRAND_AVE)


ggplot(data=DAT_GRAND_AVE, aes(x=Hz, y=frontal)) +
  geom_line(col="black") +
  geom_point(shape=16, col="black") +
  scale_x_continuous(name = "Frequency (Hz)") +
  scale_y_continuous(name = "Power (uV^2)") +
  ggtitle("Frontal Power") +
  theme_bw() +
  theme(axis.text=element_text(size=10, color="black"), 
         legend.text=element_text(size=12, color="black"),
         legend.title=element_text(size=12, face="bold"),
         axis.title=element_text(size=12, face="bold"),
         plot.title=element_text(size=12, face="bold", hjust=0.5),
         panel.grid.minor = element_blank(),
         strip.text = element_text(size=12, face="bold"),
         legend.position = "bottom")


ggplot(data=DAT_GRAND_AVE, aes(x=ln_Hz, y=ln_frontal)) +
  geom_line(col="black") +
  geom_point(shape=16, col="black") +
  scale_x_continuous(name = "Frequency (Hz)") +
  scale_y_continuous(name = "Power (uV^2)") +
  ggtitle("Frontal Power")+
  theme_bw()+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "bottom")


# Plotting all of the regions by transforming the data from long to wide
head(DAT_GRAND_AVE)
DAT_GRAND_AVE_LONG <- DAT_GRAND_AVE %>% select(Hz:occipital) %>%
  pivot_longer(cols=frontal:occipital, names_to = "region", values_to = "power")

head(DAT_GRAND_AVE_LONG)

DAT_GRAND_AVE_LOG <- DAT_GRAND_AVE %>% select(ln_Hz:ln_occipital) %>%
  pivot_longer(cols=ln_frontal:ln_occipital, names_to = "region", values_to = "ln_power")
head(DAT_GRAND_AVE_LOG)


ggplot(data=DAT_GRAND_AVE_LONG, aes(x=Hz, y=power)) +
  geom_line(aes(col=region)) +
  geom_point(aes(col=region), shape=16) +
  scale_x_continuous(name = "Frequency (Hz)") +
  scale_y_continuous(name = "Power (uV^2)") +
  theme_bw()+
    labs(color="Region")+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "bottom")


ggplot(data=DAT_GRAND_AVE_LOG, aes(x=ln_Hz, y=ln_power)) +
  geom_line(aes(col=region)) +
  geom_point(aes(col=region), shape=16) +
  scale_x_continuous(name = "Frequency log(Hz)") +
  scale_y_continuous(name = "Power log(uV^2)") +
  theme_bw()+
  labs(color="Region")+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "bottom")



# Averages within each condition 
head(DATA)
DAT_COND_AVE <- DATA %>% group_by(condition, Hz) %>%
  summarise_at(vars(frontal:ln_occipital), mean, na.rm = TRUE)

head(DAT_COND_AVE)

DAT_COND_LONG <- DAT_COND_AVE %>% select(condition:occipital) %>%
  pivot_longer(cols=frontal:occipital, names_to = "region", values_to = "power")

head(DAT_COND_LONG)

DAT_COND_LONG_LOG <- DAT_COND_AVE %>% select(condition, ln_Hz:ln_occipital) %>%
  pivot_longer(cols=ln_frontal:ln_occipital, names_to = "region", values_to = "ln_power")

head(DAT_COND_LONG_LOG)


ggplot(data=DAT_COND_LONG, aes(x=Hz, y=power)) +
  geom_line(aes(col=region)) +
  geom_point(aes(col=region), shape=16) +
  facet_wrap(~condition)+
  scale_x_continuous(name = "Frequency (Hz)") +
  scale_y_continuous(name = "Power (uV^2)") +
  theme_bw()+
  labs(color="Region")+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "bottom")


ggplot(data=DAT_COND_LONG_LOG, aes(x=ln_Hz, y=ln_power)) +
  geom_line(aes(col=region)) +
  geom_point(aes(col=region), shape=16) +
  facet_wrap(~condition)+
  scale_x_continuous(name = "Frequency log(Hz)") +
  scale_y_continuous(name = "Power log(uV^2)") +
  theme_bw()+
  labs(color="Region")+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "bottom")




# Spaghetti Plots layering individual participant data with aggregate data:
head(DATA)
head(DAT_COND_AVE)

ggplot(data=DATA, aes(x=ln_Hz, y=ln_occipital)) +
  geom_line(aes(group=subID, col=subID), alpha=0.5) +
  facet_wrap(~condition)+
  geom_line(data=DAT_COND_AVE, aes(x=ln_Hz, y=ln_occipital), 
            col="black", lwd=1) +
  scale_x_continuous(name = "Frequency, ln(Hz)") +
  scale_y_continuous(name = "Power,  ln(uV^2)") +
  theme_bw()+
  labs(color="Region")+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "none")



# plot of the differences between EO and EC conditions
head(DATA)
?str_sub
DAT_OCCIP_WIDE <- DATA %>% mutate(group=str_sub(subID, start=1,end=2)) %>%
  select(subID, condition,  group, Hz, occipital, ln_Hz, ln_occipital) %>%
  pivot_wider(names_from=condition, values_from = c(occipital, ln_occipital))

head(DAT_OCCIP_WIDE)

DAT_OCCIP_WIDE$diff_ln_power <- DAT_OCCIP_WIDE$ln_occipital_ec - DAT_OCCIP_WIDE$ln_occipital_eo


ggplot(data=DAT_OCCIP_WIDE, aes(x=ln_Hz, y=diff_ln_power)) +
  geom_line(aes(group=subID, col=subID), alpha=0.5) +
  facet_wrap(~group)+
  geom_line(data=DAT_COND_AVE, aes(x=ln_Hz, y=ln_occipital), 
             col="black", lwd=1) +
  scale_x_continuous(name = "Frequency (Hz)") +
  scale_y_continuous(name = "Power (uV^2)") +
  theme_bw()+
  labs(color="Region")+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "none")

head(DAT_COND_AVE)

# Calculating the group mean differences:
head(DAT_OCCIP_WIDE)

DAT_OCCIP_WIDE_GROUP_AVE <- DAT_OCCIP_WIDE %>% group_by(group, Hz) %>%
  summarize(ln_Hz = ln_Hz[1],
            diff_ln_power=mean(diff_ln_power, na.rm=TRUE))

head(DAT_OCCIP_WIDE_GROUP_AVE)


ggplot(data=DAT_OCCIP_WIDE, aes(x=ln_Hz, y=diff_ln_power)) +
  geom_line(aes(group=subID, col=subID), alpha=0.5) +
  facet_wrap(~group)+
  geom_line(data=DAT_OCCIP_WIDE_GROUP_AVE, 
            aes(x=ln_Hz, y=diff_ln_power), 
             col="black", lwd=1) +
  scale_x_continuous(name = "Frequency, ln(Hz)") +
  scale_y_continuous(name = "Change in Log Power (EC-EO)") +
  theme_bw()+
  labs(color="Region")+
  theme(axis.text=element_text(size=10, color="black"), 
        legend.text=element_text(size=12, color="black"),
        legend.title=element_text(size=12, face="bold"),
        axis.title=element_text(size=12, face="bold"),
        plot.title=element_text(size=12, face="bold", hjust=0.5),
        panel.grid.minor = element_blank(),
        strip.text = element_text(size=12, face="bold"),
        legend.position = "none")

