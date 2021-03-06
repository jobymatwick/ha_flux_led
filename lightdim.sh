#!/bin/bash

# Sleep for 1 second because some hue control devices set the color then the brightness. 
# If this script is called too soon after the color is changed, 
# it will set to the new brightness of the old color
sleep 0.5

# Get current status
TESTVAR=$(python3 -m flux_led -i $1)
TEST2=$(awk -F"(" '{print $2}' <<< $TESTVAR)
TEST3=$(awk -F")" '{print $1}' <<< $TEST2)

# Strip out R G and B values
RED=$(awk -F", " '{print $1}' <<< $TEST3)
GRN=$(awk -F", " '{print $2}' <<< $TEST3)
BLU=$(awk -F", " '{print $3}' <<< $TEST3)

# Find what 100% would be
MAX=$RED
if [ $GRN -ge $MAX ]; then
	MAX=$GRN
elif [ $BLU -ge $MAX ]; then
	MAX=$BLU
fi

REDMAX=$(echo "( 255 / $MAX ) * $RED" | bc -l)
GRNMAX=$(echo "( 255 / $MAX ) * $GRN" | bc -l)
BLUMAX=$(echo "( 255 / $MAX ) * $BLU" | bc -l)

# Scale to new brightness
RED=$(echo "$REDMAX * $2" | bc -l)
GRN=$(echo "$GRNMAX * $2" | bc -l)
BLU=$(echo "$BLUMAX * $2" | bc -l)

# Round away decimals
REDROUND=$(echo $RED | awk '{printf("%d\n",$1 + 0.5)}')
GRNROUND=$(echo $GRN | awk '{printf("%d\n",$1 + 0.5)}')
BLUROUND=$(echo $BLU | awk '{printf("%d\n",$1 + 0.5)}')

# Set brightness
python3 -m flux_led $1 -c $REDROUND,$GRNROUND,$BLUROUND
