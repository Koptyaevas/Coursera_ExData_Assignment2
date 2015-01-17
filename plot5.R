5) How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# All motor vehicle IDs, includes aircraft & marine vessels
nums <- SCC$SCC[c(542:2288, 4313:4332)]

# Subset for Baltimore City
BaltCity <- subset(NEI, NEI$fips == "24510")

# Subset all Baltimore emissions, where SCC is in nums
motor <- subset(BaltCity, BaltCity$SCC %in% nums)

# Sum up Emissions data
data <- tapply(motor$Emissions, motor$year, sum)

png("plot5.png")
barplot(data, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Baltimore City" ~ PM[2.5] ~ "Vehicle Emissions"), col="blue")
dev.off()
