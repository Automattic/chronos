kMinuteInSeconds <- 60
kHourInSeconds <- kMinuteInSeconds * 60
kDayInSeconds <- kHourInSeconds * 24

AnalyzeTimeBetweenEvents <- function( file ) {
	# Analyzes the distribution of time between two events in a file
	#
	# Args:
	#   file: The path to a CSV containing two columns, one for the Unix
	#         timestamp of the first event, the second for the Unix timestamp
	#         of the second event. This expects no column headers.
	events <- read.csv( file, header = FALSE,
		col.names = c( "event.a", "event.b" ) )
	seconds <- events$event.b - events$event.a
	PrintQuantileAnalysis( seconds )
	PrintTimeAnalysis( seconds )
}

PrintQuantileAnalysis <- function( seconds ) {
	# Analyzes the quantiles of a vector of seconds
	#
	# Args:
	#   seconds: A vector of seconds
	cat( "\nDistribution:\n" )
	interesting.quantiles <- sort( c( seq( 0.05, 1, 0.05 ), 1 / 3, 2 / 3 ) )
	quantiles <- quantile( seconds, interesting.quantiles, names = TRUE )
	for ( n in 1:length( quantiles ) ) {
		quantile <- names( quantiles )[ n ]
		seconds <- ceiling( unname( quantiles[ n ] ) )
		duration <- SecondsToDuration( seconds )
		cat( quantile, "within", duration, "\n")
	}
}

PrintTimeAnalysis <- function( seconds ) {
	# Analyzes the % who perform the second event within some fixed durations
	#
	# Args:
	#   seconds: A vector of seconds
	cat( "\nPercentage by certain durations:\n")
	interesting.durations.in.seconds <- c(
		kMinuteInSeconds * 30,
		kHourInSeconds,
		kHourInSeconds * 5,
		kDayInSeconds,
		kDayInSeconds * 7 )
	for ( n in 1:length( interesting.durations.in.seconds ) ) {
		duration.in.seconds <- interesting.durations.in.seconds[ n ]
		duration.in.words <- SecondsToDuration( duration.in.seconds )
		events.under.duration <- seconds[ seconds <= duration.in.seconds ]
		probability <- length( events.under.duration ) / length( seconds )
		percentage <- paste( round( probability * 100 ), "%", sep = "" )
		cat( percentage, "within", duration.in.words, "\n" )
	}
}

SecondsToDuration <- function( seconds ) {
	# Converts a quantity of seconds into a human readable duration
	#
	# Args:
	#   seconds: The number of seconds
	#
	# Returns:
	#   A string such as "1 day 5 hours 10 minutes"
	if ( ! seconds ) {
		return( "Immediately" )
	}


	days <- floor( seconds / kDayInSeconds )
	seconds.remaining.in.day <- seconds %% kDayInSeconds
	hours <- floor( seconds.remaining.in.day / kHourInSeconds )
	seconds.remaining.in.hour <- seconds.remaining.in.day %% kHourInSeconds
	minutes <- ceiling( seconds.remaining.in.hour / kMinuteInSeconds )

	parts <- c()
	if ( days ) {
		parts <- c( parts, Pluralize( days, "day" ) )
	}

	if ( hours ) {
		parts <- c( parts, Pluralize( hours, "hour" ) )
	}

	if ( minutes ) {
		parts <- c( parts, Pluralize( minutes, "minute" ) )
	}

	return ( parts )
}

Pluralize <- function( quantity, word ) {
	# Pluralizes a word based on a value
	#
	# Args:
	#   quantity: How many of the things there are
	#   word: The word to pluralize
	#
	# Returns:
	#   The quantity followed by the word with an 's' added to it as necessary
	if ( quantity == 1 ) {
		return ( paste( quantity, word ) )
	}

	pluralized.word <- paste( word, "s", sep = "" )
	paste( quantity, pluralized.word )
}

AnalyzeTimeBetweenEvents( "data/example.csv" )
