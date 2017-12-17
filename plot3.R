# Exploratory Data Analysis - Assignment Week 4 - Question #3
# This code makes a plot showing the change in the PM2.5 emissions from 
# the different type of sources in Baltimore City, Maryland, from 1999 to 2008

library(ggplot2)
library(RColorBrewer)

# Load provided datasets that are assumed to be in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Select only data for Baltimore city
PM25Balt <- subset(NEI,fips == "24510")

# Set 4 colors from "Blues" color palette
cols <- brewer.pal(4, "Blues")

# Make barplot with the ggplot plotting system
p <- ggplot(PM25Balt, aes(x=factor(year), y=Emissions,fill=factor(year)))
p + geom_bar(stat="identity") + theme(legend.position='none') + facet_grid(.~type) + labs(x="year", y="PM2.5 Emission (tons)") + labs(title="Total emissions of PM2.5 in Baltimore by Source Type")

# Generate the graph as a png file in the same directory as the source code
ggsave(file="plot3.png")

dev.off()
