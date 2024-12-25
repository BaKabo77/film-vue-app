import { createRouter, createWebHistory } from 'vue-router';
import Accueil from '@/composants/para.vue';
import pageRecherche from './composants/pageRecherche.vue';
import Categorie from './composants/categorie.vue';
import PageFilm from '@/composants/film.vue'
import ajoutFilm from './composants/ajout.vue';
import ModifierFilm from './composants/ModifierFilm.vue'
import NotFound from './composants/NotFound.vue'


const routes =[
    {
        path:'/',
        name:'Accueil',
        component:Accueil
    },
    {
        path:'/recherche',
        name:'Recherche',
        component:pageRecherche
    },
    {
        path:'/categorie',
        name:'categorie',
        component:Categorie
    },
    {
        path:"/film/:id",
        name:"film",
        component:PageFilm
    },
    {
        path:"/ajout",
        name:"ajout",
        component:ajoutFilm
    },
    {
        path: '/films/modifier/:id',
        name: 'ModifierFilm',
        component: ModifierFilm
    },
    {
        path: '/:pathMatch(.*)*',
        name: 'NotFound',
        component: NotFound
    }
]


const router = createRouter({
    history: createWebHistory(),
    routes
});

export default router;