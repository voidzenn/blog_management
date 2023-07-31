## Simple Blog post management using ActiveAdmin and Quill Editor ( Rich Text Editor )

### Pre-requisites
 - After pulling repo, run **bundle install**
 - Change the name of "/config/application.yml.example" to **application.yml**
 - You need to install docker, after installing docker, run mysql docker containers using this command **docker compose up -d**
 - Run migration **rails db:migrate**
 - Install webpacker **rails webpacker:install**
   - **Note**: Enter "n" to skip configuration overwrite
   - If you have issues with webpacker, try using an older version of node, currently working using node v16.20.1
 - Create fake data seed **rake create_fake_data**
   - This creates categories and posts data
 - Run webpack server **bin/webpack-dev-server**
 - Run application **rails s**
 - Access localhost **http://127.0.0.1:3000/** or the generated url and port after running **rails s**

### Preview
Sign in page
![Screenshot from 2023-07-31 09-31-19](https://github.com/voidzenn/blog_management/assets/47482620/f28eed26-55a5-4594-81b0-2c2ae927f325)


Post list
![Screenshot from 2023-07-31 09-32-15](https://github.com/voidzenn/blog_management/assets/47482620/07094b2f-a4d3-4667-b824-4cdc9290f74a)


Create Post ( Can save post as draft to not include in home page list )
![Screenshot from 2023-07-31 09-33-14](https://github.com/voidzenn/blog_management/assets/47482620/b98e9963-31d8-48db-ab6c-e58a1c8ffa99)


Edit Post
![Screenshot from 2023-07-31 09-33-34](https://github.com/voidzenn/blog_management/assets/47482620/041c5db1-c2a0-4ede-8fdd-e50a6bcf94db)


Home Page ( Jquery )
![Screenshot from 2023-07-31 09-34-00](https://github.com/voidzenn/blog_management/assets/47482620/c4341354-034b-451d-b27d-c3e27ff45291)


Filtered Category
![Screenshot from 2023-07-31 09-34-15](https://github.com/voidzenn/blog_management/assets/47482620/f3b84a9a-1c2f-4d1b-ab7c-c4f82f3a8508)


Post Title as slug using **friendly_id** gem
![Screenshot from 2023-07-31 09-51-30](https://github.com/voidzenn/blog_management/assets/47482620/d9b30d5c-c436-4494-b04a-434178394857)
