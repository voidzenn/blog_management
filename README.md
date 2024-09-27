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


Create Post ( Can save post as draft to not include in home page list | Add Cover Image | Add Image in content )
![Screenshot from 2024-09-27 10-29-21](https://github.com/user-attachments/assets/112a65df-d42d-4f98-a258-72ac53ffac42)


Edit Post
![Screenshot from 2024-09-27 10-30-25](https://github.com/user-attachments/assets/e4ea6a60-e9d2-4aab-bd1f-5b8eb9577b7d)


Home Page ( Stimulus with Turbo Stream loading )
![Peek 2024-09-27 10-49](https://github.com/user-attachments/assets/4bf599de-8941-4cdf-b9ba-cad902e99f44)


Search and Show Page ( ElasticSearch | Title as slug with **friendly_id** gem )
![blog management search](https://github.com/user-attachments/assets/c4b5cec3-51c5-46b4-ba7e-b47a38a15500)
