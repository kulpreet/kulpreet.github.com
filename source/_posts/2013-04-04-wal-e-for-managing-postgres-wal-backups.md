---
layout: post
title: "wal-e for managing postgres WAL backups"
description: "WAL-E"
category: 
tags: [postgres, backups]
---
{% include JB/setup %}

## Pros

1. Smarts built in to find last backup and use that number to delete
older wal segments

1. Really active community

## Con

1. Python and all sorts of other dependencies. I don't like my
postgres.conf having dependencies on libraries that have to be
installed using not so robust package managers like easy_install or
pip. [I do a lot more with Ruby, so Python's package managers still seem alien to me.]

1. [Keep N Backups](https://github.com/heroku/WAL-E/issues/43) still is a todo.

1. Documentation on how to switch from existing S3/WAL backups to
wal-e is not there.


## Switching from an existing setup

I used to do the following

```
psql my_database
pg_start_backup('some label');
pg_stop_backup();
archive_command = '/var/lib/postgresql/8.4/main/s3test %f && s3cmd -c /home/ubuntu/.s3cfg put --acl-private %p s3://pg_archive/%f'
```

In the above s3test is

```
#!/bin/bash
xxx=`s3cmd -c /home/ubuntu/.s3cfg ls s3://pg_archive/$1`
res=`expr "$xxx" : ".*s3://pg_archive/$1$"`
if [[ $res > 0 ]]
then
    exit 1
else
    exit 0
fi
```

The switch is basically a hack, as I haven't found much help on what
is the best way to switch directories.

Should I change the archive_command, restart server and then run the
first backup-push?

Instead, I am running with the following steps

1. Let the old archive_command (as shown above) run as it does.
1. run a wal-r backup-push. This will create a directory called
```basebackups_NNN``` under the s3-prefix path you specify.  1. As
soon as backup-push returns, restart databased to pick up the new
archive_command.

I really recommend someone to find out more about this first. But this
is what I am doing for now.

There has to be a tool that is easier to setup and better
documented. But using wal-e for now.
