# csv-curl

Utility for making multiple curl requests using a CSV file.

### Usage
```
Usage: csv-curl[OPTIONS] [CURL OPTIONS]
        --template FILE              Path to the template file
        --csv CSV_FILE               Path to the CSV file
        --exec UTILITY               Utility to run on each response
```

### Template

File containing the payload to pass to the curl command, the "-d@<file>" option.

### CSV File

A CSV file containing the replacement values to use.  It must have a header.  And have a header for all replacement values.

### Utility

This is an additional command to run on the response body from the curl command.

Example to output only the "id" from a JSON body

```
csv-curl --csv emails.csv 'https://example.com/user_lookup?email={{param:email}}' --exec 'jq ".id" -r'
```

### Replacement variables

A replacement variable is enclosed in handlebars *{{* *format:* *name* *}}*.

*name* matches a header in the CSV file
*format* escape sequence to apply the the replacement value

