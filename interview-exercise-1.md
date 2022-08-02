# Exercise 1 - Kanban Board API

Implement a REST service that exposes the /cards endpoint.

Each card is a JSON object with the following keys:

- `id`: The unique card ID. (Integer)
- `title`: The title of the card. (String)
- `status`: The current status of the card (Integer), where 1 = 'To do', 2 = 'In progress' and 3 = 'Done'

Here is an example of a card JSON object:

```json
{
  "id": 2,
  "status": 1,
  "title": "Create a new project"
}
```

It should allow for managing the collection of cards in a Kanban Board in the current status in the following way:

`POST` request to `/cards`:

- creates a new card in the board
- expects a JSON card object without the id and status property as the body payload. You can assume that the given object is always valid.
- adds the given object containing the card to the board and assigns a unique integer id to it. The first created card must have an id of 1, the second one, 2, and so on.
- Each newly created card should have a status of 1.
- You can assume that the status property will never be passed.
- The response code is 201, and the response body is the created kanban board card object.

`PUT` request to `/cards/:id`

- accepts the status property containing the new status as the body payload
- updates the status of the card for the passed card id
- If the status value passed is not 1,2, or 3, return the status code 400 with no requirement on the response body.
- If the status value is 1, 2 or 3, the response code is 200, with the updated card as the response body.
- You can assume that the passed card ID always exists.

You should complete the given project so that it passes all the test cases when running the provided unit tests.

## Example requests and responses

`POST` request to `/boards`

Request body:

```json
{
  "title": "Create a new project"
}
```

The response code is 201, and when converted to JSON, the response body is:

```json
{
  "id": 1,
  "status": 1,
  "title": "Create a new project"
}
```

This adds a new object to the collection with the given properties, id 1, with the status set to 1.

`PUT` request to `/boards/1`

Request body:

```json
{
  "status": 2
}
```

The response code is 200, the status of card 1 has been updated to 2, and the updated card object is sent in the response body:

```json
{
  "id": 1,
  "status": 2,
  "title": "Create a new project"
}
```

`PUT` request to `/boards/1`

Request body:

```json
{
  "status": 4
}
```

The response code is 400 with no requirements for the response body.
