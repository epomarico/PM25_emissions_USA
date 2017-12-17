# Exploratory Data Analysis - Assignment Week 4 - Question #6
# This code makes a plot comparing emissions from motor vehicle sources in Baltimore
# City with emissions from motor vehicle sources in Los Angeles County

library(ggplot2)
library(RColorBrewer)

# Load provided datasets that are assumed to be in the working directory
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Select only SCC codes associated to motor vehicle sources
vehicle_sources <- SCC[grepl("[Vv]eh",SCC$Short.Name),]

# Select only data for Baltimore and Los Angeles city
PM25Balt_LA <- subset(NEI,fips == "24510" | fips == "06037")

# Select only data from Baltimore and LA dataset associated to vehicle sources
Balt_LA_vehicle <- PM25Balt_LA[PM25Balt_LA$SCC %in% vehicle_sources$SCC,]

# Change fips codes into readable strings 
Balt_LA_vehicle$fips[Balt_LA_vehicle$fips=="24510"] <- "Baltimore, MD"
Balt_LA_vehicle$fips[Balt_LA_vehicle$fips=="06037"] <- "Los Angeles, CA"

# Make barplot with the ggplot plotting system
p <- ggplot(Balt_LA_vehicle, aes(x=factor(year), y=Emissions, fill=factor(fips)))
p + geom_bar(stat="identity") + labs(x="year", y="PM2.5 Emission (tons)") + labs(title="Total emissions of PM2.5 in Baltimore and Los Angeles") + theme(legend.position='none') + facet_grid(. ~ fips)  


# Generate the graph as a png file in the same directory as the source code
ggsave(file="plot6.png")

dev.off()



