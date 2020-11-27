const default_config = {
  client: "pg",
  connection: {
    database: "gqlserver-prod",
<<<<<<< HEAD
    user: "gqlserver",
=======
    user: "postgres",
>>>>>>> e39ae139cd978509e0fe704df78b0cc077b09497
    password: "root",
  },
  pool: {
    min: 2,
    max: 10,
  },
  migrations: {
    tableName: "knex_migrations",
    directory: "migrations",
  },
  timezone: "UTC",
};
interface KnexConfig {
  [key: string]: object;
}
const config: KnexConfig = {
  development: {
    ...default_config,
  },
  testing: {
    ...default_config,
    connection: {
      database: "gqlserver-test",
<<<<<<< HEAD
      user: "gqlserver",
=======
      user: "postgres",
>>>>>>> e39ae139cd978509e0fe704df78b0cc077b09497
      password: "root",
    },
    pool: { min: 0, max: 10, idleTimeoutMillis: 500 },
  },
  production: {
    ...default_config,
  },
};

export default config;
