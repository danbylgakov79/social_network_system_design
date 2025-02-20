
Table subscriptions {
  id uuid [primary key]
  author_id uuid
  subscriber_id uuid
  created_at timestamp
  updated_at timestamp
  deleted_at timestamp
}

Table users {
  id uuid [primary key]
  username varchar
  role varchar
  created_at timestamp
  updated_at timestamp
  deleted_at timestamp
}

Table posts {
  id uuid [primary key]
  title varchar
  body text [note: 'Content of the post']
  user_id uuid
  created_at timestamp
  updated_at timestamp
  deleted_at timestamp
}

Table media_posts {
  post_id uuid
  media_id uuid
}

Table comments {
  id uuid [primary key]
  post_id uuid
  user_id uuid
  message text
  created_at timestamp
  updated_at timestamp
  deleted_at timestamp
}

Table reactions {
  id uuid [primary key]
  post_id uuid
  user_id uuid
  reaction_id int
  created_at timestamp
  deleted_at timestamp

}


Ref: posts.user_id > users.id 

Ref: users.id < subscriptions.author_id

Ref: users.id < subscriptions.subscriber_id

Ref: users.id < comments.user_id
Ref: posts.id < comments.post_id

Ref: posts.id <> media_posts.post_id

Ref: posts.id < reactions.post_id
Ref: users.id < reactions.user_id


