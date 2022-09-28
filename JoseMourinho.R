install.packages('ggplot2')
find.package('ggplot2')
install.packages('ggExtra')

LeagueFinishesData <- data.frame(
  TeamOrder = c("1. Porto", "1. Porto", "1. Porto", "2. Chelsea1", "2. Chelsea1",
  "2. Chelsea1", "3. Inter Milan", "3. Inter Milan", "3. Inter Milan",
  "4. Real Madrid", "4. Real Madrid", "4. Real Madrid", "5. Chelsea2", "5. Chelsea2",
  "5. Chelsea2", "6. Man United", "6. Man United", "6. Man United"),
  Team = c("Porto", "Porto", "Porto", "Chelsea1", "Chelsea1",
  "Chelsea1", "Inter Milan", "Inter Milan", "Inter Milan",
  "Real Madrid", "Real Madrid", "Real Madrid", "Chelsea2", "Chelsea2",
  "Chelsea2", "Man United", "Man United", "Man United"),
  Manager = c("1 Previous Manager", "2 Jose Mourinho", "3 Subsequent Manager"),
  AverageLeagueFinish = c(1.50, 1.67, 2.00, 4.50, 1.33, 2.00, 1.50, 1.00, 2.00, 
                          2.00, 1.67, 2.50, 4.50, 2.00, 10.00, 4.500, 4.00, 4.500),
  NumberOfSeasons = c(2, 2, 1, 4, 3, 1, 4, 2, 1, 1, 3, 2, 1, 2, 1, 2, 2, 2),
  NumberOfTrophies = c(1, 5, 2, 0, 6, 0, 7, 5, 2, 0, 3, 4, 1, 2, 0, 1, 3, 0),
  TrophiesPerSeason = c(0.5, 2.5, 2, 0, 2, 0, 1.74, 2.5, 2, 0, 1, 2, 1, 1, 0, 0.5, 1.5, 0)
)

# Average League Finish
ggplot(LeagueFinishesData, aes(x=TeamOrder, y=NumberOfTrophies, fill=Manager)) +
  geom_bar(stat = "identity", position = "dodge") + 
  scale_fill_manual(values = c("azure4", "red", "darkgray"), 
                    labels = c("Previous Manager", "Jose Mourinho", "Subsequent Manager")) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  geom_text(aes(label = TrophiesPerSeason), vjust = -1, position = position_dodge(.9), size = 4) +
  geom_text(aes(label = "per season"), vjust = -0.5, position = position_dodge(.9), size = 2) + 
  ylim(0, 8) +
  labs (
    x = "Soccer Team", 
    y = "Number of Trophies",  
    title = "Number of Trophies Won for Managers", 
    fill = "Manager"
  )

