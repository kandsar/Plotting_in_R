plot4 <- function(){
	file2 <- "Source_Classification_Code.rds"
	file1 <- "summarySCC_PM25.rds"
	library(ggplot2)
	dataset1 <- readRDS(file1)
	dataset2 <- readRDS(file2)
	dataset <- merge(dataset1, dataset2, by="SCC")
	coal_temp <- grepl("coal", dataset$Short.Name, ignore.case=T)
	dataset <- dataset[coal_temp, ]
	Emission_sum <- tapply(dataset$Emissions, dataset$year, sum)
	years <- c(1999,2002,2005,2008)
	png("plot4.png", height=480, width=480)
	barplot(Emission_sum, col=years, main="Emission due to Coal in USA", xlab="year", ylab="Emission from coal sources from 1999-2008(USA)")
	dev.off()
		
}