Users
id
username
email
password
usertype (i.e. regular users, admin)
active (email verification - active once they confirm their email)

Posts
id
title
description
photopath
thumbnail (package called sharp that makes this work really well)
active
created
userID (associates the user to the post)

    UUID - better then integers for tracking DB info

to fetch data from the front end - go to https://www.youtube.com/watch?v=KUxKlsByyEo&feature=youtu.be
on minute 26 you'll see the JSON code
