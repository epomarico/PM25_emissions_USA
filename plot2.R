# Exploratory Data Analysis - Assignment Week 4 - Question #2
# This code makes a plot of the total PM2.5 emissions from all sources in the 
# Baltimore City, Maryland, from 1999 to 2008

library(RColorBrewer)

# Load provided datasets that are assumed to be in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Select only data for Baltimore city
PM25Balt <- subset(NEI,fips == "24510")

# Sum emissions in Baltimore city per year. Provides array of summed values per year
emB_sum_year <- tapply(PM25Balt$Emissions,PM25Balt$year, sum)

# Set 4 colors from "Blues" color palette
cols <- brewer.pal(4, "Blues")

# Generate the png graph in the same directory as the source code
png(filename="plot2.png")

# Make barplot of summed values with the base plotting system
barplot(emB_sum_year, col=cols, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main="Total emissions of PM2.5 in Baltimore")
dev.off()
