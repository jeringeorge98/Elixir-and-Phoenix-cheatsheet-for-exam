## Validators

#### Generic

```elixir
def validate_is_useful(changeset, field) when is_atom(field) do
    validate_change(changeset, field, fn field, value ->
      case value do
        true ->
          []

        false ->
          [{field, "This field is not allowed to be false"}]
      end
    end)
  end

```

#### Number 
```elixir
validate_number(changeset, :pi, greater_than: 3, less_than: 4, less_than_or_equal_to: ...)
```

#### String Format

```elixir
validate_format(changeset, :email, ~r/@/)
```

## SQL Queries

#### Complex Example 

```elixir
  def get_friend_requests_for_user(user) do
    query =
      from u in FriendRequests,
        where: u.receiver_id == ^user.id and u.status == :open

    Repo.all(query) |> Repo.preload([:sender, :reciever])
  end
```

#### Example with order by
```elixir
  def get_timeline_entries_for_user(user) do
    query =
      from t in TimelineEntry,
        where: t.for_user_id == ^user.id,
        order_by: [desc: t.inserted_at]

    Repo.all(query)
  end
```