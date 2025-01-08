<template>
  <div>
    <h2>Buscar Reglamentos y Resoluciones</h2>
    <input
      type="text"
      v-model="query"
      placeholder="Ingrese su búsqueda"
    />
    <button @click="handleSearch">Buscar</button>
    <ul>
      <li v-for="doc in documents" :key="doc.id">
        <h3>{{ doc.title }}</h3>
        <p>{{ doc.content }}</p>
      </li>
    </ul>
    <p v-if="error">{{ error }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      query: '',
      documents: [],
      error: null,
    };
  },
  methods: {
    async handleSearch() {
      if (!this.query.trim()) {
        this.error = 'Por favor, ingrese un término de búsqueda.';
        return;
      }
      this.error = null;
      try {
        const response = await fetch('/api/chatbot', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ query: this.query }),
        });
        if (response.ok) {
          const data = await response.json();
          this.documents = data.documents;
        } else {
          const errorData = await response.json();
          this.error = errorData.error || 'Error al realizar la búsqueda.';
        }
      } catch (err) {
        console.error(err);
        this.error = 'Error de red al realizar la búsqueda.';
      }
    },
  },
};
</script>
