---
title: Logging Guidelines
parent: Software Development
nav_order: 170
---

# {{ page.title }}

## Guidelines

- Software components must log each line of the stream to `stdout`

- Logs should adopt the [NSD JSON Schema](https://gitlab.nsd.no/logging/log-schema)

- Use logging level **WARN** as the deafault

## Rational

This intention of this guideline is to help Developers ensure that component logging:

- is consistent within an application

- is consistent across CESSDA's service portfolio

- uses industry standards and best practice where relevant

so the logged event data can be consumed, correlated, analysed and managed by a central logging system.

### Purpose of logging

Logging output from CESSDA application components is important and brings benefits to the following groups of people:

- CESSDA Platform team: Provide detail evidence of problems so they can help Developers to resolve issues

- Developers: Allows code execution tracing without the use of a debugger

### Loggers

Depending on the programming language, Developers may choose any logging client or logging framework that suits them.
It must be properly defined in each of the classes that performs logging.

For example, the CESSDA Data Catalogue (CDC) harvester component (implemented in Java) uses Logback with
`lombok` extension.
An example from the CDC harvester component is shown below:

```java
@Slf4j
public class ConsumerScheduler {
 public void weeklyFullHarvestAndIngestionAllConfiguredSPsReposRecords(){
  log.info("Once a Week Full Run. Triggered by cron - STARTED");
  }
}
```

### Log levels

The default log level for CESSDA is **WARN**.

This communicates to the Platform support team that this message needs some kind of attention.
In such a scenario, an issue will be created in the Bitbucket issue tracker for resolution.
Below is the example from the CDC harvester component:

`log.warn("Could not parse RecordIdentifier lastModifiedDate")`

### Parameterize logging  and fields creation

Most frameworks provide parameterised logging capabilities.
Parameterised logging allows Developers to specify parameters in log statements which will be evaluated only if the log is actually processed.
CESSDA recommends that Developers choose a logging framework that implements parameterisation.
In  SLF4J Logger, it is indicated in the logging statement with a string {}.
This allows a more readable syntax than concatenating strings.
It also yields better performance as the string will only be concatenated when required.

It should be also possible to choose a framework that allows extra fields (key-value pairs)
to be created to allow for flexibility and easy ingestion into the logging system.
Below is an example:

```java
log.info("BulkIndexing repo [{}] with lang code [{}].", value("repo_name", repo.getName()), value("lang_code", lang));
```

### Context

Creating a log message to indicate what is happening to a block of code is very important.
Indicate what the operation is attempting to do, what object it is trying to act on and why that is required.
For instance, when logging exceptions, indicate the operation failure,
the objects that it acts on and detail the exception so the stack-trace can be logged.

Below is an example of good exception logging:

```java
log.error("[{}] Failed to get StudyId [{}]: {}: {}",
 repo.getName(),
 value(LoggingConstants.STUDY_ID, studyNumber),
 value(LoggingConstants.OAI_ERROR_CODE, exception.getCode()),
 value(LoggingConstants.OAI_ERROR_MESSAGE, exception.getErrorMessage()),
 exception
);
```

The message text explains the failure and includes all relevant information.
The name of the repository, the Study ID, the code and optional message are logged.
Finally, the exception is attached allowing for the full stack trace to be printed.

See [logging overview]({% link platform/logging-overview.md %}) for additional background information.
