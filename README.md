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
![Screenshot from 2023-07-31 09-31-19](https://github.com/voidzenn/blog_management/assets/47482620/609856c0-1fae-4381-8e06-2573213d2784)


Post list
![Screenshot from 2023-07-31 09-32-15](https://github.com/voidzenn/blog_management/assets/47482620/ffc6f6af-c038-43e1-ba1f-af1a1a0211e2)


Create Post ( Can save post as draft to not include in home page list )
![Screenshot from 2023-07-31 09-33-14](https://github.com/voidzenn/blog_management/assets/47482620/3bc239d3-015c-4478-99bb-c34c0d8f8c0f)


Edit Post
![Screenshot from 2023-07-31 09-33-34](https://github.com/voidzenn/blog_management/assets/47482620/cb986313-689e-4bad-9979-a9db58220031)


Home Page ( Jquery )
![Screenshot from 2023-07-31 09-34-00](https://github.com/voidzenn/blog_management/assets/47482620/423bcdfb-46ce-44e6-9a44-64f3ee640983)


Filtered Category
![Screenshot from 2023-07-31 09-34-15](https://github.com/voidzenn/blog_management/assets/47482620/6a8a5b61-ce60-4b62-8b0a-1623232abf1f)


Post Title as slug using **friendly_id** gem
![Screenshot from 2023-07-31 09-51-30](https://github.com/voidzenn/blog_management/assets/47482620/0fabe952-691d-4aa1-bdab-70c431ff541a)
