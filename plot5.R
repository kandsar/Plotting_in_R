plot5 <- function(){
	file2 <- "Source_Classification_Code.rds"
	file1 <- "summarySCC_PM25.rds"
	library(ggplot2)
	dataset1 <- readRDS(file1)
	dataset2 <- readRDS(file2)
	dataset <- merge(dataset1, dataset2, by="SCC")
	dataset <- dataset[dataset$fips == "24510",]
	road_temp <- grepl("ON-ROAD", dataset$type, ignore.case=T)
	dataset <- dataset[road_temp, ]
	Emission_sum <- tapply(dataset$Emissions, dataset$year, sum)
	years <- c(1999,2002,2005,2008)
	png("plot5.png", height=480, width=480)
	barplot(Emission_sum, col=years, main="Emission due to motor vehicles in USA", xlab="year", ylab="Emission")
	dev.off()
		
}