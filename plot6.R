6) Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County,
California (fips == "06037"). 
Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# All motor vehicle IDs, includes aircraft & marine vessels
nums <- SCC$SCC[c(542:2288, 4313:4332)]

# Subset to Baltimore city and Los Angeles 
BaltCity <- subset(NEI, NEI$fips == "24510")
LA <- subset(NEI, NEI$fips == "06037")

# Subset all Baltimore & LA emissions, where SCC are in nums
Baltmotor <- subset(BaltCity, BaltCity$SCC %in% nums)
LAmotor <-subset(LA, LA$SCC %in% nums)

# Sum up emissions data
BaltData <- tapply(Baltmotor$Emissions, Baltmotor$year, sum)
LAdata <- tapply(LAmotor$Emissions, LAmotor$year, sum)

# Plot the results with 1-row, 2 cols
png("plot6.png")
par(mfrow = c(1,2))
barplot(BaltData, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Baltimore" ~ PM[2.5] ~ "Vehicle Emissions"), col="blue")
barplot(LAdata, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("LA" ~ PM[2.5] ~ "Vehicle Emissions"), col="red")
dev.off()
