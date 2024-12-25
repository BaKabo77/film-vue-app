<template>

<input v-model="search" class="col-12 my-3" type="text" placeholder="Recherche de films">

<p v-if="!recherche[0]" class="text-center h1 disabled opacity-25">Aucun film trouvé</p>

<div class="row">

    
    <div class="col-md-4 mb-5 col-6" v-for="film in recherche" :key="film.id" :id="film.id">
        <router-link :to="'/film/'+film.id" class="text-decoration-none">
            <div class="card h-100 shadow hover-zoom" :id="film.id" :key="film.id">
                <img :src="film.img" class="card-img-top hover-zoom" alt="film poster">
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
</template>

<script setup>

import {ref,onMounted,computed} from 'vue';

const search = ref('');

const films = ref([]);



onMounted(async()=>{
    try{

        const requete = await fetch(`${import.meta.env.VITE_API_URL}/films`)
    let data = await requete.json();  

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
    }
})

const recherche = computed(()=>{

    let retour = [];

    films.value.filter((film)=>{
    
        if(film.titre.toLowerCase().includes(search.value.toLocaleLowerCase())){
            retour.push(film)
        }
     
    })
    return retour;

})



</script>