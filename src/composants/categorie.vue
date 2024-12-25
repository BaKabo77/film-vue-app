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
            <div class="col-md-4 mb-5 col-6" v-for="film in filtrage" :key="film.titre">
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

    </div>



</template>

<script setup>

import {onMounted,computed,ref} from 'vue'

let categorie = ref('')


let affichage = (e)=>{
    categorie.value = e.target.innerHTML
}

let films =ref([])

onMounted(async()=>{
    try{
        const requete = await fetch(`${import.meta.env.VITE_API_URL}/films`)
        let data = await requete.json();  

        data.forEach(element => {
            let tab = {
                titre: element.Titre,
                annee: element.Annee,
                realisateur: element.NomRealisateur,
                description:element.Description,
                img:element.ImageURL,
                categorie:element.NomCategorie,
                id:element.FilmID
            }

            films.value.push(tab)
        })
    }catch(ex){
        console.log(ex.message)
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

