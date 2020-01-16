# Actions workshop

In this workshop, we'll be using a simple e-commerce schema and we'll use actions to add business logic:  `login/logout` and `checkout`.

## Setup

1. Create a Hasura project using `hasura init --template docker-compose`

2. Get hasura and postgres running by running `docker-compose up -d`

3. Copy the metadata and migrations directory from this repo

4. `hasura migrate apply`

5. `hasura metadata apply`

This will setup the ecommerce schema for you.

## Get started

To get started with actions, run

1. `hasura actions use-codegen`
2. `hasura actions create --help`
