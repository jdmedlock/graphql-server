const default_config = {
  client: "pg",
  connection: {
    database: "gqlserver-prod",
    user: "gqlserver",
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
      user: "gqlserver",
      password: "root",
    },
    pool: { min: 0, max: 10, idleTimeoutMillis: 500 },
  },
  production: {
    ...default_config,
  },
};

export default config;
