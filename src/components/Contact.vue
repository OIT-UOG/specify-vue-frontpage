<template>
    <v-container secondary fluid dark style="background-color: #80848f !important" ma-0 pa-0>
        <v-container secondary dark style="background-color: #80848f !important">
            <v-spacer class="py-4"></v-spacer>
            <v-row justify-center align-center dark class="mb-9">
                <v-col cols="12" justify="center">
                    <h1 class="display-2 font-weight-light text-center" dark style="color: #eaeaea">Get in touch</h1>
                </v-col>
            </v-row>
            <v-spacer class="py-1"></v-spacer>
            <v-row align-start justify="space-around" align="start" class="d-flex pb-8 flex-wrap" :style="$vuetify.breakpoint.width >= 732 ? '' : 'overflow: srcoll;'">
                <v-col cols="1" v-if="$vuetify.breakpoint.mdAndUp"></v-col>
                <v-col cols="4" class="mx-10" style="color: #eaeaea; width: fit-content; box-sizing: border-box; display: inline-table">
                    <div class="d-flex align-top mb-5"
                        v-for="(c, i) in contacts"
                        :key="i"
                        style="width: fit-content"
                    >
                        <v-hover class="contact-btn">
                            <v-layout
                                slot-scope="{ hover }" width="auto"
                                @click="goto(c.link)"
                            >
                                <div class="mx-4 contact-icon">
                                    <v-icon
                                        :dark="hover"
                                    >{{c.icon}}</v-icon>
                                </div>
                                <a class="subtitle-1 contact-info white--text" v-html="c.text" />
                            </v-layout>
                        </v-hover>
                    </div>
                    <v-spacer :class="$vuetify.breakpoint.width >= 732 ? 'py-12' : 'py-2'"></v-spacer>
                    <hr v-if="$vuetify.breakpoint.width < 732" class="mb-7 mt-4">
                    <!-- <div 
                        class="d-flex align-top ml-12"
                        v-for="(c, i) in cites"
                        :key="i"
                    >
                        * {{c.type}} by 
                        <a 
                            class="d-flex pl-1" 
                            style="color: white" 
                            :href="c.link"
                            target="_blank"
                        >{{c.name}}</a>
                    </div> -->
                </v-col>
                <v-col :cols="$vuetify.breakpoint.width >= 732 ? 5 : 10" style="color: #eaeaea" :class="$vuetify.breakpoint.width >= 732 ? '' : ' mx-10'">
                    <!-- <v-flex xs1></v-flex> -->
                    <p>
                        We are always looking for feedback and are open to collaboration. 
                        We also loan out our specimen in various preperations. 
                        Leave us a message letting us know what you're interested in,
                        and we'll get back to you with information on our loaning process.
                    </p>
                    <v-textarea
                        dark
                        name="name"
                        label="Message"
                        class="pt-4"
                        multi-line
                        outlined
                    ></v-textarea>
                    <v-text-field
                        required
                        dark
                        label="E-mail"
                        class="pt-0 pb-8"
                        name="email"
                        v-model="email"
                    ></v-text-field>
                    <v-layout justify="end" align="center" class="d-flex" style="align-items: center">
                        <v-flex xs2 py-2>
                            <v-btn color="white" light px-8style="padding: inherit">Send</v-btn>
                        </v-flex>
                        <v-flex xs11>
                            <v-slide-y-transition>
                                <!-- <v-layout v-show="email"> -->
                                <p class="mb-0 pl-2" v-show="email">
                                    By submitting this form, you are agreeing to our 
                                    <a href="javascript:void(0)" style="color: white;" @click="open('terms')">
                                        Terms of Use
                                    </a>
                                    and 
                                    <a href="javascript:void(0)" style="color: white;" @click="open('privacy')">
                                        Privacy Policy
                                    </a>
                                    <info-modal
                                        v-model="dialog"
                                    >
                                        <component :is="component"></component>
                                    </info-modal>
                                </p>
                                <!-- </v-layout> -->
                            </v-slide-y-transition>
                        </v-flex>
                    </v-layout>
                </v-col>
                <v-col cols="1" v-if="$vuetify.breakpoint.width >= 732"></v-col>
            </v-row>
        
        </v-container>
    </v-container>
</template>

<script>
import InfoModal from '@/components/InfoModal.vue';
import Privacy from '@/components/Privacy.vue';
import Terms from '@/components/Terms.vue';

export default {
    components: {
        InfoModal,
        Privacy,
        Terms,
    },
  data: () => ({
      dialog: false,
      component: null,
      contacts: [
          {
            icon: "email",
            text: "GECrepository@uog.edu",
            link: "mailto:GECrepository@uog.edu"
          },
          {
            icon: 'language',
            text: 'https://guamepscor.uog.edu',
            link: 'https://guamepscor.uog.edu/',
          },
          {
            icon: "phone",
            text: "(671) 735-0301",
            link: "tel:16717350301"
          },
          {
            icon: "room",
            text: "University of Guam<br>Unibetsedȧt Guahan<br>UOG Station<br>Mangilao, Guam 96923",
            link: "https://goo.gl/maps/rJSUhBSQzLB1JHe69"
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
      email: ""
  }),
  computed: {
      tiny() {
          return this.$vuetify.breakpoint.name === 'xs';
      },
  },
  methods: {
    open(item) {
        this.component = {
            'terms': Terms,
            'privacy': Privacy,
        }[item];
        this.dialog = true;
    },
      goto(link) {
          window.open(link, '_blank');
      }
  }
}
</script>

<style>
.contact-btn, .contact-icon {
    cursor: pointer;
    transition: all .3s ease;
}
.contact-btn:hover .contact-icon {
    /* transform: translateY(-3px); */
    color: white;
}
.contact-btn:hover .contact-info {
    text-decoration: underline;
}
</style>