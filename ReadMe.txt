This folder contains R codes and png files exploring the National Emissions Inventory database to investigate the fine particulate matter pollution in the United states over the 10-year period 1999–2008. This work corresponds to the assignment for the Week 4 of th Exploratory Data Analysis course in Coursera.

The data can be downloaded from
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

The zip file contains two files:
- PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. 
- Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

The following 6 questions are addressed and corresponding plots produced.

1) Have total emissions from PM_{2.5} decreased in the United States from 1999 to 2008? (plot1.png)
2) Have total emissions from PM_{2.5} decreased in the Baltimore City, Maryland from 1999 to 2008? (plot2.png)
3) Of the four types of sources indicated by the =type= (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? (plot3.png)
4) Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008? (plot4.png)
5) How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? (plot5.png)
6) Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California. Which city has seen greater changes over time in motor vehicle emissions? (plot6.png)
