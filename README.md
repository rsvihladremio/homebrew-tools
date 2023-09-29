# homebrew-tools

Provides a series of support focused tooling

## Quick Start

    brew tap rsvihladremio/tools

## Dremio Diagnostic Collector

Provides the ability to easily collect logs and diagnostics from Dremio [ddc repo](https://github.com/dremio/dremio-diagnostic-collector)

    brew install ddc

## Dremio Stress

Provides a good method for beating up Dremio with some load or to simulate given workloads [dremio-stress repo](https://github.com/rsvihladremio/dremio-stress)

    brew install dremio-stress

## Dremio Batch Execute

Want to run a bunch of queries in order against a server. Say set all those 2000 permissions for new roles? Replicate an environment on other clusters? But you don't want to write _any_ _code_ then dremio-batch-execute will work wonders for you. Just dump all your SQL statements into a file and run dremio-batch-execute

    brew install dremio-batch-execute

## ssdownloader

Will search a zendesk ticket for all links including Sendsafely links and download them [ssdownloader repo](https://github.com/rsvihladremio/ssdownloader).

    brew install ssdownloader

## statcapn

No install binaries for getting metrics from nodes [statcapn repo](https://github.com/rsvihladremio/statcapn)

    brew install statcapn 

## gclog

JDK 8 gclog analyzer that is insanely fast [gclog repo](https://github.com/rsvihladremio/gclog)

    brew install gclog
