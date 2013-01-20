---
layout: post
title: "Game Intelligence"
date: 2013-01-20 16:07
comments: true
categories: [game development, analytics, business intelligence]
---

In this post I argue for the need for an open source analytics engine
for use in games and any other gamified (or just a regular web
application).

## Why not just use Google Analytics (or any such analytics)

1. Only tracks front end events, like page loads and clicks. Does a
fantastic job of handling country, browser etc. We need to able to
track back end events, creating equivalent front end events for google
analytics might be too much?

1. Can't really be used as a business intelligence tool. For example,
we can't answer the question, "How many users have reached level 10"
or even a more complex question to answer "What percentage of users
have reached level 10 - split by the week number they joined our
system."

The latter is what is called
[Cohort Analysis](http://jonathonbalogh.com/2012/03/24/introduction-to-cohort-analysis-for-startups/)
and Google Analytics tools and other 'web analytics' tools (for
example [Piwik](http://piwik.org/)) don't help us do cohort analysis.

## Open Source Cohort Analysis

So the next question is what is on offer for a self hosted free, open
source cohort analysis tool that we can use. I really can't find
anything useful out there. The closest I came to was
[aarrr](https://github.com/railsjedi/aarrr) a Ruby library backed by
MongoDB to track cohorts.

It seems a lot of people build their own little tools for such
analysis. Could it be cause 

1. Describing cohorts and tracking activity along cohorts can result
in a lot of data replication, so no one is releasing a framework, or

1. Most of the analysis is carried out in an Business Intelligence
[ETL](http://en.wikipedia.org/wiki/Extract,_transform,_load) manner.

## So Why Not an ETL Business Intelligence Tool?

1. Not open source and can be pretty expensive

1. Mostly written in Java, and have a painful learning curve,
especially the wysiwg query editors. The whole thing stinks of
'enterprise' I must say.

1. ETL might not be flexible and dynamic enough. With databases like
mongodb, we don't need to run cron jobs hogging the database to return
analytics results. Instead, we can try and set up a small db to
collect events from the backend as users/players hit certain
landmarks.

## MongoDB and Analytics

A lot has been written on how Mongo can be used to aggregate analytics
data. The difference is very clear, no more ETL, just simple '*pings*'
to mongodb to track analytics. Late the aggregated results can be
shown using any of the freely available graphing libraries - google
charts or rgraph come to mind.
