#!/bin/bash

# 
#	Roy van Santen	-	6081282
#	This program parses persons from a text file into XML format.
#	Individual entries are separated by a "|" character and person's properties
#	are all identical and all present, and separated by a "/" character 
#

# Enable additional globbing pattern options
shopt -s extglob

# Remove leading whitespace in global "key" and "value" variables
function trim_leading_whitespace() {
	key=${key##+([[:space:]])}
	value=${value##+([[:space:]])}
}

# Remove trailing whitespace in global "key" and "value" variables
function trim_trailing_whitespace() {
	key=${key%%+([[:space:]])}
	value=${value%%+([[:space:]])}
}

# Replace all redundant whitespace between words in global 
# "property" and "value" variables. Replace all occurring whitespace
# in global "key" variable with underscores
function replace_internal_whitespace() {
	key=${key//+([[:space:]])/_}
	property=${property//+([[:space:]])/' '}
	value=${value//+([[:space:]])/' '}
}

# Remove internal newlines in global "property" variable
function remove_property_newlines() {
	property=${property//$'\n'/}
}

# Print file header and persons opening tag to output
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
echo "<persons>"

# Read till end of file and continue when line is parsed into emtpy string
while read -r -d '|' person || [[ -n "$person"  ]]; do
	while read -r -d '/' property || [[ -n "$property"  ]]; do
		remove_property_newlines
		if [[ $property == *":"* ]]; then
			IFS=':'
			read -r key value <<< $property
			trim_leading_whitespace
			trim_trailing_whitespace
			replace_internal_whitespace
			echo "    <$key>$value</$key>"
			unset IFS
		else
			replace_internal_whitespace
			echo "  <person name=\"$property\">"
		fi
	done <<< $person
	echo "  </person>"
done

echo "</persons>"