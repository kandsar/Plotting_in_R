plot1 <- function(){
	file2 <- "Source_Classification_Code.rds"
	file1 <- "summarySCC_PM25.rds"
	dataset <- readRDS(file1)
	Emission_sum <- tapply(dataset$Emissions, dataset$year, sum)
	years <- c(1999,2002,2005,2008)
	png("plot1.png", height=480, width=480)
	barplot(Emission_sum, col=years)
	dev.off()	
}