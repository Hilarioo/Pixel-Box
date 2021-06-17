function signOut(event) {
  var fetchOptions = {
    method: "POST",
    body: "",
    headers: {
      "Content-Type": "application/json",
    },
  };
  let fetchURL = "http://localhost:3000/users/logout";
  fetch(fetchURL, fetchOptions)
    .then((data) => {
      console.log(data);
      //if user is not logged in button is -> [LOGIN]
      let login_to_logout = document.getElementById("login_to_logout");
      login_to_logout.innerHTML = "LOGIN";
      login_to_logout.setAttribute("href", "/login");
      login_to_logout.onclick = null;

      //if user is not logged in button is -> [REGISTER]
      let register_to_upload = document.getElementById("register_to_upload");
      register_to_upload.innerHTML = "REGISTER";
      register_to_upload.setAttribute("href", "/registration");

      // redirects back to the homepage once logged out
      document.location.href = "/";
    })
    .catch((err) => {
      location.reload;
    });
}

if (document.cookie.includes("csid")) {
  //Changes [LOGIN] button -> [LOGOUT]
  console.log("user is logged in");
  let login_to_logout = document.getElementById("login_to_logout");
  login_to_logout.innerHTML = "LOGOUT";
  login_to_logout.removeAttribute("href");
  login_to_logout.onclick = signOut;

  //Changes [REGISTER] button -> [UPLOAD IMAGE]
  let register_to_upload = document.getElementById("register_to_upload");
  register_to_upload.innerHTML = "UPLOAD IMAGE";
  register_to_upload.setAttribute("href", "/postimage");
} else {
  //if user is not logged in button is -> [LOGIN]
  let login_to_logout = document.getElementById("login_to_logout");
  login_to_logout.innerHTML = "LOGIN";
  login_to_logout.setAttribute("href", "/login");

  //if user is not logged in button is -> [REGISTER]
  let register_to_upload = document.getElementById("register_to_upload");
  register_to_upload.innerHTML = "REGISTER";
  register_to_upload.setAttribute("href", "/registration");
}
