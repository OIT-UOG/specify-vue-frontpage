<template>
  <v-parallax
    dark
    class="pa-0 undo-image-transform"
    src="../assets/fishb.jpg"
  >
    <v-container grid-list-xs fluid>
      <v-layout
        align-center
        column
        justify-center
      >
        <v-flex xs12 text-center>
          <h1 class="display-3 mb-4 text-capitalize that-font" id="that-header">EXPLORE OUR WATERS</h1>
        <v-spacer class="py-4"></v-spacer>
        </v-flex>
        <v-flex xs12 md6 px-auto>
          <v-card max-width="800" 
            :width="cardWidth" tile>
            <v-card-actions>
              <v-layout column text-center py-3 px-5>
                <v-flex xs10 px-5>
                  <v-text-field
                    v-model="content"
                    name="query"
                    label="Search collections"
                    id="id"
                    @keydown.enter="redirect"
                  ></v-text-field>
                </v-flex>
                <v-flex xs5 pa-5>
                <v-btn color="rgb(95, 225, 255)" dark
                  :href="link"
                >
                Search
                </v-btn>
                </v-flex>
              </v-layout>
            </v-card-actions>
          </v-card>
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
    collections: ['fish', 'coral', 'diatoms'],
    coll: 'fish'
  }),
  computed: {
    cardWidth() {
      return this.$vuetify.breakpoint.name=='xs' ? '300' : '800'
    },
    link() {
      if (this.content.trim()) {
        return 'apps/viewer/#/?q=' + this.content.trim()
      } else {
        return 'apps/viewer/#/'
      }
    }
  },
  methods: {
    redirect() {
      window.location.href = this.link
    }
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
  transform: translate(-50%,0) !important;
}
</style>

