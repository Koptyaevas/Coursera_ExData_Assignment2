2) Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 

NEI <- readRDS("summarySCC_PM25.rds")

BaltCity <- subset(NEI, NEI$fips == "24510")
BaltData <- aggregate(BaltCity[c("Emissions")], list(year = BaltCity$year), sum)

png('plot2.png', width=480, height=480)
plot(BaltData$year, BaltData$Emissions, type = "l", 
     main = "Total Emissions from PM 2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")

dev.off()
