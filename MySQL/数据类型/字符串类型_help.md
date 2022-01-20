* The length of a CHAR column is fixed to the length that you declare when you create the table. The length can be any
  value from 0 to 255.
* Values in VARCHAR columns are variable-length strings. The length can be specified as a value from 0 to 65,535.
* In contrast to CHAR, VARCHAR values are stored as a 1-byte or 2-byte length prefix plus data. The length prefix
  indicates the number of bytes in the value. A column uses one length byte if values require no more than 255 bytes,
  two length bytes if values may require more than 255 bytes.

### The following table illustrates the differences between CHAR and VARCHAR by showing the result of storing various string values into CHAR(4) and VARCHAR(4) columns

| Value        | `CHAR(4)` | Storage Required | `VARCHAR(4)` | Storage Required |
|--------------|-----------|------------------|--------------|------------------|
| `''`         | `'  '`    | 4 bytes          | `''`         | 1 byte           |
| `'ab'`       | `'ab '`   | 4 bytes          | `'ab'`       | 3 bytes          |
| `'abcd'`     | `'abcd'`  | 4 bytes          | `'abcd'`     | 5 bytes          |
| `'abcdefgh'` | `'abcd'`  | 4 bytes          | `'abcd'`     | 5 bytes          |