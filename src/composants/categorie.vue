<template>
    <div class="container">
        <h1 class="my-5">Liste des Catégories des films</h1>

        <div class="list-inline list-flush row text-center my-5 justify-content-center">
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Science-fiction</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Crime</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Drame</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Thriller</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Action</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Fantastique</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Romance</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Animation</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Musical</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Horreur</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Comédie</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Biographie</li>
            <li @click="affichage" class="btn list-inline-item h5 text-muted col-3">Aventure</li>
        </div>

        <div class="row">
            <div class="col-md-4 mb-5 col-6" v-for="film in filtrage" :key="film.id">
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

        <!-- Ajout du sentinel -->
        <div ref="sentinel" class="sentinel my-5"></div>

        <!-- Indicateur de chargement -->
        <div v-if="isLoading" class="text-center mb-4">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Chargement...</span>
            </div>
        </div>

    </div>



</template>

<script setup>

import {onMounted,computed,ref} from 'vue'

let categorie = ref('')


let affichage = (e)=>{
    categorie.value = e.target.innerHTML
}

const films = ref([])
const sentinel = ref(null)
const isLoading = ref(false)

async function getFilms() {
    if (isLoading.value) return

    try {
        isLoading.value = true
        const index = films.value.length || 0
        const requete = await fetch(`${import.meta.env.VITE_API_URL}/films?index=${index}`)
        const data = await requete.json()

        data.forEach(element => {
            films.value.push({
                id: element.FilmID,
                titre: element.Titre,
                annee: element.Annee,
                realisateur: element.NomRealisateur,
                description: element.Description,
                img: element.ImageURL,
                categorie: element.NomCategorie
            })
        })
    } catch(ex) {
        console.log(ex.message)
    } finally {
        isLoading.value = false
    }
}

onMounted(() => {
    // Premier chargement
    getFilms()

    // Configuration de l'Intersection Observer
    const observer = new IntersectionObserver(
        (entries) => {
            if (entries[0].isIntersecting && !isLoading.value) {
                getFilms()
            }
        },
        {
            rootMargin: '200px',
            threshold: 0.1
        }
    )

    // Observer le sentinel
    if (sentinel.value) {
        observer.observe(sentinel.value)
    }
})

const filtrage = computed(()=>{

    let selection = []

    films.value.filter((film)=>{
    if(film.categorie === categorie.value){
        selection.push(film)
    }
 
})
    return selection

})

</script>

<style scoped>
.sentinel {
    height: 20px;
}
</style>

