# pyspark_nlp
NLP analysis on social media (reddit, twitter) posts and comments using PySpark

## use bfg-cleaner to clean up the files 
BFG-cleaner helps clean up the token just in case you accidentially include in the previous commits

```
mac brew install bfg
git clone --mirror git@github.com:jchenhsch/pyspark_nlp.git
cd pyspark_nlp.git
bfg -D auth_git_repo.git
git reflog expire --expire=now --all && git gc --prune=now --aggressive
git push
# help to clone the repo in case using the JupyterLab in the cluster
# when cloning, need to clone in the Local Disk, GCS folder not working

```
## code directory

### load code 
load and scrape the Youtube data based on the keywords

### model train code
train/ cross_validate / debug for multilabel SVM models (reddit data) using spark.mlib 

### visualization code
EDA for the reddit/ youtube datasets
