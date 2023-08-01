// Store

Table store {
  id integer [pk]   
  name varchar(50)
  address varchar(100)
  phone varchar(100)
  map_link varchar(100)
  description varchar(200)
  start_time timestamp
  contact_id integer
  end_time timestamp
}
Table contact {
  id integer
  phone_number varchar(9)
  email vachar(100)
  y_map varchar(200)
  store_id integer [ref: <> store.id]
  manufacturer_id integer
}

Table category {
  id integer [pk]
  name varchar(50)
  description varchar(50)
}

Table product {
  id integer [pk]
  name varchar(100)
  desciption varchar(200)
  created_at timestamp
  price money
  rating decimal
  company_name varchar(50)
  quantity decimal
  category_id integer [ref: > category.id]
  product_id integer 
}

Table seller {
  id integer [pk]
  first_name varchar(50) 
  last_name varchar(50)
  age integer
  rating decimal
  // 
  work_start_time timestamp  
  work_end_time timestamp
  trading_exp varchar(20)
  password varchar(20)
  email varchar(100)
  date_of_birth date
  phone_number varchar(9)
}

Table purchase {
  id integer [pk]  
  customer_id integer [ref: > customer.id]
  product_id integer [ref: > product.id]
  seller_id integer [ref: > seller.id]
  price money
}

Table sell {
  id integer [pk] 
  product_id integer [ref: > product.id]
  customer_id integer [ref: > customer.id]
  seller_id  integer [ref: > seller.id]
}

Table manufacturer {
  id integer [pk]  
  name varchar(50) 
  contact_id integer [ref: > contact.id]
  qualty varchar(50)
  lead_time timestamp
  country varchar(50)
}

Table customer {
  id integer [pk]   
  first_name varchar(50) 
  last_name varchar(50)
  email varchar(100)
  date_of_birth date
}

Table bucket {
  id integer [pk]  
  customer_id integer [ref: > customer.id]
  product_id integer [ref: > product.id]
}

Table review {
  id integer [pk]   
  customer_id integer [ref: <> customer.id]
  product_id integer [ref: > product.id]
  comment text

}
