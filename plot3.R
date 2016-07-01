plot3 <- function(){
	file2 <- "Source_Classification_Code.rds"
	file1 <- "summarySCC_PM25.rds"
	library(ggplot2)
	dataset <- readRDS(file1)
	baltimore_dataset <- dataset[dataset$fips == "24510",]
	Emission_sum <- xtabs(Emissions ~year +type, data=baltimore_dataset)
	Emission_sum <- as.data.frame(Emission_sum)
	Emission_sum$year <- as.numeric(Emission_sum$year)
	colnames(Emission_sum)[3] <- "Emission"
	years <- c(1999,2002,2005,2008)
	png("plot3.png", height=480, width=480)
	final_plot <- ggplot(Emission_sum, aes(year,Emission, col=type),  main="Baltimore City") +
		  geom_line() +
		  xlab("Year") +
		  ylab(expression("Total PM"[2.5]*"Emissions")) +
		  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
	print(final_plot)
	dev.off()
		
}