
<template>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">CinéVue</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <router-link class="nav-link" to="/">Accueil</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" to="/recherche">Recherche</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" to="/categorie">Catégories</router-link>
                    </li>
                    <li class="nav-item">
                        <router-link class="nav-link" to="/ajout">Ajouter un film</router-link>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

<script setup>
import { ref } from 'vue'

const searchQuery = ref('')

</script>

<style scoped>
.navbar {
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.navbar-brand {
    font-weight: bold;
    font-size: 1.5rem;
}

.nav-link {
    font-size: 1.1rem;
    margin: 0 10px;
}

.nav-link:hover {
    color: #fff !important;
}
</style>