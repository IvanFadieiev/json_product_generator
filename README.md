# README

## JSON GENERATOR

1. Install ```npm install -g json-server```
2. Clone the repository ```git clone git@github.com:IvanFadieiev/json_product_generator.git```
3. Enter to the project directory ```cd json_product_generator```
4. Fill **config/config.yaml** with proper values
5. Run ```ruby execute.rb```
6. Run ```json-server --watch json_files/example.json```

To see json-server documentation just visit https://github.com/typicode/json-server

Now you are able to visit ```http://localhost:3000```

You have the ability to manage **categories, products, users** entities with general CRUD

e.g.

GET ```/categories``` will return the page with all categories

POST ```/categories?categoryName='category_name'&categoryImg='category_img'``` will create new category

GET ```/categories/1``` will show us category's info page

PUT/PATCH ```/categories/1``` will update chosen category

DELETE ```/categories/1``` will destroy chosen category

## Also, there are few supplemental paths to help us manage entities:

### Relationships

GET ```/products?_expand=categories```

GET ```/posts?_embed=comments```

To get or create nested resources (by default one level, add custom routes for more)

GET  ```/posts/1/comments```

POST ```/posts/1/comments```

### Filtering

GET ```/posts?title=json-server&author=typicode```

GET ```/posts?id=1&id=2```

GET ```/comments?author.name=typicode```

### Paginate

GET ```/posts?_page=7```

GET ```/posts?_page=7&_limit=20```

### Sort

GET ```/posts?_sort=views&_order=asc```

GET ```/posts/1/comments?_sort=votes&_order=asc```

For multiple fields, use the following format:

GET ```/posts?_sort=user,views&_order=desc,asc```

### Operators
Add _gte or _lte for getting a range

GET ```/posts?views_gte=10&views_lte=20```

Add _ne to exclude a value

GET ```/posts?id_ne=1```

Add _like to filter (RegExp supported)

GET ```/posts?title_like=server```

### Full-text search
    
GET /posts?q=internet

### Database

GET ```/db```
