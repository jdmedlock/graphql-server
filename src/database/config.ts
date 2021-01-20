const default_config = {
  client: "pg",
  connection: {
    database: process.env.POSTGRES_DB,
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
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
