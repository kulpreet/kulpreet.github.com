---
layout: post
title: "Dropbox API, a SCRUM Taskboard, and offline application framework?"
date: 2013-01-20 16:17
comments: true
categories: [Dropbox, offline-apps]
---

## Offline Apps and Sharing Data

What about having an offline application that saves your data using
offline storage, but synchs to a server that allows the same 'offline
storage' to be editted by two more users.

The idea is simple.

1. Load an app from a service that stores and serves files - S3?
Dropbox? Anything you fancy. That is where you get the 'app' from.

1. The App is essentially a HTML/JS page that allows you to create and
edit data.

1. The app saves your data in local offline storage - which seems to
have a (limit of 5MB)[http://diveintohtml5.info/storage.html]. So of
course such offline apps will only work for apps that keep data
consumption to less than 5MB.

1. Finally on issuing a 'sync' command that offline storage is saved
back on to a file server. It could be S3, Dropbox or a plain simple
FTP server.

1. Security will be an issue as credentials for ftp, or s3 will have
to be saved in plain text in the application page.

### Dropbox Apps to the rescue

I think the folks are Dropbox are really up to something. 

While looking around what the current state of the art is on such an
approach to building offline applications, I found that Dropbox team
has been busily building away something that just works marvelously
well. They call them apps (Dropbox Apps)[https://www.dropbox.com/developers/start].

Using the Dropbox Core API from their Javascript client library
everything seems so simple and straight forward.

#### No offline storage

You even start to wonder if you need to use the offline storage at
all. Just update the dropbox files and let the dropbox daemon synch
them up with your team.

#### Locks

I do think it'll be cool to use a lock file so that multiple user's
can't edit the app at the same time. If we really need that then we
need to start thinking merging and probably using Git JS libs to do
the synching. All to complicated for people who are simply interested
in say a SCRUM taskboard.

Having a start editting -> edit -> save semantics will enable us to
check for lock file, and if two people do manage to get locks then the
one with the earlier version wins. Dropbox core api lets us get the
versions and timestamps for files.

### Current State of the Art

A few people have tried and it seems quite an active area. 

(Unhosted)[https://unhosted.org/] have been working on providing just
these kinds of 'offline' applications.

(RemoteStorage)[http://remotestorage.io/] lets anyone run a remote
storage server which they provide (client
apis)[http://remotestoragejs.com/doc/code/files/remoteStorage-js.html]
to talk to from JS applications.

Definitely working keeping an eye on them.
