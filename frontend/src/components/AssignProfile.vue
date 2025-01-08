<template>
  <div>
    <h2>Asignar Perfil de Usuario</h2>
    <form @submit.prevent="assignProfile">
      <label for="user">Usuario:</label>
      <select v-model="selectedUser" id="user" required>
        <option v-for="user in users" :key="user.id" :value="user.id">{{ user.username }}</option>
      </select>

      <label for="role">Perfil:</label>
      <select v-model="selectedRole" id="role" required>
        <option value="estudiante">Estudiante</option>
        <option value="funcionario">Funcionario</option>
        <option value="administrador de documentos">Administrador de Documentos</option>
      </select>

      <button type="submit">Guardar Cambios</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      users: [],
      selectedUser: null,
      selectedRole: null,
    };
  },
  methods: {
    async fetchUsers() {
      try {
        const response = await axios.get('/api/users'); // Endpoint para obtener usuarios
        this.users = response.data;
      } catch (error) {
        console.error('Error al obtener usuarios:', error);
      }
    },
    async assignProfile() {
      try {
        await axios.put('/api/users/assign-profile', {
          userId: this.selectedUser,
          role: this.selectedRole,
        });
        alert('Perfil asignado correctamente.');
      } catch (error) {
        console.error('Error al asignar perfil:', error);
        alert('Hubo un problema al asignar el perfil.');
      }
    },
  },
  created() {
    this.fetchUsers();
  },
};
</script>
