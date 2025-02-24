JSON_DIR="./ebay_data"
SCRIPT_PATH="./TaskC.py"
ITEM_TB="./Item.dat"
PERSON_TB="./Person.dat"
CATEGORY_TB="./Category.dat"
BIDS_TB="./Bids.dat"

rm -f $ITEM_TB
rm -f $PERSON_TB
rm -f $CATEGORY_TB
rm -f $BIDS_TB

python3 TaskC.py ebay_data/items-*.json

# Sort the files and remove duplicates in a single step
sort -u $CATEGORY_TB -o $CATEGORY_TB
sort -u $ITEM_TB -o $ITEM_TB
sort -u $BIDS_TB -o $BIDS_TB
sort -u $PERSON_TB -o $PERSON_TB

sqlite3 ebay_data.db < create.sql
sqlite3 ebay_data.db < load.txt
sqlite3 ebay_data.db < query1.sql
