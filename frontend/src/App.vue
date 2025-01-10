<template>
  <div id="app">
    <header>
      <h1>Chatbot FING-USACH</h1>
      <nav>
        <ul>
          <li><a href="#request-helper">Ayuda a Estudiantes</a></li>
          <li><a href="#pdf-upload">Gestión de Documentos</a></li>
          <li><a href="#user-management">Gestión de Usuarios</a></li>
        </ul>
      </nav>
    </header>
    <main>
      <section id="request-helper">
        <h2>Ayuda a Estudiantes</h2>
        <p>Encuentra las solicitudes que debes realizar según las normativas.</p>
      </section>
      <section id="pdf-upload">
        <h2>Gestión de Documentos</h2>
        <p>Sube documentos y conviértelos en texto para almacenamiento.</p>
      </section>
      <section id="user-management">
        <h2>Gestión de Usuarios</h2>
        <p>Gestiona perfiles y roles de los usuarios del sistema.</p>
      </section>
    </main>
    <footer>
      <p>&copy; 2025 Universidad de Santiago de Chile. Todos los derechos reservados.</p>
    </footer>
  </div>
</template>

<script>
export default {
  name: "App",
};
</script>

<style>
#app {
  font-family: Arial, sans-serif;
  text-align: center;
  background-color: #f5f5f5;
  margin: 0;
  padding: 0;
}

header {
  background-color: #35495e;
  color: #fff;
  padding: 1rem;
}

header nav ul {
  list-style: none;
  padding: 0;
  display: flex;
  justify-content: center;
  gap: 1rem;
}

header nav ul li a {
  color: #61dafb;
  text-decoration: none;
}

main {
  padding: 2rem;
}

footer {
  margin-top: 2rem;
  padding: 1rem;
  background-color: #35495e;
  color: #fff;
}
</style>
