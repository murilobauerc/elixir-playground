# Ecto

Ecto is a official project from Elixir to provide a database layer and a query integrated structure.We can create migrations, schemes, insert and update data, and make queries.

# Adapters

Ecto supports different databases through the use of adapters, they are:
- PostgreSQL
- MySQL
- SQLite


# Starting with Ecto

There are 3 parts:
- Repository: Provide us the interface with our database, including the connection.
- Migrations: Mechanism to create, modify and destroy tables and indexes on the database.
- Schemes: Specialized structs that represent database table entries.


# Create repository
```elixir
iex> mix ecto.gen.repo -r Friends.Repo
```

# Create the database inside postgres
```elixir
iex> ecto.create
```

# Create/Modify with Migrations
```elixir
iex> mix ecto.gen.migration <migration_name>
```

# Run the migration
```elixir
iex> mix ecto.migrate
```

# Changesets
- In order to insert, update or delete data from db `Ecto.Repo.insert/2` or `update/2` and `delete/2`, require a changeset as their first parameter. 
- But what are changesets? It's a solution to verify data's integrity.

```elixir
# An empty `%Changeset{}`
iex> %Ecto.Changeset{}
%Ecto.Changeset<action: nil, changes: %{}, errors: [], data: nil, valid?: false>
```


## To create a changeset using a `Person` schema, we are going to use `Ecto.Changeset.cast/3`
```elixir
iex> Ecto.Changeset.cast(%Friends.Person{name: "Bob"}, %{}, [:name, :age])
%Ecto.Changeset<action: nil, changes: %{}, errors: [], data: %Friends.Person<>,
  valid?: true>
```
- First parameter is the original data - an initial `%Friends.Person{}`
- Second parameter are the changes we want to make - just an empty map.
- The third parameter is what makes cast/3 special: it's a list of fields allowed to go through, which gives us the ability to control what fields can be changed and safe-guard the rest.


