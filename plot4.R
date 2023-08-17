setwd("C:/Users/liseth/OneDrive - IV Group/Schulungsunterlagen/Data Science Specialization/04 Exploratory Data Analysis/C4_CodeFiles/exdata_data_household_power_consumption")
rm(list = ls())

filename <- "household_power_consumption.txt"
raw_data <- read.delim(filename, header = TRUE, sep = ";", na.strings = "?")

# Convert the "Date" column to a date class using as.Date()
raw_data$Date <- as.Date(raw_data$Date, format = "%d/%m/%Y")

# Convert the "Time" column to a time class using strptime()
raw_data$Time <- strptime(raw_data$Time, format = "%H:%M:%S")

# Create a subset of the dataset for the specified date range
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")
relevant_subset <- raw_data[raw_data$Date >= start_date & raw_data$Date <= end_date, ]


#Create and save Plot 4 - Combined plot
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
with(relevant_subset,{
        plot(relevant_subset$Global_active_power, type = "l", col = "black",
             xlab = c("Thu", "Fri", "Sat"), ylab = "Global Active Power (kilowatts)")
        plot(relevant_subset$Sub_metering_1, col="black", type = "l", ylab = "Energy sub metering")
        with(relevant_subset, points(relevant_subset$Sub_metering_2, col = "red", type = "l"))
        with(relevant_subset, points(relevant_subset$Sub_metering_3, col = "blue", type = "l"))
        legend("topright", pch = "-", col = c("black", "red", "blue"), bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(relevant_subset$Voltage, type = "l", col="black", xlab = "datetime", ylab = "")
        plot(relevant_subset$Global_reactive_power, type = "l", col="black", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()