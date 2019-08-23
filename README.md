# csv-curl

Utility for making multiple curl requests using a CSV file.

### Install

```
gem install csv-curl
```

### Usage
```
Usage: csv-curl [OPTIONS] [CURL OPTIONS]
        --template FILE              Path to the template file
        --csv CSV_FILE               Path to the CSV file
        --exec UTILITY               Utility to run on each response
```

### Template

File containing the payload to pass to the curl command, the "-d@<file>" option.

### CSV File

A CSV file containing the replacement values to use.  It must have a header.  And have a header for all replacement variables.

### Utility

This is an additional command to run on the response body from the curl command.

Example to output only the "id" from a JSON body

```
csv-curl --csv emails.csv 'https://example.com/user_lookup?email={{param:email}}' --exec 'jq ".id" -r'
```

### Replacement variables

A replacement variable is enclosed in handlebars **{{** **format:** **name** **}}**.  Replacement variables can be used in the arguments to curl, in the template and in the utility.

*(format and name a separated by a colon)*

- **name** matches a header in the CSV file
- **format** escape sequence to apply the the replacement value
    - _json_ JSON encode
    - _param_ URL encode
    - _base64_ Base64 encode
    - _urlsafe64_ URL safe Base64 encode
    - _hex_ Hex encode
    - _shell_ Shell encode

Example: lookup users by email and save response by user id.

```
csv-curl --csv users.csv 'https://example.com/user_lookup?email={{param:email}}' --exec 'cat > {{id}}.json'

# users.csv
id,email
5,bob@example.com
8,johndoe@example.com
```
