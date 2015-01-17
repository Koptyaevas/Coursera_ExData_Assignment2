1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

NEI <- readRDS("summarySCC_PM25.rds")
data <- tapply(NEI$Emissions, NEI$year, sum) #apply a function over subsets of a vector 

png("plot1.png")
barplot(data, xlab = "Year", ylab=expression(~ PM[2.5] ~ "Emissions (tons)"), 
        main=expression("Total US"~ PM[2.5] ~ "Emissions by Year"), col="blue")
dev.off()
