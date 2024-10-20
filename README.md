# MyBatisCodegenCodeFirstLiquibase1

**Liquibase Demo** 

## Overview

To start using Liquibase with PostgreSQL in your Gradle project, here's a minimal configuration steps:

## 1. Install the Liquibase tool

You need to decide on how you will use the Liquibase tool:
- use and run liquibase commands via a build tool like gradle or maven
- or run liquibase commands via terminal command line
Here is presented the second approach - run liquibase commands via terminal command line.
For reference: [Creating Config Properties]([https://docs.liquibase.com/concepts/connections/creating-config-properties.html](https://docs.liquibase.com/start/install/home.html))


# Instructions

## :exclamation: NB !!!

**CHOOSE** whether to execute Liquibase changesets:
  - Upon **App Build Button**.
  - Or via **terminal command line**.

> **Note:** If you run/build the project from inside the IntelliJ IDE, it uses the `application.yml` configuration and executes all changesets accordingly. In this case, you need to define rollback contexts explicitly, etc.

### :warning: NB !!! NEVER USE BOTH approaches simultaneously!
If you decide to use the command line, it **creates separate files**:
  - `LIQUIBASECHANGELOG`
  - `LIQUIBASECHANGELOGLOCK`

If you then use the **App Build Button**, it will create other files with the same names:
  - `LIQUIBASECHANGELOG`
  - `LIQUIBASECHANGELOGLOCK`

---

### :white_check_mark: I chose the **terminal CLI** approach, because it's easier to run single rollbacks.

**First**, define the `liquibase.properties` file. 
For reference: [Creating Config Properties](https://docs.liquibase.com/concepts/connections/creating-config-properties.html)

I created it in the main project root folder. This allows me to run only:
```bash
liquibase update

