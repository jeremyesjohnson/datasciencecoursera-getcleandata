---
title: "README.md"
author: "Jeremy S. Johnson"
date: "Saturday, December 20, 2014"
output: html_document
---

### Usage: 

```
> source("run_analysis.R")
> run()
```

### Input:

"Human Activity Recognition Using Smartphones Data Set" from www.smartlab.ws.

https://www.dropbox.com/s/u7jq5twvohyhac4/UCI%20HAR%20Dataset.zip

### Output:

./tinydata.txt in the following format:

```
"activity","subject","tBodyAcc-mean()-X", ...
"LAYING",10,0.276977089565657,...
"LAYING",12,0.27360872421875,...
"LAYING",13,0.275895876198777,...
```

### Assumptions:

Your working directory is "UCI HAR Dataset" and "run_analysis.R" is in your
working directory.