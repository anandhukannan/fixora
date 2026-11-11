async function loadServices() {
  const list = document.getElementById("service-list");
  if (!list) return;

  const response = await fetch("http://127.0.0.1:8000/services");
  const services = await response.json();

  services.forEach(function (service) {
    const card = document.createElement("a");
    card.className = "service-card";
    card.href = "workers.html?service=" + encodeURIComponent(service.name);
    card.innerHTML = "<h3>" + service.name + "</h3><p>" + service.description + "</p>";
    list.appendChild(card);
  });
}

loadServices();

async function loadWorkers() {
  const list = document.getElementById("worker-list");
  if (!list) return;

  const params = new URLSearchParams(window.location.search);
  const service = params.get("service");

  if (!service) {
    list.textContent = "Please choose a service first.";
    return;
  }

  document.getElementById("page-heading").textContent = service + " Workers";

  const response = await fetch(
    "http://127.0.0.1:8000/workers?service=" + encodeURIComponent(service)
  );
  const workers = await response.json();

  if (workers.length === 0) {
    list.textContent = "No workers available for " + service + " yet.";
    return;
  }

  workers.forEach(function (worker) {
    const card = document.createElement("div");
    card.className = "service-card";

    const name = document.createElement("h3");
    name.textContent = worker.name;

    const details = document.createElement("p");
    details.textContent =
      worker.city + " | " + worker.experience_years + " years | Rs. " + worker.price;

    card.appendChild(name);
    card.appendChild(details);
    list.appendChild(card);
  });
}

loadWorkers();