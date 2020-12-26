<template>
  <v-app>
    <v-app-bar app>
      <v-toolbar-title class="headline text-uppercase">
        <a href="#home" style="color:black; text-decoration:none">
          <span>GEC</span>
        </a>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-sm-and-down">
        <v-btn
          v-for="{ path, title } in menu"
          :key="title[1]"
          :href="path"
          text
        ><span class="font-weight-light">{{title[0]}}</span><span class="font-weight-light">{{title[1]}}</span> </v-btn>
      </v-toolbar-items>
      <v-menu class="hidden-md-and-up">
        <template v-slot:activator="{on}">
          <v-app-bar-nav-icon v-on="on" class="hidden-md-and-up"></v-app-bar-nav-icon>
        </template>
        <v-list>
            <v-list-item 
              v-for="{ path, title } in menu"
              :key="title[1]"
              :href="path"
            >
              <v-list-item-title class="font-weight-light">
                {{(title[0] + title[1]).toUpperCase()}}
              </v-list-item-title>
            </v-list-item>
          </v-list>
      </v-menu>
    </v-app-bar>

    <v-content id="home">
      <HelloWorld/>
      <v-container grid-list-xs text-center id="about">
        <v-spacer class="py-6"></v-spacer>
        <v-layout justify-center align-center>
          <h1 class="display-2 font-weight-light">Guam Ecosystem Collaboratorium</h1>
        </v-layout>
        <v-spacer class="py-2"></v-spacer>
        <v-layout align-center>
          <p class="pa-6 pb-2 grey--text" >The Guam EPSCoR-Guam Ecosystem Collaboratorium (GEC) Biorepository and Reference Library (RefLib) 
            serve as world-class physical and cyber warehouses of Micronesian marine biodiversity and research papers enhancing
            local research capacity and facilitating collaborative research through global access to 
            geographically-linked specimen records and images and research references published and used by Guam EPSCoR researchers.
            Explore our collections below.
          </p>
        </v-layout>
        <v-layout row wrap align-center justify-center>
          <v-flex xs5>
            <v-divider class="ma-10" style="padding-top: 1px; background-color: rgb(88, 155, 237)"></v-divider>
          </v-flex>
        </v-layout>

      </v-container>
      <v-container
        grid-list-xs
        class="pb-6"
      >
        <v-row text-center>
            <v-col
              v-for="(c,i) in cards"
              :key="i"
              pa-2
              :cols="12"
              :md="cardCols(c)"
            >
              <v-hover v-slot:default="{ hover }">
                <a
                  :href="c.link"
                  style="text-decoration: none;"
                >
                  <v-card 
                    outlined
                    :elevation="hover ? 6:0"
                  >
                    <v-card-title class="justify-center display-1"
                      style="margin-top: 12px; padding-bottom:0;"
                    >
                      <b>{{c.title[0]}}</b>{{c.title[1]}}
                    </v-card-title>

                    <v-container>
                      <v-row justify="space-around">
                        <v-col cols="auto"
                          v-for="({title, img, link}, i) in c.imgs"
                          :key="i"
                        >
                          <v-card flat :href="link" :ripple="false" class="no-focus hue-hover">
                            <v-img
                              height="200"
                              width="200"
                              :src="imgPath(img)"
                            >
                            </v-img>
                            <v-card-title class="justify-center no-opacity-change">
                              {{title}}
                            </v-card-title>
                          </v-card>
                          

                        </v-col>
                      </v-row>
                    </v-container>

                  </v-card>
                </a>
              </v-hover>
            </v-col>
        </v-row>
      </v-container>

      <v-container>
        <v-spacer class="my-12"></v-spacer>
      </v-container>

      <v-container grid-list-xs fluid class="tertiary ma-0 pa-0">
        <v-container grid-list-xs class="tertiary">
          <v-spacer class="my-12"></v-spacer>
          <v-layout justify-center align-center mb-12>
              <h1 class="display-2 font-weight-light" dark>About us</h1>
          </v-layout>
          <v-layout px-12 align-center text-center>
            <p class="pb-6" >
              The Guam Ecosystem Collaboratorium is part of a 5-year plan focused upon studying the effects of climate change on coral reefs, specifically on a genetic basis and 
              is funded by the National Science Fountation's Established Program to Stimulate Competitive Research (EPSCoR) grant. 
              It is the hope that bringing these resources to a wider audience for collaboration and awareness that we might spark further research
              into these beautiful waters that we in Guam call home and that we as a global community deeply rely on.
            </p>
          </v-layout>
          <v-layout justify-center align-center xs12>
            <v-flex
              v-for="({ logo, link }, i) in logos"
              :key="i"
              xs4
            >
              <a
                :href="link"
                target="_blank"
              >
                <v-img
                  contain
                  :src="imgPath(logo)"
                  height="100px"
                >
            <!-- :style="'margin: 0; width: ' + Math.floor((1/logos.length)*100*.9) + '%'" -->
                </v-img>
              </a>
            </v-flex>
          </v-layout>
          <v-spacer class="my-12"></v-spacer>
          <v-layout row wrap align-center justify-center>
            <v-btn
              color="white"
              light
              href="https://guamepscor.uog.edu/"
              target="_blank"
            >Read more</v-btn>
          </v-layout>
          <v-spacer class="my-12"></v-spacer>
        </v-container>
      </v-container>

      <!-- <v-container grid-list-xs secondary fluid> -->
        <Contact id="contact"></Contact>
      <!-- </v-container> -->
      <v-footer dark>
        <v-container class="full-width py-0">
          <v-row justify="center">
            <v-col>
              <div class="d-flex flex-column align-center">
                <a
                  :href="epscorLogo.link"
                  target="_blank"
                >
                  <v-img height="60px" width="200px" contain :src="imgPath(epscorLogo.logo)"></v-img>
                </a>
              </div>
            </v-col>
            <v-col 
              align-self="center" 
              class="d-flex text-center justify-center flex-wrap"
              cols="12"
              md="6"
            >
              <div 
                v-for="(f, i) in footerText"
                :key="i"
                style="white-space: nowrap;"
              >
                {{ f.text }}
                <info-modal
                  v-if="f.link && f.link.component"
                  v-model="f.link.open"
                >
                  <template v-slot:activator="{ on }">
                    <a style="color: white" href="javascript:void(0)" v-on="on">{{ f.link.text }}</a>
                  </template>

                  <template v-slot:title v-if="f.link.title">
                    {{ f.link.title }}
                  </template>
                  <component :is="f.link.component"></component>
                </info-modal>
                <a
                  v-else-if="f.link"
                  style="color: white"
                  :href="f.link.link"
                  target="_blank"
                >{{ f.link.text }}</a>
                <!-- <div v-if="br"></div> -->
                <span v-if="i !== footerText.length - 1" class="mx-2">|</span>
              </div>
            </v-col>
            <v-col>
              <div class="d-flex justify-center">
                <v-btn
                  v-for="({ name, link }, i) in socials"
                  :key="i"
                  :href="link"
                  target="_blank"
                  fab
                  small
                  color="white"
                  class="ma-3"
                >
                  <v-icon color="#212121">mdi-{{ name }}</v-icon>
                </v-btn>
              </div>
            </v-col>
          </v-row>
        </v-container>
      </v-footer>
      
      <!-- <div>Icons made by <a href="https://www.flaticon.com/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
      <div>Icons made by <a href="https://www.flaticon.com/free-icon/file_709591?term=file%20search&page=2&position=27" title="Kiranshastry">Kiranshastry</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a></div> -->
    </v-content>
  </v-app>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue';
