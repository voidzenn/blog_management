## Simple Blog post management using ActiveAdmin and Quill Editor ( Rich Text Editor )

### Pre-requisites
 - rails
 - docker | docker compose
 - node | version 16.20.1 should work for this webpacker version

### Run app
 - After pulling repo, run **bundle install**
 - Change the name of ".env.example" to **.env**
 - Run docker containers using this command **docker compose up -d**
 - Create the databases **rails db:create**
 - Run migration **rails db:migrate**
 - Install webpacker **rails webpacker:install**
   - **Note**: Enter "n" to skip configuration overwrite
   - If you have issues with webpacker, try using an older version of node, currently working using node v16.20.1
 - Create admin console access with **rails db:seed**
 - Create fake data seed **rails create_fake_data**
   - This creates posts data
 - In a separate terminal run webpack server **bin/webpack-dev-server**
 - Run application **rails s**
 - Access localhost **http://127.0.0.1:3000/** or the generated url and port after running **rails s**
 - Access Admin Console **http://127.0.0.1:3000/admin** with this credentials **admin@example.com** | **password**

### Preview
#### Demo

[Watch video](https://drive.google.com/file/d/1IfLpKxUryaqb3UeKtuNjmyb9f-Ud4rSs/view?usp=sharing)

#### Screenshots
Sign in page
![Screenshot from 2023-07-31 09-31-19](https://github.com/voidzenn/blog_management/assets/47482620/f28eed26-55a5-4594-81b0-2c2ae927f325)


Post list
![Screenshot from 2023-07-31 09-32-15](https://github.com/voidzenn/blog_management/assets/47482620/07094b2f-a4d3-4667-b824-4cdc9290f74a)


Create Post ( Can save post as draft to not include in home page list | Add Cover Image | Add Image in content )
![Screenshot from 2024-09-27 10-29-21](https://github.com/user-attachments/assets/112a65df-d42d-4f98-a258-72ac53ffac42)


Edit Post
![Screenshot from 2024-09-27 10-30-25](https://github.com/user-attachments/assets/e4ea6a60-e9d2-4aab-bd1f-5b8eb9577b7d)

Home Page
![Screenshot from 2024-09-29 19-39-29](https://github.com/user-attachments/assets/58e74231-82ca-4129-b5c5-1c1b865503d8)

Show Page
![Screenshot from 2024-09-29 19-40-50](https://github.com/user-attachments/assets/c1101abe-4f7c-45b9-8962-96eb1014ac4b)
