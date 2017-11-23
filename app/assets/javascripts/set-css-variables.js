if (document.attachEvent ? document.readyState === "complete" : document.readyState !== "loading"){
  setCssVariables();
} else {
  document.addEventListener('DOMContentLoaded', setCssVariables);
}

function setCssVariables() {
  const navbar = document.querySelector('nav');
  const navbarProperties = document.querySelector('#navbar_category').dataset;
  navbar.style.setProperty('--' + navbarProperties.name, navbarProperties.value + navbarProperties.suffix);
}
