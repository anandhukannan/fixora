async function loadServices() {
  const list = document.getElementById("service-list");
  if (!list) return;

  const response = await fetch("http://127.0.0.1:8000/services");
  const services = await response.json();

  services.forEach(function (service) {
    const card = document.createElement("div");
    card.className = "service-card";
    card.innerHTML = "<h3>" + service.name + "</h3><p>" + service.description + "</p>";
    list.appendChild(card);
  });
}

loadServices();