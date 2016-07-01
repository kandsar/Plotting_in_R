plot6 <- function(){
	file2 <- "Source_Classification_Code.rds"
	file1 <- "summarySCC_PM25.rds"
	library(ggplot2)
	dataset1 <- readRDS(file1)
	dataset2 <- readRDS(file2)
	dataset <- merge(dataset1, dataset2, by="SCC")
	dataset_BA <- dataset[dataset$fips == "24510",]
	dataset_LA <- dataset[dataset$fips == "06037",]
	road_temp_BA <- grepl("ON-ROAD", dataset_BA$type, ignore.case=T)
	road_temp_LA <- grepl("ON-ROAD", dataset_LA$type, ignore.case=T)
	dataset_BA <- dataset_BA[road_temp_BA, ]
	dataset_LA <- dataset_LA[road_temp_LA, ]
	Emission_sum_BA <- tapply(dataset_BA$Emissions, dataset_BA$year, sum)
	Emission_sum_LA <- tapply(dataset_LA$Emissions, dataset_LA$year, sum)
	years <- c(1999,2002,2005,2008)
	png("plot6.png", height=600, width=600)
	par(mfrow=c(1,2))
	barplot(Emission_sum_BA, col=years, main="Emission of motor vehicles in Baltimore", xlab="year", ylab="Emission", ylim=c(0,12000))
	barplot(Emission_sum_LA, col=years, main="Emission of motor vehicles in LA", xlab="year", ylab="Emission", ylim=c(0,12000))
	dev.off()
		
}