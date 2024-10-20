# MyBatisCodegenCodeFirstLiquibase1



# Instructions

## :exclamation:NB **First decide** on how you want to execute the Liquibase changesets (the so called SQL statements):
  - Upon **App Build Button**.
  - Or via **terminal command line**.

> **Note:** Why does this matter? Because if you decide to use the 'App Build Button' via your IDE, then you need to install all Liquibase dependencies via your pom.xml ot build.gradle file, apply settings in `application.yml` file, and explicitly configure "how and when" to run Rollbacks. But if you want to execute Liquibase changesets via **terminal command line**, then you can only install the Liquibase tool on your local machine.

### :warning: NB! NEVER USE BOTH approaches simultaneously, because if you decide to use the command line, it **creates separate files**:
  - `LIQUIBASECHANGELOG`
  - `LIQUIBASECHANGELOGLOCK`

but later if deice also to run liquibase commands upon building your project, e.g. pressing the **App Build Button**, it will create other files with the same names:
  - `LIQUIBASECHANGELOG`
  - `LIQUIBASECHANGELOGLOCK`

, as a result you will have 4 files, containing tracking changelog information and both files will contain different data.

---

### :white_check_mark: Here we choose to implement the **terminal CLI** approach, because we want to keep such process like updating our database separate from the regular build process, when we run our app. Also it's simpler to configure and run rollbacks, when we want to revert changes.

**First**, install the Liquibase tool on your machine.
For reference: [Creating Config Properties](https://docs.liquibase.com/start/install/home.html)


**Second**,  define the `liquibase.properties` file. 
For reference: [Creating Config Properties](https://docs.liquibase.com/concepts/connections/creating-config-properties.html)

I created the `liquibase.properties` file in the main project root folder. This allows me to run only this command and it will locate that file automatically:
```bash
liquibase update
```
If the file is created on another place or inside another folder, then the flag `--defaultsFile` needs to be included when running the command:
```bash
liquibase --defaultsFile=path/to/liquibase.properties update
```

## Running Liquibase Commands
IF you don't create any liquibase.properties file, you have to pass the arguments manually on the command line,
like so: (Arguments passed on the command line will overwrite any properties in the liquibase.properties.)
### To execute an 'install liquibase script' - run the below command and use the 'update' flag:
```bash
    liquibase --changeLogFile=src/main/resources/db/changelog/changelog-root.xml --url=jdbc:postgresql://localhost:5444/liquibase-test1 --username=postgres --password=myPassword update
```
### To execute a rollback only for the last applied changeset - run the below command and use the 'rollbackCount 1' flag:
```bash
liquibase --changeLogFile=src/main/resources/db/changelog/changelog-root.xml --url=jdbc:postgresql://localhost:5444/liquibase-test1 --username=postgres --password=myPassword rollbackCount 1
```
### Rollback to the initial state (before any changesets were applied):
If you haven't used tags, you can roll back to the initial state by specifying the oldest date (before any changesets were applied):
```bash
liquibase rollbackToDate YYYY-MM-DDTHH:MM:SS
```
### Rollback to a specific tag - This will roll back all changesets applied after the tag.:
```bash
liquibase rollback myTag
```
### Use rollbackCount with a High Number:
```bash
liquibase rollbackCount <total_number_of_changesets>
```
### Use rollback to an Empty Database:
```bash
liquibase rollbackCount <total_number_of_changesets_applied>
```
### you can query the DATABASECHANGELOG table, like this:
```bash
SELECT COUNT(*) FROM DATABASECHANGELOG;
```
### To clear the checksums:
```bash
liquibase --changeLogFile=src/main/resources/db/changelog/changelog-root.xml --url=jdbc:postgresql://localhost:5444/liquibase-test1 --username=postgres --password=myPassword clearCheckSums
```
### and then create same 'command script file', but with new ID, because the previous ID is stored in the
### 'databasechangelog' table and will not allow you to repeat same ID again.




For reference: [Creating Config Properties](https://docs.liquibase.com/concepts/changelogs/home.html)


