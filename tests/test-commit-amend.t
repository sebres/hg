  > pretxncommit.foo = sh -c "echo \"pretxncommit \$HG_NODE\"; hg id -r \$HG_NODE"
  $ hg ci --amend -m 'amend base1'
  pretxncommit 9cd25b479c51be2f4ed2c38e7abdf7ce67d8e0dc
  9cd25b479c51 tip
  diff -r ad120869acf0 -r 9cd25b479c51 a
  changeset:   1:9cd25b479c51
Add new file:
  $ hg ci --amend -Am 'amend base1 new file'
  adding b
  saved backup bundle to $TESTTMP/.hg/strip-backup/9cd25b479c51-amend-backup.hg (glob)
  $ hg ci --amend -m 'amend base1 remove new file'
  saved backup bundle to $TESTTMP/.hg/strip-backup/e2bb3ecffd2f-amend-backup.hg (glob)
  b: no such file in rev 664a9b2d60cd
  amending changeset 664a9b2d60cd
  copying changeset 664a9b2d60cd to ad120869acf0
  stripping amended changeset 664a9b2d60cd
  saved backup bundle to $TESTTMP/.hg/strip-backup/664a9b2d60cd-amend-backup.hg (glob)
  committed changeset 1:ea6e356ff2ad
  diff -r ad120869acf0 -r ea6e356ff2ad a
  changeset:   1:ea6e356ff2ad
  saved backup bundle to $TESTTMP/.hg/strip-backup/ea6e356ff2ad-amend-backup.hg (glob)
  saved backup bundle to $TESTTMP/.hg/strip-backup/377b91ce8b56-amend-backup.hg (glob)
  changeset:   1:2c94e4a5756f
  amending changeset 2c94e4a5756f
  copying changeset 2c94e4a5756f to ad120869acf0
  stripping amended changeset 2c94e4a5756f
  saved backup bundle to $TESTTMP/.hg/strip-backup/2c94e4a5756f-amend-backup.hg (glob)
  committed changeset 1:ffb49186f961
  amending changeset ffb49186f961
  copying changeset 27f3aacd3011 to ad120869acf0
  a
  stripping intermediate changeset 27f3aacd3011
  stripping amended changeset ffb49186f961
  saved backup bundle to $TESTTMP/.hg/strip-backup/ffb49186f961-amend-backup.hg (glob)
  committed changeset 1:fb6cca43446f
  changeset:   1:fb6cca43446f
  saved backup bundle to $TESTTMP/.hg/strip-backup/fb6cca43446f-amend-backup.hg (glob)
     book1                     1:0cf1c7a51bcf
   * book2                     1:0cf1c7a51bcf
  saved backup bundle to $TESTTMP/.hg/strip-backup/0cf1c7a51bcf-amend-backup.hg (glob)
     book1                     1:7344472bd951
   * book2                     1:7344472bd951
  saved backup bundle to $TESTTMP/.hg/strip-backup/1661ca36a2db-amend-backup.hg (glob)
  default                        2:f24ee5961967
  saved backup bundle to $TESTTMP/.hg/strip-backup/5e302dcc12b8-amend-backup.hg (glob)
  default                        2:f24ee5961967
Refuse to amend merges:
  $ hg ci --amend
  abort: cannot amend merge changesets
  [255]
  saved backup bundle to $TESTTMP/.hg/strip-backup/9c207120aa98-amend-backup.hg (glob)
  saved backup bundle to $TESTTMP/.hg/strip-backup/fda2b3b27b22-amend-backup.hg (glob)
  saved backup bundle to $TESTTMP/.hg/strip-backup/20a7413547f9-amend-backup.hg (glob)
  saved backup bundle to $TESTTMP/.hg/strip-backup/5daa77a5d616-amend-backup.hg (glob)
  saved backup bundle to $TESTTMP/.hg/strip-backup/167f8e3031df-amend-backup.hg (glob)
  saved backup bundle to $TESTTMP/.hg/strip-backup/ceac1a44c806-amend-backup.hg (glob)
  saved backup bundle to $TESTTMP/.hg/strip-backup/18a5124daf7a-amend-backup.hg (glob)