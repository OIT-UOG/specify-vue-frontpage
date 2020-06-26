<template>
    <v-container secondary fluid dark style="background-color: #80848f !important">
        <v-spacer class="py-6"></v-spacer>
        <v-layout justify-center align-center dark mb-12>
            <h1 class="display-2 font-weight-light" dark style="color: #eaeaea">Get in touch</h1>
        </v-layout>
        <v-spacer class="py-2"></v-spacer>
        <v-layout align-start justify="space-around" align="start" class="d-flex">
            <v-flex xs2></v-flex>
            <v-flex xs4 mx-10 style="color: #eaeaea">                
                <div class="d-flex align-top mb-5"
                    v-for="(c, i) in contacts"
                    :key="i"
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
                
            </v-flex>
            <v-flex xs4 style="color: #eaeaea">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita, repudiandae mollitia? Tenetur quos, tempora consequatur </p>
                <v-textarea
                    dark
                    name="name"
                    label="Message"
                    multi-line
                    outlined
                ></v-textarea>
                <v-text-field
                    dark
                    label="E-mail"
                    name="email"
                ></v-text-field>
                <v-btn color="white" light px-8 style="padding: inherit">Send</v-btn>
            </v-flex>
            <v-flex xs2></v-flex>
        </v-layout>
    
    </v-container>
</template>

<script>
export default {
  data: () => ({
      contacts: [
          {
            icon: "room",
            text: "University of Guam<br>Unibetsedȧt Guahan<br>UOG Station<br>Mangilao, Guam 96923",
            link: "https://goo.gl/maps/rJSUhBSQzLB1JHe69"
          },
          {
            icon: "email",
            text: "GECrepository@uog.edu",
            link: "mailto:GECrepository@uog.edu"
          },
          {
            icon: "phone",
            text: "(671) 735-0301",
            link: "tel:16717350301"
          }
      ]
  }),
  methods: {
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