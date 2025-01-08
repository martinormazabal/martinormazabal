<template>
  <div>
    <h2>Crear Usuario</h2>
    <form @submit.prevent="handleCreateUser">
      <input type="text" v-model="username" placeholder="Nombre de usuario" required />
      <input type="email" v-model="email" placeholder="Correo electrónico" required />
      <input type="password" v-model="password" placeholder="Contraseña" required />
      <select v-model="role" required>
        <option value="" disabled>Seleccionar perfil</option>
        <option value="student">Estudiante</option>
        <option value="faculty">Funcionario</option>
        <option value="admin">Admin</option>
      </select>
      <button type="submit">Crear</button>
    </form>
    <p v-if="message">{{ message }}</p>
    <p v-if="error">{{ error }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      email: '',
      password: '',
      role: '',
      message: '',
      error: '',
    };
  },
  methods: {
    async handleCreateUser() {
      try {
        const response = await fetch('/api/users/create', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            username: this.username,
            email: this.email,
            password: this.password,
            role: this.role,
          }),
        });
        const data = await response.json();
        if (response.ok) {
          this.message = data.message;
          this.error = '';
        } else {
          this.error = data.error;
          this.message = '';
        }
      } catch (err) {
        console.error(err);
        this.error = 'Error de red al crear usuario.';
      }
    },
  },
};
</script>
