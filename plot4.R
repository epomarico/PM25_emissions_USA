# Exploratory Data Analysis - Assignment Week 4 - Question #4
# This code makes a plot of the total PM2.5 emissions from coal 
# combustion-related sources in the USA from 1999 to 2008

library(RColorBrewer)

# Load provided datasets that are assumed to be in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Select only SCC codes associated to coal combusiton-related sources
coal_sources <- SCC[grepl("Coal",SCC$Short.Name),]

# Select only data from data set NEI associated to coal combusiton-related sources
sel_NEI <- NEI[NEI$SCC %in% coal_sources$SCC,]

# Sum emissions in the USA associated to coal combusiton-related sources. Provides array of summed values per year
sel_NEI_sum_year <- tapply(sel_NEI$Emissions,sel_NEI$year, sum)
# Set 4 colors from "Blues" color palette
cols <- brewer.pal(4, "Blues")

# Generate the png graph in the same directory as the source code
png(filename="plot4.png")

# Generate the png graph in the same directory as the source code
barplot(sel_NEI_sum_year, col=cols, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main="Total emissions of PM2.5 from coal sources in USA")
dev.off()