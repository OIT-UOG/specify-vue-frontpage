<template>
  <v-parallax
    dark
    class="pa-0 undo-image-transform"
    :src="imgPath"
    :style="cssProps"
  >
    <v-container grid-list-xs fluid :px-0=mobile>
      <v-layout
        align-center
        column
        justify-center
      >
        <v-flex xs12 text-center>
          <h1 :class="(mobile? '' : 'mb-4 ') + 'display-3 text-capitalize that-font noselect'" id="that-header">EXPLORE OUR WATERS</h1>
        </v-flex>
        <v-spacer class="py-4"></v-spacer>
        <v-flex xs12 md6 px-auto>
          <transition name="slide-fade-in">
            <div v-if="transIn">
            <v-card max-width="800" 
              :width="cardWidth" tile>
              <v-card-actions>
                <v-layout column text-center py-3 :px-5=!mobile :px-3=mobile>
                  <v-flex xs10 :px-5=!mobile :px-2=mobile>
                    <v-text-field
                      v-model="content"
                      name="query"
                      label="Search collections"
                      id="id"
                      @keydown.enter="redirect"
                      append-icon="search"
                      @click:append="redirect"
                    ></v-text-field>
                  </v-flex>
                  <v-row justify-center>
                    <v-col
                      :cols="mobile ? 12 : 4"
                      justify="center"
                      :class="mobile? 'pa-0' : ''"
                    >
                      <v-flex justify-center>
                        <p 
                          mt-5 
                          :class="mobile? 'subheading' : 'headline' + ' font-weight-light'" 
                          :style="'margin-bottom:0px !important; margin-top: ' + mobile? '0px; margin-bottom: 0px;' :'7px;'">I want to search for{{mobile? '' : ':'}} </p>
                      </v-flex>
                    </v-col>
                    <v-col
                      :cols="mobile ? 12 : 8"
                     
                    >
                    <v-tabs
                    v-model="tab"
                    >
                      <v-tab-slider></v-tab-slider>
                      <v-tab
                        fixed-tabs
                        style="width: 200%"
                        v-for="i in tabs"
                        :key="i"
                      >
                        {{i}}
                      </v-tab>
                    </v-tabs>
                    </v-col>
                    
                  </v-row>
                  <v-flex xs5 :pa-5=!mobile :pt-3=mobile>
                  <v-btn color="rgb(88, 155, 237)" dark
                    :href="link"
                  >
                  Search
                  </v-btn>
                  </v-flex>
                </v-layout>
              </v-card-actions>
            </v-card>
            </div>
          </transition>
        </v-flex>
        <!-- <v-flex xs2>
          <v-select
            dark
            filled
            :items="collections"
            v-model="coll"
            label="collection"
          ></v-select>
        </v-flex> -->
      </v-layout>
    </v-container>
  </v-parallax>
  <!-- <v-container fluid>
    <v-layout
      text-center
      wrap
    >
      <v-flex xs12>
        <v-img
          src="http://www.coastalseekers.com/wp-content/uploads/2017/05/feature-5.jpg"
          
          contain
          height="200"
        ></v-img>
      </v-flex>

      <v-flex mb-4>
        <h1 class="display-2 font-weight-bold mb-3">
          Welcome to Vuetify
        </h1>
        <p class="subheading font-weight-regular">
          For help and collaboration with other Vuetify developers,
          <br>please join our online
          <a href="https://community.vuetifyjs.com" target="_blank">Discord Community</a>
        </p>
      </v-flex>

      <v-flex
        mb-5
        xs12
      >
        <h2 class="headline font-weight-bold mb-3">What's next?</h2>

        <v-layout justify-center>
          <a
            v-for="(next, i) in whatsNext"
            :key="i"
            :href="next.href"
            class="subheading mx-3"
            target="_blank"
          >
            {{ next.text }}
          </a>
        </v-layout>
      </v-flex>

      <v-flex
        xs12
        mb-5
      >
        <h2 class="headline font-weight-bold mb-3">Important Links</h2>

        <v-layout justify-center>
          <a
            v-for="(link, i) in importantLinks"
            :key="i"
            :href="link.href"
            class="subheading mx-3"
            target="_blank"
          >
            {{ link.text }}
          </a>
        </v-layout>
      </v-flex>

      <v-flex
        xs12
        mb-5
      >
        <h2 class="headline font-weight-bold mb-3">Ecosystem</h2>

        <v-layout justify-center>
          <a
            v-for="(eco, i) in ecosystem"
            :key="i"
            :href="eco.href"
            class="subheading mx-3"
            target="_blank"
          >
            {{ eco.text }}
          </a>
        </v-layout>
      </v-flex>
    </v-layout>
  </v-container> -->
</template>

<script>
export default {
  data: () => ({
    content: "",
    collections: ['fishes', 'corals', 'diatoms'],
    coll: 'fish',
    img: 1,
    imgs: 8,
    img_y_transforms: [
      '-10%',
      '1.5%',
      '-3%',
      '-10%',
      '-1%',
      '-3%',
      '-5%'
    ],
    tab: null,
    tabs: ['specimen', 'references'],
    transIn: false
  }),
  computed: {
    mobile() {
      return this.$vuetify.breakpoint.name=='xs'
    },
    cardWidth() {
      return this.mobile ? '100%' : '800'
    },
    link() {
      if (this.content.trim()) {
        return 'apps/viewer/#/?q='+ encodeURIComponent('[2,"' + this.content.trim() + '"]')
      } else {
        return 'apps/viewer/#/'
      }
    },
    imgPath() {
      let images = require.context('../assets/dbphotos/', false, /\.jpg$/);
      return images('./' + this.img + ".jpg")
    },
    cssProps() {
      return {
        '--mv-img-y': this.img_y_transforms[this.img-1]
      }
    }
  },
  methods: {
    redirect() {
      window.location.href = this.link
    },
  },
  mounted() {
    this.img = Math.ceil(Math.random()*this.imgs)
    this.transIn = true;
  }
};
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Lato:900&display=swap');

.blur {
  -webkit-filter: blur(5px);
  -moz-filter: blur(5px);
  -o-filter: blur(5px);
  -ms-filter: blur(5px);
  filter: blur(5px);
}
#that-header {
  font-family: 'Lato', sans-serif !important;
  letter-spacing: 4.2px !important;
  text-shadow: 0 2px 10px rgba(0,0,0,0.5);
  font-weight: 400 !important;
}

.undo-image-transform .v-parallax__image {
  width: 200%;
  min-width: 2400px !important;
  transform-origin: 50% 50%;
  transform: translate(calc(-50%), calc(40% + var(--mv-img-y))) scale(0.5) !important;
}

.search {
  color: rgb(88, 155, 237)
}

.noselect {
  -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Safari */
     -khtml-user-select: none; /* Konqueror HTML */
       -moz-user-select: none; /* Old versions of Firefox */
        -ms-user-select: none; /* Internet Explorer/Edge */
            user-select: none; /* Non-prefixed version, currently
                                  supported by Chrome, Edge, Opera and Firefox */
}

.slide-fade-in-enter-active {
  transition: all 1s ease 1s;
  transform: translateY(0px);
}
.slide-fade-in-enter, .slide-fade-in-leave-to {
  margin-bottom: -20%;
  transform: translateY(50px);
  opacity: 0;
}
</style>

