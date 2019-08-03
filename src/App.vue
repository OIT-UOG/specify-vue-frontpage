<template>
  <v-app>
    <v-app-bar app>
      <v-toolbar-title class="headline text-uppercase">
        <span>GEC</span>
        <span class="font-weight-light">BIOREPOSITORY</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
    </v-app-bar>

    <v-content>
      <HelloWorld/>
      <v-container grid-list-xs text-center >
        <v-layout row wrap align-center justify-center>
          <v-flex xs1>
            <v-divider class="mt-6" style="padding-top: 1px; background-color: rgb(95, 225, 255)"></v-divider>
          </v-flex>
        </v-layout>
        <v-layout row wrap pt-2>
          <v-flex xs12>
            <span class="caption grey--text">
              Photo Credit: Paul Carlson, 2019
            </span>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
import HelloWorld from './components/HelloWorld';

export default {
  name: 'App',
  components: {
    HelloWorld,
  },
  data: () => ({
    //
  }),
};
</script>
