<template>
  <div>
    <h2>Subir documento</h2>
    <form @submit.prevent="handleUpload">
      <label for="title">Título:</label>
      <input type="text" id="title" v-model="title" required />
      
      <label for="file">Seleccionar archivo:</label>
      <input type="file" id="file" @change="handleFile" required />
      
      <button type="submit">Subir</button>
    </form>
    <p v-if="message">{{ message }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      title: '',
      file: null,
      message: '',
    };
  },
  methods: {
    handleFile(event) {
      this.file = event.target.files[0];
    },
    async handleUpload() {
      const formData = new FormData();
      formData.append('title', this.title);
      formData.append('file', this.file);
      formData.append('uploaded_by', 'admin');

      try {
        const response = await fetch('/api/upload', {
          method: 'POST',
          body: formData,
        });

        if (response.ok) {
          this.message = 'Archivo subido exitosamente.';
        } else {
          this.message = 'Error al subir el archivo.';
        }
      } catch (err) {
        console.error(err);
        this.message = 'Error de red.';
      }
    },
  },
};
</script>
