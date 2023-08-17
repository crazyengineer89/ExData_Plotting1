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

# Create Plot 1 - Global Active Power

png("plot1.png", width = 480, height = 480)
hist(as.numeric(relevant_subset$Global_active_power), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
