# Exploratory Data Analysis - Assignment Week 4 - Question #5
# This code makes a plot of the total PM2.5 emissions from from motor 
# vehicle sources in the Baltimore city from 1999 to 2008

library(RColorBrewer)

# Load provided datasets that are assumed to be in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Select only SCC codes associated to motor vehicle sources
vehicle_sources <- SCC[grepl("[Vv]eh",SCC$Short.Name),]

# Select only data for Baltimore city
PM25Balt <- subset(NEI,fips == "24510")

# Select only data from Baltimore dataset associated to vehicle sources
Balt_vehicle <- PM25Balt[PM25Balt$SCC %in% vehicle_sources$SCC,]

# Sum emissions in Baltimore city per year associated to vehicle sources. Provides array of summed values per year
Balt_vehicle_sum_year <- tapply(Balt_vehicle$Emissions,Balt_vehicle$year, sum)

# Set 4 colors from "Blues" color palette
cols <- brewer.pal(4, "Blues")

# Generate the png graph in the same directory as the source code
png(filename="plot5.png")

# Make barplot of summed values with the base plotting system
barplot(Balt_vehicle_sum_year, col=cols, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main="Total emissions of PM2.5 from vehicle sources in Baltimore")
dev.off()