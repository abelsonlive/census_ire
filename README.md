## Download 2000 and 2010 Censuses ##

This file contains a couple of helper tools for downloading everything from http://census.ire.org/

1. Download the repo and unzip it.
2. Open your terminal and navigate to the 'census_ire folder' (eg: 'cd Downloads/census_ire')
3. type 'bash scrape.sh' files will output to 'data'
4. run merge.R - files will output to 'states'
5. install mongodb (if on mac os x w/ hombrew, 'brew install mongodb')
6. run 'mongo_dump.sh'
7. expect this to take awhile!

## TODO ##
* vectorize merging function, something thing rbind.fill but for columns t(rbind.fill(t(df1), t(df2)))
* dump into mongodb
