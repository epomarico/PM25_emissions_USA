# Exploratory Data Analysis - Assignment Week 4 - Question #1
# This code makes a plot of the total PM2.5 emissions from all sources in the 
# United States from 1999 to 2008

library(RColorBrewer)

# Load provided datasets that are assumed to be in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum emissions per year. Provides array of summed values per year
em_sum_year <- tapply(NEI$Emissions,NEI$year, sum)

# Set 4 colors from "Blues" color palette
cols <- brewer.pal(4, "Blues")

# Generate the png graph in the same directory as the source code
png(filename="plot1.png")

# Make barplot of summed values with the base plotting system
barplot(em_sum_year, col=cols, xlab = "Year", ylab = "PM2.5 Emissions (tons)",main="Total emissions of PM2.5 in USA")
dev.off()


