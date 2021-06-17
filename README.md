# Pixel Box

## Overview

Pixel Box is a photo management website that allows users to post images, search for images and view individual image posts. Like the website https://imgur.com/. This project was an assignment for my Introduction to Web Software (SFSU CSC317).

Functional Requirements:

- Unregistered users must be able create a user account.
- Registered users must be able to log in.
- Registered users must be able to log out.
- Registered users must be able post an image
- Registered users must be able to search for image posts
- Unregistered users must be able to search for image posts.
- Unregistered user must be able to view individual image posts.

None-Functional Requirements:

- User account information must be stored in the application’s database
- User Passwords must be encrypted.
- Image Post information must be stored in the application’s database
- Logged in users must stay logged in as they navigate your website until they log out.

### GIF of user adding a comment to a post

![ui video demo](public/images/pixel-box.gif)

### Build Instructions

#### 1. Open terminal

#### 2. Inside terminal

```bash
cd Desktop

git clone https://github.com/csc317-01-spring2020/csc317-termproject-Hilarioo.git
```

#### 3. Open VS Code

- Step1: click "open folder"
- Step2: navigate to the folder downloaded on your desktop
- Step3: open the "application" folder

#### 4. Retrieve "csc317db" mysql file from config folder and paste it into MySQLWorkbench

---

### Run Instructions

#### 1. Open a terminal within the VS Code application

```bash
npm install

npm fund

npm start
```

#### 2. Open browser and input (chrome OR firefox recommended)

```bash
http://localhost:3000/
```

I used display 'display: flex' (CSS) which is not compatible in some browsers. Please check if it is compatible with your browser here [here](https://caniuse.com/#search=flex)

#### 2. Navigate to register and create an account (required to make comments)

#### 3. Navigate to login and signin using registered account OR

```bash
(predefined users within csc317db.mysql)

    Username: Jose97
    Password: 12345678

    Username: Bob33
    Password: 12345678
```

#### 4. Search on the home page by clicking on the magnifying glass after inputting something OR click "return" / "enter" on your keyboard

[Jose H. Gonzalez](www.linkedin.com/in/hilariooo)
