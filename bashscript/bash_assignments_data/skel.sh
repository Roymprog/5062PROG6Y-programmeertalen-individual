# Using only basic redirections it can be hard to combine reading from a file
# with reading from the keyboard. To iterate over the lines of a file while
# still being able to accept input from different sources, we have to set up a
# new input stream. Here, we initialize stream 3 for reading from file FILE.
# Replace FILE by a filename.
exec 3< "persons_small.txt"

# We can now loop over the lines of FILE by reading from stream 3 using a while
# loop. Replace LINEVAR with the name(s) of variables.
while read -r -u 3 LINEVAR; do
	echo $LINEVAR
# Here, we can process LINEVAR while still being able to receive normal input.
done

# Now that we are done with stream 3, close it.
exec 3<&-
