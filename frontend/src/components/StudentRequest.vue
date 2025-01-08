<template>
    <div>
        <h1>Solicitudes para Estudiantes</h1>
        <ul>
            <li v-for="request in requests" :key="request.id" @click="selectRequest(request)">
                {{ request.name }}
            </li>
        </ul>

        <div v-if="selectedRequest">
            <h2>{{ selectedRequest.name }}</h2>
            <p>{{ selectedRequest.description }}</p>
            <h3>Pasos:</h3>
            <p v-html="selectedRequest.steps.replace(/\n/g, '<br>')"></p>
        </div>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            requests: [],
            selectedRequest: null,
        };
    },
    methods: {
        async fetchRequests() {
            try {
                const response = await axios.get('http://localhost:3000/api/requests');
                this.requests = response.data;
            } catch (error) {
                console.error('Error al obtener las solicitudes:', error);
            }
        },
        selectRequest(request) {
            this.selectedRequest = request;
        },
    },
    mounted() {
        this.fetchRequests();
    },
};
</script>
