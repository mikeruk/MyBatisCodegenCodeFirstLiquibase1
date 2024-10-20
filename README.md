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






For reference: [Creating Config Properties](https://docs.liquibase.com/concepts/changelogs/home.html)


