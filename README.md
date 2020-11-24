# graphql-server

A demonstration server for GraphQL experiments

## Overview

This project is a demonstration server for GraphQL experiments and is based on 
this
[article](https://dev.to/wonder2210/graphql-typescript-postgresql-api-271g) & 
[repo](https://github.com/Wonder2210/graphql-typescript-pg-server).

It's purpose is to provide a place to test GraphQL techniques as well as the
supporting technolgies and libraries like Data Loader & Objection.

![Architecture Diagram](https://github.com/jdmedlock/graphql-server/blob/main/docs/graphql_server-architecture.png)

## Installation & setup 

To install:

```
git clone https://github.com/jdmedlock/graphql-server
cd graphql-server
npm install
```

### Database setup

Before continuing you'll need to install and configure a local PostgreSQL 
instance and create two databases - `post` and `post-test`. 

You will also need to
to create and authorize two user accounts in PostgreSQL as owners of theses databases
databases. The default credentials can be found in 
[/src/database/config.ts](https://github.com/jdmedlock/graphql-server/blob/main/src/database/config.ts).

Now you are ready to initialize the Knex migrations & load the test data:

1. Generate the first Knex migration:
```
npx knex --knexfile ./src/database/knexfile.ts migrate:make -x ts initial
```

2. Start the server:
```
npm run dev
```

3. Prepare the DB:

| Environment | Command | Description |
|:------------|:--------|:------------|
| Testing     | `npm run test:migrate:up` | Run the Knex migration |
| Testing     | `npm run test:seed-db` | Load test data into `post-test` DB |
| Production  | `npm run migrate:up` | Run the Knex migration |
| Production  | `npm run seed-db` | Load test data into `post` DB |

4. Generate types:
```
npm run generate:types
```

### Insomnia setup

At this point you are ready to fire up the [Insomnia client](https://insomnia.rest/)
so you can begin testing GraphQL queries. 

You'll be sending your queries to `http://localhost:3000/graphql` via POST 
requests containing your GraphQL queries.

A workspace has been pre-configured and saved in the root of this repo, 
[Insomnia_workspace.json](https://github.com/jdmedlock/graphql-server/blob/main/Insomnia_workspace.json). You may import this workspace into Insomnia to save yourself a bit of 
data entry.
