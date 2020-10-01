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
              @click="path"
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
        <v-layout text-center>
            <v-flex
              v-for="(c,i) in cards"
              :key="i"
              :class="c.size"
              pa-2
            >
              <v-hover v-slot:default="{ hover }">
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
                        v-for="({title, img}, i) in c.imgs"
                        :key="i"
                      >
                        <v-card flat>
                          <v-img
                            height="200"
                            width="200"
                            :src="imgPath(img)"
                          >
                          </v-img>
                          <v-card-title class="justify-center">
                            {{title}}
                          </v-card-title>
                        </v-card>
                        

                      </v-col>
                    </v-row>
                  </v-container>

                </v-card>
              </v-hover>
            </v-flex>
        </v-layout>
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
        <div>&copy;</div>
      </v-footer>
      
      <!-- <div>Icons made by <a href="https://www.flaticon.com/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
      <div>Icons made by <a href="https://www.flaticon.com/free-icon/file_709591?term=file%20search&page=2&position=27" title="Kiranshastry">Kiranshastry</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a></div> -->
    </v-content>
  </v-app>
</template>

<script>
import HelloWorld from './components/HelloWorld';
import Contact from './components/Contact';

export default {
  name: 'App',
  components: {
    HelloWorld,
    Contact,
  },
  data: () => ({
    menu: [
      {
        path: 'gecbiorepository',
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
        size: 'xs9',
        imgs: [
          {
            title: 'Fishes',
            img: 'fish.png'
          },
          {
            title: 'Corals',
            img: 'coral.png'
          },
          {
            title: 'Diatoms',
            img: 'diatom.png'
          }
        ]
      },
      {
        title: ['GEC', 'RefLib'],
        desc: null,
        size: 'xs3',
        imgs: [
          {
            title: 'References',
            img: 'search.png'
          }
        ]
      }
    ]
  }),
  methods: {
    imgPath(img_name) {
      let images = require.context('./assets/', false, /\.png$/);
      return images('./' + img_name);
    },
  }
};
</script>

<style>
@media (min-width: 1904px) {
  .container {
    max-width: 1264px;
  }
  .container--fluid {
    max-width: 100%;
  }
}

.tertiary {
  background-color: rgb(55, 140, 244);
  color: white;
}
</style>