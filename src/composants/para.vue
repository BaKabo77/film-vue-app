<template>

<h1 class="text-center my-5 display-1"> CinéVue</h1>

<p class="text-center my-5 display-6"> Gestionnaire de films cultes </p>

    <div class="row">   
            <div class="col-md-4 mb-5 col-6" v-for="film in films" :key="film.id">
            <router-link :to="'/film/'+film.id" class="text-decoration-none">
                <div class="card h-100 shadow hover-zoom text-decoration-none">
                    <img :src="film.img" class="card-img-top" alt="film poster">
                    <div class="card-body">
                        <h4 class="card-title text-center">{{ film.titre }} </h4>
                        <h5 class="card-subtitle mb-2 text-muted text-center">{{ film.realisateur }}</h5>
                        <p class="card-text text-center">{{ film.annee }}</p>
                        <p class="card-text">{{ film.description }}</p>
                    </div>
                </div>
            </router-link>
            </div>
    </div>

    <!-- Élément sentinel pour l'Intersection Observer -->
    <div ref="sentinel" class="sentinel my-5"></div>

    <!-- Indicateur de chargement -->
    <div v-if="isLoading" class="text-center mb-4">
        <div class="spinner-border" role="status">
            <span class="visually-hidden">Chargement...</span>
        </div>
    </div>
</template>

<script setup>
import { onMounted, ref } from 'vue';

const films = ref([])
const sentinel = ref(null)
const isLoading = ref(false)

async function getFilms() {
    if (isLoading.value) return

    try {
        isLoading.value = true
        const index = films.value.length || 0
        const requete = await fetch(`${import.meta.env.VITE_API_URL}/films?index=${index}`)
        const data = await requete.json();  

        data.forEach(element => {
            let tab = {
                id:element.FilmID,
                titre: element.Titre,
                annee: element.Annee,
                realisateur: element.NomRealisateur,
                description:element.Description,
                img:element.ImageURL
            }

            films.value.push(tab)

            })

            }catch(ex){
                console.log(ex.message)
            } finally {
                isLoading.value = false
            }
} 
onMounted(()=>{
    // Premier chargement
    getFilms()

    // Configuration de l'Intersection Observer
    const observer = new IntersectionObserver(
        (entries) => {
            if (entries[0].isIntersecting && !isLoading.value) {
                getFilms()
            }
        }
    )

    // Commence à observer le sentinel
    if (sentinel.value) {
        observer.observe(sentinel.value)
    }
})

</script>

<style>

.sentinel{
    height: 10px;
}
</style>