import Contact from './components/Contact.vue';
import InfoModal from './components/InfoModal.vue';
import Privacy from './components/Privacy.vue';
import Terms from './components/Terms.vue';

export default {
  name: 'App',
  components: {
    HelloWorld,
    Contact,
    InfoModal,
    Privacy,
    Terms,
  },
  data: () => ({
    menu: [
      {
        path: 'apps/viewer/#/',
        title: ['GEC','Biorepository'],
      },
      {
        path: 'gecreflib',
        title: ['GEC', 'RefLib'],
      },
      {
        path: '#about',
        title: ['','About'],
      },
      {
        path: '#contact',
        title: ['','Contact'],
      },
    ],
    logos: [
      {
        logo: "epscor_logo.png",
        link: "https://guamepscor.uog.edu/",
      },
      {
        logo: "nsf_logo.png",
        link: "https://nsf.gov/",
      },
      {
        logo: "uog_logo.png",
        link: "https://www.uog.edu/",
      },
    ],
    cards: [
      {
        title: ['GEC', 'Biorepository'],
        desc: null,
        link: 'apps/viewer/#/',
        size: 'xs9',
        imgs: [
          {
            title: 'Fishes',
            img: 'fish.png',
            link: 'apps/viewer/#/?colls=fish',
          },
          {
            title: 'Corals',
            img: 'coral.png',
            link: 'apps/viewer/#/?colls=coral',
          },
          {
            title: 'Diatoms',
            img: 'diatom.png',
            link: 'apps/viewer/#/?colls=diatom',
          }
        ]
      },
      {
        title: ['GEC', 'RefLib'],
        desc: null,
        link: '',
        size: 'xs3',
        imgs: [
          {
            title: 'References',
            img: 'search.png'
          }
        ]
      },
    ],
    cites: [
      {
        name: "David Burdick",
        link: "http://www.guamreeflife.com/",
        type: "photos",
      },
      {
        name: "Kiranshastry",
        link: "https://www.flaticon.com/free-icon/file_709591?term=file%20search&page=2&position=27",
        type: "file icon",
      }
    ],
    socials: [
      {
        name: 'twitter',
        link: 'https://twitter.com/guamepscor',
      },
      {
        name: 'facebook',
        link: 'https://www.facebook.com/guamepscor/',
      },
      {
        name: 'instagram',
        link: 'https://www.instagram.com/guamepscor/',
      }
    ],
    footerText: [
      { text: "Copyright © 2020 RCUOG", },
      { text: "photos by ", link: {
          text: "David Burdick",
          link: "http://www.guamreeflife.com/",
        }
      },
      { text: "file icon by ", link: {
          text: "Kiranshastry",
          link: "https://www.flaticon.com/free-icon/file_709591?term=file%20search&page=2&position=27",
        },
      },
      { link: {
        text: "Terms of Use",
        component: Terms,
        open: false,
      }},
      { link: {
        text: "Privacy Policy",
        component: Privacy,
        open: false,
      }},
    ],
  }),
  computed: {
    epscorLogo() {
      return this.logos[0];
    },
  },
  methods: {
    imgPath(img_name) {
      let images = require.context('./assets/', false, /\.png$/);
      return images('./' + img_name);
    },
    cardCols(card) {
      let total = this.cards.reduce((prev, curr) => { return prev + curr.imgs.length }, 0);
      return 12/total * card.imgs.length;
    },
  }
};
</script>

<style>
html, body {
    width: 100%;
    overflow-x: hidden;
}

@media (min-width: 1904px) {
  .container {
    max-width: 1264px;
  }
  .container--fluid {
    max-width: 100%;
  }
}

.full-width {
  max-width: 100%;
}

.tertiary {
  background-color: rgb(55, 140, 244);
  color: white;
}

.no-focus:hover:before {
  opacity: 0;
}

.hue-hover {
  transition-property: all;
  filter: saturate(1) hue-rotate(0deg) opacity(1);
  user-select: none;
}

.hue-hover:hover {
  filter: saturate(3.5) hue-rotate(15deg) opacity(0.9);
  /* adjusted primary color for filter */
  color: #3f6679;
}
</style>