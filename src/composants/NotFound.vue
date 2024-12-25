<template>
    <div class="container mt-5">
        <div class="text-center">
            <h1 class="display-1 text-danger">404</h1>
            <h2 class="display-4 mb-4">Page Non Trouvée</h2>
            <p class="lead mb-5">Désolé, la page que vous recherchez n'existe pas.</p>
            <button @click="router.push('/')" class="btn btn-primary btn-lg">
                Retourner à l'accueil
            </button>
        </div>
    </div>
</template>

<script setup>
import { useRouter } from 'vue-router'

const router = useRouter()
</script>

