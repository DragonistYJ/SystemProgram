#########################################
# Globals specific to test cases
#########################################

@optional = ("Global List");
$numtestcases = 8;
@testcasetopic = ("Memory Leak", "Footer Payload Overflow", "Footer Payload Overflow", "Memory Leak", "Freeing Unallocated Block", "Header Overwrite", "Freeing Unallocated Block", "Global List");
@testcaseweight = (0.10, 0.15, 0.15, 0.15, 0.15, 0.15, 0.15, 0);

# Weights for error, filename/linenum, and correct error message
@individualweight[0] = [1, 0, 0];
@individualweight[1] = [.4, .2, .4];
@individualweight[2] = [.4, .2, .4];
@individualweight[3] = [1, 0, 0]; # possible extra
@individualweight[4] = [1, 0, 0]; # possible extra
@individualweight[5] = [.6, 0, .4];
@individualweight[6] = [1, 0, 0]; # possible extra
@individualweight[7] = [.6, .2, .2];


@iserror = (0, 1, 1, 0, 1, 1, 1, 1); # only really needed for first set
@checkstrings0 = ("Size: 0", "", "", "Size: 6", "", "", "", "Caught errors");

# to check for correct filename/line number
$drivername = "driver.c";
@checkstrings1line1 = ("", "line 21", "line 28", "", "line 43", "line 47", "line 54", "line 59");
@checkstrings1line2 = ("", "line 23", "line 30", "", "", "line 49", "");

# to check for correct error
@checkstrings2a = ("", "Ending edge of the payload has been overwritten.", "Ending edge of the payload has been overwritten.", "line 34", "Attempting to free an unallocated block.", "Starting edge of the payload has been overwritten.", "Attempting to free an unallocated block.", "Ending edge of the payload has been overwritten.");
@checkstrings2b = ("", "", "", "", "", "Header has been corrupted.", "");


#################################

$numcriteria = 4;
@criteria = ("Error Recognition", "Best Error Message", "Filename/Line Number", "Memory Leak Analysis (Bonus)");


#################################
# Grader program
#################################

for($i = 0; $i < $numcriteria; $i++) {
	$criteriagrade[$i] = 0;
	$criteriamax[$i] = 0;
}

foreach $topic (@testcasetopic) {
	$topicgrade{$topic} = 0;
	$topicmax{$topic} = 0;
}

for($i = 0; $i < $numtestcases; $i++) {
	$testcasegrade[$i] = 0;
}

print("\nTest #\t\tError?\tLocation\tReason\n");
for ($i = 1; $i <= $numtestcases; $i++) {
	$topic = $testcasetopic[$i - 1];
	$bonus = 0;
	print("$i (", int($testcaseweight[$i - 1] * 1000 + 0.5) / 10, "%");
	if (grep {$topic eq $_} @optional) {
		$bonus = 1;
		print(" Bonus");
	}
	print("):\t");
	$output = `debugmalloc -t $i`;
	
	if ($output =~ /Error:/i) {
		$result = ($iserror[$i - 1] == 1)?1:0;
	}
	else {
		$result = ($iserror[$i - 1] == 0)?1:0;
	}
	if ($result == 1) {
		$match = $checkstrings0[$i - 1];
		if ($match ne "") {
			$result = ($output =~ /$match/i)?1:0;
		}
	}
	$criteriagrade[0] += $result * $testcaseweight[$i - 1] * $individualweight[$i-1][0];
	$criteriamax[0] += $bonus?0:($testcaseweight[$i - 1] * $individualweight[$i-1][0]);

	$topicgrade{$topic} += $result;
	$topicmax{$topic} += $bonus?0:1;
	
	$testcasegrade[$i - 1] += $result * $individualweight[$i-1][0];
	print("$result\t");
	
	
	# Check for correct filename/line number
	$match1 = $checkstrings1line1[$i - 1];
	$match2 = $checkstrings1line2[$i - 1];
	if ($match1 ne "") {
		$result = 0;
		if ($output =~ /$match1/i) {
			$result += ($output =~ /$drivername/i)?1:0;
		}
		if ($match2 ne "") {
			if ($output =~ /$match2/i) {
				$result += ($output =~ /$drivername/i)?1:0;
			}
			$result *= 0.5;
		}
		print("$result\t");
		$criteriagrade[2] += $result * $testcaseweight[$i - 1] * $individualweight[$i-1][1];
		$criteriamax[2] += $bonus?0:($testcaseweight[$i - 1] * $individualweight[$i-1][1]);
		$topicgrade{$topic} += $result;
		$topicmax{$topic} += $bonus?0:1;
		$testcasegrade[$i - 1] += $result * $individualweight[$i-1][1];
	}
	else {
		print(".\t");
	}
	
	# Check for correct reason for error
	$match1 = $checkstrings2a[$i - 1];
	$match2 = $checkstrings2b[$i - 1];
	if ($match1 ne "") {
		$result = ($output =~ /$match1/i)?1:0;
		if ($result == 0 && $match2 ne "") {
			$result = ($output =~ /$match2/i)?1:0;
		}
		print("\t$result\t");
		if ($topic eq "Memory Leak") {
			$criteriagrade[3] += $result * $testcaseweight[$i - 1] * $individualweight[$i-1][2];
			$criteriamax[3] += $bonus?0:($testcaseweight[$i - 1] * $individualweight[$i-1][2]);
		}
		else {
			$criteriagrade[1] += $result * $testcaseweight[$i - 1] * $individualweight[$i-1][2];
			$criteriamax[1] += $bonus?0:($testcaseweight[$i - 1] * $individualweight[$i-1][2]);
		}
		$topicgrade{$topic} += $result;
		$topicmax{$topic} += $bonus?0:1;
		$testcasegrade[$i - 1] += $result * $individualweight[$i-1][2];
	}
	else {
		print("\t.\t");
	}
	
	print("\n");
}

print("------------\n");

# Print out results by topic

foreach $topic (keys(%topicgrade)) {
	print("$topic: \t$topicgrade{$topic}/$topicmax{$topic}\n");
}

print("------------\n");

# Print out results by criteria

for ($i = 0; $i < $numcriteria; $i++) {
	if ($criteriamax[$i] != 0) {
		$currgrade = $criteriagrade[$i]/$criteriamax[$i];
		$currgrade = int($currgrade * 1000 + .5) / 10;
		print("$criteria[$i]: \t", $currgrade, "%\n");
	}
	else {
		print("$criteria[$i]: \t N/A\n");
	}
}

print("------------\n");

$totalgrade = 0;
for($i = 0; $i < $numtestcases; $i++) {
	$totalgrade += $testcasegrade[$i] * $testcaseweight[$i];
}

$totalgrade  = int($totalgrade * 1000 + .5) / 10;
print("Total: $totalgrade%\n\n");

