## Project 2 First question
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
#SumSCC <- readRDS("summarySCC_PM25.rds")

# subset the data for the specific years
NEI_Subset <- NEI[NEI$year %in% c(1999,2002,2005,2008),]

# summarize the data
cdata <- ddply(NEI_Subset, c("year"), summarise, N    = sum(Emissions))

#open the output file
png('proj_2_rplot1.png', width = 480, height = 480)

#plot the data
plot(cdata$year,cdata$N,type="l",xlab="Year", ylab="Total Emissions in tons",xaxt="n")
axis(1,at=cdata$year)
title(main="Did total emissions from PM2.5 decreased in the United States")

# reset the device
dev.off()

