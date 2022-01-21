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


# Tests
```elixir
iex> alias Friends.{Movie,Repo}
iex> import Ecto.Query
iex> query = from(Movie)
iex> Repo.all(query)

# query only for specific fields (e.g where movie title is "Ready Player One")
iex> query = from(Movie, where: [title: "Ready Player One"], select: [:title, :tagline])
iex> Repo.all(query)

# 'in' bindings expressions (in this case 'm' is a binding).
iex> query = from(m in Movie, where: m.id < 2, select: m.title)
iex> Repo.all(query)

# macro-based queries
query = select(Movie, [m], m.title)
Repo.all(query)

# macros with pipe
Movie
|> where([m], m.id < 2)
|> select([m], {m.title})
|> Repo.all()

# Interpolated values with pin operator
# Pinned values allows us to refer to that pinned value, instead of re-binding that variable.
iex> title = "Ready Player One"
iex> query = from(m in Movie, where: m.title == ^title, select: m.tagline)
iex> Repo.all(query)


# Getting the first record in DB
iex> first(Movie)
iex> Movie |> first() |> Repo.one()

# Getting the last record in DB
iex> Movie |> last() |> Repo.one()

# Preload
# WE NEED USE PRELOAD WHEN WE HAVE ASSOCIATED SCHEMAS (e.g `belongs_to`, `has_many`, `has_one`)
iex> movie = Repo.get(Movie, 1)
iex > movie.actors
iex > Repo.all(from m in Movie, preload: [:actors])
```
