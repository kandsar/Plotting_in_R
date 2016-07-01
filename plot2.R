plot2 <- function(){
	file2 <- "Source_Classification_Code.rds"
	file1 <- "summarySCC_PM25.rds"
	dataset <- readRDS(file1)
	baltimore_dataset <- dataset[dataset$fips == "24510",]
	Emission_sum <- tapply(baltimore_dataset$Emissions, baltimore_dataset$year, sum)
	years <- c(1999,2002,2005,2008)
	png("plot2.png", height=480, width=480)
	barplot(Emission_sum, col=years, main="Baltimore City")
	dev.off()	
}